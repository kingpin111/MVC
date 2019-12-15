//
//  RandomQuestionStrategy.swift
//  MVC
//
//  Created by victor on 08/12/2019.
//  Copyright © 2019 victor. All rights reserved.
//

import GameplayKit.GKRandomSource

public class RandomQuestionStrategy: BaseQuestionStrategy {
    
    public convenience init(
        questionGroupCareTaker: QuestionGroupCareTaker) {
        let questionGroup = questionGroupCareTaker.selectedQuestionGroup!
        let randomSource = GKRandomSource.sharedRandom()
        let questions = randomSource.arrayByShufflingObjects(in: questionGroup.questions) as! [Question]
        self.init(questionGroupCareTaker: questionGroupCareTaker, questions: questions)
    }
}
