//
//  PageTextModel.swift
//  WorldOfTasteApp
//
//  Created by Александр Федоткин on 06.08.2024.
//

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let data: [Datum]
}

// MARK: - Datum
struct Datum: Codable {
    let page: [Page]
}

// MARK: - Page
struct Page: Codable {
    let type, string: String
    let runs: [Run]
}

// MARK: - Run
struct Run: Codable {
    let range: [Int]
    let attributes: Attributes
}

// MARK: - Attributes
struct Attributes: Codable {
    let font: Font
    let color: [Int]
}

// MARK: - Font
struct Font: Codable {
    let name: String
    let size: Int
}
