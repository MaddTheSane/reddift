//
//  ParserTest.swift
//  reddift
//
//  Created by sonson on 2015/04/20.
//  Copyright (c) 2015年 sonson. All rights reserved.
//

import UIKit
import XCTest

class ParserTest: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

//    func testLinkList() {
//        if let path = NSBundle(forClass: self.classForCoder).pathForResource("links", ofType: "json") {
//            if let data = NSData(contentsOfFile: path) {
//                if let json:AnyObject = NSJSONSerialization.JSONObjectWithData(data, options:NSJSONReadingOptions.allZeros, error: nil) {
//                    Parser.parseJSON(json, depth:0)
//                }
//            }
//        }
//    }
    
    func testComment() {
        if let path = NSBundle(forClass: self.classForCoder).pathForResource("comments01", ofType: "json") {
            if let data = NSData(contentsOfFile: path) {
                if let json:AnyObject = NSJSONSerialization.JSONObjectWithData(data, options:NSJSONReadingOptions.allZeros, error: nil) {
                    var obj:AnyObject? = Parser.parseJSON(json, depth:0)
                    if let array = obj as? [AnyObject] {
                        println(obj)
                        for element in array {
                            if let listing = element as? Listing {
                                println(listing.children)
                            }
                        }
                    }
                }
            }
        }
    }
    
//    func testParseThing_t1() {
//        if let path = NSBundle(forClass: self.classForCoder).pathForResource("t1", ofType: "json") {
//            if let data = NSData(contentsOfFile: path) {
//                if let json = NSJSONSerialization.JSONObjectWithData(data, options:NSJSONReadingOptions.allZeros, error: nil) as? [String:AnyObject] {
//                    if let thing = Parser.parseThing(json, depth:0) as? Thing {
//                        println(thing.data)
//                    }
//                }
//            }
//        }
//    }
//    
//    func testParseThing_t3() {
//        if let path = NSBundle(forClass: self.classForCoder).pathForResource("t3", ofType: "json") {
//            if let data = NSData(contentsOfFile: path) {
//                if let json = NSJSONSerialization.JSONObjectWithData(data, options:NSJSONReadingOptions.allZeros, error: nil) as? [String:AnyObject] {
//                    if let thing = Parser.parseThing(json, depth:0) as? Thing {
//                        println(thing.data)
//                    }
//                }
//            }
//        }
//    }

//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measureBlock() {
//            // Put the code you want to measure the time of here.
//        }
//    }
}