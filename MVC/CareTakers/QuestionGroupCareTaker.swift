//
//  QuestionGroupCareTaker.swift
//  MVC
//
//  Created by victor on 15/12/2019.
//  Copyright © 2019 victor. All rights reserved.
//

import Foundation

public final class QuestionGroupCareTaker {
    // MRAK: - Properties
    private let fileName = "QuestionGroupData"
    public var questionGroups: [QuestionGroup] = []
    public var selectedQuestionGroup: QuestionGroup!
    
    // MARK: - Object LifeCycle
    init() {
        loadQuestionGroups()
    }
    
    private func loadQuestionGroups() {
        if let questionGroups = try? DiskCareTaker.retrieve([QuestionGroup].self, from: fileName) {
            self.questionGroups = questionGroups
        } else {
            let bundle = Bundle.main
            let url = bundle.url(forResource: fileName, withExtension: "json")!
            self.questionGroups = try! DiskCareTaker.retrieve([QuestionGroup].self, from: url)
            try! save()
        }
    }
    
    // MARK: - Instance Methods
    public func save() throws {
        try DiskCareTaker.save(questionGroups, to: fileName)
    }
}
