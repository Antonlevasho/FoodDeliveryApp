//
//  AppCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Анастасия on 25.03.2024.
//

import UIKit

class AppCoordinator: Coordinator {
   
    override func start() {
        shouOnboardingFlow()
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

