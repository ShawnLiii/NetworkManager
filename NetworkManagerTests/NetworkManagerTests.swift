//
//  NetworkManagerTests.swift
//  NetworkManagerTests
//
//  Created by Shawn Li on 6/1/20.
//  Copyright © 2020 ShawnLi. All rights reserved.
//

import XCTest
//import NetworkManager
//@testable import PhotoTableViewController
@testable import NetworkManager

class NetworkManagerTests: XCTestCase {

    var profiles: [Profile]?
    
    override func setUpWithError() throws
    {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws
    {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSingleton() throws
    {
        
        let obj1 = NetworkManager.shared
        let obj2 = NetworkManager.shared
        
        let isEqual = obj1 === obj2 ? true : false
        XCTAssertTrue(isEqual)
        
    }

    func testAPI()
    {
//        let expect = expectation(description: ".....")
//        self.wait(for: [expect], timeout: 30)

        NetworkManager.shared.createDataTask(requestUrl: URL(string: AppConstants.Network.urlPath2)!)
        { (data) in
            XCTAssertNotNil(data, "Fetch Data success")
//            self.wait(for: [expect], timeout: 10)
//            expect.fulfill()
        }

//        self.wait(for: [expect], timeout: 100)
    }
    
    func testBadAPI()
    {
        let expect = expectation(description: ".....")
        
        NetworkManager.shared.dataTaskTest(requestUrl: URL(string: "https://github.com/Alamofire/Alamofire/nayyar")!)
        { (data, response, error) in
            if let httpResponse = response as? HTTPURLResponse
            {
                let statusCode = httpResponse.statusCode
                
                if statusCode >= 200, statusCode < 300
                {
                    expect.fulfill()
                }
            }
        }
        self.wait(for: [expect], timeout: 10)
    }
    
    func testGoodAPI()
    {
        let expect = expectation(description: ".....")
        
        NetworkManager.shared.dataTaskTest(requestUrl: URL(string: AppConstants.Network.urlPath2)!)
        { (data, response, error) in
            if let httpResponse = response as? HTTPURLResponse
            {
                let statusCode = httpResponse.statusCode
                
                if statusCode >= 200, statusCode < 300
                {
                    expect.fulfill()
                }
            }
        }
        
        self.wait(for: [expect], timeout: 1)
    }
    
    func testController()
    {
        let photoObj = PhotoTableViewController()
        XCTAssertTrue(photoObj.flag)
    }
    
    func testModel()
    {
        NetworkManager.shared.downloadPhoto(url: URL(string: AppConstants.Network.urlPath2)!)
        { (image) in
            
            XCTAssertTrue(NetworkManager.shared.flag)
        }
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure
        {
           NetworkManager.shared.loadProfileData(requestUrl: URL(string: AppConstants.Network.urlPath2)!)
           { (profile) in
               DispatchQueue.main.async
               {
                   self.profiles = profile
                   
                   XCTAssertNotNil(self.profiles![0].avatar, "Fetch Data success")
               }
           }
        }
    }

}
