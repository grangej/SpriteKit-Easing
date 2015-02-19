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
        case .CurveTypeCubic:
            currentFunction = (mode == EasingMode.EaseIn) ? cubicEaseIn : (mode == EasingMode.EaseOut) ? cubicEaseOut : cubicEaseInOut
        case .CurveTypeQuartic:
            currentFunction = (mode == EasingMode.EaseIn) ? quarticEaseIn : (mode == EasingMode.EaseOut) ? quarticEaseOut : quarticEaseInOut
        case .CurveTypeQuintic:
            currentFunction = (mode == EasingMode.EaseIn) ? quinticEaseIn : (mode == EasingMode.EaseOut) ? quinticEaseOut : quinticEaseInOut
        case .CurveTypeSine:
            currentFunction = (mode == EasingMode.EaseIn) ? sineEaseIn : (mode == EasingMode.EaseOut) ? sineEaseOut : sineEaseInOut
        case .CurveTypeCircular:
            currentFunction = (mode == EasingMode.EaseIn) ? circularEaseIn : (mode == EasingMode.EaseOut) ? circularEaseOut : circularEaseInOut
        case .CurveTypeExpo:
            currentFunction = (mode == EasingMode.EaseIn) ? exponentialEaseIn : (mode == EasingMode.EaseOut) ? exponentialEaseOut : exponentialEaseInOut
        case .CurveTypeElastic:
            currentFunction = (mode == EasingMode.EaseIn) ? elasticEaseIn : (mode == EasingMode.EaseOut) ? elasticEaseOut : elasticEaseInOut
        case .CurveTypeBack:
            currentFunction = (mode == EasingMode.EaseIn) ? backEaseIn : (mode == EasingMode.EaseOut) ? backEaseOut : backEaseInOut
        case .CurveTypeBounce:
            currentFunction = (mode == EasingMode.EaseIn) ? bounceEaseIn : (mode == EasingMode.EaseOut) ? bounceEaseOut : bounceEaseInOut
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
    :param: fromVector  optional CGVector representing the start position, otherwise it will use the nodes current position
    :param: toVector   CGVector representing the end position
    :param: curveType  CurveType
    :param: mode       EasingMode
    :param: duration   NSTimerInterval representing the duration of the animation
    
    :returns: SKAction
    */
    class func moveNode(targetNode: SKNode, fromVector: CGVector?, toVector: CGVector, curveType: CurveType, mode: EasingMode, duration: NSTimeInterval) -> SKAction? {
        
        var startPosition: CGVector
        
        if let fromVector = fromVector {
            
            startPosition = fromVector
        }
        else {
            
            startPosition = CGVectorMake(targetNode.position.x, targetNode.position.y)
        }
        
        
        var action : SKAction?
        
        if let easingFunction = SKAction.getEaseFunctionForCurveType(curveType, mode: mode) {
            
            action = self.createPointTween(startPosition, endPosition: toVector, duration: duration, easingFunction: easingFunction) { (node, point) -> () in
                
                node.position = point
            }
        }
        
        return action

    }
    
    /**
    Scale the node from the current scale to a new scale value using the selected curve and easing mode
    
    :param: targetNode SKNode to scale
    :param: fromValue  optional CGFloat representing the start scale, otherwise it will use the nodes current scale
    :param: toValue    CGFloat representing the end scale value
    :param: curveType  CurveType
    :param: mode       EasingMode
    :param: duration   NSTimerInterval representing the duration of the animation
    
    :returns: SKAction
    */
    class func scaleNode(targetNode: SKNode, fromValue: CGFloat?, toValue: CGFloat, curveType: CurveType, mode: EasingMode, duration: NSTimeInterval) -> SKAction? {
        
        
        var startValue: CGFloat
        
        if let fromValue = fromValue {
            
            startValue = fromValue
        }
        else {
            
            startValue = targetNode.xScale
        }
        
        var action : SKAction?
        
        if let easingFunction = SKAction.getEaseFunctionForCurveType(curveType, mode: mode) {
            
            action = SKAction.createFloatTween(startValue, endFloat: toValue, duration: duration, easingFunction: easingFunction, setterBlock: { (node, float) -> () in
                
                node.setScale(float)
            })
        }
        
        return action
        
    }

    /**
    Rotate the node to the new rotation value using the selected curve and easing mode
    
    :param: targetNode SKNode to rotate
    :param: fromValue  optional CGFloat representing the start rotation, otherwise it will use the nodes current zRotation
    :param: toValue    CGFloat representing the end scale value
    :param: curveType  CurveType
    :param: mode       EasingMode
    :param: duration   NSTimerInterval representing the duration of the animation
    
    :returns: SKAction
    */
    class func rotateNode(targetNode: SKNode, fromValue: CGFloat?, toValue: CGFloat, curveType: CurveType, mode: EasingMode, duration: NSTimeInterval) -> SKAction? {
        
        
        var startValue: CGFloat
        
        if let fromValue = fromValue {
            
            startValue = fromValue
        }
        else {
            
            startValue = targetNode.zRotation
        }
        
        var action : SKAction?
        
        if let easingFunction = SKAction.getEaseFunctionForCurveType(curveType, mode: mode) {
            
            action = SKAction.createFloatTween(startValue, endFloat: toValue, duration: duration, easingFunction: easingFunction, setterBlock: { (node, float) -> () in
                
                node.zRotation = float
            })
        }
        
        return action
        
    }
    
    /**
    Fade the node to the new alpha value using the selected curve and easing mode
    
    :param: targetNode SKNode to fade
    :param: fromValue  optional CGFloat representing the starting alpha value, otherwise it will use the nodes current alpha value
    :param: toValue    CGFloat representing the ending alpha value
    :param: curveType  CurveType
    :param: mode       EasingMode
    :param: duration   NSTimerInterval representing the duration of the animation
    
    :returns: SKAction
    */
    class func fadeNode(targetNode: SKNode, fromValue: CGFloat?, toValue: CGFloat, curveType: CurveType, mode: EasingMode, duration: NSTimeInterval) -> SKAction? {
        
        
        var startValue: CGFloat
        
        if let fromValue = fromValue {
            
            startValue = fromValue
        }
        else {
            
            startValue = targetNode.alpha
        }
        
        var action : SKAction?
        
        if let easingFunction = SKAction.getEaseFunctionForCurveType(curveType, mode: mode) {
            
            action = SKAction.createFloatTween(startValue, endFloat: toValue, duration: duration, easingFunction: easingFunction, setterBlock: { (node, float) -> () in
                
                node.alpha = float
            })
        }
        
        return action
        
    }
    
 
    
}