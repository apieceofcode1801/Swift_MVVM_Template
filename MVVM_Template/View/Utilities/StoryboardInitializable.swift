import UIKit

protocol StoryboardInitializable {
    static var storyboard: Storyboard { get }

    static var viewIdentifier: String { get }

    static func initFromStoryboard() -> Self
}

extension StoryboardInitializable {
    static var viewIdentifier: String {
        return String(describing: Self.self)
    }

    static func initFromStoryboard() -> Self {
        guard
            let viewController = UIStoryboard(name: storyboard.name, bundle: nil).instantiateViewController(withIdentifier: viewIdentifier) as? Self
            else {
            fatalError("Could not instantiate initial view controller from \(storyboard.name) storyboard.")
        }
        return viewController
    }

}
