//
//  OnboardingPageViewController.swift
//  WorldOfTasteApp
//
//  Created by Александр Федоткин on 24.07.2024.
//

import UIKit

typealias PageViewControllerDelegateAndDataSource = UIPageViewControllerDelegate & UIPageViewControllerDataSource

final class OnboardingPageViewController: UIPageViewController {
    
    private var controllersPage: [OnboardingViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        setupViewControllers()
    }
}

extension OnboardingPageViewController: PageViewControllerDelegateAndDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let contentVC = viewController as? OnboardingViewController,
                      let currentIndex = controllersPage.firstIndex(of: contentVC),
                      currentIndex > 0 else {
                    return nil
                }
        return controllersPage[currentIndex - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let contentVC = viewController as? OnboardingViewController,
                      let currentIndex = controllersPage.firstIndex(of: contentVC),
                      currentIndex < controllersPage.count - 1 else {
                    return nil
                }
        return controllersPage[currentIndex + 1]
    }
}

private extension OnboardingPageViewController {
    
    func setupViewControllers() {
        for index in 0...2 {
            let contentVC = OnboardingViewController()
            contentVC.setCurrentPage(number: index)
            controllersPage.append(contentVC)
        }
        
        if let firstPage = controllersPage.first {
            setViewControllers([firstPage], direction: .forward, animated: true)
        }
    }
}
