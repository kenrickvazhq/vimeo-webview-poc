//
//  WebViewController.swift
//  Workout
//
//  Created by Kenrick Vaz on 19/11/20.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    @IBOutlet weak var wv: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        self.modalPresentationStyle = .fullScreen
        
        wv.customUserAgent = "Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.116 Safari/537.36 Mozilla/5.0 (iPad; U; CPU OS 3_2 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Version/4.0.4 Mobile/7B334b Safari/531.21.10"
        
        //change id, these are old
        //let vimeoEmbedURL: String = "https://player.vimeo.com/video/478906616"; //prerecorded
        let vimeoEmbedURL: String = "https://vimeo.com/event/226942/embed"; //live
        
        let embedHTML="<html><head><style type=\"text/css\">body {background-color: transparent;color: black;}</style><meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=yes\"/></head><body style=\"margin:0\"><div><div style=\"padding:56.25% 0 0 0;position:relative;\"><iframe src=\"\(vimeoEmbedURL)\" frameborder=\"0\" allow=\"autoplay; fullscreen\" allowfullscreen style=\"position:absolute;top:0;left:0;width:100%;height:100%;\"></iframe></div></div></body></html>"
        
        
        //update url
        wv.loadHTMLString(embedHTML as String, baseURL:URL(string: "https://www.virginactive.coach/live/live-studio-1/")!)
        wv.contentMode = UIView.ContentMode.scaleAspectFit
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
