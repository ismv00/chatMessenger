//
//  Message.swift
//  ChatMessenger
//
//  Created by Igor S. Menezes on 12/06/24.
//

import Foundation

struct Message : Hashable {
    let uuid: String
    let text: String
    let isMe : Bool
}
