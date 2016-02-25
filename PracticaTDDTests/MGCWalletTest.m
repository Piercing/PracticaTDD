//
//  MGCWalletTest.m
//  PracticaTDD
//
//  Created by MacBook Pro on 24/2/16.
//  Copyright © 2016 weblogmerlos.com. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MGCMoney.h"
#import "MGCBroker.h"
#import "MGCWallet.h"

@interface MGCWalletTest : XCTestCase

@end

@implementation MGCWalletTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

 // €40 + $20 = $100  tasa => 2:1
-(void) testAdditionWithReduction{
    
    MGCBroker *broker = [MGCBroker new];
    [broker addRate: 2 fromCurrency:@"EUR" toCurrency:@"USD"];
    
    MGCWallet *wallet = [[MGCWallet alloc] initWithAmount: 40 currency: @"EUR"];
    [wallet plus: [MGCMoney dollarWithAmount: 20]];
    
    MGCMoney *reduced = [broker reduce:wallet toCurrency:@"USD"];
    
    XCTAssertEqualObjects(reduced, [MGCMoney dollarWithAmount:100], @"€40 + $20 = $100 2:1");
    
}

@end
