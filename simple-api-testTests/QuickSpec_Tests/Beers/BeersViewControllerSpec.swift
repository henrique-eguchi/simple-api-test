//
//  BeersViewControllerSpec.swift
//  simple-api-testTests
//
//  Created by Henrique Akiyoshi Eguchi on 29/10/19.
//  Copyright © 2019 Henrique Akiyoshi Eguchi. All rights reserved.
//

import Nimble
import Nimble_Snapshots
import Quick
@testable import simple_api_test

class BeersViewControllerSpec: QuickSpec {
    override func spec() {
        var sut: BeersViewController!
        var view: UIView!
        var tableView: UITableView!
        
        describe("BeersViewController") {
            beforeEach {
                tableView = UITableView()
                sut = BeersViewController()
                sut.tableView = tableView
                sut.viewDidLoad()
                
                view = sut.view
            }
            context("BeersViewController Layout and initalization") {
                it("should init properly") {
                    expect(sut.tableView).toNot(beNil())
                    expect(sut.fetchingMore).toNot(beNil())
                }
                
                it("should have stable Layout ") {
                    expect(view) == snapshot("beers_view")
                }
            }
            afterEach {
                sut = nil
                view = nil
                tableView = nil
            }
        }
    }
}
