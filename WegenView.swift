import SwiftUI
import Charts // Assuming you're using Charts for visualization

struct WeightEntry {
    var date: Date
    var weight: Double
    var circumference: Double
    var notes: String
}

struct WegenView: View {
    @State private var currentWeight: Double = 0.0
    @State private var previousWeight: Double = 0.0
    @State private var startWeight: Double = 0.0
    @State private var weightHistory: [WeightEntry] = []
    @State private var newWeight: String = ""
    @State private var newCircumference: String = ""
    @State private var newNote: String = ""

    var weightDelta: Double {
        return currentWeight - previousWeight
    }

    var body: some View {
        VStack {
            Text("Current Weight: \(currentWeight, specifier: "%.1f") kg")
            Text("Weight Delta: \(weightDelta, specifier: "%.1f") kg")
            Text("Starting Weight: \(startWeight, specifier: "%.1f") kg")
            
            List(weightHistory, id: \ .date) { entry in
                VStack(alignment: .leading) {
                    Text("\(entry.date, formatter: DateFormatter())")
                    Text("Weight: \(entry.weight) kg")
                    Text("Circumference: \(entry.circumference) cm")
                    Text("Notes: \(entry.notes)")
                }
            }

            HStack {
                TextField("Enter Weight", text: \$newWeight)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Enter Circumference", text: \$newCircumference)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Enter Notes", text: \$newNote)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: addNewEntry) {
                    Text("Add Entry")
                }
            }

            Chart(weightHistory.map { ($0.date, $0.weight) }) {
                LineMark(x: \ .0, y: \ .1)
            }
        }
    }

    private func addNewEntry() {
        guard let weight = Double(newWeight), let circumference = Double(newCircumference) else { return }
        let entry = WeightEntry(date: Date(), weight: weight, circumference: circumference, notes: newNote)
        weightHistory.append(entry)
        currentWeight = weight // Optional: set current weight to new entry
        newWeight = ""
        newCircumference = ""
        newNote = ""
    }
}

struct WegenView_Previews: PreviewProvider {
    static var previews: some View {
        WegenView()
    }
}