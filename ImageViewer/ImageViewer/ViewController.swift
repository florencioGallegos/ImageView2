//
//  ViewController.swift
//  ImageViewer
//
//  Created by MAC Consultant on 2/28/19.
//  Copyright © 2019 MAC Consultant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var Image: UIImageView!
    @IBOutlet weak var widthTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        
}
@IBAction func getPicture(_ sender: Any) {
    guard let width: String = String(self.widthTextField.text!) else {
        print("need to input width")
        return
    }
    guard let height: String = String(self.heightTextField.text!) else {
        print("need to input height")
        return
    }
    func get_image(_ url_str:String, _ imageView:UIImageView)
    {
        let url:URL = URL(string: url_str)!
        let session = URLSession.shared
        let task = session.dataTask(with: url, completionHandler:
        {
            (data, response, error) in
            if data != nil
            {
                let image = UIImage(data: data!)
                if image != nil
                {
                    DispatchQueue.main.async(execute:
                        {
                            imageView.image = image
                    })
                }
            }
            
        })
        task.resume()
    }
    var url = "https://placekitten.com/\(width)/\(height)"
    get_image(url, Image)
}
}
