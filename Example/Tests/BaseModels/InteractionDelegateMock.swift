//
//  InteractionDelegateMock.swift
//  PowerTools_Example
//
//  Created by Andrea Altea on 08/06/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

// swiftlint:disable line_length
// swiftlint:disable variable_name

import PowerTools

class InteractionDelegateMock: InteractionDelegate {
    
    var containerViewShouldSelectCallsCount = 0
    var containerViewShouldSelectCalled: Bool {
        return containerViewShouldSelectCallsCount > 0
    }
    var containerViewShouldSelectReceivedArguments: (containerView: UIView, item: ItemViewModel)?
    var containerViewShouldSelectReceivedInvocations: [(containerView: UIView, item: ItemViewModel)] = []
    var containerViewShouldSelectReturnValue: Bool!
    var containerViewShouldSelectClosure: ((UIView, ItemViewModel) -> Bool)?
    
    func containerView(_ containerView: UIView, shouldSelect item: ItemViewModel) -> Bool {
        containerViewShouldSelectCallsCount += 1
        containerViewShouldSelectReceivedArguments = (containerView: containerView, item: item)
        containerViewShouldSelectReceivedInvocations.append((containerView: containerView, item: item))
        return containerViewShouldSelectClosure.map({ $0(containerView, item) }) ?? containerViewShouldSelectReturnValue
    }
    
    var containerViewDidSelectCallsCount = 0
    var containerViewDidSelectCalled: Bool {
        return containerViewDidSelectCallsCount > 0
    }
    var containerViewDidSelectReceivedArguments: (containerView: UIView, item: ItemViewModel)?
    var containerViewDidSelectReceivedInvocations: [(containerView: UIView, item: ItemViewModel)] = []
    var containerViewDidSelectClosure: ((UIView, ItemViewModel) -> Void)?
    
    func containerView(_ containerView: UIView, didSelect item: ItemViewModel) {
        containerViewDidSelectCallsCount += 1
        containerViewDidSelectReceivedArguments = (containerView: containerView, item: item)
        containerViewDidSelectReceivedInvocations.append((containerView: containerView, item: item))
        containerViewDidSelectClosure?(containerView, item)
    }
    
    var containerViewShouldDeselectCallsCount = 0
    var containerViewShouldDeselectCalled: Bool {
        return containerViewShouldDeselectCallsCount > 0
    }
    var containerViewShouldDeselectReceivedArguments: (containerView: UIView, item: ItemViewModel)?
    var containerViewShouldDeselectReceivedInvocations: [(containerView: UIView, item: ItemViewModel)] = []
    var containerViewShouldDeselectReturnValue: Bool!
    var containerViewShouldDeselectClosure: ((UIView, ItemViewModel) -> Bool)?
    
    func containerView(_ containerView: UIView, shouldDeselect item: ItemViewModel) -> Bool {
        containerViewShouldDeselectCallsCount += 1
        containerViewShouldDeselectReceivedArguments = (containerView: containerView, item: item)
        containerViewShouldDeselectReceivedInvocations.append((containerView: containerView, item: item))
        return containerViewShouldDeselectClosure.map({ $0(containerView, item) }) ?? containerViewShouldDeselectReturnValue
    }
    
    var containerViewDidDeselectCallsCount = 0
    var containerViewDidDeselectCalled: Bool {
        return containerViewDidDeselectCallsCount > 0
    }
    var containerViewDidDeselectReceivedArguments: (containerView: UIView, item: ItemViewModel)?
    var containerViewDidDeselectReceivedInvocations: [(containerView: UIView, item: ItemViewModel)] = []
    var containerViewDidDeselectClosure: ((UIView, ItemViewModel) -> Void)?
    
    func containerView(_ containerView: UIView, didDeselect item: ItemViewModel) {
        containerViewDidDeselectCallsCount += 1
        containerViewDidDeselectReceivedArguments = (containerView: containerView, item: item)
        containerViewDidDeselectReceivedInvocations.append((containerView: containerView, item: item))
        containerViewDidDeselectClosure?(containerView, item)
    }
    
    var containerViewShouldHighlightCallsCount = 0
    var containerViewShouldHighlightCalled: Bool {
        return containerViewShouldHighlightCallsCount > 0
    }
    var containerViewShouldHighlightReceivedArguments: (containerView: UIView, item: ItemViewModel)?
    var containerViewShouldHighlightReceivedInvocations: [(containerView: UIView, item: ItemViewModel)] = []
    var containerViewShouldHighlightReturnValue: Bool!
    var containerViewShouldHighlightClosure: ((UIView, ItemViewModel) -> Bool)?
    
    func containerView(_ containerView: UIView, shouldHighlight item: ItemViewModel) -> Bool {
        containerViewShouldHighlightCallsCount += 1
        containerViewShouldHighlightReceivedArguments = (containerView: containerView, item: item)
        containerViewShouldHighlightReceivedInvocations.append((containerView: containerView, item: item))
        return containerViewShouldHighlightClosure.map({ $0(containerView, item) }) ?? containerViewShouldHighlightReturnValue
    }
    
    var containerViewDidHighlightCallsCount = 0
    var containerViewDidHighlightCalled: Bool {
        return containerViewDidHighlightCallsCount > 0
    }
    var containerViewDidHighlightReceivedArguments: (containerView: UIView, item: ItemViewModel)?
    var containerViewDidHighlightReceivedInvocations: [(containerView: UIView, item: ItemViewModel)] = []
    var containerViewDidHighlightClosure: ((UIView, ItemViewModel) -> Void)?
    
    func containerView(_ containerView: UIView, didHighlight item: ItemViewModel) {
        containerViewDidHighlightCallsCount += 1
        containerViewDidHighlightReceivedArguments = (containerView: containerView, item: item)
        containerViewDidHighlightReceivedInvocations.append((containerView: containerView, item: item))
        containerViewDidHighlightClosure?(containerView, item)
    }
    
    var containerViewDidUnhighlightCallsCount = 0
    var containerViewDidUnhighlightCalled: Bool {
        return containerViewDidUnhighlightCallsCount > 0
    }
    var containerViewDidUnhighlightReceivedArguments: (containerView: UIView, item: ItemViewModel)?
    var containerViewDidUnhighlightReceivedInvocations: [(containerView: UIView, item: ItemViewModel)] = []
    var containerViewDidUnhighlightClosure: ((UIView, ItemViewModel) -> Void)?
    
    func containerView(_ containerView: UIView, didUnhighlight item: ItemViewModel) {
        containerViewDidUnhighlightCallsCount += 1
        containerViewDidUnhighlightReceivedArguments = (containerView: containerView, item: item)
        containerViewDidUnhighlightReceivedInvocations.append((containerView: containerView, item: item))
        containerViewDidUnhighlightClosure?(containerView, item)
    }
    
}
