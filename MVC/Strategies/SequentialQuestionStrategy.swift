//
//  SequentialQuestionStrategy.swift
//  MVC
//
//  Created by victor on 08/12/2019.
//  Copyright © 2019 victor. All rights reserved.
//
public class SequentialQuestionStrategy: BaseQuestionStrategy {
    public convenience init(
        questionGroupCareTaker: QuestionGroupCareTaker) {
        let questionGroup = questionGroupCareTaker.selectedQuestionGroup!
        let questions = questionGroup.questions
        self.init(questionGroupCareTaker: questionGroupCareTaker, questions: questions)
    }
}
