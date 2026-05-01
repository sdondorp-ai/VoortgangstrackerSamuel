import SwiftUI

struct SettingsView: View {
    @State private var kcalGoal: Int = 2000
    @State private var proteinGoal: Int = 150
    @State private var carbsGoal: Int = 250
    @State private var fatGoal: Int = 70
    
    @State private var movementTarget: Int = 10000
    @State private var startWeight: Double = 70.0
    @State private var goalWeight: Double = 65.0
    
    @State private var showConfirmationDialog = false

    var body: some View {
        Form {
            Section(header: Text("Nutrition Goals")) {
                TextField("Calories (kcal)", value: &$kcalGoal, formatter: NumberFormatter())
                TextField("Protein (g)", value: &$proteinGoal, formatter: NumberFormatter())
                TextField("Carbohydrates (g)", value: &$carbsGoal, formatter: NumberFormatter())
                TextField("Fat (g)", value: &$fatGoal, formatter: NumberFormatter())
            }
            
            Section(header: Text("Movement Targets")) {
                TextField("Movement Target", value: &$movementTarget, formatter: NumberFormatter())
            }
            
            Section(header: Text("Weight Goals")) {
                TextField("Start Weight (kg)", value: &$startWeight, formatter: NumberFormatter())
                TextField("Goal Weight (kg)", value: &$goalWeight, formatter: NumberFormatter())
            }
            
            Section {
                Button("Export Data to JSON") {
                    exportDataToJSON()
                }
                Button("Import Data from JSON") {
                    importDataFromJSON()
                }
                Button("Reset All Data") {
                    showConfirmationDialog.toggle()
                }
                .confirmationDialog("Are you sure you want to reset all data?", isPresented: &$showConfirmationDialog) {
                    Button("Reset", role: .destructive) {
                        resetAllData()
                    }
                    Button("Cancel", role: .cancel) {}
                }
            }
        }
        .navigationTitle("Settings")
    }
    
    func exportDataToJSON() {
        // Implementation for exporting data to a JSON file
    }
    
    func importDataFromJSON() {
        // Implementation for importing data from a JSON file
    }
    
    func resetAllData() {
        // Implementation for resetting all data
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}