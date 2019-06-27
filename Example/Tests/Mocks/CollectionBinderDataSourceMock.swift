//
//  CollectionBinderDataSourceMock.swift
//  PowerToolsTester
//
//  Created by Andrea Altea on 27/06/2019.
//

@testable import PowerTools

// swiftlint:disable all

public class GridCollectionDataSourceMock: GridCollectionDataSource {
    
    //MARK: - init
    
    public var initViewModelReceivedArguments: (view: UICollectionView?, model: [SectionViewModel])?
    public var initViewModelReceivedInvocations: [(view: UICollectionView?, model: [SectionViewModel])] = []
    public var initViewModelClosure: ((UICollectionView?, [SectionViewModel]) -> Void)?
    
    required public override init(view: UICollectionView?, model: [SectionViewModel]) {
        initViewModelReceivedArguments = (view: view, model: model)
        initViewModelReceivedInvocations.append((view: view, model: model))
        initViewModelClosure?(view, model)
        super.init(view: view, model: model)
    }
    
    //MARK: - collectionView
    
    public var updateModelForceReloadCallsCount = 0
    public var updateModelForceReloadCalled: Bool {
        return updateModelForceReloadCallsCount > 0
    }
    public var updateModelForceReloadReceivedArguments: (newModel: [SectionViewModel], forceReload: Bool)?
    public var updateModelForceReloadReceivedInvocations: [(newModel: [SectionViewModel], forceReload: Bool)] = []
    public var updateModelForceReloadClosure: ([SectionViewModel], Bool)?

    override public func update(model newModel: [SectionViewModel], forceReload reloadData: Bool = false) {
        updateModelForceReloadCallsCount += 1
        updateModelForceReloadReceivedArguments = (newModel: newModel, forceReload: reloadData)
        updateModelForceReloadReceivedInvocations.append((newModel: newModel, forceReload: reloadData))
    }

    //MARK: - collectionView

    public var collectionViewShouldHighlightItemAtCallsCount = 0
    public var collectionViewShouldHighlightItemAtCalled: Bool {
        return collectionViewShouldHighlightItemAtCallsCount > 0
    }
    public var collectionViewShouldHighlightItemAtReceivedArguments: (collectionView: UICollectionView, indexPath: IndexPath)?
    public var collectionViewShouldHighlightItemAtReceivedInvocations: [(collectionView: UICollectionView, indexPath: IndexPath)] = []
    public var collectionViewShouldHighlightItemAtReturnValue: Bool!
    public var collectionViewShouldHighlightItemAtClosure: ((UICollectionView, IndexPath) -> Bool)?
    
