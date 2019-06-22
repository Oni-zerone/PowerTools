//
//  CollectionSizedDataSource.swift
//  SOTViewModelRepresenter
//
//  Created by Andrea Altea on 29/10/18.
//

import UIKit

public class GridCollectionDataSource: CollectionBinderDataSource, UICollectionViewDelegateFlowLayout {
    
    override public var model: [SectionViewModel] {
        willSet {
            self.moduleCache = [:]
        }
    }
    
    override public var view: UICollectionView? {
        didSet {
            self.view?.delegate = self
        }
    }
    
    internal var moduleCache: [Int: GridModule] = [:]
    public weak var interactionDelegate: InteractionDelegate?
    public weak var scrollViewDelegate: UIScrollViewDelegate?
    
    public override init(view: UICollectionView?, model: [SectionViewModel]) {
        super.init(view: view, model: model)
        view?.delegate = self
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        guard let section = self.model.item(at: section) as? GridSection else {
            return .zero
        }
        return section.sectionInsets
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        guard let section = self.model.item(at: section) as? GridSection else {
            return 0
        }
        return section.horizontalSpacing(collectionView.contentDirection)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

        guard let section = self.model.item(at: section) as? GridSection else {
            return 0
        }
        return section.verticalSpacing(collectionView.contentDirection)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        guard let module = self.module(for: indexPath.section, in: collectionView),
            let sizedItem = self.model.viewModel(at: indexPath) as? GridItem else {
            return .zero
        }
        return sizedItem.size(in: collectionView, module: module)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return self.referenceSizeOf(elementOfKind: UICollectionView.elementKindSectionHeader, for: section, in: collectionView)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return self.referenceSizeOf(elementOfKind: UICollectionView.elementKindSectionFooter, for: section, in: collectionView)
    }
    
    public func invalidateLayout() {
        
        self.moduleCache = [:]
        self.view?.collectionViewLayout.invalidateLayout()
    }
    
    //MARK: - InteractionDelegate
    
    public func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        
        guard let model = self.model.viewModel(at: indexPath) else {
            return false
        }
        return self.interactionDelegate?.containerView(collectionView, shouldSelect: model) ?? false
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let model = self.model.viewModel(at: indexPath) {
            self.interactionDelegate?.containerView(collectionView, didSelect: model)
        }
    }
    
    public func collectionView(_ collectionView: UICollectionView, shouldDeselectItemAt indexPath: IndexPath) -> Bool {

        guard let model = self.model.viewModel(at: indexPath) else {
            return false
        }
        return self.interactionDelegate?.containerView(collectionView, shouldDeselect: model) ?? false
    }

    public func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
        if let model = self.model.viewModel(at: indexPath) {
            self.interactionDelegate?.containerView(collectionView, didDeselect: model)
        }
    }

    public func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        
        guard let model = self.model.viewModel(at: indexPath) else {
            return false
        }
        return self.interactionDelegate?.containerView(collectionView, shouldHighlight: model) ?? false
    }
    
    public func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        
        if let model = self.model.viewModel(at: indexPath) {
            self.interactionDelegate?.containerView(collectionView, didHighlight: model)
        }
    }
    
    public func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        
        if let model = self.model.viewModel(at: indexPath) {
            self.interactionDelegate?.containerView(collectionView, didUnhighlight: model)
        }
    }
    
    //MARK: - UIScrollViewDelegate
    
    public func scrollViewDidZoom(_ scrollView: UIScrollView) {
        self.scrollViewDelegate?.scrollViewDidZoom?(scrollView)
    }
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.scrollViewDelegate?.scrollViewDidScroll?(scrollView)
    }
    
    public func scrollViewDidScrollToTop(_ scrollView: UIScrollView) {
        self.scrollViewDelegate?.scrollViewDidScrollToTop?(scrollView)
    }
    
    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.scrollViewDelegate?.scrollViewDidEndDecelerating?(scrollView)
    }
    
    public func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.scrollViewDelegate?.scrollViewWillBeginDragging?(scrollView)
    }
    
    public func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        self.scrollViewDelegate?.scrollViewWillBeginDecelerating?(scrollView)
    }
    
    public func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        self.scrollViewDelegate?.scrollViewDidEndScrollingAnimation?(scrollView)
    }
    
    public func scrollViewShouldScrollToTop(_ scrollView: UIScrollView) -> Bool {
        return self.scrollViewDelegate?.scrollViewShouldScrollToTop?(scrollView) ?? true
    }
    
    @available(iOS 11.0, *)
    public func scrollViewDidChangeAdjustedContentInset(_ scrollView: UIScrollView) {
        self.scrollViewDelegate?.scrollViewDidChangeAdjustedContentInset?(scrollView)
    }
    
    public func scrollViewWillBeginZooming(_ scrollView: UIScrollView, with view: UIView?) {
        self.scrollViewDelegate?.scrollViewWillBeginZooming?(scrollView, with: view)
    }
    
    public func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        self.scrollViewDelegate?.scrollViewDidEndDragging?(scrollView, willDecelerate: decelerate)
    }
    
    public func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        self.scrollViewDelegate?.scrollViewWillEndDragging?(scrollView, withVelocity: velocity, targetContentOffset: targetContentOffset)
    }
    
    public func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        self.scrollViewDelegate?.scrollViewDidEndZooming?(scrollView, with: view, atScale: scale)
    }
    
    public func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.scrollViewDelegate?.viewForZooming?(in: scrollView)
    }
}
