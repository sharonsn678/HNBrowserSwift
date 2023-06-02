//
//  NewsItem.swift
//  NewsAppSn
//
//  Created by Sharon Shen on 5/21/23.
//

import Foundation

class NewsItem: Decodable {
    
    let title: String
    let objectID: String
    let points: Int
    let url: String?

}
