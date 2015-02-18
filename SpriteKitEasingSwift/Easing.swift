//
//  Easing.swift
//  SpriteKitEasingSwift
//
//  Created by John Grange on 2/17/15.
//  Copyright (c) 2015 SD Networks. All rights reserved.
//

import Foundation
import UIKit


typealias EasingFunction = Double -> Double

/**

Modeled after the line y = x

:param: perecentTimeElapsed Double repreesenting a the time elasped as value from 0.0 -> 1.0

:returns: Double modfied with the Liniear function y = x
*/
func linearInterpolation(perecentTimeElapsed: Double) -> Double {
    
    return perecentTimeElapsed
    
}

/**

Modeled after the parabola y = x^2

:param: perecentTimeElapsed Double repreesenting a the time elasped as value from 0.0 -> 1.0

:returns: Double modfied with the parabola function y = x^2
*/
func quadraticEaseIn(perecentTimeElapsed: Double) -> Double {
    
    return perecentTimeElapsed * perecentTimeElapsed
}

/**

Modeled after the parabola y = -x^2 + 2x

:param: perecentTimeElapsed Double repreesenting a the time elasped as value from 0.0 -> 1.0

:returns: Double modfied with the parabola function y = -x^2 + 2x
*/
func quadraticEaseOut(percentTimeElapsed: Double) -> Double {
    
    return -(percentTimeElapsed * (percentTimeElapsed - 2))
}

/**

Modeled after the piecewise quadratic
y = (1/2)((2x)^2)             ; [0, 0.5)
y = -(1/2)((2x-1)*(2x-3) - 1) ; [0.5, 1]

:param: perecentTimeElapsed Double repreesenting a the time elasped as value from 0.0 -> 1.0

:returns: Double modfied with the piecewise function :
y = (1/2)((2x)^2)             ; [0, 0.5)
y = -(1/2)((2x-1)*(2x-3) - 1) ; [0.5, 1]

*/
func quadraticEaseInOut(percentTimeElapsed: Double) -> Double {
    
    if(percentTimeElapsed < 0.5) {
        
        return 2 * percentTimeElapsed * percentTimeElapsed
    }
    else {
        
        return (-2 * percentTimeElapsed * percentTimeElapsed) + (4 * percentTimeElapsed) - 1
    }
}