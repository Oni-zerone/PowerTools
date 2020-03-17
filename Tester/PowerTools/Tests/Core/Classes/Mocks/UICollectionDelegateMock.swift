//
//  UICollectionDelegateMock.swift
//  PowerToolsTester
//
//  Created by Andrea Altea on 09/06/2019.
//

import UIKit

// swiftlint:disable line_length
// swiftlint:disable public variable_name
// swiftlint:disable large_tuple

public class CollectionViewDelegateMock: ScrollViewDelegateMock, UICollectionViewDelegate {
    
    public override init() { }

    //MARK: - collectionView
    
    public var collectionViewShouldHighlightItemAtCallsCount = 0
    public var collectionViewShouldHighlightItemAtCalled: Bool {
        return collectionViewShouldHighlightItemAtCallsCount > 0
    }
    public var collectionViewShouldHighlightItemAtReceivedArguments: (collectionView: UICollectionView, indexPath: IndexPath)?
    public var collectionViewShouldHighlightItemAtReceivedInvocations: [(collectionView: UICollectionView, indexPath: IndexPath)] = []
    public var collectionViewShouldHighlightItemAtReturnValue: Bool!
    public var collectionViewShouldHighlightItemAtClosure: ((UICollectionView, IndexPath) -> Bool)?
    
    public func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
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
    
    public func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
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
    
    public func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
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
    
    public func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
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
    
    public func collectionView(_ collectionView: UICollectionView, shouldDeselectItemAt indexPath: IndexPath) -> Bool {
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
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
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
    
    public func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        collectionViewDidDeselectItemAtCallsCount += 1
        collectionViewDidDeselectItemAtReceivedArguments = (collectionView: collectionView, indexPath: indexPath)
        collectionViewDidDeselectItemAtReceivedInvocations.append((collectionView: collectionView, indexPath: indexPath))
        collectionViewDidDeselectItemAtClosure?(collectionView, indexPath)
    }
    
    //MARK: - collectionView
    
    public var collectionViewWillDisplayForItemAtCallsCount = 0
    public var collectionViewWillDisplayForItemAtCalled: Bool {
        return collectionViewWillDisplayForItemAtCallsCount > 0
    }
    public var collectionViewWillDisplayForItemAtReceivedArguments: (collectionView: UICollectionView, cell: UICollectionViewCell, indexPath: IndexPath)?
    public var collectionViewWillDisplayForItemAtReceivedInvocations: [(collectionView: UICollectionView, cell: UICollectionViewCell, indexPath: IndexPath)] = []
    public var collectionViewWillDisplayForItemAtClosure: ((UICollectionView, UICollectionViewCell, IndexPath) -> Void)?
    
