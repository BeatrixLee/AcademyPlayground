import Foundation
import UIKit

public class Card {
    
    public let name: String
    public let imageCulture: UIImage
    public let imageCard: UIImage
    
    public init (name: String, imageCulture: UIImage, imageCard: UIImage) {
        
        self.name = name
        self.imageCard = imageCard
        self.imageCulture = imageCulture
        
    }

}
