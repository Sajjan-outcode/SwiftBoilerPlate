import UIKit

class UserManager {
    
    static var global = UserManager()
    
    var cachedProfileImage: UIImage?
    
    private init() {}
    
    
    func setCompanyInfo(userinfo: CompanyInfo?) {
        guard let info = userinfo else {
            UserDefaults.standard.setValue(nil, forKey: AppConstants.UserDefaults.companyInfoKey)
            return
        }
        do {
            let userInfoData = try JSONEncoder().encode(info)
            UserDefaults.standard.set(userInfoData, forKey: AppConstants.UserDefaults.companyInfoKey)
            UserDefaults.standard.synchronize()
        } catch {
           
        }
    }
    
    func setFirstTimeUser(firsTimeUser: Bool?) {
        guard let info = firsTimeUser else {
            UserDefaults.standard.setValue(false, forKey: AppConstants.UserDefaults.firstUserLogin)
            return
        }
            UserDefaults.standard.set(info, forKey: AppConstants.UserDefaults.firstUserLogin)
            UserDefaults.standard.synchronize()
 
    }
    
    func setIsAuthenticated(_ isAuthenticated: Bool?) {
        guard let info =  isAuthenticated else {
            UserDefaults.standard.setValue(false, forKey: AppConstants.UserDefaults.isAuthenticated)
            return
        }
            UserDefaults.standard.set(info, forKey: AppConstants.UserDefaults.isAuthenticated)
            UserDefaults.standard.synchronize()
 
    }

    func getCompanyInfo() -> CompanyInfo? {
        guard let data = UserDefaults.standard.data(forKey: AppConstants.UserDefaults.companyInfoKey) else { return nil }
        do {
            let userInfo = try JSONDecoder().decode(CompanyInfo.self, from: data)
            return userInfo
        } catch {
            
            return nil
        }
    }
    
    func getFirstTimeUser() -> Bool {
        let data = UserDefaults.standard.bool(forKey: AppConstants.UserDefaults.firstUserLogin)
        return data 
    }
  
    func getIsAuthenticated () -> Bool {
        let data = UserDefaults.standard.bool(forKey: AppConstants.UserDefaults.isAuthenticated)
        return data
    }
  
    
}
