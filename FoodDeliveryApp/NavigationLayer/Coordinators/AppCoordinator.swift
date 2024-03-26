//
//  AppCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Анастасия on 25.03.2024.
//

import UIKit

class AppCoordinator: Coordinator {
   
    override func start() {
//        shouOnboardingFlow()
        showMainFlow()
    }
    
    override func finish() {
        print("AppCoordinator Finish")
    }
}

//MARK: - navigation methods
private extension AppCoordinator {
    func shouOnboardingFlow()  {
        guard let navigationControlelr = navigationController else { return }
        let onboardongCoordinator = OnboardingCoordinator(type: .onboarding, navigationController: navigationControlelr, finishDelegate: self)
        addChildCoordinator(childCoordinator: onboardongCoordinator)
        onboardongCoordinator.start()
    }
        func showMainFlow() {
            guard let navigationController = navigationController else { return }
            
            let homeNavigationController = UINavigationController()
            let homeCoordinator = HomeCoordinator(type: .home, navigationController: homeNavigationController)
            homeNavigationController.tabBarItem = UITabBarItem(title: "home", image: UIImage.init(systemName: "sun.min"), tag: 0)
            homeCoordinator.finishDelegate = self
            homeCoordinator.start()
            
            
            let orderNavigationController = UINavigationController()
            let orderCoordinator = HomeCoordinator(type: .order, navigationController: orderNavigationController)
            orderNavigationController.tabBarItem = UITabBarItem(title: "order", image: UIImage.init(systemName: "sun.min"), tag: 1)
            orderCoordinator.finishDelegate = self
            orderCoordinator.start()
            
            let listNavigationController = UINavigationController()
            let listCoordinator = ListCoordinator(type: .list, navigationController: listNavigationController)
            listNavigationController.tabBarItem = UITabBarItem(title: "list", image: UIImage.init(systemName: "sun.min"), tag: 2)
            listCoordinator.finishDelegate = self
            listCoordinator.start()
            
            let profileNavigationController = UINavigationController()
            let profileCoordinator = ProfileCoordinator(type: .profile, navigationController: profileNavigationController)
            profileNavigationController.tabBarItem = UITabBarItem(title: "profile", image: UIImage.init(systemName: "sun.min"), tag: 3 )
            profileCoordinator.finishDelegate = self
            profileCoordinator.start()
            
            
            addChildCoordinator(childCoordinator: homeCoordinator)
            addChildCoordinator(childCoordinator: orderCoordinator)
            addChildCoordinator(childCoordinator: listCoordinator)
            addChildCoordinator(childCoordinator: profileCoordinator)
            
            let tabBarControllers = [homeNavigationController, orderNavigationController, listNavigationController, profileNavigationController]
            let tabBarController = TabBarController(tabBarControllers: tabBarControllers)
            
            navigationController.pushViewController(tabBarController, animated: true)
            
        }
    }
    
    extension AppCoordinator: CoordinatorFinishDelegate {
        
        func coordinatorDidFinishDelegate(childCoordinator: CoordinatorProtocol) {
            removeChildCoordinator(childCoordinator: childCoordinator)
            
            switch childCoordinator.type {
            case.app:
                return
            default:
                navigationController?.popToRootViewController(animated: false)
            }
        }
    }

