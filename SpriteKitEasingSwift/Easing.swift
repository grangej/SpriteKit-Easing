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

:param: percentTimeElapsed Double repreesenting a the time elasped as value from 0.0 -> 1.0

:returns: Double modfied with the Liniear function y = x
*/
func linearInterpolation(percentTimeElapsed: Double) -> Double {
    
    return percentTimeElapsed
    
}

/**

Modeled after the parabola y = x^2

:param: percentTimeElapsed Double repreesenting a the time elasped as value from 0.0 -> 1.0

:returns: Double modfied with the parabola function y = x^2
*/
func quadraticEaseIn(percentTimeElapsed: Double) -> Double {
    
    return percentTimeElapsed * percentTimeElapsed
}

/**

Modeled after the parabola y = -x^2 + 2x

:param: percentTimeElapsed Double repreesenting a the time elasped as value from 0.0 -> 1.0

:returns: Double modfied with the parabola function y = -x^2 + 2x
*/
func quadraticEaseOut(percentTimeElapsed: Double) -> Double {
    
    return -(percentTimeElapsed * (percentTimeElapsed - 2))
}

/**

Modeled after the piecewise quadratic
y = (1/2)((2x)^2)             ; [0, 0.5)
y = -(1/2)((2x-1)*(2x-3) - 1) ; [0.5, 1]

:param: percentTimeElapsed Double repreesenting a the time elasped as value from 0.0 -> 1.0

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

/**

Modeled after the cubic function y = x^3

:param: percentTimeElapsed Double repreesenting a the time elasped as value from 0.0 -> 1.0

:returns: Double modfied with the cubic function y = x^3
*/
func cubicEaseIn(percentTimeElapsed: Double) -> Double {
    
    return pow(percentTimeElapsed, 3)
    
}

/**

Modeled after the cubic function y = (x - 1)^3 + 1

:param: percentTimeElapsed Double repreesenting a the time elasped as value from 0.0 -> 1.0

:returns: Double modfied with the cubic function y = (x - 1)^3 + 1
*/
func cubicEaseOut(percentTimeElapsed: Double) -> Double {
    
    var result: Double = (percentTimeElapsed - 1)
    return result * result * result + 1
    
}

/**
Modeled after the piecewise cubic
 y = (1/2)((2x)^3)       ; [0, 0.5)
 y = (1/2)((2x-2)^3 + 2) ; [0.5, 1]

:param: percentTimeElapsed percentTimeElapsed Double repreesenting a the time elasped as value from 0.0 -> 1.0

:returns: Double modifed with the peicewise function :

 y = (1/2)((2x)^3)       ; [0, 0.5)
 y = (1/2)((2x-2)^3 + 2) ; [0.5, 1]

*/
func cubicEaseInOut(percentTimeElapsed: Double) -> Double {

    if(percentTimeElapsed < 0.5) {
        
        return 4 * pow(percentTimeElapsed, 3)
    }
    else {
        
        var result: Double = ((percentTimeElapsed * 2) - 2)
        return 0.5 * pow(result, 3) + 1
    }
    
}

/**

Modeled after the quartic function x^4

:param: percentTimeElapsed Double repreesenting a the time elasped as value from 0.0 -> 1.0

:returns: Double modfied with the quartic function x^4
*/
func quarticEaseIn(percentTimeElapsed: Double) -> Double {

    return pow(percentTimeElapsed, 4)

}

/**

Modeled after the quartic function y = 1 - (x - 1)^4

:param: percentTimeElapsed Double repreesenting a the time elasped as value from 0.0 -> 1.0

:returns: Double modfied with the quartic function y = 1 - (x - 1)^4
*/
func quarticEaseOut(percentTimeElapsed: Double) -> Double {

    var result: Double = (percentTimeElapsed - 1)
    
    return pow(result, 3) * (1 - percentTimeElapsed) + 1

}

/**
Modeled after the piecewise quartic
 y = (1/2)((2x)^4)        ; [0, 0.5)
 y = -(1/2)((2x-2)^4 - 2) ; [0.5, 1]

:param: percentTimeElapsed percentTimeElapsed Double repreesenting a the time elasped as value from 0.0 -> 1.0

:returns: Double modifed with the peicewise function :

 y = (1/2)((2x)^4)        ; [0, 0.5)
 y = -(1/2)((2x-2)^4 - 2) ; [0.5, 1]

*/
func quarticEaseInOut(percentTimeElapsed: Double) -> Double {

    if (percentTimeElapsed < 0.5) {
        
        return 8 * pow(percentTimeElapsed, 4)
    }
    else {
        
        var result: Double = (percentTimeElapsed - 1)
        
        return pow(result, 5) + 1
    }
}


