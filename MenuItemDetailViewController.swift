//
//  MenuItemDetailViewController.swift
//  OrderApp
//
//  Created by Andrew Higbee on 11/12/23.
//

import UIKit

class MenuItemDetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var detailTextLabel: UILabel!
    @IBOutlet weak var addToOrderButton: UIButton!
    
    
    var menuItem: MenuItem
    
    init?(coder: NSCoder, menuItem: MenuItem) {
        self.menuItem = menuItem
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI(menuItem: menuItem)
    }
    
    func updateUI(menuItem: MenuItem) {
        nameLabel.text = menuItem.name
        priceLabel.text = menuItem.price.formatted((.currency(code: "usd")))
        detailTextLabel.text = menuItem.detailText
        
        Task {
            do {
                let image = try await MenuController.shared.fetchImage(from: menuItem.imageURL)
                imageView.image = image
            }
        }
    }

    @IBAction func addToOrderButtonTapped(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.1, options: [], animations: { self.addToOrderButton.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
            self.addToOrderButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0) }, completion: nil)
        
        MenuController.shared.order.menuItems.append(menuItem)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        MenuController.shared.updateUserActivity(with: .menuItemDetail(menuItem))
    }
    
    /*
     UIView.animate(withDuration: 0.8, delay: 0,
        usingSpringWithDamping: 0.6,
        initialSpringVelocity: 0.1, options: [], animations: {
         self.albumImageView.transform = CGAffineTransform.identity
     }, completion: nil)
 } else {
     UIView.animate(withDuration: 0.5) {
         self.albumImageView.transform =
            CGAffineTransform(scaleX: 0.8, y: 0.8)
     }
     */
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
