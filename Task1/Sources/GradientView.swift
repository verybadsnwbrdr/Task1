import UIKit

final class GradientView: UIView {
	
	override var bounds: CGRect {
		get { super.bounds }
		set { updateBounds(newValue) }
	}
	
	private let gradientLayer = CAGradientLayer()
	
	init(config: GradientView.Config = .default) {
		super.init(frame: .zero)
		setup(config: config)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func updateBounds(_ newBounds: CGRect) {
		super.bounds = newBounds
		gradientLayer.frame = bounds
	}
	
	private func setup(config: GradientView.Config) {
		layer.shadowColor = config.shadowColor
		layer.shadowRadius = config.cornerRadius
		layer.shadowOpacity = config.shadowOpacity
		layer.shadowOffset = config.shadowOffset
		
		layer.addSublayer(gradientLayer)
		
		gradientLayer.startPoint = .zero
		gradientLayer.colors = config.gradientColors
		gradientLayer.cornerRadius = config.cornerRadius
	}
}

extension GradientView {
	struct Config {
		let cornerRadius: CGFloat
		let gradientColors: [CGColor]
		let shadowColor: CGColor
		let shadowOpacity: Float
		let shadowOffset: CGSize
	}
}

extension GradientView.Config {
	static var `default` = GradientView.Config(
		cornerRadius: 20,
		gradientColors: [UIColor.systemBlue.cgColor, UIColor.systemRed.cgColor],
		shadowColor: UIColor.black.cgColor,
		shadowOpacity: 1,
		shadowOffset: CGSize(width: 5, height: 5)
	)
}
