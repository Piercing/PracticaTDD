//
//  MGCDolarTest.m
//  PracticaTDD
//
//  Created by MacBook Pro on 11/2/16.
//  Copyright © 2016 weblogmerlos.com. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MGCDollar.h"

@interface MGCDollarTest : XCTestCase

@end

@implementation MGCDollarTest

-(void) testMultiplication{
    
    MGCDollar *five = [[MGCDollar alloc ]initWithAmount: 5];
    MGCDollar *total = [five times:2]; // = 10
    MGCDollar *ten = [[MGCDollar alloc ]initWithAmount: 10];
    
    // Compruebo que pasa el test de multiplicación.
    // Compruebo  que el total, que  debe de  valer
    // $5 * 2 = $10, es igual  a 'ten' que vale $10
    XCTAssertEqualObjects(ten, total, @"$5 * 2 = $10");
}

// Compruebo también con un test la igualdad
-(void) testEquality{
    
    MGCDollar *five = [[MGCDollar alloc ]initWithAmount: 5];
    MGCDollar *total = [five times:2]; // = 10
    MGCDollar *ten = [[MGCDollar alloc ]initWithAmount: 10];
    
    // Compruebo  que  dos  objetos creados de  forma  distinta  pero
    // equivalentes son iguales, es decir, son objetos del mismo tipo
    XCTAssertEqualObjects(ten, total, @"Equivalent objects should be equals");
    
    // Compruebo si no son iguales => False
    XCTAssertFalse([total isEqual:five], @"Non equivalent objects should not be equal");
}

@end
