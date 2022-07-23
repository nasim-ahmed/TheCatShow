//
//  TheCatShowTests.swift
//  TheCatShowTests
//
//  Created by Nasim Ahmed on 23.07.22.
//

import XCTest
import Combine
@testable import TheCatShow

class TheCatShowTests: XCTestCase {

    override func setUp(){
        
    }
    
    override func tearDown(){
        subscriptions = []
    }
    
    var subscriptions = Set<AnyCancellable>()
    
    func test_getting_breeds_success(){
        let results = Result<[Breed], APIError>.success([Breed.example1()])
        
        let fetcher = BreedFetcher(service: MockAPIService(result: results))
        
        let promise = expectation(description: "Expecting a breeds fetch to pass")
        
        fetcher.$breeds.sink{breeds in
            if breeds.count > 0 {
                promise.fulfill()
            }
        }.store(in: &subscriptions)
        
        wait(for: [promise], timeout: 2.0)
    }
    
    func test_loading_error(){
        let results = Result<[Breed], APIError>.failure(APIError.badURL)
        
        let fetcher = BreedFetcher(service: MockAPIService(result: results))
        
        let promise = expectation(description: "testing for error")
        
        fetcher.$breeds.sink{ breeds in
            if !breeds.isEmpty{
                XCTFail()
            }
        }.store(in: &subscriptions)
        
        
        fetcher.$errorMessage.sink{ msg in
            if msg != nil{
                promise.fulfill()
            }
        }.store(in: &subscriptions)
        
        wait(for: [promise], timeout: 2.0)
    }

}
