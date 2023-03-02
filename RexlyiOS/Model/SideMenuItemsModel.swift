//
//  SideMenuItemsModel.swift
//  RexlyiOS
//
//  Created by Gregg Trimarchi on 2/24/23.
//

import Foundation
import SwiftUI

enum MenuItem: Int, CaseIterable {
    case accountinfo
    //case logout
    
    var title: String {
        switch self {
        case .accountinfo: return "My Account"
        //case .logout: return "Log out"
        }
    }
    
    var imageName: String {
        switch self {
        case .accountinfo: return "person"
        //case .logout: return "person"
        }
    }
    
    @ViewBuilder var handler: some View {
        
            switch self {
            case .accountinfo: AccountView()
            }
    }
}

extension MenuItem {
    static let items: [MenuItem] = [.accountinfo]
}
