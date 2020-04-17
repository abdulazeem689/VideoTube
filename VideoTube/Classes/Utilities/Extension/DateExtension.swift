//
//  DateExtension.swift
//  VideoTube
//
//  Created by Abdul Azeem on 17/04/20.
//  Copyright © 2020 Mindfire. All rights reserved.
//

import Foundation

extension Date {
    /// Returns the amount of years from another date
    func years(from date: Date) -> Int {
        return Calendar.current.dateComponents([.year], from: date, to: self).year ?? 0
    }
    /// Returns the amount of months from another date
    func months(from date: Date) -> Int {
        return Calendar.current.dateComponents([.month], from: date, to: self).month ?? 0
    }
    /// Returns the amount of weeks from another date
    func weeks(from date: Date) -> Int {
        return Calendar.current.dateComponents([.weekOfMonth], from: date, to: self).weekOfMonth ?? 0
    }
    /// Returns the amount of days from another date
    func days(from date: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: date, to: self).day ?? 0
    }
    /// Returns the amount of hours from another date
    func hours(from date: Date) -> Int {
        return Calendar.current.dateComponents([.hour], from: date, to: self).hour ?? 0
    }
    /// Returns the amount of minutes from another date
    func minutes(from date: Date) -> Int {
        return Calendar.current.dateComponents([.minute], from: date, to: self).minute ?? 0
    }
    /// Returns the amount of seconds from another date
    func seconds(from date: Date) -> Int {
        return Calendar.current.dateComponents([.second], from: date, to: self).second ?? 0
    }
    /// Returns the a custom time interval description from another date
    func offset(from date: Date) -> String {
        let year = years(from: date)
        if year > 0 { return year > 1 ? ("\(year) years ago") : ("\(year) year ago") }
        let month = months(from: date)
        if month > 0 { return month>1 ? ("\(month) months ago") : ("\(month) month ago") }
        let week = weeks(from: date)
        if week > 0 { return week > 1 ? ("\(week) weeks ago") : ("\(week) week ago") }
        let day = days(from: date)
        if day > 0 { return day > 1 ? ("\(day) days ago") : ("\(day) day ago") }
        let hour = hours(from: date)
        if hour > 0 { return hour > 1 ? ("\(hour) hours ago") : ("\(hour) hour ago") }
        let minute = minutes(from: date)
        if minute > 0 { return minute > 1 ? ("\(minute) minutes ago") : ("\(minute) minute ago") }
        let second = seconds(from: date)
        if second > 0 { return second > 1 ? ("\(second) seconds ago") : ("\(second) second ago") }
        return "just now"
    }
}
