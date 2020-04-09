import Foundation
import UIKit

public class Culture {
    
    public let tips: [String]
    public let alternatives: [String]
    public let answer: String
    
    public init(tips: [String], alternatives: [String], answer: String){
        self.tips = tips
        self.alternatives = alternatives
        self.answer = answer
    }
}

public class Country {
    
    public let name: String
    public var questions: [Culture]
    
    public init(){
        self.name = ""
        self.questions = []
    }
    
    public init(name: String, questions: [Culture]){
        self.name = name
        self.questions = questions
    }
}

public class Quiz {
    
    public var quiz: [Country]
    
    public init(){
        self.quiz = []
    }
}


