import SwiftUI

struct PointsUIViewRepresentable: UIViewRepresentable {
    var points: Int

    func makeUIView(context: Context) -> PointsView {
        return PointsView(points: points)
    }

    func updateUIView(_ uiView: PointsView, context: Context) {
        uiView.updatePoints(points)
    }
}
