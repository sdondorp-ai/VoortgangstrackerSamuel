import Foundation

class AppState {
    // MARK: - Properties
    var nutritionData: [String: Any] = [:]
    var trainingLog: [String: Any] = [:]
    var weight: Double = 0.0

    private let userDefaults = UserDefaults.standard
    private let nutritionKey = "nutritionData"
    private let trainingKey = "trainingLog"
    private let weightKey = "weight"

    // MARK: - Initialization
    init() {
        loadState()
    }

    // MARK: - Data Persistence
    private func loadState() {
        if let savedNutrition = userDefaults.dictionary(forKey: nutritionKey) {
            nutritionData = savedNutrition
        }
        if let savedTraining = userDefaults.dictionary(forKey: trainingKey) {
            trainingLog = savedTraining
        }
        weight = userDefaults.double(forKey: weightKey)
    }

    private func saveState() {
        userDefaults.set(nutritionData, forKey: nutritionKey)
        userDefaults.set(trainingLog, forKey: trainingKey)
        userDefaults.set(weight, forKey: weightKey)
    }

    // MARK: - Nutrition Tracking
    func addNutritionEntry(identifier: String, data: Any) {
        nutritionData[identifier] = data
        saveState()
    }

    func getNutritionEntry(identifier: String) -> Any? {
        return nutritionData[identifier]
    }

    // MARK: - Training Logging
    func addTrainingEntry(identifier: String, data: Any) {
        trainingLog[identifier] = data
        saveState()
    }

    func getTrainingEntry(identifier: String) -> Any? {
        return trainingLog[identifier]
    }

    // MARK: - Weight Management
    func setWeight(newWeight: Double) {
        weight = newWeight
        saveState()
    }

    func getWeight() -> Double {
        return weight
    }
}