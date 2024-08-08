//
//  MenuTabBarController.swift
//  WorldOfTasteApp
//
//  Created by Vyacheslav on 06.08.2024.
//

import UIKit

final class MenuTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
}

private extension MenuTabBarController {
    
    func setupTabBar() {
        let homeController = HomeViewController()
        homeController.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "Home"), tag: 0)
        
        let wishListController = WishListViewController()
        wishListController.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "Wishlist"), tag: 0)
        
        let playController = PlayViewController()
        playController.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "Play"), tag: 0)
        
        let accountController = AccountViewController()
        accountController.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "Account"), tag: 0)
        
        setViewControllers([homeController, wishListController, playController, accountController], animated: false)
        
        tabBar.itemWidth = 30.0
        tabBar.tintColor = .white
        tabBar.unselectedItemTintColor = .white
        tabBar.itemPositioning = .centered
        tabBar.itemSpacing = 50.0
        
        setTabBarStyle()
    }
    
    func setTabBarStyle() {
        let layer = CAShapeLayer()
        layer.path = UIBezierPath(roundedRect: CGRect(x: 30,
                                                      y: tabBar.bounds.minY - 15,
                                                      width: tabBar.bounds.width - 60,
                                                      height: tabBar.bounds.height + 15),
                                  cornerRadius: (tabBar.frame.width/2)).cgPath
        layer.borderWidth = 1.0
        layer.isHidden = false
        layer.masksToBounds = false
        layer.fillColor = UIColor.black.cgColor
        
        tabBar.layer.insertSublayer(layer, at: 0)
        
        if let items = tabBar.items {
            items.forEach { item in
                item.imageInsets = UIEdgeInsets(top: -10, left: 0, bottom: 5, right: 0)
            }
        }
    }
}
