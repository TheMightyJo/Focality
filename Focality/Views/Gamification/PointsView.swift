import UIKit

/// PointsView est une classe UIKit personnalisée qui affiche le nombre de points.
/// Elle contient une méthode pour mettre à jour l'affichage des points.
class PointsView: UIView {
    private let pointsLabel: UILabel
    
    /// Initialiseur qui configure la vue avec un nombre initial de points.
    /// - Parameter points: Le nombre initial de points à afficher.
    init(points: Int) {
        pointsLabel = UILabel()
        super.init(frame: .zero)
        setupView()
        updatePoints(points)
    }
    
    /// Configuration de la vue.
    private func setupView() {
        pointsLabel.textAlignment = .center
        pointsLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        pointsLabel.textColor = UIColor(named: "Primaire")
        addSubview(pointsLabel)
        pointsLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pointsLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            pointsLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    /// Méthode pour mettre à jour l'affichage des points.
    /// - Parameter points: Le nouveau nombre de points à afficher.
    func updatePoints(_ points: Int) {
        pointsLabel.text = "Points: \(points)"
    }
    
    /// Initialiseur requis par UIKit.
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