    public func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        collectionViewWillDisplayForItemAtCallsCount += 1
        collectionViewWillDisplayForItemAtReceivedArguments = (collectionView: collectionView, cell: cell, indexPath: indexPath)
        collectionViewWillDisplayForItemAtReceivedInvocations.append((collectionView: collectionView, cell: cell, indexPath: indexPath))
        collectionViewWillDisplayForItemAtClosure?(collectionView, cell, indexPath)
    }
    
    //MARK: - collectionView
    
    public var collectionViewWillDisplaySupplementaryViewForElementKindAtCallsCount = 0
    public var collectionViewWillDisplaySupplementaryViewForElementKindAtCalled: Bool {
        return collectionViewWillDisplaySupplementaryViewForElementKindAtCallsCount > 0
    }
    public var collectionViewWillDisplaySupplementaryViewForElementKindAtReceivedArguments: (collectionView: UICollectionView, view: UICollectionReusableView, elementKind: String, indexPath: IndexPath)?
    public var collectionViewWillDisplaySupplementaryViewForElementKindAtReceivedInvocations: [(collectionView: UICollectionView, view: UICollectionReusableView, elementKind: String, indexPath: IndexPath)] = []
    public var collectionViewWillDisplaySupplementaryViewForElementKindAtClosure: ((UICollectionView, UICollectionReusableView, String, IndexPath) -> Void)?
    
    public func collectionView(_ collectionView: UICollectionView, willDisplaySupplementaryView view: UICollectionReusableView, forElementKind elementKind: String, at indexPath: IndexPath) {
        collectionViewWillDisplaySupplementaryViewForElementKindAtCallsCount += 1
        collectionViewWillDisplaySupplementaryViewForElementKindAtReceivedArguments = (collectionView: collectionView, view: view, elementKind: elementKind, indexPath: indexPath)
        collectionViewWillDisplaySupplementaryViewForElementKindAtReceivedInvocations.append((collectionView: collectionView, view: view, elementKind: elementKind, indexPath: indexPath))
        collectionViewWillDisplaySupplementaryViewForElementKindAtClosure?(collectionView, view, elementKind, indexPath)
    }
    
    //MARK: - collectionView
    
    public var collectionViewDidEndDisplayingForItemAtCallsCount = 0
    public var collectionViewDidEndDisplayingForItemAtCalled: Bool {
        return collectionViewDidEndDisplayingForItemAtCallsCount > 0
    }
    public var collectionViewDidEndDisplayingForItemAtReceivedArguments: (collectionView: UICollectionView, cell: UICollectionViewCell, indexPath: IndexPath)?
    public var collectionViewDidEndDisplayingForItemAtReceivedInvocations: [(collectionView: UICollectionView, cell: UICollectionViewCell, indexPath: IndexPath)] = []
    public var collectionViewDidEndDisplayingForItemAtClosure: ((UICollectionView, UICollectionViewCell, IndexPath) -> Void)?
    
    public func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        collectionViewDidEndDisplayingForItemAtCallsCount += 1
        collectionViewDidEndDisplayingForItemAtReceivedArguments = (collectionView: collectionView, cell: cell, indexPath: indexPath)
        collectionViewDidEndDisplayingForItemAtReceivedInvocations.append((collectionView: collectionView, cell: cell, indexPath: indexPath))
        collectionViewDidEndDisplayingForItemAtClosure?(collectionView, cell, indexPath)
    }
    
    //MARK: - collectionView
    
    public var collectionViewDidEndDisplayingSupplementaryViewForElementOfKindAtCallsCount = 0
    public var collectionViewDidEndDisplayingSupplementaryViewForElementOfKindAtCalled: Bool {
        return collectionViewDidEndDisplayingSupplementaryViewForElementOfKindAtCallsCount > 0
    }
    public var collectionViewDidEndDisplayingSupplementaryViewForElementOfKindAtReceivedArguments: (collectionView: UICollectionView, view: UICollectionReusableView, elementKind: String, indexPath: IndexPath)?
    public var collectionViewDidEndDisplayingSupplementaryViewForElementOfKindAtReceivedInvocations: [(collectionView: UICollectionView, view: UICollectionReusableView, elementKind: String, indexPath: IndexPath)] = []
    public var collectionViewDidEndDisplayingSupplementaryViewForElementOfKindAtClosure: ((UICollectionView, UICollectionReusableView, String, IndexPath) -> Void)?
    
    public func collectionView(_ collectionView: UICollectionView, didEndDisplayingSupplementaryView view: UICollectionReusableView, forElementOfKind elementKind: String, at indexPath: IndexPath) {
        collectionViewDidEndDisplayingSupplementaryViewForElementOfKindAtCallsCount += 1
        collectionViewDidEndDisplayingSupplementaryViewForElementOfKindAtReceivedArguments = (collectionView: collectionView, view: view, elementKind: elementKind, indexPath: indexPath)
        collectionViewDidEndDisplayingSupplementaryViewForElementOfKindAtReceivedInvocations.append((collectionView: collectionView, view: view, elementKind: elementKind, indexPath: indexPath))
        collectionViewDidEndDisplayingSupplementaryViewForElementOfKindAtClosure?(collectionView, view, elementKind, indexPath)
    }
    
    //MARK: - collectionView
    
    public var collectionViewShouldShowMenuForItemAtCallsCount = 0
    public var collectionViewShouldShowMenuForItemAtCalled: Bool {
        return collectionViewShouldShowMenuForItemAtCallsCount > 0
    }
    public var collectionViewShouldShowMenuForItemAtReceivedArguments: (collectionView: UICollectionView, indexPath: IndexPath)?
    public var collectionViewShouldShowMenuForItemAtReceivedInvocations: [(collectionView: UICollectionView, indexPath: IndexPath)] = []
    public var collectionViewShouldShowMenuForItemAtReturnValue: Bool!
    public var collectionViewShouldShowMenuForItemAtClosure: ((UICollectionView, IndexPath) -> Bool)?
    
    public func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        collectionViewShouldShowMenuForItemAtCallsCount += 1
        collectionViewShouldShowMenuForItemAtReceivedArguments = (collectionView: collectionView, indexPath: indexPath)
        collectionViewShouldShowMenuForItemAtReceivedInvocations.append((collectionView: collectionView, indexPath: indexPath))
        return collectionViewShouldShowMenuForItemAtClosure.map({ $0(collectionView, indexPath) }) ?? collectionViewShouldShowMenuForItemAtReturnValue
    }
    
    //MARK: - collectionView
    
    public var collectionViewCanPerformActionForItemAtWithSenderCallsCount = 0
    public var collectionViewCanPerformActionForItemAtWithSenderCalled: Bool {
        return collectionViewCanPerformActionForItemAtWithSenderCallsCount > 0
    }
    public var collectionViewCanPerformActionForItemAtWithSenderReceivedArguments: (collectionView: UICollectionView, action: Selector, indexPath: IndexPath, sender: Any?)?
    public var collectionViewCanPerformActionForItemAtWithSenderReceivedInvocations: [(collectionView: UICollectionView, action: Selector, indexPath: IndexPath, sender: Any?)] = []
    public var collectionViewCanPerformActionForItemAtWithSenderReturnValue: Bool!
    public var collectionViewCanPerformActionForItemAtWithSenderClosure: ((UICollectionView, Selector, IndexPath, Any?) -> Bool)?
    
    public func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        collectionViewCanPerformActionForItemAtWithSenderCallsCount += 1
        collectionViewCanPerformActionForItemAtWithSenderReceivedArguments = (collectionView: collectionView, action: action, indexPath: indexPath, sender: sender)
        collectionViewCanPerformActionForItemAtWithSenderReceivedInvocations.append((collectionView: collectionView, action: action, indexPath: indexPath, sender: sender))
        return collectionViewCanPerformActionForItemAtWithSenderClosure.map({ $0(collectionView, action, indexPath, sender) }) ?? collectionViewCanPerformActionForItemAtWithSenderReturnValue
    }
    
    //MARK: - collectionView
    
    public var collectionViewPerformActionForItemAtWithSenderCallsCount = 0
    public var collectionViewPerformActionForItemAtWithSenderCalled: Bool {
        return collectionViewPerformActionForItemAtWithSenderCallsCount > 0
    }
    public var collectionViewPerformActionForItemAtWithSenderReceivedArguments: (collectionView: UICollectionView, action: Selector, indexPath: IndexPath, sender: Any?)?
    public var collectionViewPerformActionForItemAtWithSenderReceivedInvocations: [(collectionView: UICollectionView, action: Selector, indexPath: IndexPath, sender: Any?)] = []
    public var collectionViewPerformActionForItemAtWithSenderClosure: ((UICollectionView, Selector, IndexPath, Any?) -> Void)?
    
    public func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
        collectionViewPerformActionForItemAtWithSenderCallsCount += 1
        collectionViewPerformActionForItemAtWithSenderReceivedArguments = (collectionView: collectionView, action: action, indexPath: indexPath, sender: sender)
        collectionViewPerformActionForItemAtWithSenderReceivedInvocations.append((collectionView: collectionView, action: action, indexPath: indexPath, sender: sender))
        collectionViewPerformActionForItemAtWithSenderClosure?(collectionView, action, indexPath, sender)
    }
    
    //MARK: - collectionView
    
    public var collectionViewTransitionLayoutForOldLayoutNewLayoutCallsCount = 0
    public var collectionViewTransitionLayoutForOldLayoutNewLayoutCalled: Bool {
        return collectionViewTransitionLayoutForOldLayoutNewLayoutCallsCount > 0
    }
    public var collectionViewTransitionLayoutForOldLayoutNewLayoutReceivedArguments: (collectionView: UICollectionView, fromLayout: UICollectionViewLayout, toLayout: UICollectionViewLayout)?
    public var collectionViewTransitionLayoutForOldLayoutNewLayoutReceivedInvocations: [(collectionView: UICollectionView, fromLayout: UICollectionViewLayout, toLayout: UICollectionViewLayout)] = []
    public var collectionViewTransitionLayoutForOldLayoutNewLayoutReturnValue: UICollectionViewTransitionLayout!
    public var collectionViewTransitionLayoutForOldLayoutNewLayoutClosure: ((UICollectionView, UICollectionViewLayout, UICollectionViewLayout) -> UICollectionViewTransitionLayout)?
    
    public func collectionView(_ collectionView: UICollectionView, transitionLayoutForOldLayout fromLayout: UICollectionViewLayout, newLayout toLayout: UICollectionViewLayout) -> UICollectionViewTransitionLayout {
        collectionViewTransitionLayoutForOldLayoutNewLayoutCallsCount += 1
        collectionViewTransitionLayoutForOldLayoutNewLayoutReceivedArguments = (collectionView: collectionView, fromLayout: fromLayout, toLayout: toLayout)
        collectionViewTransitionLayoutForOldLayoutNewLayoutReceivedInvocations.append((collectionView: collectionView, fromLayout: fromLayout, toLayout: toLayout))
        return collectionViewTransitionLayoutForOldLayoutNewLayoutClosure.map({ $0(collectionView, fromLayout, toLayout) }) ?? collectionViewTransitionLayoutForOldLayoutNewLayoutReturnValue
    }
    
    //MARK: - collectionView
    
    public var collectionViewCanFocusItemAtCallsCount = 0
    public var collectionViewCanFocusItemAtCalled: Bool {
        return collectionViewCanFocusItemAtCallsCount > 0
    }
    public var collectionViewCanFocusItemAtReceivedArguments: (collectionView: UICollectionView, indexPath: IndexPath)?
    public var collectionViewCanFocusItemAtReceivedInvocations: [(collectionView: UICollectionView, indexPath: IndexPath)] = []
    public var collectionViewCanFocusItemAtReturnValue: Bool!
    public var collectionViewCanFocusItemAtClosure: ((UICollectionView, IndexPath) -> Bool)?
    
    public func collectionView(_ collectionView: UICollectionView, canFocusItemAt indexPath: IndexPath) -> Bool {
        collectionViewCanFocusItemAtCallsCount += 1
        collectionViewCanFocusItemAtReceivedArguments = (collectionView: collectionView, indexPath: indexPath)
        collectionViewCanFocusItemAtReceivedInvocations.append((collectionView: collectionView, indexPath: indexPath))
        return collectionViewCanFocusItemAtClosure.map({ $0(collectionView, indexPath) }) ?? collectionViewCanFocusItemAtReturnValue
    }
    
    //MARK: - collectionView
    
    public var collectionViewShouldUpdateFocusInCallsCount = 0
    public var collectionViewShouldUpdateFocusInCalled: Bool {
        return collectionViewShouldUpdateFocusInCallsCount > 0
    }
    public var collectionViewShouldUpdateFocusInReceivedArguments: (collectionView: UICollectionView, context: UICollectionViewFocusUpdateContext)?
    public var collectionViewShouldUpdateFocusInReceivedInvocations: [(collectionView: UICollectionView, context: UICollectionViewFocusUpdateContext)] = []
    public var collectionViewShouldUpdateFocusInReturnValue: Bool!
    public var collectionViewShouldUpdateFocusInClosure: ((UICollectionView, UICollectionViewFocusUpdateContext) -> Bool)?
    
    public func collectionView(_ collectionView: UICollectionView, shouldUpdateFocusIn context: UICollectionViewFocusUpdateContext) -> Bool {
        collectionViewShouldUpdateFocusInCallsCount += 1
        collectionViewShouldUpdateFocusInReceivedArguments = (collectionView: collectionView, context: context)
        collectionViewShouldUpdateFocusInReceivedInvocations.append((collectionView: collectionView, context: context))
        return collectionViewShouldUpdateFocusInClosure.map({ $0(collectionView, context) }) ?? collectionViewShouldUpdateFocusInReturnValue
    }
    
    //MARK: - collectionView
    
    public var collectionViewDidUpdateFocusInWithCallsCount = 0
    public var collectionViewDidUpdateFocusInWithCalled: Bool {
        return collectionViewDidUpdateFocusInWithCallsCount > 0
    }
    public var collectionViewDidUpdateFocusInWithReceivedArguments: (collectionView: UICollectionView, context: UICollectionViewFocusUpdateContext, coordinator: UIFocusAnimationCoordinator)?
    public var collectionViewDidUpdateFocusInWithReceivedInvocations: [(collectionView: UICollectionView, context: UICollectionViewFocusUpdateContext, coordinator: UIFocusAnimationCoordinator)] = []
    public var collectionViewDidUpdateFocusInWithClosure: ((UICollectionView, UICollectionViewFocusUpdateContext, UIFocusAnimationCoordinator) -> Void)?
    
    public func collectionView(_ collectionView: UICollectionView, didUpdateFocusIn context: UICollectionViewFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        collectionViewDidUpdateFocusInWithCallsCount += 1
        collectionViewDidUpdateFocusInWithReceivedArguments = (collectionView: collectionView, context: context, coordinator: coordinator)
        collectionViewDidUpdateFocusInWithReceivedInvocations.append((collectionView: collectionView, context: context, coordinator: coordinator))
        collectionViewDidUpdateFocusInWithClosure?(collectionView, context, coordinator)
    }
    
    //MARK: - indexPathForPreferredFocusedView
    
    public var indexPathForPreferredFocusedViewInCallsCount = 0
    public var indexPathForPreferredFocusedViewInCalled: Bool {
        return indexPathForPreferredFocusedViewInCallsCount > 0
    }
    public var indexPathForPreferredFocusedViewInReceivedCollectionView: UICollectionView?
    public var indexPathForPreferredFocusedViewInReceivedInvocations: [UICollectionView] = []
    public var indexPathForPreferredFocusedViewInReturnValue: IndexPath?
    public var indexPathForPreferredFocusedViewInClosure: ((UICollectionView) -> IndexPath?)?
    
    public func indexPathForPreferredFocusedView(in collectionView: UICollectionView) -> IndexPath? {
        indexPathForPreferredFocusedViewInCallsCount += 1
        indexPathForPreferredFocusedViewInReceivedCollectionView = collectionView
        indexPathForPreferredFocusedViewInReceivedInvocations.append(collectionView)
        return indexPathForPreferredFocusedViewInClosure.map({ $0(collectionView) }) ?? indexPathForPreferredFocusedViewInReturnValue
    }
    
    //MARK: - collectionView
    
    public var collectionViewTargetIndexPathForMoveFromItemAtToProposedIndexPathCallsCount = 0
    public var collectionViewTargetIndexPathForMoveFromItemAtToProposedIndexPathCalled: Bool {
        return collectionViewTargetIndexPathForMoveFromItemAtToProposedIndexPathCallsCount > 0
    }
    public var collectionViewTargetIndexPathForMoveFromItemAtToProposedIndexPathReceivedArguments: (collectionView: UICollectionView, originalIndexPath: IndexPath, proposedIndexPath: IndexPath)?
    public var collectionViewTargetIndexPathForMoveFromItemAtToProposedIndexPathReceivedInvocations: [(collectionView: UICollectionView, originalIndexPath: IndexPath, proposedIndexPath: IndexPath)] = []
    public var collectionViewTargetIndexPathForMoveFromItemAtToProposedIndexPathReturnValue: IndexPath!
    public var collectionViewTargetIndexPathForMoveFromItemAtToProposedIndexPathClosure: ((UICollectionView, IndexPath, IndexPath) -> IndexPath)?
    
    public func collectionView(_ collectionView: UICollectionView, targetIndexPathForMoveFromItemAt originalIndexPath: IndexPath, toProposedIndexPath proposedIndexPath: IndexPath) -> IndexPath {
        collectionViewTargetIndexPathForMoveFromItemAtToProposedIndexPathCallsCount += 1
        collectionViewTargetIndexPathForMoveFromItemAtToProposedIndexPathReceivedArguments = (collectionView: collectionView, originalIndexPath: originalIndexPath, proposedIndexPath: proposedIndexPath)
        collectionViewTargetIndexPathForMoveFromItemAtToProposedIndexPathReceivedInvocations.append((collectionView: collectionView, originalIndexPath: originalIndexPath, proposedIndexPath: proposedIndexPath))
        return collectionViewTargetIndexPathForMoveFromItemAtToProposedIndexPathClosure.map({ $0(collectionView, originalIndexPath, proposedIndexPath) }) ?? collectionViewTargetIndexPathForMoveFromItemAtToProposedIndexPathReturnValue
    }
    
    //MARK: - collectionView
    
    public var collectionViewTargetContentOffsetForProposedContentOffsetCallsCount = 0
    public var collectionViewTargetContentOffsetForProposedContentOffsetCalled: Bool {
        return collectionViewTargetContentOffsetForProposedContentOffsetCallsCount > 0
    }
    public var collectionViewTargetContentOffsetForProposedContentOffsetReceivedArguments: (collectionView: UICollectionView, proposedContentOffset: CGPoint)?
    public var collectionViewTargetContentOffsetForProposedContentOffsetReceivedInvocations: [(collectionView: UICollectionView, proposedContentOffset: CGPoint)] = []
    public var collectionViewTargetContentOffsetForProposedContentOffsetReturnValue: CGPoint!
    public var collectionViewTargetContentOffsetForProposedContentOffsetClosure: ((UICollectionView, CGPoint) -> CGPoint)?
    
    public func collectionView(_ collectionView: UICollectionView, targetContentOffsetForProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint {
        collectionViewTargetContentOffsetForProposedContentOffsetCallsCount += 1
        collectionViewTargetContentOffsetForProposedContentOffsetReceivedArguments = (collectionView: collectionView, proposedContentOffset: proposedContentOffset)
        collectionViewTargetContentOffsetForProposedContentOffsetReceivedInvocations.append((collectionView: collectionView, proposedContentOffset: proposedContentOffset))
        return collectionViewTargetContentOffsetForProposedContentOffsetClosure.map({ $0(collectionView, proposedContentOffset) }) ?? collectionViewTargetContentOffsetForProposedContentOffsetReturnValue
    }
    
    //MARK: - collectionView
    
    public var collectionViewShouldSpringLoadItemAtWithCallsCount = 0
    public var collectionViewShouldSpringLoadItemAtWithCalled: Bool {
        return collectionViewShouldSpringLoadItemAtWithCallsCount > 0
    }
}
