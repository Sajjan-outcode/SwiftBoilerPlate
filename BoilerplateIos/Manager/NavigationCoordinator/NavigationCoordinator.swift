//
//  NavigationCoordinator.swift
//  TimeEntry
//
//  Created by outcode  on 26/03/2024.
//


import Foundation
import SwiftUI
import Observation

enum Screens {
    case initialView
    case loginView
    case companyKeyView
    case homeView
    case dayListView
    case addTimeView
    case addDefaultTimeView
    case timelistDetailView
    case copyTime
}

@Observable
class NavigationCoordinator {
    var paths = NavigationPath()

    // We will add this item to navigate method to pass
    @ViewBuilder
    func navigate(to screen: Screens, data: Any?)  -> some View {
//        switch screen {
//        case .initialView:
//         //   InitialView().navigationBarBackButtonHidden(true)
//        case .loginView:
//           // LoginView().navigationBarBackButtonHidden(true)
//        case .companyKeyView:
//            // ChangeCompanyKeyView().navigationBarBackButtonHidden(true)
//        case .homeView:
//            HomeView().navigationBarBackButtonHidden(true)
//        case .dayListView:
//            DayListView().navigationBarBackButtonHidden(true)
//        case .addTimeView:
//            AddTimeView().navigationBarBackButtonHidden(true)
//        case .timelistDetailView:
//            DayTimesListDetailView().navigationBarBackButtonHidden(true)
//        case .addDefaultTimeView:
//            AddDefaultTimeView().navigationBarBackButtonHidden(true)
//        case .copyTime:
//            CopyTimeView().navigationBarBackButtonHidden(true)
//        }
    }

    // add screen
    func push(_ screen: Screens) {
        paths.append(screen)
    }

    // remove last screen
    func pop() {
        paths.removeLast()
    }

    // go to root screen
    func popToRoot() {
        paths.removeLast(paths.count)
    }
    
    
}

