//
//  MGCMoneyTest.m
//  PracticaTDD
//
//  Created by MacBook Pro on 12/2/16.
//  Copyright © 2016 weblogmerlos.com. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MGCMoney.h"

@interface MGCMoneyTest : XCTestCase

@end

@implementation MGCMoneyTest

-(void) testThatTimesRaisesException{
    
    MGCMoney *money = [[MGCMoney alloc ]initWithAmount:1];
    // Cuando  mando  el  mensaje  'times' a  una  instancia  de  money  me
    // avisa que este  método tiene que ser  implemtentado por la  subclase
    // Con esto consigo marcar que ciertos métodos no se deben  de ejecutar
    // en la superclase sino en las  subclases, ya que 'times' lo he imple-
    // mentado en la superclase y se debe de sobreescribir en las subclases
    XCTAssertThrows([money times :2], @"Should raise an exception");
}

@end