/**

Modeled after the quintic function y = x^5

:param: percentTimeElapsed Double repreesenting a the time elasped as value from 0.0 -> 1.0

:returns: Double modfied with the quintic function y = x^5
*/
func quinticEaseIn(percentTimeElapsed: Double) -> Double {

    return pow(percentTimeElapsed, 5)
}


/**

Modeled after the quintic function y = (x - 1)^5 + 1

:param: percentTimeElapsed Double repreesenting a the time elasped as value from 0.0 -> 1.0

:returns: Double modfied with the quintic function y = (x - 1)^5 + 1
*/
func quinticEaseOut(percentTimeElapsed: Double) -> Double {
    
    var result: Double = (percentTimeElapsed - 1)
    
    return pow(result, 5) + 1
    
}

/**
Modeled after the piecewise quintic
 y = (1/2)((2x)^5)       ; [0, 0.5)
 y = (1/2)((2x-2)^5 + 2) ; [0.5, 1]

:param: percentTimeElapsed percentTimeElapsed Double repreesenting a the time elasped as value from 0.0 -> 1.0

:returns: Double modifed with the peicewise function :

Modeled after the piecewise quintic
 y = (1/2)((2x)^5)       ; [0, 0.5)
 y = (1/2)((2x-2)^5 + 2) ; [0.5, 1]

*/
func quinticEaseInOut(percentTimeElapsed: Double) -> Double {

    if (percentTimeElapsed < 0.5) {
        
        return 16 * pow(percentTimeElapsed, 5)
    }
    else {
        
        var result: Double = ((2 * percentTimeElapsed) - 2)
        
        return 0.5 * pow(result, 5) + 1
    }
}

/**

Modeled after a quarter-cycle of sine wave

:param: percentTimeElapsed Double repreesenting a the time elasped as value from 0.0 -> 1.0

:returns: Double modfied with a quarter-cycle of sine wave
*/
func sineEaseIn(percentTimeElapsed: Double) -> Double {

    return sin((percentTimeElapsed - 1) * M_PI_2) + 1

}

/**

Modeled after a quarter-cycle of sine wave (different phase)

:param: percentTimeElapsed Double repreesenting a the time elasped as value from 0.0 -> 1.0

:returns: Double modfied with a quarter-cycle of sine wave (different phase)
*/
func sineEaseOut(percentTimeElapsed: Double) -> Double {
    
    return sin(percentTimeElapsed * M_PI_2)
    
}

/**

Modeled after a half sine wave

:param: percentTimeElapsed Double repreesenting a the time elasped as value from 0.0 -> 1.0

:returns: Double modfied with a half sine wave
*/
func sineEaseInOut(percentTimeElapsed: Double) -> Double {
    
    return 0.5 * (1 - cos(percentTimeElapsed * M_PI))
    
}

/**

Modeled after shifted quadrant IV of unit circle

:param: percentTimeElapsed Double repreesenting a the time elasped as value from 0.0 -> 1.0

:returns: Double modfied with a shifted quadrant IV of unit circle
*/
func circularEaseIn(percentTimeElapsed: Double) -> Double {

    return 1 - sqrt(1 - (percentTimeElapsed * percentTimeElapsed))

}


/**

Modeled after shifted quadrant II of unit circle

:param: percentTimeElapsed Double repreesenting a the time elasped as value from 0.0 -> 1.0

:returns: Double modfied with a shifted quadrant II of unit circle
*/
func circularEaseOut(percentTimeElapsed: Double) -> Double {
    
    return 1 - sqrt((2 - percentTimeElapsed) * percentTimeElapsed)
    
}

