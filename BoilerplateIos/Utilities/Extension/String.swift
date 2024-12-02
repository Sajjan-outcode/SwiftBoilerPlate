import UIKit

extension String {
    
    var toInt: Int {
        return  Int(self) ?? 0
    }
    
    var doubleValue: Double {
        return Double(self) ?? 0.0
    }
    
    func getDouble() -> Double? {
        return Double(self)
    }
    
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    func letterize() -> [String] {
        return self.map { String($0) }
    }
    
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin,
                                            attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(boundingBox.height)
    }
    
    var isValidEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return predicate.evaluate(with: self)
    }
    
    var isInValidEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return !(predicate.evaluate(with: self))
    }
    
    var isValidPassword: Bool {
        let passwordRegEx = "^(?=.*?[A-Za-z])(?=.*?[0123456789#?!@$%^&*-]).{8,}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        return predicate.evaluate(with: self)
    }
    
    var isValidFullName: Bool {
        let alphaRegEx = "[A-Za-z ]+"
        let predicate = NSPredicate(format: "SELF MATCHES %@", alphaRegEx)
        return predicate.evaluate(with: self)
    }
    
    var isValidAlphaNumeric: Bool {
        let alphaNumericRegEx = "[a-zA-Z0-9 ]+"
        let predicate = NSPredicate(format: "SELF MATCHES %@", alphaNumericRegEx)
        return predicate.evaluate(with: self)
    }
    
    var isValidNumeric: Bool {
        let alphaNumericRegEx = "[0-9 ]+"
        let predicate = NSPredicate(format: "SELF MATCHES %@", alphaNumericRegEx)
        return predicate.evaluate(with: self)
    }
    
    var isValidAlphabetOnly: Bool {
        let alphaRegEx = "[A-Za-z_-]+"
        let predicate = NSPredicate(format: "SELF MATCHES %@", alphaRegEx)
        return predicate.evaluate(with: self)
    }
    
    var isInValidFullName: Bool {
        let alphaRegEx = "[A-Za-z]+"
        let predicate = NSPredicate(format: "SELF MATCHES %@", alphaRegEx)
        return !(predicate.evaluate(with: self))
    }
    
    var isValidPhoneNumber: Bool {
        let alphaNumericRegEx = "[0-9+ ]+"
        let predicate = NSPredicate(format: "SELF MATCHES %@", alphaNumericRegEx)
        return predicate.evaluate(with: self)
    }
    
    func isEqual(to str: String) -> Bool {
        return self == str
    }
    
    var asUrl: URL? {
        if self.hasPrefix("http://") || self.hasPrefix("https://") {
            return URL(string: self)
        }
        return URL(string: "http://\(self)")
    }
    
    var isNotEmpty: Bool { return !self.isEmpty }
    
    var isBlank: Bool { return self.replacingOccurrences(of: " ", with: "").isEmpty }
    
    var isNotBlank: Bool { return !self.replacingOccurrences(of: " ", with: "").isEmpty }
    
    var json: [String: Any]? {
        let data = Data(self.utf8)
        do {
            // make sure this JSON is in the format we expect
            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                return json
            }
        } catch {
            return nil
        }
        return nil
    }
    
    func decodeJson<ResponseType: Decodable>(toType: ResponseType.Type) -> ResponseType? {
        do {
            let decoder = JSONDecoder()
            let decodedResult = try decoder.decode(ResponseType.self,
                                                   from: self.data(using: .utf8)!)
            return decodedResult
        } catch {
            return nil
        }
    }
    
    static func randomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 "
        return String((0..<length).map { _ in letters.randomElement()! })
    }
    
    func getColoredSubString(with subStringToColor: String,
                             and color: UIColor) -> NSAttributedString {
        let range = (self as NSString).range(of: subStringToColor)
        let attributedString = NSMutableAttributedString(string: self)
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor,
                                      value: color,
                                      range: range)
        return attributedString
    }
    
    func getBoldSubString(with subStrings: [String],
                          font: UIFont) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        for string in subStrings {
            let range = (self as NSString).range(of: string)
            
            attributedString.addAttribute(NSAttributedString.Key.font,
                                          value: font,
                                          range: range)
        }
        return attributedString
    }
    
    func getUnderlinedSubString(with subStringToColor: String,
                                and color: UIColor,
                                addUnderline: Bool = true) -> NSAttributedString {
        let range = (self as NSString).range(of: subStringToColor)
        let attributedString = NSMutableAttributedString(string: self)
        if addUnderline {
            attributedString.addAttribute(NSAttributedString.Key.underlineColor,
                                          value: color,
                                          range: range)
            attributedString.addAttribute(NSAttributedString.Key.underlineStyle,
                                          value: 1,
                                          range: range)
        }
        return attributedString
    }
    
    var trimmed: String {
        return self.trimmingCharacters(in: .whitespaces)
    }
    
}

extension Optional where Wrapped == String {
    
    var unWrapped: String {
        return self ?? ""
    }

    
    func round(to places: Int) -> Double? {
        guard let unWrapped = self else { return nil }
        guard let double = Double(unWrapped) else { return nil }
        let divisor = pow(10.0, Double(places))
        return (double * divisor).rounded() / divisor
    }
    
}

extension String {
    
    var isValidURL: Bool {
        do {
            let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
            if let match = detector.firstMatch(in: self, options: [],
                                               range: NSRange(location: 0,
                                                              length: self.utf16.count)) {
                // it is a link, if the match covers the whole string
                return match.range.length == self.utf16.count
            } else {
                return false
            }
        } catch {
          //  Utilities.printMessage(error.localizedDescription)
        }
        return false
    }
    
}

struct SubtitleData {
    var startTime: TimeInterval
    var endTime: TimeInterval
    var text: String
}
