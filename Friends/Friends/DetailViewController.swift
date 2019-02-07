//
//  DetailViewController.swift
//  Friends
//
//  Created by Nathanael Youngren on 2/7/19.
//  Copyright © 2019 Nathanael Youngren. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    func updateViews() {
        guard let friend = friend else { return }
        image.image = UIImage(named: friend.name)
        label.text = friend.name.capitalized
        textView.text = friend.information
    }
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    var friend: Friend?
}
