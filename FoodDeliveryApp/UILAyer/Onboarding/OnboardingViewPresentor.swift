//
//  OnboardingViewPresentor.swift
//  FoodDeliveryApp
//
//  Created by Анастасия on 26.03.2024.
//

import UIKit

protocol OnboardingViewOutput: AnyObject {
    func onboardingFinish()
        
    }


class OnboardingViewPresentor: OnboardingViewOutput {
    
    //MARK: - Properies
    
    weak var coordinator: OnboardingCoordinator!
    
    init(cocoordinator: OnboardingCoordinator!) {
        self.coordinator = cocoordinator
    }
    func onboardingFinish() {
        coordinator.finish()
    }
}
