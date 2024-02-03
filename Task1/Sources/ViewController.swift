import UIKit

final class ViewController: UIViewController {
	private let squareView = GradientView()

	override func viewDidLoad() {
		super.viewDidLoad()
		setupUI()
	}
	
	private func setupUI() {
		view.backgroundColor = .white
		view.addSubview(squareView)

		squareView.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			squareView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Layout.leadingOffset),
			squareView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
			squareView.widthAnchor.constraint(equalToConstant: Layout.widthAndHeight),
			squareView.heightAnchor.constraint(equalToConstant: Layout.widthAndHeight)
		])
	}
}

extension ViewController {
	private enum Layout {
		static var leadingOffset: CGFloat { 100 }
		static var widthAndHeight: CGFloat { 120 }
	}
}
