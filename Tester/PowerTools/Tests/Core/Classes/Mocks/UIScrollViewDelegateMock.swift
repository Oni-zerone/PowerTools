//
//  UIScrollViewDelegateMock.swift
//  PowerTools_Tests
//
//  Created by Andrea Altea on 09/06/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

// swiftlint:disable line_length
// swiftlint:disable public variable_name
// swiftlint:disable large_tuple

public class ScrollViewDelegateMock: NSObject, UIScrollViewDelegate {
    
    public override init() { }

    // MARK: - scrollViewDidScroll
    
    public var scrollViewDidScrollCallsCount = 0
    public var scrollViewDidScrollCalled: Bool {
        return scrollViewDidScrollCallsCount > 0
    }
    public var scrollViewDidScrollReceivedScrollView: UIScrollView?
    public var scrollViewDidScrollReceivedInvocations: [UIScrollView] = []
    public var scrollViewDidScrollClosure: ((UIScrollView) -> Void)?
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollViewDidScrollCallsCount += 1
        scrollViewDidScrollReceivedScrollView = scrollView
        scrollViewDidScrollReceivedInvocations.append(scrollView)
        scrollViewDidScrollClosure?(scrollView)
    }
    
    // MARK: - scrollViewDidZoom
    
    public var scrollViewDidZoomCallsCount = 0
    public var scrollViewDidZoomCalled: Bool {
        return scrollViewDidZoomCallsCount > 0
    }
    public var scrollViewDidZoomReceivedScrollView: UIScrollView?
    public var scrollViewDidZoomReceivedInvocations: [UIScrollView] = []
    public var scrollViewDidZoomClosure: ((UIScrollView) -> Void)?
    
    public func scrollViewDidZoom(_ scrollView: UIScrollView) {
        scrollViewDidZoomCallsCount += 1
        scrollViewDidZoomReceivedScrollView = scrollView
        scrollViewDidZoomReceivedInvocations.append(scrollView)
        scrollViewDidZoomClosure?(scrollView)
    }
    
    // MARK: - scrollViewWillBeginDragging
    
    public var scrollViewWillBeginDraggingCallsCount = 0
    public var scrollViewWillBeginDraggingCalled: Bool {
        return scrollViewWillBeginDraggingCallsCount > 0
    }
    public var scrollViewWillBeginDraggingReceivedScrollView: UIScrollView?
    public var scrollViewWillBeginDraggingReceivedInvocations: [UIScrollView] = []
    public var scrollViewWillBeginDraggingClosure: ((UIScrollView) -> Void)?
    
    public func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        scrollViewWillBeginDraggingCallsCount += 1
        scrollViewWillBeginDraggingReceivedScrollView = scrollView
        scrollViewWillBeginDraggingReceivedInvocations.append(scrollView)
        scrollViewWillBeginDraggingClosure?(scrollView)
    }
    
    // MARK: - scrollViewWillEndDragging
    
    public var scrollViewWillEndDraggingWithVelocityTargetContentOffsetCallsCount = 0
    public var scrollViewWillEndDraggingWithVelocityTargetContentOffsetCalled: Bool {
        return scrollViewWillEndDraggingWithVelocityTargetContentOffsetCallsCount > 0
    }
    public var scrollViewWillEndDraggingWithVelocityTargetContentOffsetReceivedArguments: (scrollView: UIScrollView, velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>)?
    public var scrollViewWillEndDraggingWithVelocityTargetContentOffsetReceivedInvocations: [(scrollView: UIScrollView, velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>)] = []
    public var scrollViewWillEndDraggingWithVelocityTargetContentOffsetClosure: ((UIScrollView, CGPoint, UnsafeMutablePointer<CGPoint>) -> Void)?
    
    public func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        scrollViewWillEndDraggingWithVelocityTargetContentOffsetCallsCount += 1
        scrollViewWillEndDraggingWithVelocityTargetContentOffsetReceivedArguments = (scrollView: scrollView, velocity: velocity, targetContentOffset: targetContentOffset)
        scrollViewWillEndDraggingWithVelocityTargetContentOffsetReceivedInvocations.append((scrollView: scrollView, velocity: velocity, targetContentOffset: targetContentOffset))
        scrollViewWillEndDraggingWithVelocityTargetContentOffsetClosure?(scrollView, velocity, targetContentOffset)
    }
    
    // MARK: - scrollViewDidEndDragging
    
    public var scrollViewDidEndDraggingWillDecelerateCallsCount = 0
    public var scrollViewDidEndDraggingWillDecelerateCalled: Bool {
        return scrollViewDidEndDraggingWillDecelerateCallsCount > 0
    }
    public var scrollViewDidEndDraggingWillDecelerateReceivedArguments: (scrollView: UIScrollView, decelerate: Bool)?
    public var scrollViewDidEndDraggingWillDecelerateReceivedInvocations: [(scrollView: UIScrollView, decelerate: Bool)] = []
    public var scrollViewDidEndDraggingWillDecelerateClosure: ((UIScrollView, Bool) -> Void)?
    
    public func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        scrollViewDidEndDraggingWillDecelerateCallsCount += 1
        scrollViewDidEndDraggingWillDecelerateReceivedArguments = (scrollView: scrollView, decelerate: decelerate)
        scrollViewDidEndDraggingWillDecelerateReceivedInvocations.append((scrollView: scrollView, decelerate: decelerate))
        scrollViewDidEndDraggingWillDecelerateClosure?(scrollView, decelerate)
    }
    
    // MARK: - scrollViewWillBeginDecelerating
    
    public var scrollViewWillBeginDeceleratingCallsCount = 0
    public var scrollViewWillBeginDeceleratingCalled: Bool {
        return scrollViewWillBeginDeceleratingCallsCount > 0
    }
    public var scrollViewWillBeginDeceleratingReceivedScrollView: UIScrollView?
    public var scrollViewWillBeginDeceleratingReceivedInvocations: [UIScrollView] = []
    public var scrollViewWillBeginDeceleratingClosure: ((UIScrollView) -> Void)?
    
    public func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        scrollViewWillBeginDeceleratingCallsCount += 1
        scrollViewWillBeginDeceleratingReceivedScrollView = scrollView
        scrollViewWillBeginDeceleratingReceivedInvocations.append(scrollView)
        scrollViewWillBeginDeceleratingClosure?(scrollView)
    }
    
    // MARK: - scrollViewDidEndDecelerating
    
    public var scrollViewDidEndDeceleratingCallsCount = 0
    public var scrollViewDidEndDeceleratingCalled: Bool {
        return scrollViewDidEndDeceleratingCallsCount > 0
    }
    public var scrollViewDidEndDeceleratingReceivedScrollView: UIScrollView?
    public var scrollViewDidEndDeceleratingReceivedInvocations: [UIScrollView] = []
    public var scrollViewDidEndDeceleratingClosure: ((UIScrollView) -> Void)?
    
    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        scrollViewDidEndDeceleratingCallsCount += 1
        scrollViewDidEndDeceleratingReceivedScrollView = scrollView
        scrollViewDidEndDeceleratingReceivedInvocations.append(scrollView)
        scrollViewDidEndDeceleratingClosure?(scrollView)
    }
    
    // MARK: - scrollViewDidEndScrollingAnimation
    
    public var scrollViewDidEndScrollingAnimationCallsCount = 0
    public var scrollViewDidEndScrollingAnimationCalled: Bool {
        return scrollViewDidEndScrollingAnimationCallsCount > 0
    }
    public var scrollViewDidEndScrollingAnimationReceivedScrollView: UIScrollView?
    public var scrollViewDidEndScrollingAnimationReceivedInvocations: [UIScrollView] = []
    public var scrollViewDidEndScrollingAnimationClosure: ((UIScrollView) -> Void)?
    
    public func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        scrollViewDidEndScrollingAnimationCallsCount += 1
        scrollViewDidEndScrollingAnimationReceivedScrollView = scrollView
        scrollViewDidEndScrollingAnimationReceivedInvocations.append(scrollView)
        scrollViewDidEndScrollingAnimationClosure?(scrollView)
    }
    
    // MARK: - viewForZooming
    
    public var viewForZoomingInCallsCount = 0
    public var viewForZoomingInCalled: Bool {
        return viewForZoomingInCallsCount > 0
    }
    public var viewForZoomingInReceivedScrollView: UIScrollView?
    public var viewForZoomingInReceivedInvocations: [UIScrollView] = []
    public var viewForZoomingInReturnValue: UIView?
    public var viewForZoomingInClosure: ((UIScrollView) -> UIView?)?
    
    public func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        viewForZoomingInCallsCount += 1
        viewForZoomingInReceivedScrollView = scrollView
        viewForZoomingInReceivedInvocations.append(scrollView)
        return viewForZoomingInClosure.map({ $0(scrollView) }) ?? viewForZoomingInReturnValue
    }
    
    // MARK: - scrollViewWillBeginZooming
    
    public var scrollViewWillBeginZoomingWithCallsCount = 0
    public var scrollViewWillBeginZoomingWithCalled: Bool {
        return scrollViewWillBeginZoomingWithCallsCount > 0
    }
    public var scrollViewWillBeginZoomingWithReceivedArguments: (scrollView: UIScrollView, view: UIView?)?
    public var scrollViewWillBeginZoomingWithReceivedInvocations: [(scrollView: UIScrollView, view: UIView?)] = []
    public var scrollViewWillBeginZoomingWithClosure: ((UIScrollView, UIView?) -> Void)?
    
    public func scrollViewWillBeginZooming(_ scrollView: UIScrollView, with view: UIView?) {
        scrollViewWillBeginZoomingWithCallsCount += 1
        scrollViewWillBeginZoomingWithReceivedArguments = (scrollView: scrollView, view: view)
        scrollViewWillBeginZoomingWithReceivedInvocations.append((scrollView: scrollView, view: view))
        scrollViewWillBeginZoomingWithClosure?(scrollView, view)
    }
    
    // MARK: - scrollViewDidEndZooming
    
    public var scrollViewDidEndZoomingWithAtScaleCallsCount = 0
    public var scrollViewDidEndZoomingWithAtScaleCalled: Bool {
        return scrollViewDidEndZoomingWithAtScaleCallsCount > 0
    }
    public var scrollViewDidEndZoomingWithAtScaleReceivedArguments: (scrollView: UIScrollView, view: UIView?, scale: CGFloat)?
    public var scrollViewDidEndZoomingWithAtScaleReceivedInvocations: [(scrollView: UIScrollView, view: UIView?, scale: CGFloat)] = []
    public var scrollViewDidEndZoomingWithAtScaleClosure: ((UIScrollView, UIView?, CGFloat) -> Void)?
    
    public func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        scrollViewDidEndZoomingWithAtScaleCallsCount += 1
        scrollViewDidEndZoomingWithAtScaleReceivedArguments = (scrollView: scrollView, view: view, scale: scale)
        scrollViewDidEndZoomingWithAtScaleReceivedInvocations.append((scrollView: scrollView, view: view, scale: scale))
        scrollViewDidEndZoomingWithAtScaleClosure?(scrollView, view, scale)
    }
    
    // MARK: - scrollViewShouldScrollToTop
    
    public var scrollViewShouldScrollToTopCallsCount = 0
    public var scrollViewShouldScrollToTopCalled: Bool {
        return scrollViewShouldScrollToTopCallsCount > 0
    }
    public var scrollViewShouldScrollToTopReceivedScrollView: UIScrollView?
    public var scrollViewShouldScrollToTopReceivedInvocations: [UIScrollView] = []
    public var scrollViewShouldScrollToTopReturnValue: Bool!
    public var scrollViewShouldScrollToTopClosure: ((UIScrollView) -> Bool)?
    
    public func scrollViewShouldScrollToTop(_ scrollView: UIScrollView) -> Bool {
        scrollViewShouldScrollToTopCallsCount += 1
        scrollViewShouldScrollToTopReceivedScrollView = scrollView
        scrollViewShouldScrollToTopReceivedInvocations.append(scrollView)
        return scrollViewShouldScrollToTopClosure.map({ $0(scrollView) }) ?? scrollViewShouldScrollToTopReturnValue
    }
    
    // MARK: - scrollViewDidScrollToTop
    
    public var scrollViewDidScrollToTopCallsCount = 0
    public var scrollViewDidScrollToTopCalled: Bool {
        return scrollViewDidScrollToTopCallsCount > 0
    }
    public var scrollViewDidScrollToTopReceivedScrollView: UIScrollView?
    public var scrollViewDidScrollToTopReceivedInvocations: [UIScrollView] = []
    public var scrollViewDidScrollToTopClosure: ((UIScrollView) -> Void)?
    
    public func scrollViewDidScrollToTop(_ scrollView: UIScrollView) {
        scrollViewDidScrollToTopCallsCount += 1
        scrollViewDidScrollToTopReceivedScrollView = scrollView
        scrollViewDidScrollToTopReceivedInvocations.append(scrollView)
        scrollViewDidScrollToTopClosure?(scrollView)
    }
    
    // MARK: - scrollViewDidChangeAdjustedContentInset
    
    public var scrollViewDidChangeAdjustedContentInsetCallsCount = 0
    public var scrollViewDidChangeAdjustedContentInsetCalled: Bool {
        return scrollViewDidChangeAdjustedContentInsetCallsCount > 0
    }
    public var scrollViewDidChangeAdjustedContentInsetReceivedScrollView: UIScrollView?
    public var scrollViewDidChangeAdjustedContentInsetReceivedInvocations: [UIScrollView] = []
    public var scrollViewDidChangeAdjustedContentInsetClosure: ((UIScrollView) -> Void)?
    
    public func scrollViewDidChangeAdjustedContentInset(_ scrollView: UIScrollView) {
        scrollViewDidChangeAdjustedContentInsetCallsCount += 1
        scrollViewDidChangeAdjustedContentInsetReceivedScrollView = scrollView
        scrollViewDidChangeAdjustedContentInsetReceivedInvocations.append(scrollView)
        scrollViewDidChangeAdjustedContentInsetClosure?(scrollView)
    }
}
