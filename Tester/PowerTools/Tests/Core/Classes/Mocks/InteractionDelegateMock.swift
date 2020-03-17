//
//  InteractionDelegateMock.swift
//  PowerTools_Example
//
//  Created by Andrea Altea on 08/06/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

// swiftlint:disable line_length
// swiftlint:disable public variable_name

import PowerTools

public class InteractionDelegateMock: NSObject, InteractionDelegate {
    
    public override init() { }
    
    public var containerViewShouldSelectCallsCount = 0
    public var containerViewShouldSelectCalled: Bool {
        return containerViewShouldSelectCallsCount > 0
    }
    public var containerViewShouldSelectReceivedArguments: (containerView: UIView, item: ItemViewModel)?
    public var containerViewShouldSelectReceivedInvocations: [(containerView: UIView, item: ItemViewModel)] = []
    public var containerViewShouldSelectReturnValue: Bool!
    public var containerViewShouldSelectClosure: ((UIView, ItemViewModel) -> Bool)?
    
    public func containerView(_ containerView: UIView, shouldSelect item: ItemViewModel) -> Bool {
        containerViewShouldSelectCallsCount += 1
        containerViewShouldSelectReceivedArguments = (containerView: containerView, item: item)
        containerViewShouldSelectReceivedInvocations.append((containerView: containerView, item: item))
        return containerViewShouldSelectClosure.map({ $0(containerView, item) }) ?? containerViewShouldSelectReturnValue
    }
    
    public var containerViewDidSelectCallsCount = 0
    public var containerViewDidSelectCalled: Bool {
        return containerViewDidSelectCallsCount > 0
    }
    public var containerViewDidSelectReceivedArguments: (containerView: UIView, item: ItemViewModel)?
    public var containerViewDidSelectReceivedInvocations: [(containerView: UIView, item: ItemViewModel)] = []
    public var containerViewDidSelectClosure: ((UIView, ItemViewModel) -> Void)?
    
    public func containerView(_ containerView: UIView, didSelect item: ItemViewModel) {
        containerViewDidSelectCallsCount += 1
        containerViewDidSelectReceivedArguments = (containerView: containerView, item: item)
        containerViewDidSelectReceivedInvocations.append((containerView: containerView, item: item))
        containerViewDidSelectClosure?(containerView, item)
    }
    
    public var containerViewShouldDeselectCallsCount = 0
    public var containerViewShouldDeselectCalled: Bool {
        return containerViewShouldDeselectCallsCount > 0
    }
    public var containerViewShouldDeselectReceivedArguments: (containerView: UIView, item: ItemViewModel)?
    public var containerViewShouldDeselectReceivedInvocations: [(containerView: UIView, item: ItemViewModel)] = []
    public var containerViewShouldDeselectReturnValue: Bool!
    public var containerViewShouldDeselectClosure: ((UIView, ItemViewModel) -> Bool)?
    
    public func containerView(_ containerView: UIView, shouldDeselect item: ItemViewModel) -> Bool {
        containerViewShouldDeselectCallsCount += 1
        containerViewShouldDeselectReceivedArguments = (containerView: containerView, item: item)
        containerViewShouldDeselectReceivedInvocations.append((containerView: containerView, item: item))
        return containerViewShouldDeselectClosure.map({ $0(containerView, item) }) ?? containerViewShouldDeselectReturnValue
    }
    
    public var containerViewDidDeselectCallsCount = 0
    public var containerViewDidDeselectCalled: Bool {
        return containerViewDidDeselectCallsCount > 0
    }
    public var containerViewDidDeselectReceivedArguments: (containerView: UIView, item: ItemViewModel)?
    public var containerViewDidDeselectReceivedInvocations: [(containerView: UIView, item: ItemViewModel)] = []
    public var containerViewDidDeselectClosure: ((UIView, ItemViewModel) -> Void)?
    
    public func containerView(_ containerView: UIView, didDeselect item: ItemViewModel) {
        containerViewDidDeselectCallsCount += 1
        containerViewDidDeselectReceivedArguments = (containerView: containerView, item: item)
        containerViewDidDeselectReceivedInvocations.append((containerView: containerView, item: item))
        containerViewDidDeselectClosure?(containerView, item)
    }
    
    public var containerViewShouldHighlightCallsCount = 0
    public var containerViewShouldHighlightCalled: Bool {
        return containerViewShouldHighlightCallsCount > 0
    }
    public var containerViewShouldHighlightReceivedArguments: (containerView: UIView, item: ItemViewModel)?
    public var containerViewShouldHighlightReceivedInvocations: [(containerView: UIView, item: ItemViewModel)] = []
    public var containerViewShouldHighlightReturnValue: Bool!
    public var containerViewShouldHighlightClosure: ((UIView, ItemViewModel) -> Bool)?
    
    public func containerView(_ containerView: UIView, shouldHighlight item: ItemViewModel) -> Bool {
        containerViewShouldHighlightCallsCount += 1
        containerViewShouldHighlightReceivedArguments = (containerView: containerView, item: item)
        containerViewShouldHighlightReceivedInvocations.append((containerView: containerView, item: item))
        return containerViewShouldHighlightClosure.map({ $0(containerView, item) }) ?? containerViewShouldHighlightReturnValue
    }
    
    public var containerViewDidHighlightCallsCount = 0
    public var containerViewDidHighlightCalled: Bool {
        return containerViewDidHighlightCallsCount > 0
    }
    public var containerViewDidHighlightReceivedArguments: (containerView: UIView, item: ItemViewModel)?
    public var containerViewDidHighlightReceivedInvocations: [(containerView: UIView, item: ItemViewModel)] = []
    public var containerViewDidHighlightClosure: ((UIView, ItemViewModel) -> Void)?
    
    public func containerView(_ containerView: UIView, didHighlight item: ItemViewModel) {
        containerViewDidHighlightCallsCount += 1
        containerViewDidHighlightReceivedArguments = (containerView: containerView, item: item)
        containerViewDidHighlightReceivedInvocations.append((containerView: containerView, item: item))
        containerViewDidHighlightClosure?(containerView, item)
    }
    
    public var containerViewDidUnhighlightCallsCount = 0
    public var containerViewDidUnhighlightCalled: Bool {
        return containerViewDidUnhighlightCallsCount > 0
    }
    public var containerViewDidUnhighlightReceivedArguments: (containerView: UIView, item: ItemViewModel)?
    public var containerViewDidUnhighlightReceivedInvocations: [(containerView: UIView, item: ItemViewModel)] = []
    public var containerViewDidUnhighlightClosure: ((UIView, ItemViewModel) -> Void)?
    
    public func containerView(_ containerView: UIView, didUnhighlight item: ItemViewModel) {
        containerViewDidUnhighlightCallsCount += 1
        containerViewDidUnhighlightReceivedArguments = (containerView: containerView, item: item)
        containerViewDidUnhighlightReceivedInvocations.append((containerView: containerView, item: item))
        containerViewDidUnhighlightClosure?(containerView, item)
    }
    
}
