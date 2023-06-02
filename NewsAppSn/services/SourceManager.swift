//
//  SourceManager.swift
//  NewsAppSn
//
//  Created by Sharon Shen on 5/21/23.
//

import Foundation

class SourceManager {
    
    let delegate: SourceManangerDelegate
    
    init(delegate: SourceManangerDelegate){
        self.delegate = delegate
    }
    
    func loadData(){
        
        
        let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page")
        let mySession = URLSession.shared
        let dataTask = mySession.dataTask(with: url!, completionHandler:     {data, response, error in
            guard let safeData = data, error == nil else{
                print(error as Any)
                return
            }
            let jsonDecoder = JSONDecoder()
            
            do{
                let newsPage = try jsonDecoder.decode(NewsPage.self, from: safeData)
                DispatchQueue.main.async{
                    self.delegate.dataReceived(data: newsPage)
                }
            }catch{
                print("Fail to decode Json data")
            }
           
        })

        dataTask.resume()
        
    }
}

protocol SourceManangerDelegate{
    
    func dataReceived(data: NewsPage)
}
