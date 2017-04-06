//
//  Namespace.swift
//  StaticCellKit
//
//  Created by Mango on 2017/4/5.
//  Copyright © 2017年 MangoMade. All rights reserved.
//

import Foundation

public protocol NamespaceWrappable {
    
    associatedtype WrapperType
    
    var sck: WrapperType { get }
    
    static var sck: WrapperType.Type { get }
}

public extension NamespaceWrappable {
    
    /// sck, aka Static Cell Kit
    var sck: TypeWrapper<Self> {
        return TypeWrapper(self)
    }
    
    static var sck: TypeWrapper<Self>.Type {
        return TypeWrapper.self
    }
}

public protocol TypeWrapperProtocol {
    
    associatedtype WrapperObject
    
    var wrapperObject: WrapperObject { get }
    
    init(_ wrapperObject: WrapperObject)
    
}

public struct TypeWrapper<T>: TypeWrapperProtocol {
    
    public let wrapperObject: T
    
    public init(_ wrapperObject: T) {
        self.wrapperObject = wrapperObject
    }
}

