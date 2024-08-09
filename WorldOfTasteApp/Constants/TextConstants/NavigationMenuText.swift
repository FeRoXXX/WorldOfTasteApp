//
//  NavigationMenuText.swift
//  WorldOfTasteApp
//
//  Created by Александр Федоткин on 08.08.2024.
//

import Foundation

enum NavigationMenuText: String, CaseIterable {
    case main = "Главная"
    case products = "Продукты"
    case contacts = "Контакты"
    
    static func getText(from index: Int) -> String {
        guard index < NavigationMenuText.allCases.count 
        else {
            return ""
        }
        return NavigationMenuText.allCases[index].rawValue
    }
}
