//
//  Person.swift
//  BoostcampRelay23
//
//  Created by Seungeon Kim on 2020/08/07.
//  Copyright © 2020 Boostcamp challenge. All rights reserved.
//

import Foundation
import RealmSwift


class PersonData: Object{
    @objc dynamic var number = 0
    @objc dynamic var title = ""
    @objc dynamic var text = ""
    @objc dynamic var date = ""
}
