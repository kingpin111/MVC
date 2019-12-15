//
//  AppSettings.swift
//  MVC
//
//  Created by victor on 14/12/2019.
//  Copyright © 2019 victor. All rights reserved.
//

import Foundation

public class AppSettings {
    // MARK: - Keys
    private struct Keys {
        static let questionStrategy = "questionStrategy"
    }
    // MARK: - Static Porperties
    public static let shared = AppSettings()
    
    // MARK: - Instance Properties
    public var questionStrategyType: QuestionStrategyType {
        get {
            let rawValue = userDefaults.integer(forKey: Keys.questionStrategy)
            return QuestionStrategyType(rawValue: rawValue)!
        }
        
        set {
            userDefaults.set(newValue.rawValue, forKey: Keys.questionStrategy)
        }
    }
    private let userDefaults = UserDefaults.standard
    
    // MARK: - Object Lifecycle
    private init() { }
    
    // MARK: - Instance Methods
    public func questionStrategy(for questionGroupCareTaker: QuestionGroupCareTaker) -> QuestionStrategy {
        return questionStrategyType.questionStrategy(for: questionGroupCareTaker)
    }
}

// MARK: - QuestionStrategyType
public enum QuestionStrategyType: Int, CaseIterable {
    case random
    case sequential
    
    // MARK: - Instacne Methods
    public func title() -> String {
        switch self {
        case .random:
            return "Random"
        case .sequential:
            return "Sequential"
        }
    }
    
    public func questionStrategy(
        for questionGroupCareTaker: QuestionGroupCareTaker) -> QuestionStrategy {
        switch self {
        case .random:
            return RandomQuestionStrategy(questionGroupCareTaker: questionGroupCareTaker)
        case .sequential:
            return SequentialQuestionStrategy(questionGroupCareTaker: questionGroupCareTaker)
        }
    }
}
