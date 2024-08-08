import SwiftUI

/// PointsUIViewRepresentable est une structure qui permet d'intégrer une vue UIKit (PointsView) dans une interface SwiftUI.
/// Elle utilise le protocole UIViewRepresentable pour créer et gérer l'instance de PointsView.
struct PointsUIViewRepresentable: UIViewRepresentable {
    /// La variable 'points' stocke le nombre de points à afficher dans la vue.
    var points: Int

    /// Cette méthode crée et configure la vue UIKit (PointsView) lorsqu'elle est initialement créée.
    /// - Parameter context: Le contexte utilisé pour coordonner entre SwiftUI et UIKit.
    /// - Returns: Une instance de PointsView configurée avec les points initiaux.
    func makeUIView(context: Context) -> PointsView {
        return PointsView(points: points)
    }

    /// Cette méthode met à jour la vue UIKit (PointsView) lorsque les propriétés de SwiftUI changent.
    /// - Parameters:
    ///   - uiView: L'instance actuelle de PointsView.
    ///   - context: Le contexte utilisé pour coordonner entre SwiftUI et UIKit.
    func updateUIView(_ uiView: PointsView, context: Context) {
        uiView.updatePoints(points)
    }
}
