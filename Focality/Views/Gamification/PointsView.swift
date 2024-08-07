import UIKit

class PointsView: UIView {
    private let pointsLabel: UILabel

    init(points: Int) {
        self.pointsLabel = UILabel()
        super.init(frame: .zero)
        self.pointsLabel.text = "Points : \(points)"
        self.pointsLabel.font = UIFont.boldSystemFont(ofSize: 16)
        self.pointsLabel.textColor = .white
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        self.addSubview(pointsLabel)
        pointsLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pointsLabel.topAnchor.constraint(equalTo: self.topAnchor),
            pointsLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            pointsLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            pointsLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }

    func updatePoints(_ points: Int) {
        self.pointsLabel.text = "Points : \(points)"
    }
}
