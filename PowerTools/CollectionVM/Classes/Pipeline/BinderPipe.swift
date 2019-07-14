//
//  BinderPipe.swift
//  Pods
//
//  Created by Andrea Altea on 27/06/2019.
//

import Foundation

public class BinderPipe<DataSource: AbstractBinderDataSource, Result>: Pipe<[Result]> where Result == DataSource.ASectionViewModel {
    
    var queue: DispatchQueue = .main
    weak var dataSource: DataSource?
    
    public init(dataSource: DataSource) {
        self.dataSource = dataSource
    }
    
    override public func success(_ content: [Result]) {
        self.queue.async {
            self.dataSource?.model = content
        }
        self.send(content)
    }
    
    override public func failure(_ error: Error) {
        self.queue.async {
            self.dataSource?.model = []
        }
        self.send(error)
    }
    
    override public func reset() {
        self.queue.async {
            self.dataSource?.model = []
        }
        super.reset()
    }
}

public extension Pipeline {
    
    mutating func dataSource<DataSource: AbstractBinderDataSource>(_ binderDataSource: DataSource) where Value == [DataSource.ASectionViewModel] {
        let binderPipe = BinderPipe(dataSource: binderDataSource)
        self.attach(binderPipe)
    }
}
