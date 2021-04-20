//
//  DetailTest.swift
//  TDDCaseStudyTests
//
//  Created by alexis on 19/04/21.
//

import XCTest
@testable import TDDCaseStudy


class DetailTest: XCTestCase {

    func testDetailImageViewExists() {
        // given
        let sut = DetailViewController()
        // when
        sut.loadViewIfNeeded()
        // then
        XCTAssertNotNil(sut.imageView)
    }
    
    func testDetailViewIsImageView() {
        // given
        let sut = DetailViewController()
        // when
        sut.loadViewIfNeeded()
        // then
        XCTAssertEqual(sut.view, sut.imageView)
    }
    
    func testDetailLoadsImage() {
        // given
        let filenameToTest = "nssl-1.jpeg"
        let imageToLoad = UIImage(named: filenameToTest, in:
                                    Bundle.main, compatibleWith: nil)
        let sut = DetailViewController()
        sut.selectedImage = filenameToTest
        // when
        sut.loadViewIfNeeded()
        // then
        XCTAssertEqual(sut.imageView.image, imageToLoad)
    }
    
    func testSelectingImageShowsDetail() {
        func testSelectingImageShowsDetail() {
           // given
           let sut = ViewController()
           var selectedImage: String?
           let testIndexPath = IndexPath(row: 0, section: 0)
        // when
           sut.pictureSelectAction = {
              selectedImage = $0
           }
           sut.tableView(sut.tableView, didSelectRowAt: testIndexPath)
        // then
           XCTAssertEqual(selectedImage, "nssl-3.jpeg")
        }
    }
    
    func testSelectingImageShowsDetailImage() {
        // given
           let sut = ViewController()
           let testIndexPath = IndexPath(row: 0, section: 0)
           let filenameToTest = "nssl-3.jpeg"
           let imageToLoad = UIImage(named: filenameToTest, in:
        Bundle.main, compatibleWith: nil)
        // when
           sut.pictureSelectAction = {
              let detail = DetailViewController()
              detail.selectedImage = $0
              detail.loadViewIfNeeded()
              XCTAssertEqual(detail.imageView.image, imageToLoad)
        }
           sut.tableView(sut.tableView, didSelectRowAt: testIndexPath)
        }
}
