//
//  ParseResponseObjectTest.swift
//  reddift
//
//  Created by sonson on 2015/04/22.
//  Copyright (c) 2015年 sonson. All rights reserved.
//

import UIKit
import XCTest

class ParseResponseObjectTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testResponse_error() {
        let json:AnyObject? = self.jsonFromFileName("error.json")
        if let json:AnyObject = json {
            let object:AnyObject? = Parser.parseJSON(json)
            XCTAssert((object == nil), "Irregular json file test.")
        }
        else {
            XCTFail("JSON error")
        }
    }
    
    func testResponse_irregular() {
        for fileName in ["t1.json", "t2.json", "t3.json", "t4.json", "t5.json"] {
            let json:AnyObject? = self.jsonFromFileName(fileName)
            if let json:AnyObject = json {
                let object:AnyObject? = Parser.parseJSON(json)
                XCTAssert((object == nil), "Irregular json file test.")
            }
            else {
                XCTFail("JSON error")
            }
        }
    }
    
    func testResponse_comment() {
        let json:AnyObject? = self.jsonFromFileName("comments.json")
        if let json:AnyObject = json {
            if let objects = Parser.parseJSON(json) as? [JSON] {
                XCTAssertEqual(objects.count, 2, "Check 2 Listing objects")
                if let links = objects[0] as? [AnyObject] {
                    XCTAssertEqual(links.count, 1, "Check first Listing object's children.")
                    if links.count == 1 {
                        XCTAssert((links[0] is Link), "Check class of children.")
                    }
                }
                if let comments = objects[1] as? [AnyObject] {
                    XCTAssertEqual(comments.count, 26, "Check first Listing object's children.")
                    for comment in comments {
                        XCTAssert((comment is Comment), "Check class of children.")
                    }
                }
            }
            else {
                XCTFail("JSON error")
            }
        }
        else {
            XCTFail("JSON error")
        }
    }
    
    func testResponse_link() {
        let json:AnyObject? = self.jsonFromFileName("links.json")
        if let json:AnyObject = json {
            if let listing = Parser.parseJSON(json) as? Listing {
                XCTAssertEqual(listing.children.count, 26, "Check 2 Listing objects")
                for child in listing.children {
                    XCTAssert((child is Link), "Check class of children.")
                }
                XCTAssert((listing.paginator != nil), "Check class of children.")
            }
            else {
                XCTFail("JSON error")
            }
        }
        else {
            XCTFail("JSON error")
        }
    }
    
    func testResponse_message() {
        let json:AnyObject? = self.jsonFromFileName("message.json")
        if let json:AnyObject = json {
            if let listing = Parser.parseJSON(json) as? Listing {
                XCTAssertEqual(listing.children.count, 4, "Check 2 Listing objects")
                if listing.children.count == 4 {
                    XCTAssert((listing.children[0] is Comment), "Check class of children.")
                    XCTAssert((listing.children[1] is Comment), "Check class of children.")
                    XCTAssert((listing.children[2] is Comment), "Check class of children.")
                    XCTAssert((listing.children[3] is Message), "Check class of children.")
                }
            }
            else {
                XCTFail("JSON error")
            }
        }
        else {
            XCTFail("JSON error")
        }
    }

    func testResponse_subreddit() {
        let json:AnyObject? = self.jsonFromFileName("subreddit.json")
        if let json:AnyObject = json {
            if let listing = Parser.parseJSON(json) as? Listing {
                XCTAssertEqual(listing.children.count, 5, "Check 2 Listing objects")
                for child in listing.children {
                    XCTAssert((child is Subreddit), "Check class of children.")
                }
            }
            else {
                XCTFail("JSON error")
            }
        }
        else {
            XCTFail("JSON error")
        }
    }
    


}
