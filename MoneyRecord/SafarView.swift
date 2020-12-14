import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable {
    
        func makeUIViewController(context: Context) -> SFSafariViewController {
             SFSafariViewController(url: url)
        }
        func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
                
        }
        let url: URL
    
}

struct SafariView_Previews: PreviewProvider {
    static var previews: some View {
        SafariView(url: URL(string: "https://line.me/R/")!)
    }
}

