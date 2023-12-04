//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 29.11.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    
    // MARK: - IB Outlets and Properties
    @IBOutlet var emojiResultLabel: UILabel!
    @IBOutlet var definitionResultLabel: UILabel!
    
    var answersChosen: [Answer]!
    
    private var animalsCount: [Character: Int] = [:]
    private var animalResulted = Animal.cat
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        countAnimals()
        determineMoreFrequentAnimal()
        emojiResultLabel.text = "Вы - \(animalResulted.rawValue)"
        definitionResultLabel.text = animalResulted.definition
    }
    
    // MARK: - IB Actions
    @IBAction func doneButtonAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    // MARK: - Private Methods
    private func countAnimals() {
        answersChosen.forEach {
            animalsCount[$0.animal.rawValue] = (animalsCount[$0.animal.rawValue] ?? 0) + 1
        }
    }
    
    private func determineMoreFrequentAnimal() {
        let moreFrequentAnimal = animalsCount.max { $0.value < $1.value }

        switch moreFrequentAnimal?.key {
        case Animal.cat.rawValue:
            animalResulted = Animal.cat
        case Animal.dog.rawValue:
            animalResulted = Animal.dog
        case Animal.turtle.rawValue:
            animalResulted = Animal.turtle
        default:
            animalResulted = Animal.rabbit
        }
    }
}