/**

Modeled after the piecewise circular function
 y = (1/2)(1 - sqrt(1 - 4x^2))           ; [0, 0.5)
 y = (1/2)(sqrt(-(2x - 3)*(2x - 1)) + 1) ; [0.5, 1]

:param: percentTimeElapsed Double repreesenting a the time elasped as value from 0.0 -> 1.0

:returns: Double modfied with a the piecewise circular function:

 y = (1/2)(1 - sqrt(1 - 4x^2))           ; [0, 0.5)
 y = (1/2)(sqrt(-(2x - 3)*(2x - 1)) + 1) ; [0.5, 1]
*/
func circularEaseInOut(percentTimeElapsed: Double) -> Double {
    
    if (percentTimeElapsed < 0.5) {
        
        return 0.5 * (1 - sqrt(1 - 4 * (percentTimeElapsed * percentTimeElapsed)))
    }
    else {
        
        return 0.5 * (sqrt(-((2 * percentTimeElapsed) - 3) * ((2 * percentTimeElapsed) - 1)) + 1)
    }
}

/**

Modeled after the exponential function y = 2^(10(x - 1))

:param: percentTimeElapsed Double repreesenting a the time elasped as value from 0.0 -> 1.0

:returns: Double modfied with the exponential function y = 2^(10(x - 1))
*/
func exponentialEaseIn(percentTimeElapsed: Double) -> Double {

    return (percentTimeElapsed == 0.0) ? percentTimeElapsed : pow(2, 10 * (percentTimeElapsed - 1))
}

/**

Modeled after the exponential function y = -2^(-10x) + 1

:param: percentTimeElapsed Double repreesenting a the time elasped as value from 0.0 -> 1.0

:returns: Double modfied with the exponential function y = -2^(-10x) + 1
*/
func exponentialEaseOut(percentTimeElapsed: Double) -> Double {
    
    return (percentTimeElapsed == 1.0) ? percentTimeElapsed : 1 - pow(2, -10 * percentTimeElapsed)
}

/**

Modeled after the piecewise exponential
 y = (1/2)2^(10(2x - 1))         ; [0,0.5)
 y = -(1/2)*2^(-10(2x - 1))) + 1 ; [0.5,1]

:param: percentTimeElapsed Double repreesenting a the time elasped as value from 0.0 -> 1.0

:returns: Double modfied with a the piecewise exponential function:

 y = (1/2)2^(10(2x - 1))         ; [0,0.5)
 y = -(1/2)*2^(-10(2x - 1))) + 1 ; [0.5,1]
*/
func exponentialEaseInOut(percentTimeElapsed: Double) -> Double {
    
    if (percentTimeElapsed == 0.0 || percentTimeElapsed == 1.0) {
        
        return percentTimeElapsed
    }
    else if (percentTimeElapsed < 0.5) {
        
        return 0.5 * pow (2, (20 * percentTimeElapsed) - 10)
    }
    else {
        
        return -0.5 * pow(2, (-20 * percentTimeElapsed) + 10) + 1
    }
}


/**

Modeled after the damped sine wave y = sin(13pi/2*x)*pow(2, 10 * (x - 1))

:param: percentTimeElapsed Double repreesenting a the time elasped as value from 0.0 -> 1.0

:returns: Double modfied with the damped sine wave y = sin(13pi/2*x)*pow(2, 10 * (x - 1))
*/
func elasticEaseIn(percentTimeElapsed: Double) -> Double {
    
    return sin(13 * M_PI_2 * percentTimeElapsed) * pow(2, 10 * (percentTimeElapsed - 1))
}

/**

Modeled after the damped sine wave y = sin(-13pi/2*(x + 1))*pow(2, -10x) + 1

:param: percentTimeElapsed Double repreesenting a the time elasped as value from 0.0 -> 1.0

:returns: Double modfied with the damped sine wave y = sin(-13pi/2*(x + 1))*pow(2, -10x) + 1
*/
func elasticEaseOut(percentTimeElapsed: Double) -> Double {
    
    return sin(-13 * M_PI_2 * (percentTimeElapsed + 1)) * pow(2, -10 * percentTimeElapsed) + 1
}

