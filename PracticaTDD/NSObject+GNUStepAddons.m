//
//  NSObject+GNUStepAddons.m
//  PracticaTDD
//
//  Created by MacBook Pro on 12/2/16.
//  Copyright © 2016 weblogmerlos.com. All rights reserved.
//

#import "NSObject+GNUStepAddons.h"
#import <objc/runtime.h>


// Clase Abstracta en objectiveC mediante GNUStep.
@implementation NSObject (GNUStepAddons)

-(id) subclassResponsability: (SEL)aSel{
    
    char prefix = class_isMetaClass(object_getClass(self)) ? '+': '-';
    
    [NSException raise:NSInvalidArgumentException format:@"%@%c%@ should be overriden by its subclass",
     NSStringFromClass([self class]),
     prefix,
     NSStringFromSelector(aSel)];
    
    return  self;  // not reached
}
@end
