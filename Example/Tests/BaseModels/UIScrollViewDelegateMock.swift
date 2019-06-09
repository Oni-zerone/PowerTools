//
//  UIScrollViewDelegateMock.swift
//  PowerTools_Tests
//
//  Created by Andrea Altea on 09/06/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

// swiftlint:disable line_length
// swiftlint:disable variable_name
// swiftlint:disable large_tuple

class ScrollViewDelegateMock: NSObject, UIScrollViewDelegate {
    
    // MARK: - scrollViewDidScroll
    
    var scrollViewDidScrollCallsCount = 0
    var scrollViewDidScrollCalled: Bool {
        return scrollViewDidScrollCallsCount > 0
    }
    var scrollViewDidScrollReceivedScrollView: UIScrollView?
    var scrollViewDidScrollReceivedInvocations: [UIScrollView] = []
    var scrollViewDidScrollClosure: ((UIScrollView) -> Void)?
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollViewDidScrollCallsCount += 1
        scrollViewDidScrollReceivedScrollView = scrollView
        scrollViewDidScrollReceivedInvocations.append(scrollView)
        scrollViewDidScrollClosure?(scrollView)
    }
    
    // MARK: - scrollViewDidZoom
    
    var scrollViewDidZoomCallsCount = 0
    var scrollViewDidZoomCalled: Bool {
        return scrollViewDidZoomCallsCount > 0
    }
    var scrollViewDidZoomReceivedScrollView: UIScrollView?
    var scrollViewDidZoomReceivedInvocations: [UIScrollView] = []
    var scrollViewDidZoomClosure: ((UIScrollView) -> Void)?
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        scrollViewDidZoomCallsCount += 1
        scrollViewDidZoomReceivedScrollView = scrollView
        scrollViewDidZoomReceivedInvocations.append(scrollView)
        scrollViewDidZoomClosure?(scrollView)
    }
    
    // MARK: - scrollViewWillBeginDragging
    
    var scrollViewWillBeginDraggingCallsCount = 0
    var scrollViewWillBeginDraggingCalled: Bool {
        return scrollViewWillBeginDraggingCallsCount > 0
    }
    var scrollViewWillBeginDraggingReceivedScrollView: UIScrollView?
    var scrollViewWillBeginDraggingReceivedInvocations: [UIScrollView] = []
    var scrollViewWillBeginDraggingClosure: ((UIScrollView) -> Void)?
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        scrollViewWillBeginDraggingCallsCount += 1
        scrollViewWillBeginDraggingReceivedScrollView = scrollView
        scrollViewWillBeginDraggingReceivedInvocations.append(scrollView)
        scrollViewWillBeginDraggingClosure?(scrollView)
    }
    
    // MARK: - scrollViewWillEndDragging
    
    var scrollViewWillEndDraggingWithVelocityTargetContentOffsetCallsCount = 0
    var scrollViewWillEndDraggingWithVelocityTargetContentOffsetCalled: Bool {
        return scrollViewWillEndDraggingWithVelocityTargetContentOffsetCallsCount > 0
    }
    var scrollViewWillEndDraggingWithVelocityTargetContentOffsetReceivedArguments: (scrollView: UIScrollView, velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>)?
    var scrollViewWillEndDraggingWithVelocityTargetContentOffsetReceivedInvocations: [(scrollView: UIScrollView, velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>)] = []
    var scrollViewWillEndDraggingWithVelocityTargetContentOffsetClosure: ((UIScrollView, CGPoint, UnsafeMutablePointer<CGPoint>) -> Void)?
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        scrollViewWillEndDraggingWithVelocityTargetContentOffsetCallsCount += 1
        scrollViewWillEndDraggingWithVelocityTargetContentOffsetReceivedArguments = (scrollView: scrollView, velocity: velocity, targetContentOffset: targetContentOffset)
        scrollViewWillEndDraggingWithVelocityTargetContentOffsetReceivedInvocations.append((scrollView: scrollView, velocity: velocity, targetContentOffset: targetContentOffset))
        scrollViewWillEndDraggingWithVelocityTargetContentOffsetClosure?(scrollView, velocity, targetContentOffset)
    }
    
    // MARK: - scrollViewDidEndDragging
    
    var scrollViewDidEndDraggingWillDecelerateCallsCount = 0
    var scrollViewDidEndDraggingWillDecelerateCalled: Bool {
        return scrollViewDidEndDraggingWillDecelerateCallsCount > 0
    }
    var scrollViewDidEndDraggingWillDecelerateReceivedArguments: (scrollView: UIScrollView, decelerate: Bool)?
    var scrollViewDidEndDraggingWillDecelerateReceivedInvocations: [(scrollView: UIScrollView, decelerate: Bool)] = []
    var scrollViewDidEndDraggingWillDecelerateClosure: ((UIScrollView, Bool) -> Void)?
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        scrollViewDidEndDraggingWillDecelerateCallsCount += 1
        scrollViewDidEndDraggingWillDecelerateReceivedArguments = (scrollView: scrollView, decelerate: decelerate)
        scrollViewDidEndDraggingWillDecelerateReceivedInvocations.append((scrollView: scrollView, decelerate: decelerate))
        scrollViewDidEndDraggingWillDecelerateClosure?(scrollView, decelerate)
    }
    
    // MARK: - scrollViewWillBeginDecelerating
    
    var scrollViewWillBeginDeceleratingCallsCount = 0
    var scrollViewWillBeginDeceleratingCalled: Bool {
        return scrollViewWillBeginDeceleratingCallsCount > 0
    }
    var scrollViewWillBeginDeceleratingReceivedScrollView: UIScrollView?
    var scrollViewWillBeginDeceleratingReceivedInvocations: [UIScrollView] = []
    var scrollViewWillBeginDeceleratingClosure: ((UIScrollView) -> Void)?
    
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        scrollViewWillBeginDeceleratingCallsCount += 1
        scrollViewWillBeginDeceleratingReceivedScrollView = scrollView
        scrollViewWillBeginDeceleratingReceivedInvocations.append(scrollView)
        scrollViewWillBeginDeceleratingClosure?(scrollView)
    }
    
    // MARK: - scrollViewDidEndDecelerating
    
    var scrollViewDidEndDeceleratingCallsCount = 0
    var scrollViewDidEndDeceleratingCalled: Bool {
        return scrollViewDidEndDeceleratingCallsCount > 0
    }
    var scrollViewDidEndDeceleratingReceivedScrollView: UIScrollView?
    var scrollViewDidEndDeceleratingReceivedInvocations: [UIScrollView] = []
    var scrollViewDidEndDeceleratingClosure: ((UIScrollView) -> Void)?
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        scrollViewDidEndDeceleratingCallsCount += 1
        scrollViewDidEndDeceleratingReceivedScrollView = scrollView
        scrollViewDidEndDeceleratingReceivedInvocations.append(scrollView)
        scrollViewDidEndDeceleratingClosure?(scrollView)
    }
    
    // MARK: - scrollViewDidEndScrollingAnimation
    
    var scrollViewDidEndScrollingAnimationCallsCount = 0
    var scrollViewDidEndScrollingAnimationCalled: Bool {
        return scrollViewDidEndScrollingAnimationCallsCount > 0
    }
    var scrollViewDidEndScrollingAnimationReceivedScrollView: UIScrollView?
    var scrollViewDidEndScrollingAnimationReceivedInvocations: [UIScrollView] = []
    var scrollViewDidEndScrollingAnimationClosure: ((UIScrollView) -> Void)?
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        scrollViewDidEndScrollingAnimationCallsCount += 1
        scrollViewDidEndScrollingAnimationReceivedScrollView = scrollView
        scrollViewDidEndScrollingAnimationReceivedInvocations.append(scrollView)
        scrollViewDidEndScrollingAnimationClosure?(scrollView)
    }
    
    // MARK: - viewForZooming
    
    var viewForZoomingInCallsCount = 0
    var viewForZoomingInCalled: Bool {
        return viewForZoomingInCallsCount > 0
    }
    var viewForZoomingInReceivedScrollView: UIScrollView?
    var viewForZoomingInReceivedInvocations: [UIScrollView] = []
    var viewForZoomingInReturnValue: UIView?
    var viewForZoomingInClosure: ((UIScrollView) -> UIView?)?
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        viewForZoomingInCallsCount += 1
        viewForZoomingInReceivedScrollView = scrollView
        viewForZoomingInReceivedInvocations.append(scrollView)
        return viewForZoomingInClosure.map({ $0(scrollView) }) ?? viewForZoomingInReturnValue
    }
    
    // MARK: - scrollViewWillBeginZooming
    
    var scrollViewWillBeginZoomingWithCallsCount = 0
    var scrollViewWillBeginZoomingWithCalled: Bool {
        return scrollViewWillBeginZoomingWithCallsCount > 0
    }
    var scrollViewWillBeginZoomingWithReceivedArguments: (scrollView: UIScrollView, view: UIView?)?
    var scrollViewWillBeginZoomingWithReceivedInvocations: [(scrollView: UIScrollView, view: UIView?)] = []
    var scrollViewWillBeginZoomingWithClosure: ((UIScrollView, UIView?) -> Void)?
    
    func scrollViewWillBeginZooming(_ scrollView: UIScrollView, with view: UIView?) {
        scrollViewWillBeginZoomingWithCallsCount += 1
        scrollViewWillBeginZoomingWithReceivedArguments = (scrollView: scrollView, view: view)
        scrollViewWillBeginZoomingWithReceivedInvocations.append((scrollView: scrollView, view: view))
        scrollViewWillBeginZoomingWithClosure?(scrollView, view)
    }
    
    // MARK: - scrollViewDidEndZooming
    
    var scrollViewDidEndZoomingWithAtScaleCallsCount = 0
    var scrollViewDidEndZoomingWithAtScaleCalled: Bool {
        return scrollViewDidEndZoomingWithAtScaleCallsCount > 0
    }
    var scrollViewDidEndZoomingWithAtScaleReceivedArguments: (scrollView: UIScrollView, view: UIView?, scale: CGFloat)?
    var scrollViewDidEndZoomingWithAtScaleReceivedInvocations: [(scrollView: UIScrollView, view: UIView?, scale: CGFloat)] = []
    var scrollViewDidEndZoomingWithAtScaleClosure: ((UIScrollView, UIView?, CGFloat) -> Void)?
    
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        scrollViewDidEndZoomingWithAtScaleCallsCount += 1
        scrollViewDidEndZoomingWithAtScaleReceivedArguments = (scrollView: scrollView, view: view, scale: scale)
        scrollViewDidEndZoomingWithAtScaleReceivedInvocations.append((scrollView: scrollView, view: view, scale: scale))
        scrollViewDidEndZoomingWithAtScaleClosure?(scrollView, view, scale)
    }
    
    // MARK: - scrollViewShouldScrollToTop
    
    var scrollViewShouldScrollToTopCallsCount = 0
    var scrollViewShouldScrollToTopCalled: Bool {
        return scrollViewShouldScrollToTopCallsCount > 0
    }
    var scrollViewShouldScrollToTopReceivedScrollView: UIScrollView?
    var scrollViewShouldScrollToTopReceivedInvocations: [UIScrollView] = []
    var scrollViewShouldScrollToTopReturnValue: Bool!
    var scrollViewShouldScrollToTopClosure: ((UIScrollView) -> Bool)?
    
    func scrollViewShouldScrollToTop(_ scrollView: UIScrollView) -> Bool {
        scrollViewShouldScrollToTopCallsCount += 1
        scrollViewShouldScrollToTopReceivedScrollView = scrollView
        scrollViewShouldScrollToTopReceivedInvocations.append(scrollView)
        return scrollViewShouldScrollToTopClosure.map({ $0(scrollView) }) ?? scrollViewShouldScrollToTopReturnValue
    }
    
    // MARK: - scrollViewDidScrollToTop
    
    var scrollViewDidScrollToTopCallsCount = 0
    var scrollViewDidScrollToTopCalled: Bool {
        return scrollViewDidScrollToTopCallsCount > 0
    }
    var scrollViewDidScrollToTopReceivedScrollView: UIScrollView?
    var scrollViewDidScrollToTopReceivedInvocations: [UIScrollView] = []
    var scrollViewDidScrollToTopClosure: ((UIScrollView) -> Void)?
    
    func scrollViewDidScrollToTop(_ scrollView: UIScrollView) {
        scrollViewDidScrollToTopCallsCount += 1
        scrollViewDidScrollToTopReceivedScrollView = scrollView
        scrollViewDidScrollToTopReceivedInvocations.append(scrollView)
        scrollViewDidScrollToTopClosure?(scrollView)
    }
    
    // MARK: - scrollViewDidChangeAdjustedContentInset
    
    var scrollViewDidChangeAdjustedContentInsetCallsCount = 0
    var scrollViewDidChangeAdjustedContentInsetCalled: Bool {
        return scrollViewDidChangeAdjustedContentInsetCallsCount > 0
    }
    var scrollViewDidChangeAdjustedContentInsetReceivedScrollView: UIScrollView?
    var scrollViewDidChangeAdjustedContentInsetReceivedInvocations: [UIScrollView] = []
    var scrollViewDidChangeAdjustedContentInsetClosure: ((UIScrollView) -> Void)?
    
    func scrollViewDidChangeAdjustedContentInset(_ scrollView: UIScrollView) {
        scrollViewDidChangeAdjustedContentInsetCallsCount += 1
        scrollViewDidChangeAdjustedContentInsetReceivedScrollView = scrollView
        scrollViewDidChangeAdjustedContentInsetReceivedInvocations.append(scrollView)
        scrollViewDidChangeAdjustedContentInsetClosure?(scrollView)
    }
}
