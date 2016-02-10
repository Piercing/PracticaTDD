//
//  MGCEuroTest.m
//  PracticaTDD
//
//  Created by MacBook Pro on 10/2/16.
//  Copyright © 2016 weblogmerlos.com. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MGCEuro.h"

@interface MGCEuroTest : XCTestCase

@end

@implementation MGCEuroTest

-(void)testMultiplication{
    
    // Instancio un objeto de la clase que posteriormente crearé
    MGCEuro *euro = [[MGCEuro alloc ]initWithAmount:5];
    
    // A euro le mando el mensane 'times' que multiplicará por dos
    MGCEuro *total = [euro times:2];
    
    // Aplico la macro, compruebo que la cantidad (amount) de euros sea igual a 10.
    XCTAssertEqual(total.amount, 10, @"5*2 should be 10");
}

// Test de igualdad, es decir, me aseguro que, por ejemplo, 5€ = 5€ pase lo que pase.
-(void) testEquality{
    
    MGCEuro *five = [[MGCEuro alloc]initWithAmount:5];
    MGCEuro *ten = [[MGCEuro alloc]initWithAmount:10];
    
    // Me aseguro que el primero multiplicado
    // por  dos es  siempre  igual al segundo.
    MGCEuro *total = [five times:2];
    
    // Compruebo si el primero es igual al total (primero x segundo)
    XCTAssertEqualObjects(ten, total, @"Equivalent objects should be equal");
}





@end
