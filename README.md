# Swift Matched Geometry Effect PoC

This is a proof of concept SwiftUI project. The purpose is to explore how
matched geometry effect can be used to do a "hero" transition animation between
an overview list and a details view for the selected item.

I wanted to have enough structure in the project to be able to explore some of
the challenges that a real project faces. The resources on SwiftUI animation
that I have been able to find are all squashed together in one Swift file and
this hides some challenges that I am facing in real projects.

Challenges I wanted to explore:
* How to do navigation? What about `NavigationView`?
* How to use `.matchedGeometryEffect` across views that are far away from each
  other in the view hierarchy.
* How to use `@Namespace` in this scenario

This project requires iOS 14 or macOS 11 but has only been tested on an iPhone
simulator. 

## Structure

This project is SwiftUI from the top and uses the new SwiftUI `App` and with a
view called `ContentView` at the top.

The top view has two subviews, `OverviewListView` and `DetailsListView`. The
overview view displays a list of all the top level "lines" and with each line
consisting of a number of items horizontally. The details view show the contents
of one such line with each item on a separate line vertically in what looks like
a traditional table view.

For the purpose of simulating a real project in simples possible way, a few
model classes are defined: `ItemLineModel` and `ItemModel`. The top view,
`ContentView` contains a hard-coded `var` with an array of `ItemLineModel`
instances which each have an array of `ItemModel` instances.

## User Interface

When the app is run, the user sees a list of lines, each with a number of items,
each with its own color, icon and text. 

![Overview](doc/Overview.png)

When a line is tapped, the details view is shown and the same items are shown,
now vertically. A cross in the corner lets the user close the details view and
go back to the overview.

![Details](doc/Details.png)

## Navigation – Not Using `NavigationView`

While the overview list view do have a `NavigationView` around it, this is
only to have a navigation bar. Currently it is not possible in SwiftUI to use
`NavigationView` and `NavigationLink` for navigation and at the same time use
custom animations. This might change in a future version of SwiftUI but as it is
now, one have to choose.

Instead, navigation is done by using SwiftUI's ability to have some state and an
`if` statement decide what views are generated and shown. The immediate approach
would be to have one `if` statement (or `switch`) and have the body of
`ContentView` be either overview or details view.

This approach seems to give some problems when combined with the use of
`NavigationView`. That is why I ultimately decided for an approach inspired by
[swiftui-hero-animations](https://github.com/swiftui-lab/swiftui-hero-animations)
from [The SwiftUI Lab](https://swiftui-lab.com).

This approach use a `ZStack` and have the overview list always on screen but
with the details view overlayed when a line is selected.

### Navigation to details

So `ContentView` has a
```
@State var selectedLine: ItemLineModel?
```

and when this is non-nil, the details view is shown in an overlay. The overview
list is passed a binding to `selectedLine` and can thus tell us about it when
the user selects a line.
```
OverviewListView(lines: data,
                  selectedLine: $selectedLine)
```

This is enabled by the following definition in `OverviewListView`:
```
struct OverviewListView: View {
    var lines: [ItemLineModel]
    @Binding var selectedLine: ItemLineModel?

    ...
```

The selection of a line is done by means of a `Button`:
```
Button {
    selectedLine = line
}
label: {
    ...
}
```

Because `selectedLine` is a binding, this sets the `selectedLine` all the way
at the top of the view hierarchy, makes the views rebuild and now the details
view will be shown (see below).

```
if let selectedLine = selectedLine {
    Color.white.overlay(
        DetailsListView(items: selectedLine.items,
                        selectedLine: $selectedLine)
    )
}
```

### Navigation back to overview

As can be seen above, the state is also passed on the the details view as a
binding and when the close button is tapped, the `var` is changed back to nil
and thus the overlay with the details view is removed again.

```
Button {
    selectedLine = nil
}
label: {
    Icons.xmark_circle.imageScale(.large)
}
```