//
//  TextViewController.swift
//  PageViewExample2
//
//  Created by Maximiliano Riquelme Vera on 19/01/2022.
//

import UIKit

class TextViewController: UIViewController {

    let text: String
    
    private let textView: UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        textView.font = .systemFont(ofSize: 24)
        textView.textColor = .black
        return textView
    }()
        
    init(title: String, text: String) {
        self.text = text
        textView.text = self.text
        super.init(nibName: nil, bundle: nil)
        self.title = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view = self.textView
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
}
