import Foundation

public extension Error {
    func toDomainError() -> DomainError {
        switch (self as Error) {
        case DataTransferError.networkFailure(let networkError):
            return networkError.toDomainError()
        case DataTransferError.resolvedNetworkFailure(let error):
            return error.toDomainError()
        case DataTransferError.parsing(let error):
            return error.toDomainError()
        case NetworkError.notConnected:
            return .noInternetConnection
        case NetworkError.cancelled:
            return .ignorable
        case NetworkError.genericMessage(let message):
            return .error(message)
        case NetworkError.generic(let error):
            return .error(error.localizedDescription)
        default:
            if let domainError = self as? DomainError {
                return domainError
            } else if let errorString = self as? String {
                return parseErrorMessage(from: errorString)
            } else {
                return .contactCustomerSupport
            }
        }
    }
    
    func parseErrorMessage(from jsonString: String) -> DomainError {
        if let data = jsonString.data(using: .utf8),
           let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: String],
           let message = json["message"] {
            return .error(message.replacingOccurrences(of: "\\r\\n", with: "\n"))
        }
        return .contactCustomerSupport // Default error if parsing fails
    }
}


