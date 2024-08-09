//
//  OnboardingDataManager.swift
//  WorldOfTasteApp
//
//  Created by Александр Федоткин on 06.08.2024.
//

import Foundation

final class OnboardingDataManager {
    
    private var model: Welcome?
    
    init() {
        fetchData()
    }
    
    func getData(with index: Int) -> Datum? {
        return model?.data[index]
    }
}

private extension OnboardingDataManager {
    
    func fetchData() {
        guard let data = createJSONData()
        else {
            fatalError() //TODO: - Make Alert
        }
        do {
            model = try JSONDecoder().decode(Welcome.self,
                                             from: data)
        } catch {
            print("Error") //TODO: - Make Alert
        }
    }
    
    func createJSONData() -> Data? {
        guard let url = Bundle.main.url(forResource: "FirstLoginText",
                                        withExtension: "json")
        else {
            return nil
        }
        do {
            let jsonData = try Data(contentsOf: url)
            return jsonData
        } catch {
            return nil
        }
    }
}
