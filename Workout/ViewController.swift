//
//  ViewController.swift
//  Workout
//
//  Created by Kenrick Vaz on 18/11/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var coverImage: AlignmentImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.checkAction))
        self.view.addGestureRecognizer(gesture)
        
    }

    

    @objc func checkAction(sender : UITapGestureRecognizer) {
        // Do what you want
        self.performSegue(withIdentifier: "launchWebview", sender: self)
    }

}


class AlignmentImageView: UIImageView {

    enum HorizontalAlignment {
        case left, center, right
    }

    enum VerticalAlignment {
        case top, center, bottom
    }


    // MARK: Properties

    var horizontalAlignment: HorizontalAlignment = .center
    var verticalAlignment: VerticalAlignment = .center


    // MARK: Overrides

    override var image: UIImage? {
        didSet {
            updateContentsRect()
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        updateContentsRect()
    }


    // MARK: Content layout

    private func updateContentsRect() {
        var contentsRect = CGRect(origin: .zero, size: CGSize(width: 1, height: 1))

        guard let imageSize = image?.size else {
            layer.contentsRect = contentsRect
            return
        }

        let viewBounds = bounds
        let imageViewFactor = viewBounds.size.width / viewBounds.size.height
        let imageFactor = imageSize.width / imageSize.height

        if imageFactor > imageViewFactor {
            // Image is wider than the view, so height will match
            let scaledImageWidth = viewBounds.size.height * imageFactor
            var xOffset: CGFloat = 0.0

            if case .left = horizontalAlignment {
                xOffset = -(scaledImageWidth - viewBounds.size.width) / 2
            }
            else if case .right = horizontalAlignment {
                xOffset = (scaledImageWidth - viewBounds.size.width) / 2
            }

            contentsRect.origin.x = xOffset / scaledImageWidth
        }
        else {
            let scaledImageHeight = viewBounds.size.width / imageFactor
            var yOffset: CGFloat = 0.0

            if case .top = verticalAlignment {
                yOffset = -(scaledImageHeight - viewBounds.size.height) / 2
            }
            else if case .bottom = verticalAlignment {
                yOffset = (scaledImageHeight - viewBounds.size.height) / 2
            }

            contentsRect.origin.y = yOffset / scaledImageHeight
        }

        layer.contentsRect = contentsRect
    }

}