    public override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        collectionViewShouldHighlightItemAtCallsCount += 1
        collectionViewShouldHighlightItemAtReceivedArguments = (collectionView: collectionView, indexPath: indexPath)
        collectionViewShouldHighlightItemAtReceivedInvocations.append((collectionView: collectionView, indexPath: indexPath))
        return collectionViewShouldHighlightItemAtClosure.map({ $0(collectionView, indexPath) }) ?? collectionViewShouldHighlightItemAtReturnValue
    }
    
    //MARK: - collectionView
    
    public var collectionViewDidHighlightItemAtCallsCount = 0
    public var collectionViewDidHighlightItemAtCalled: Bool {
        return collectionViewDidHighlightItemAtCallsCount > 0
    }
    public var collectionViewDidHighlightItemAtReceivedArguments: (collectionView: UICollectionView, indexPath: IndexPath)?
    public var collectionViewDidHighlightItemAtReceivedInvocations: [(collectionView: UICollectionView, indexPath: IndexPath)] = []
    public var collectionViewDidHighlightItemAtClosure: ((UICollectionView, IndexPath) -> Void)?
    
    public override func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        collectionViewDidHighlightItemAtCallsCount += 1
        collectionViewDidHighlightItemAtReceivedArguments = (collectionView: collectionView, indexPath: indexPath)
        collectionViewDidHighlightItemAtReceivedInvocations.append((collectionView: collectionView, indexPath: indexPath))
        collectionViewDidHighlightItemAtClosure?(collectionView, indexPath)
    }
    
    //MARK: - collectionView
    
    public var collectionViewDidUnhighlightItemAtCallsCount = 0
    public var collectionViewDidUnhighlightItemAtCalled: Bool {
        return collectionViewDidUnhighlightItemAtCallsCount > 0
    }
    public var collectionViewDidUnhighlightItemAtReceivedArguments: (collectionView: UICollectionView, indexPath: IndexPath)?
    public var collectionViewDidUnhighlightItemAtReceivedInvocations: [(collectionView: UICollectionView, indexPath: IndexPath)] = []
    public var collectionViewDidUnhighlightItemAtClosure: ((UICollectionView, IndexPath) -> Void)?
    
    public override func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        collectionViewDidUnhighlightItemAtCallsCount += 1
        collectionViewDidUnhighlightItemAtReceivedArguments = (collectionView: collectionView, indexPath: indexPath)
        collectionViewDidUnhighlightItemAtReceivedInvocations.append((collectionView: collectionView, indexPath: indexPath))
        collectionViewDidUnhighlightItemAtClosure?(collectionView, indexPath)
    }
    
    //MARK: - collectionView
    
    public var collectionViewShouldSelectItemAtCallsCount = 0
    public var collectionViewShouldSelectItemAtCalled: Bool {
        return collectionViewShouldSelectItemAtCallsCount > 0
    }
    public var collectionViewShouldSelectItemAtReceivedArguments: (collectionView: UICollectionView, indexPath: IndexPath)?
    public var collectionViewShouldSelectItemAtReceivedInvocations: [(collectionView: UICollectionView, indexPath: IndexPath)] = []
    public var collectionViewShouldSelectItemAtReturnValue: Bool!
    public var collectionViewShouldSelectItemAtClosure: ((UICollectionView, IndexPath) -> Bool)?
    
    public override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        collectionViewShouldSelectItemAtCallsCount += 1
        collectionViewShouldSelectItemAtReceivedArguments = (collectionView: collectionView, indexPath: indexPath)
        collectionViewShouldSelectItemAtReceivedInvocations.append((collectionView: collectionView, indexPath: indexPath))
        return collectionViewShouldSelectItemAtClosure.map({ $0(collectionView, indexPath) }) ?? collectionViewShouldSelectItemAtReturnValue
    }
    
    //MARK: - collectionView
    
    public var collectionViewShouldDeselectItemAtCallsCount = 0
    public var collectionViewShouldDeselectItemAtCalled: Bool {
        return collectionViewShouldDeselectItemAtCallsCount > 0
    }
    public var collectionViewShouldDeselectItemAtReceivedArguments: (collectionView: UICollectionView, indexPath: IndexPath)?
    public var collectionViewShouldDeselectItemAtReceivedInvocations: [(collectionView: UICollectionView, indexPath: IndexPath)] = []
    public var collectionViewShouldDeselectItemAtReturnValue: Bool!
    public var collectionViewShouldDeselectItemAtClosure: ((UICollectionView, IndexPath) -> Bool)?
    
    public override func collectionView(_ collectionView: UICollectionView, shouldDeselectItemAt indexPath: IndexPath) -> Bool {
        collectionViewShouldDeselectItemAtCallsCount += 1
        collectionViewShouldDeselectItemAtReceivedArguments = (collectionView: collectionView, indexPath: indexPath)
        collectionViewShouldDeselectItemAtReceivedInvocations.append((collectionView: collectionView, indexPath: indexPath))
        return collectionViewShouldDeselectItemAtClosure.map({ $0(collectionView, indexPath) }) ?? collectionViewShouldDeselectItemAtReturnValue
    }
    
    //MARK: - collectionView
    
    public var collectionViewDidSelectItemAtCallsCount = 0
    public var collectionViewDidSelectItemAtCalled: Bool {
        return collectionViewDidSelectItemAtCallsCount > 0
    }
    public var collectionViewDidSelectItemAtReceivedArguments: (collectionView: UICollectionView, indexPath: IndexPath)?
    public var collectionViewDidSelectItemAtReceivedInvocations: [(collectionView: UICollectionView, indexPath: IndexPath)] = []
    public var collectionViewDidSelectItemAtClosure: ((UICollectionView, IndexPath) -> Void)?
    
    public override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionViewDidSelectItemAtCallsCount += 1
        collectionViewDidSelectItemAtReceivedArguments = (collectionView: collectionView, indexPath: indexPath)
        collectionViewDidSelectItemAtReceivedInvocations.append((collectionView: collectionView, indexPath: indexPath))
        collectionViewDidSelectItemAtClosure?(collectionView, indexPath)
    }
    
    //MARK: - collectionView
    
    public var collectionViewDidDeselectItemAtCallsCount = 0
    public var collectionViewDidDeselectItemAtCalled: Bool {
        return collectionViewDidDeselectItemAtCallsCount > 0
    }
    public var collectionViewDidDeselectItemAtReceivedArguments: (collectionView: UICollectionView, indexPath: IndexPath)?
    public var collectionViewDidDeselectItemAtReceivedInvocations: [(collectionView: UICollectionView, indexPath: IndexPath)] = []
    public var collectionViewDidDeselectItemAtClosure: ((UICollectionView, IndexPath) -> Void)?
    
    public override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        collectionViewDidDeselectItemAtCallsCount += 1
        collectionViewDidDeselectItemAtReceivedArguments = (collectionView: collectionView, indexPath: indexPath)
        collectionViewDidDeselectItemAtReceivedInvocations.append((collectionView: collectionView, indexPath: indexPath))
        collectionViewDidDeselectItemAtClosure?(collectionView, indexPath)
    }
    
    //MARK: - scrollViewDidScroll
    
    public var scrollViewDidScrollCallsCount = 0
    public var scrollViewDidScrollCalled: Bool {
        return scrollViewDidScrollCallsCount > 0
    }
    public var scrollViewDidScrollReceivedScrollView: UIScrollView?
    public var scrollViewDidScrollReceivedInvocations: [UIScrollView] = []
    public var scrollViewDidScrollClosure: ((UIScrollView) -> Void)?
    
    public override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollViewDidScrollCallsCount += 1
        scrollViewDidScrollReceivedScrollView = scrollView
        scrollViewDidScrollReceivedInvocations.append(scrollView)
        scrollViewDidScrollClosure?(scrollView)
    }
    
    //MARK: - scrollViewDidZoom
    
    public var scrollViewDidZoomCallsCount = 0
    public var scrollViewDidZoomCalled: Bool {
        return scrollViewDidZoomCallsCount > 0
    }
    public var scrollViewDidZoomReceivedScrollView: UIScrollView?
    public var scrollViewDidZoomReceivedInvocations: [UIScrollView] = []
    public var scrollViewDidZoomClosure: ((UIScrollView) -> Void)?
    
    public override func scrollViewDidZoom(_ scrollView: UIScrollView) {
        scrollViewDidZoomCallsCount += 1
        scrollViewDidZoomReceivedScrollView = scrollView
        scrollViewDidZoomReceivedInvocations.append(scrollView)
        scrollViewDidZoomClosure?(scrollView)
    }
    
    //MARK: - scrollViewWillBeginDragging
    
    public var scrollViewWillBeginDraggingCallsCount = 0
    public var scrollViewWillBeginDraggingCalled: Bool {
        return scrollViewWillBeginDraggingCallsCount > 0
    }
    public var scrollViewWillBeginDraggingReceivedScrollView: UIScrollView?
    public var scrollViewWillBeginDraggingReceivedInvocations: [UIScrollView] = []
    public var scrollViewWillBeginDraggingClosure: ((UIScrollView) -> Void)?
    
    public override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        scrollViewWillBeginDraggingCallsCount += 1
        scrollViewWillBeginDraggingReceivedScrollView = scrollView
        scrollViewWillBeginDraggingReceivedInvocations.append(scrollView)
        scrollViewWillBeginDraggingClosure?(scrollView)
    }
    
    //MARK: - scrollViewWillEndDragging
    
    public var scrollViewWillEndDraggingWithVelocityTargetContentOffsetCallsCount = 0
    public var scrollViewWillEndDraggingWithVelocityTargetContentOffsetCalled: Bool {
        return scrollViewWillEndDraggingWithVelocityTargetContentOffsetCallsCount > 0
    }
    public var scrollViewWillEndDraggingWithVelocityTargetContentOffsetReceivedArguments: (scrollView: UIScrollView, velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>)?
    public var scrollViewWillEndDraggingWithVelocityTargetContentOffsetReceivedInvocations: [(scrollView: UIScrollView, velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>)] = []
    public var scrollViewWillEndDraggingWithVelocityTargetContentOffsetClosure: ((UIScrollView, CGPoint, UnsafeMutablePointer<CGPoint>) -> Void)?
    
    public override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        scrollViewWillEndDraggingWithVelocityTargetContentOffsetCallsCount += 1
        scrollViewWillEndDraggingWithVelocityTargetContentOffsetReceivedArguments = (scrollView: scrollView, velocity: velocity, targetContentOffset: targetContentOffset)
        scrollViewWillEndDraggingWithVelocityTargetContentOffsetReceivedInvocations.append((scrollView: scrollView, velocity: velocity, targetContentOffset: targetContentOffset))
        scrollViewWillEndDraggingWithVelocityTargetContentOffsetClosure?(scrollView, velocity, targetContentOffset)
    }
    
    //MARK: - scrollViewDidEndDragging
    
    public var scrollViewDidEndDraggingWillDecelerateCallsCount = 0
    public var scrollViewDidEndDraggingWillDecelerateCalled: Bool {
        return scrollViewDidEndDraggingWillDecelerateCallsCount > 0
    }
    public var scrollViewDidEndDraggingWillDecelerateReceivedArguments: (scrollView: UIScrollView, decelerate: Bool)?
    public var scrollViewDidEndDraggingWillDecelerateReceivedInvocations: [(scrollView: UIScrollView, decelerate: Bool)] = []
    public var scrollViewDidEndDraggingWillDecelerateClosure: ((UIScrollView, Bool) -> Void)?
    
    public override func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        scrollViewDidEndDraggingWillDecelerateCallsCount += 1
        scrollViewDidEndDraggingWillDecelerateReceivedArguments = (scrollView: scrollView, decelerate: decelerate)
        scrollViewDidEndDraggingWillDecelerateReceivedInvocations.append((scrollView: scrollView, decelerate: decelerate))
        scrollViewDidEndDraggingWillDecelerateClosure?(scrollView, decelerate)
    }
    
    //MARK: - scrollViewWillBeginDecelerating
    
    public var scrollViewWillBeginDeceleratingCallsCount = 0
    public var scrollViewWillBeginDeceleratingCalled: Bool {
        return scrollViewWillBeginDeceleratingCallsCount > 0
    }
    public var scrollViewWillBeginDeceleratingReceivedScrollView: UIScrollView?
    public var scrollViewWillBeginDeceleratingReceivedInvocations: [UIScrollView] = []
    public var scrollViewWillBeginDeceleratingClosure: ((UIScrollView) -> Void)?
    
    public override func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        scrollViewWillBeginDeceleratingCallsCount += 1
        scrollViewWillBeginDeceleratingReceivedScrollView = scrollView
        scrollViewWillBeginDeceleratingReceivedInvocations.append(scrollView)
        scrollViewWillBeginDeceleratingClosure?(scrollView)
    }
    
    //MARK: - scrollViewDidEndDecelerating
    
    public var scrollViewDidEndDeceleratingCallsCount = 0
    public var scrollViewDidEndDeceleratingCalled: Bool {
        return scrollViewDidEndDeceleratingCallsCount > 0
    }
    public var scrollViewDidEndDeceleratingReceivedScrollView: UIScrollView?
    public var scrollViewDidEndDeceleratingReceivedInvocations: [UIScrollView] = []
    public var scrollViewDidEndDeceleratingClosure: ((UIScrollView) -> Void)?
    
    public override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        scrollViewDidEndDeceleratingCallsCount += 1
        scrollViewDidEndDeceleratingReceivedScrollView = scrollView
        scrollViewDidEndDeceleratingReceivedInvocations.append(scrollView)
        scrollViewDidEndDeceleratingClosure?(scrollView)
    }
    
    //MARK: - scrollViewDidEndScrollingAnimation
    
    public var scrollViewDidEndScrollingAnimationCallsCount = 0
    public var scrollViewDidEndScrollingAnimationCalled: Bool {
        return scrollViewDidEndScrollingAnimationCallsCount > 0
    }
    public var scrollViewDidEndScrollingAnimationReceivedScrollView: UIScrollView?
    public var scrollViewDidEndScrollingAnimationReceivedInvocations: [UIScrollView] = []
    public var scrollViewDidEndScrollingAnimationClosure: ((UIScrollView) -> Void)?
    
    public override func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        scrollViewDidEndScrollingAnimationCallsCount += 1
        scrollViewDidEndScrollingAnimationReceivedScrollView = scrollView
        scrollViewDidEndScrollingAnimationReceivedInvocations.append(scrollView)
        scrollViewDidEndScrollingAnimationClosure?(scrollView)
    }
    
    //MARK: - viewForZooming
    
    public var viewForZoomingInCallsCount = 0
    public var viewForZoomingInCalled: Bool {
        return viewForZoomingInCallsCount > 0
    }
    public var viewForZoomingInReceivedScrollView: UIScrollView?
    public var viewForZoomingInReceivedInvocations: [UIScrollView] = []
    public var viewForZoomingInReturnValue: UIView?
    public var viewForZoomingInClosure: ((UIScrollView) -> UIView?)?
    
    public override func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        viewForZoomingInCallsCount += 1
        viewForZoomingInReceivedScrollView = scrollView
        viewForZoomingInReceivedInvocations.append(scrollView)
        return viewForZoomingInClosure.map({ $0(scrollView) }) ?? viewForZoomingInReturnValue
    }
    
    //MARK: - scrollViewWillBeginZooming
    
    public var scrollViewWillBeginZoomingWithCallsCount = 0
    public var scrollViewWillBeginZoomingWithCalled: Bool {
        return scrollViewWillBeginZoomingWithCallsCount > 0
    }
    public var scrollViewWillBeginZoomingWithReceivedArguments: (scrollView: UIScrollView, view: UIView?)?
    public var scrollViewWillBeginZoomingWithReceivedInvocations: [(scrollView: UIScrollView, view: UIView?)] = []
    public var scrollViewWillBeginZoomingWithClosure: ((UIScrollView, UIView?) -> Void)?
    
    public override func scrollViewWillBeginZooming(_ scrollView: UIScrollView, with view: UIView?) {
        scrollViewWillBeginZoomingWithCallsCount += 1
        scrollViewWillBeginZoomingWithReceivedArguments = (scrollView: scrollView, view: view)
        scrollViewWillBeginZoomingWithReceivedInvocations.append((scrollView: scrollView, view: view))
        scrollViewWillBeginZoomingWithClosure?(scrollView, view)
    }
    
    //MARK: - scrollViewDidEndZooming
    
    public var scrollViewDidEndZoomingWithAtScaleCallsCount = 0
    public var scrollViewDidEndZoomingWithAtScaleCalled: Bool {
        return scrollViewDidEndZoomingWithAtScaleCallsCount > 0
    }
    public var scrollViewDidEndZoomingWithAtScaleReceivedArguments: (scrollView: UIScrollView, view: UIView?, scale: CGFloat)?
    public var scrollViewDidEndZoomingWithAtScaleReceivedInvocations: [(scrollView: UIScrollView, view: UIView?, scale: CGFloat)] = []
    public var scrollViewDidEndZoomingWithAtScaleClosure: ((UIScrollView, UIView?, CGFloat) -> Void)?
    
    public override func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        scrollViewDidEndZoomingWithAtScaleCallsCount += 1
        scrollViewDidEndZoomingWithAtScaleReceivedArguments = (scrollView: scrollView, view: view, scale: scale)
        scrollViewDidEndZoomingWithAtScaleReceivedInvocations.append((scrollView: scrollView, view: view, scale: scale))
        scrollViewDidEndZoomingWithAtScaleClosure?(scrollView, view, scale)
    }
    
    //MARK: - scrollViewShouldScrollToTop
    
    public var scrollViewShouldScrollToTopCallsCount = 0
    public var scrollViewShouldScrollToTopCalled: Bool {
        return scrollViewShouldScrollToTopCallsCount > 0
    }
    public var scrollViewShouldScrollToTopReceivedScrollView: UIScrollView?
    public var scrollViewShouldScrollToTopReceivedInvocations: [UIScrollView] = []
    public var scrollViewShouldScrollToTopReturnValue: Bool!
    public var scrollViewShouldScrollToTopClosure: ((UIScrollView) -> Bool)?
    
    public override func scrollViewShouldScrollToTop(_ scrollView: UIScrollView) -> Bool {
        scrollViewShouldScrollToTopCallsCount += 1
        scrollViewShouldScrollToTopReceivedScrollView = scrollView
        scrollViewShouldScrollToTopReceivedInvocations.append(scrollView)
        return scrollViewShouldScrollToTopClosure.map({ $0(scrollView) }) ?? scrollViewShouldScrollToTopReturnValue
    }
    
    //MARK: - scrollViewDidScrollToTop
    
    public var scrollViewDidScrollToTopCallsCount = 0
    public var scrollViewDidScrollToTopCalled: Bool {
        return scrollViewDidScrollToTopCallsCount > 0
    }
    public var scrollViewDidScrollToTopReceivedScrollView: UIScrollView?
    public var scrollViewDidScrollToTopReceivedInvocations: [UIScrollView] = []
    public var scrollViewDidScrollToTopClosure: ((UIScrollView) -> Void)?
    
    public override func scrollViewDidScrollToTop(_ scrollView: UIScrollView) {
        scrollViewDidScrollToTopCallsCount += 1
        scrollViewDidScrollToTopReceivedScrollView = scrollView
        scrollViewDidScrollToTopReceivedInvocations.append(scrollView)
        scrollViewDidScrollToTopClosure?(scrollView)
    }
    
    //MARK: - scrollViewDidChangeAdjustedContentInset
    
    public var scrollViewDidChangeAdjustedContentInsetCallsCount = 0
    public var scrollViewDidChangeAdjustedContentInsetCalled: Bool {
        return scrollViewDidChangeAdjustedContentInsetCallsCount > 0
    }
    public var scrollViewDidChangeAdjustedContentInsetReceivedScrollView: UIScrollView?
    public var scrollViewDidChangeAdjustedContentInsetReceivedInvocations: [UIScrollView] = []
    public var scrollViewDidChangeAdjustedContentInsetClosure: ((UIScrollView) -> Void)?
    
    public override func scrollViewDidChangeAdjustedContentInset(_ scrollView: UIScrollView) {
        scrollViewDidChangeAdjustedContentInsetCallsCount += 1
        scrollViewDidChangeAdjustedContentInsetReceivedScrollView = scrollView
        scrollViewDidChangeAdjustedContentInsetReceivedInvocations.append(scrollView)
        scrollViewDidChangeAdjustedContentInsetClosure?(scrollView)
    }
    
    //MARK: - collectionView
    
    public var collectionViewNumberOfItemsInSectionCallsCount = 0
    public var collectionViewNumberOfItemsInSectionCalled: Bool {
        return collectionViewNumberOfItemsInSectionCallsCount > 0
    }
    public var collectionViewNumberOfItemsInSectionReceivedArguments: (collectionView: UICollectionView, section: Int)?
    public var collectionViewNumberOfItemsInSectionReceivedInvocations: [(collectionView: UICollectionView, section: Int)] = []
    public var collectionViewNumberOfItemsInSectionReturnValue: Int!
    public var collectionViewNumberOfItemsInSectionClosure: ((UICollectionView, Int) -> Int)?
    
    public override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        collectionViewNumberOfItemsInSectionCallsCount += 1
        collectionViewNumberOfItemsInSectionReceivedArguments = (collectionView: collectionView, section: section)
        collectionViewNumberOfItemsInSectionReceivedInvocations.append((collectionView: collectionView, section: section))
        return collectionViewNumberOfItemsInSectionClosure.map({ $0(collectionView, section) }) ?? collectionViewNumberOfItemsInSectionReturnValue
    }
    
    //MARK: - collectionView
    
    public var collectionViewCellForItemAtCallsCount = 0
    public var collectionViewCellForItemAtCalled: Bool {
        return collectionViewCellForItemAtCallsCount > 0
    }
    public var collectionViewCellForItemAtReceivedArguments: (collectionView: UICollectionView, indexPath: IndexPath)?
    public var collectionViewCellForItemAtReceivedInvocations: [(collectionView: UICollectionView, indexPath: IndexPath)] = []
    public var collectionViewCellForItemAtReturnValue: UICollectionViewCell!
    public var collectionViewCellForItemAtClosure: ((UICollectionView, IndexPath) -> UICollectionViewCell)?
    
    public override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        collectionViewCellForItemAtCallsCount += 1
        collectionViewCellForItemAtReceivedArguments = (collectionView: collectionView, indexPath: indexPath)
        collectionViewCellForItemAtReceivedInvocations.append((collectionView: collectionView, indexPath: indexPath))
        return collectionViewCellForItemAtClosure.map({ $0(collectionView, indexPath) }) ?? collectionViewCellForItemAtReturnValue
    }
    
    //MARK: - numberOfSections
    
    public var numberOfSectionsInCallsCount = 0
    public var numberOfSectionsInCalled: Bool {
        return numberOfSectionsInCallsCount > 0
    }
    public var numberOfSectionsInReceivedCollectionView: UICollectionView?
    public var numberOfSectionsInReceivedInvocations: [UICollectionView] = []
    public var numberOfSectionsInReturnValue: Int!
    public var numberOfSectionsInClosure: ((UICollectionView) -> Int)?
    
    public override func numberOfSections(in collectionView: UICollectionView) -> Int {
        numberOfSectionsInCallsCount += 1
        numberOfSectionsInReceivedCollectionView = collectionView
        numberOfSectionsInReceivedInvocations.append(collectionView)
        return numberOfSectionsInClosure.map({ $0(collectionView) }) ?? numberOfSectionsInReturnValue
    }
    
    //MARK: - collectionView
    
    public var collectionViewViewForSupplementaryElementOfKindAtCallsCount = 0
    public var collectionViewViewForSupplementaryElementOfKindAtCalled: Bool {
        return collectionViewViewForSupplementaryElementOfKindAtCallsCount > 0
    }
    public var collectionViewViewForSupplementaryElementOfKindAtReceivedArguments: (collectionView: UICollectionView, kind: String, indexPath: IndexPath)?
    public var collectionViewViewForSupplementaryElementOfKindAtReceivedInvocations: [(collectionView: UICollectionView, kind: String, indexPath: IndexPath)] = []
    public var collectionViewViewForSupplementaryElementOfKindAtReturnValue: UICollectionReusableView!
    public var collectionViewViewForSupplementaryElementOfKindAtClosure: ((UICollectionView, String, IndexPath) -> UICollectionReusableView)?
    
    public override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        collectionViewViewForSupplementaryElementOfKindAtCallsCount += 1
        collectionViewViewForSupplementaryElementOfKindAtReceivedArguments = (collectionView: collectionView, kind: kind, indexPath: indexPath)
        collectionViewViewForSupplementaryElementOfKindAtReceivedInvocations.append((collectionView: collectionView, kind: kind, indexPath: indexPath))
        return collectionViewViewForSupplementaryElementOfKindAtClosure.map({ $0(collectionView, kind, indexPath) }) ?? collectionViewViewForSupplementaryElementOfKindAtReturnValue
    }
}

// swiftlint:enable all