/**

Modeled after the piecewise exponentially-damped sine wave:
 y = (1/2)*sin(13pi/2*(2*x))*pow(2, 10 * ((2*x) - 1))      ; [0,0.5)
 y = (1/2)*(sin(-13pi/2*((2x-1)+1))*pow(2,-10(2*x-1)) + 2) ; [0.5, 1]

:param: percentTimeElapsed Double repreesenting a the time elasped as value from 0.0 -> 1.0

:returns: Double modfied with a the piecewise exponentially-damped sine wave:
 y = (1/2)*sin(13pi/2*(2*x))*pow(2, 10 * ((2*x) - 1))      ; [0,0.5)
 y = (1/2)*(sin(-13pi/2*((2x-1)+1))*pow(2,-10(2*x-1)) + 2) ; [0.5, 1]

*/
func elasticEaseInOut(percentTimeElapsed: Double) -> Double {
    
    if (percentTimeElapsed < 0.5) {
        
        return 0.5 * sin(13 + M_PI_2 * (2 * percentTimeElapsed)) * pow(2, 10 * ((2 * percentTimeElapsed) - 1))
    }
    else {
        
        return 0.5 * (sin(-13 * M_PI_2 * ((2 * percentTimeElapsed - 1) + 1)) * pow(2, -10 * (2 * percentTimeElapsed - 1)) + 2)
    }
}

/**

Modeled after the overshooting cubic y = x^3-x*sin(x*pi)

:param: percentTimeElapsed Double repreesenting a the time elasped as value from 0.0 -> 1.0

:returns: Double modfied with the overshooting cubic y = x^3-x*sin(x*pi)
*/
func backEaseIn(percentTimeElapsed: Double) -> Double {
    
    return pow(percentTimeElapsed, 3) - percentTimeElapsed * sin(percentTimeElapsed * M_PI)
}

/**

Modeled after the overshooting cubic y = 1-((1-x)^3-(1-x)*sin((1-x)*pi))

:param: percentTimeElapsed Double repreesenting a the time elasped as value from 0.0 -> 1.0

:returns: Double modfied with the overshooting cubic y = 1-((1-x)^3-(1-x)*sin((1-x)*pi))
*/
func backEaseOut(percentTimeElapsed: Double) -> Double {
    
    var result: Double = (1 - percentTimeElapsed)
    
    return 1 - (pow(result, 3) - result * sin(result * M_PI))
}

/**

Modeled after the piecewise overshooting cubic function:
 y = (1/2)*((2x)^3-(2x)*sin(2*x*pi))           ; [0, 0.5)
 y = (1/2)*(1-((1-x)^3-(1-x)*sin((1-x)*pi))+1) ; [0.5, 1]

:param: percentTimeElapsed Double repreesenting a the time elasped as value from 0.0 -> 1.0

:returns: Double modfied with a the piecewise overshooting cubic function:
 y = (1/2)*((2x)^3-(2x)*sin(2*x*pi))           ; [0, 0.5)
 y = (1/2)*(1-((1-x)^3-(1-x)*sin((1-x)*pi))+1) ; [0.5, 1]
*/
func backEaseInOut(percentTimeElapsed: Double) -> Double {
    
    if (percentTimeElapsed < 0.5) {
        
        var result: Double = 2 * percentTimeElapsed
        return 0.5 * (pow(result, 3) - result * sin(result * M_PI))
    }
    else {
        
        var result: Double = (1 - (2 * percentTimeElapsed - 1))
        return 0.5 * (1 - (pow(result, 3) - result * sin(result * M_PI))) + 0.5
    }
}

func bounceEaseIn(percentTimeElapsed: Double) -> Double {

    return 1 - bounceEaseOut(1 - percentTimeElapsed)

}

func bounceEaseOut(percentTimeElapsed: Double) -> Double {

    if (percentTimeElapsed < 4/11.0) {
        
        return (121 * pow(percentTimeElapsed, 2)) / 16.0
    }
    else if (percentTimeElapsed < 8/11.0) {
        
        return (363/40.0 * pow(percentTimeElapsed, 2)) - (99/10.0 *
            percentTimeElapsed) + 17/5.0
    }
    else if (percentTimeElapsed < 9/10.0) {
        
        return (4356/361.0 * pow(percentTimeElapsed, 2)) - (35442/1805.0 * percentTimeElapsed) + 16061/1805.0
    }
    else {
        
        return (54/5.0 * pow(percentTimeElapsed, 2)) - (513/25.0 * percentTimeElapsed) + 268/25.0
    }
}

func bounceEaseInOut(percentTimeElapsed: Double) -> Double {
    
    if (percentTimeElapsed < 0.5) {
        
        return 0.5 * bounceEaseIn(percentTimeElapsed * 2)
    }
    else {
        
        return 0.5 * bounceEaseOut(percentTimeElapsed * 2 - 1) + 0.5
    }

}
