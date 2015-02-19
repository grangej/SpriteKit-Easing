#SpriteKitEasingSwift

###Better Easing for SpriteKit! (Swift)

This is a port of the Objective C project SpriteKit-Easing

SpriteKit by default uses the easing curve built by Apple into iOS. While this is an awesome curve to use for UI and more traditional mobile apps game development demands more than 2 functions. The goal of this library is to port a set of standard easing functions into the SpriteKit framework as actions.

This port was created to be a 100% swift dynamic library, additionally extra care was taken to try to make the code readable and easy to understand. 

SpriteKitEasingSwift currently contains the these functions

Current functions:
* Linear 
* Quadratic 
* Cubic 
* Quartic 
* Quintic 
* Sine 
* Circular 
* Expo 
* Elastic 
* Back 
* Bounce 

##Usage
The library can directly interact with SKNodes or any Float or Point (for greater compatibility).

The SKAction easing extension functions generate an action that performs the ease. You can then use / control the action in the same manner you would for any other action in SpriteKit

```Swift
// Easing the position of a node to a point


// Create the SKNode
let node: SKNode = SKNode()
node.position = CGPointMake(0.0, 0.0)

//Add child to scene here
self.addChild(node)

if let action: SKAction = SKAction.moveNode(node, endPosition(CGVectorMake(100.0,100.0), curveType: CurveType.CurveTypeQuadratic, mode: EasingMode.EaseOut duration: 0.5) {
    
    node.runAction(action)

}



// The rest of the library follows this syntax with the exception of the Float and Point
// Those add a setter that can be used to update a variable of your choice as the action updates
```





