//
//  SKAction+Easing.swift
//  SpriteKitEasingSwift
//
//  Created by John Grange on 2/17/15.
//  Copyright (c) 2015 SD Networks. All rights reserved.
//

import Foundation
import SpriteKit

enum CurveType: NSInteger {
    
    case CurveTypeLinear
    case CurveTypeQuadratic
    case CurveTypeCubic
    case CurveTypeQuartic
    case CurveTypeQuintic
    case CurveTypeSine
    case CurveTypeCircular
    case CurveTypeExpo
    case CurveTypeElastic
    case CurveTypeBack
    case CurveTypeBounce
    
}

enum EasingMode: NSInteger {
    
    case EaseIn, EaseOut, EaseInOut
}

typealias easingPointCallBack = (node: SKNode, point: CGPoint) -> ()

typealias easingFloatCallBack = (node: SKNode, float: CGFloat) -> ()

extension SKAction {
    
    /**
    Return the EasingFunction for the CurveType and EaseingMode
    
    :param: curve CurveType
    :param: mode  EasingMode
    */
    class internal func getEaseFunctionForCurveType(curve: CurveType, mode: EasingMode) -> EasingFunction? {
        
        var currentFunction: EasingFunction?
        
        switch curve {
        case .CurveTypeLinear:
            currentFunction = linearInterpolation
        case .CurveTypeQuadratic:
            currentFunction = (mode == EasingMode.EaseIn) ? quadraticEaseIn : (mode == EasingMode.EaseOut) ? quadraticEaseOut : quadraticEaseInOut
        default:
            break
        }
        
        return currentFunction
    }
    
    /**
    Create a custom SKAction between a starting vector and the ending vector using the provided EasingFunction
    
    :param: startPosition  CGVector representing the start position for the node
    :param: endPosition    CGVector representing the end position for the node
    :param: duration       NSTimeInterval for the total duration fo the animation
    :param: easingFunction EasingFunction to apply to the animation
    :param: setterBlock    The block used to execute the positon changes on the node
    
    :returns: custom SKAction
    */
    class func createPointTween(startPosition: CGVector, endPosition: CGVector, duration: NSTimeInterval, easingFunction: EasingFunction, setterBlock: easingPointCallBack) -> SKAction {
        
        
        var action = SKAction.customActionWithDuration(duration, actionBlock: { (node:SKNode!, elapsedTime: CGFloat) -> Void in
            
            let percentComplete = Double(Double(elapsedTime) / duration)
            
            var xValue = CGFloat( Double(startPosition.dx) + easingFunction(percentComplete) * Double(endPosition.dx - startPosition.dx) )
            
            var yValue = CGFloat( Double(startPosition.dy) + easingFunction(percentComplete) * Double(endPosition.dy - startPosition.dy) )
            
            setterBlock(node: node, point: CGPointMake(xValue, yValue))
            
            ();
        })
        
        return action
    }
    
    
    /**
    Create a custom SKAction between two float values using the selected EasingFunction
    
    :param: startFloat     CGFloat start value
    :param: endFloat       CGFloat end value
    :param: duration       NSTimeInterval for the total duration fo the animation
    :param: easingFunction EasingFunction to apply to the animation
    :param: setterBlock    The block used to execute the float changes on the node
    
    :returns: custom SKAction
    */
    class func createFloatTween(startFloat: CGFloat, endFloat: CGFloat, duration: NSTimeInterval, easingFunction: EasingFunction, setterBlock: easingFloatCallBack) -> SKAction {
        
        var action = SKAction.customActionWithDuration(duration, actionBlock: { (node:SKNode!, elapsedTime: CGFloat) -> Void in
            
            let percentComplete = Double(Double(elapsedTime) / duration)
            
            var value = CGFloat( Double(startFloat) + easingFunction(percentComplete) * Double(endFloat - startFloat) )
            
            setterBlock(node: node, float: value)
            
            ();
        })
        
        return action
    }
    
    /**
    Move the node from the current position to a new postion using the selected curve and easing mode
    
    :param: targetNode SKNode to move
    :param: toVector   CGVector representing the end position
    :param: curveType  CurveType
    :param: mode       EasingMode
    :param: duration   NSTimerInterval representing the duration of the animation
    
    :returns: SKAction
    */
    class func moveNode(targetNode: SKNode, toVector: CGVector, curveType: CurveType, mode: EasingMode, duration: NSTimeInterval) -> SKAction? {
        
        let startVector = CGVectorMake(targetNode.position.x, targetNode.position.y)
        
        var action : SKAction?
        
        if let easingFunction = SKAction.getEaseFunctionForCurveType(curveType, mode: mode) {
            
            action = self.createPointTween(startVector, endPosition: toVector, duration: duration, easingFunction: easingFunction) { (node, point) -> () in
                
                node.position = point
            }
        }
        
        return action

    }
    
}