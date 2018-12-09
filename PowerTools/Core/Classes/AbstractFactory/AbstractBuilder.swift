//
//  AbstractBuilder.swift
//  PowerTools
//
//  Created by Andrea Altea on 29/11/2018.
//

import UIKit

open class Builder<Context> {
    
    public init() {  }
    
    open func build(_ context: Context) -> UIViewController? {
        return nil
    }
}
