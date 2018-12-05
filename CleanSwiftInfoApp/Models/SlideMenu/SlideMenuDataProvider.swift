//
//  SlideMenuDataProvider.swift
//  CleanSwiftInfoApp
//
//  Created by Yani Buchkov on 30.11.18.
//  Copyright © 2018 Yani Buchkov. All rights reserved.
//

import Foundation

struct SlideMenuItemResponse {
    var actions: [SlideMenuActionType]
}

final class SlideMenuDataProvider: ArrayDataProvider<SlideMenuItemViewModel> {}
