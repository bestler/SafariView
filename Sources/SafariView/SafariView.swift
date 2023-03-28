
import UIKit
import SwiftUI
import SafariServices

@available(iOS 15.0, *)
public struct SafariView: UIViewControllerRepresentable {

    let url : URL
    let dismissButtonStyle: DismissButtonStyle
    let preferredBarTintColor: UIColor?
    let preferredControlTintColor: UIColor?
    let isBarCollapsing: Bool
    let entersReaderIfAvailable: Bool

    init(url: URL,
         dismissButtonStyle: DismissButtonStyle = .done,
         preferredBarTintColor : UIColor? = .systemBackground,
         preferredControlTintColor : UIColor? = .tintColor,
         isBarCollapsing: Bool = false,
         entersReaderIfAvailable: Bool = false) {
        self.url = url
        self.dismissButtonStyle = dismissButtonStyle
        self.preferredBarTintColor = preferredBarTintColor
        self.preferredControlTintColor = preferredControlTintColor
        self.isBarCollapsing = isBarCollapsing
        self.entersReaderIfAvailable = entersReaderIfAvailable
    }

    public func makeUIViewController(context: Context) -> some UIViewController {

        let configuration = SFSafariViewController.Configuration()
        configuration.barCollapsingEnabled = isBarCollapsing
        configuration.entersReaderIfAvailable = entersReaderIfAvailable

        let viewController = SFSafariViewController(url: url, configuration: configuration)

        viewController.modalPresentationStyle = UIModalPresentationStyle.currentContext

        //Setting the colors
        viewController.preferredBarTintColor = preferredBarTintColor
        viewController.preferredControlTintColor = preferredControlTintColor


        // Configure dismissButtonStyle
        switch dismissButtonStyle {
        case .cancel:
            viewController.dismissButtonStyle = SFSafariViewController.DismissButtonStyle.cancel
        case .close:
            viewController.dismissButtonStyle = SFSafariViewController.DismissButtonStyle.close
        case .done:
            viewController.dismissButtonStyle = SFSafariViewController.DismissButtonStyle.done
        }

        return viewController
    }

    public func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        return
    }

    enum DismissButtonStyle {
        case cancel, close, done
    }

}

@available(iOS 15.0, *)
struct SafariView_Preview: PreviewProvider {
    static var previews: some View {
        SafariView(url: URL(string: "https://apple.com")!)
    }
}
