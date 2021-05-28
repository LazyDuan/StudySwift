//
//  HttpRequest.swift
//  StudySwift
//
//  Created by macbook on 2021/5/14.
//

import Foundation

enum HTTPMethod: String {
    case GET
    case POST
}

protocol Request {
    var host: String { get }
    var path: String { get }
    
    var method: HTTPMethod { get }
    var parameter: [String: Any] { get }
    
    associatedtype Response
    func parse(data: Data) ->Response?
}
struct UserRequest: Request {
    
    let name: String
    
    let host = "https://gank.io/api"
    var path: String {
            return "/v2/\(name)"
        }
    let method: HTTPMethod = .GET
    let parameter: [String: Any] = [:]
    
    typealias Response = Banner
    
    func parse(data: Data) -> Banner? {
        guard let obj = try? JSONSerialization.jsonObject(with: data, options:.mutableContainers) as? Dictionary<String, Any> else {
            return nil
        }
        let array:[Dictionary<String, Any>] = obj["data"] as! [Dictionary<String, Any>]
        
        return Banner(dictionary:array[0])
    }
}
extension Request {
    func send(hanlder:@escaping (Response?,Error?) -> Void){
        let url = URL(string: host.appending(path))!
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        let task = URLSession.shared.dataTask(with: request){
            data,res,error in
            if let data = data, let res = parse(data: data){
                DispatchQueue.main.async {
                    hanlder(res,nil)
                }
            }else{
                DispatchQueue.main.async {
                    hanlder(nil,error)
                }
            }
//            print(data as Any)
        }
        task.resume()
    }
}



protocol Client {
    func send<T:Request>(_ r: T, handler:@escaping (T.Response?) -> Void)
    var host: String { get }
}
struct URLSessionClient: Client {
    let host = "https://gank.io/api"
    
    func send<T:Request>(_ r: T, handler:@escaping (T.Response?) -> Void) {
        let url = URL(string: host.appending(r.path))!
        var request = URLRequest(url: url)
        request.httpMethod = r.method.rawValue
        let task = URLSession.shared.dataTask(with: request) {
            data, _, error in
            if let data = data, let res = r.parse(data: data) {
                DispatchQueue.main.async { handler(res) }
            } else {
                DispatchQueue.main.async { handler(nil) }
            }
        }
        task.resume()
    }
}
