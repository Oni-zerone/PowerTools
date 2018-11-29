//
//  AbstractBuilder.swift
//  PowerTools
//
//  Created by Andrea Altea on 29/11/2018.
//

import UIKit

open class Builder<Parameters> {
    
    public init() {  }
    
    open func build(_ parameters: Parameters) -> UIViewController? {
        return nil
    }
}
