//
//  BaseQuestionStrategy.swift
//  MVC
//
//  Created by victor on 15/12/2019.
//  Copyright © 2019 victor. All rights reserved.
//

import Foundation

public class BaseQuestionStrategy: QuestionStrategy {
    // MARK: - Properties
    public var correctCount: Int {
        get { return questionGroup.score.correctCount }
        set { questionGroup.score.correctCount = newValue }
    }
    
    public var incorrectCount: Int {
        get { return questionGroup.score.incorrectCount }
        set { questionGroup.score.incorrectCount = newValue }
    }
    private var questionGroupCareTaker: QuestionGroupCareTaker
    
    private var questionGroup: QuestionGroup {
        return questionGroupCareTaker.selectedQuestionGroup
    }
    
    private var questionIndex = 0
    private let questions: [Question]
    
    // MARK: - Object LifeCycle
    public init(questionGroupCareTaker: QuestionGroupCareTaker,
                questions: [Question]) {
        self.questionGroupCareTaker = questionGroupCareTaker
        self.questions = questions
        
        self.questionGroupCareTaker.selectedQuestionGroup.score = QuestionGroup.Score()
    }
    
    // MARK: - QuestionStrategy
    public var title: String {
        return questionGroup.title
    }
    
    public func currentQuestion() -> Question {
        return questionGroup.questions[questionIndex]
    }
    
    public func advanceToNextQuestion() -> Bool {
        try? questionGroupCareTaker.save()
        guard questionIndex + 1 < questionGroup.questions.count else { return false }
        questionIndex += 1
        return true
    }
    
    public func markQuestionCorrect(_ question: Question) {
        correctCount += 1
    }
    
    public func markQuestionInCorrect(_ question: Question) {
        incorrectCount += 1
    }
    
    public func questionIndexTitle() -> String {
        return "\(questionIndex + 1)/" + "\(questionGroup.questions.count)"
    }
}
