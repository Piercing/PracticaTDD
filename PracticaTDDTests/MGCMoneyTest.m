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

-(void) testCurrencies{
    
    XCTAssertEqualObjects(@"EUR", [[MGCMoney euroWithAmount:1] currency], @"The currency of euros should be EUR");
    
    XCTAssertEqualObjects(@"USD", [[MGCMoney dollarWithAmount:1] currency], @"The currency of $1 should be USD");
}


@end
