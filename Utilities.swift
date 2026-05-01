import Foundation

// Date Formatter
let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "nl_NL")
    return formatter
}()

// Format date labels
func formatDateLabel(for date: Date) -> String {
    let calendar = Calendar.current
    let today = calendar.startOfDay(for: Date())
    let targetDate = calendar.startOfDay(for: date)
    if targetDate == today {
        return "vandaag"
    } else if calendar.isDateInYesterday(date) {
        return "gisteren"
    } else {
        return dateFormatter.weekdaySymbols[calendar.component(.weekday, from: date) - 1]
    }
}

// Format full date
func formatDateFull(for date: Date) -> String {
    dateFormatter.dateStyle = .full
    return dateFormatter.string(from: date)
}

// Format short date
func formatDateShort(for date: Date) -> String {
    dateFormatter.dateStyle = .short
    return dateFormatter.string(from: date)
}

// Get Monday of the week
func getMondayOfWeek(for date: Date) -> Date? {
    let calendar = Calendar.current
    let weekday = calendar.component(.weekday, from: date)
    return calendar.date(byAdding: .day, value: -(weekday - 2), to: calendar.startOfDay(for: date))
}

// Return today's date in ISO format
func todayISO() -> String {
    let today = Date()
    return dateFormatter.string(from: today)
}

// Return date only in YYYY-MM-DD format
func dateOnly(for date: Date) -> String {
    dateFormatter.dateFormat = "yyyy-MM-dd"
    return dateFormatter.string(from: date)
}

// Number formatting for Dutch locale
let numberFormatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.locale = Locale(identifier: "nl_NL")
    formatter.numberStyle = .decimal
    return formatter
}()