//
//  OnboardingCoordinator .swift
//  FoodDeliveryApp
//
//  Created by Анастасия on 25.03.2024.
//

import UIKit

class OnboardingCoordinator: Coordinator {
    
    override func start() {
      showOnboarding()
    }
    
    override func finish() {
        print("AppCoordinator Finish")
    }
}

private extension OnboardingCoordinator {
    func showOnboarding() {
        
        var  pages = [UIViewController]()
        let firstVC = UIViewController()
        firstVC.view.backgroundColor = .purple
        
        let secondVC = UIViewController()
        secondVC.view.backgroundColor = .yellow
        
        let thirdVC = UIViewController()
        thirdVC.view.backgroundColor = .red
        
        pages.append(firstVC)
        pages.append(secondVC)
        pages.append(thirdVC)
      
        
        let presenter = OnboardingViewPresentor(cocoordinator: self)
        let viewController = OnboardingViewController(pages: pages, viewOutput: presenter) 
        navigationController?.pushViewController(viewController, animated: true)
        
    }
}
