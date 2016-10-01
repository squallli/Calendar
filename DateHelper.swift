import UIKit

class DateHelper
{
    static func getDayOfWeek(today:String)->Int {
        
        let formatter  = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let todayDate = formatter.date(from: today)!
        let myCalendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)!
        let myComponents = myCalendar.components(.weekday, from: todayDate)
        let weekDay = myComponents.weekday
        return weekDay!
    }
    
    static func getDayOfMonth(date:Date)->Int {
        return getDayOfWeek(today: getStringWithDayFormat(fromDate: date, formate: "yyyy/MM/01"))
    }
    
    static func getLastDayOfMonth(date:Date)->Date {
        return AddDay(currDate: AddMonth(currDate: getFirstDayOfMonth(date: date), month: 1), day: -1)
    }
    
    static func getFirstDayOfMonth(date:Date)->Date {
        return getDateWithStringFormat(DateString: getStringWithDayFormat(fromDate:date,formate: "yyyy/MM/01"),formate:"yyyy/MM/dd")
    }
    
    static func getStringWithDayFormat(fromDate:Date,formate:String)->String {
        
        let formatter  = DateFormatter()
        formatter.dateFormat = formate
        
        return formatter.string(from: fromDate)
    }
    
    static func getDateWithStringFormat(DateString:String,formate:String)->Date {
        
        let formatter  = DateFormatter()
        formatter.dateFormat = formate
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        
        return formatter.date(from:DateString)!
    }
    
    static func AddDay(currDate:Date,day:Int) -> Date
    {
        let cal = NSCalendar(calendarIdentifier: NSCalendar.Identifier(rawValue: NSCalendar.Identifier.gregorian.rawValue))
        let nextNDays = cal?.date(byAdding: NSCalendar.Unit.day, value: day, to: currDate, options: NSCalendar.Options(rawValue: 0))
        
        return nextNDays!
    }
    
    static func AddMonth(currDate:Date,month:Int) -> Date
    {
        let cal = NSCalendar(calendarIdentifier: NSCalendar.Identifier(rawValue: NSCalendar.Identifier.gregorian.rawValue))
        let nextMnoths = cal?.date(byAdding: NSCalendar.Unit.month, value: month, to: currDate, options: NSCalendar.Options(rawValue: 0))
        
        return nextMnoths!
    }
    
   }
