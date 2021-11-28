#  Developing Hex Boards

Objective: create a set of SwiftUI components suitable for composing game boards 
tiled with hexagons.

Uses the HexGrid package, a swift port of Amit Patel's Hex + Layout library, morphed from the javascript version.


## Offset vs position

[Making Fine Adjustments to a View’s Position](https://developer.apple.com/documentation/swiftui/making-fine-adjustments-to-a-view-s-position)

```
To explicitly position elements within a view, use the position(x:y:) view modifier. A position modifier overrides where the parent view places its content. The modifier renders the view at a location offset from the origin of the parent view, unlike an offset modifier that shifts the view from the location chosen by the parent view. The position modifier uses the same x, y coordinate system as the offset modifier, and similarly doesn’t influence the size of the view. 
```

