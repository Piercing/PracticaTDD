//
//  MGCBrokerTest.m
//  PracticaTDD
//
//  Created by MacBook Pro on 18/2/16.
//  Copyright © 2016 weblogmerlos.com. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MGCMoney.h"
#import "MGCBroker.h"

@interface MGCBrokerTest : XCTestCase

@end

@implementation MGCBrokerTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

// Test para la conversión de dolares a euros en una tasa de 2 a 1
-(void) testSimpleReduction{
    
    MGCBroker *broker = [[MGCBroker alloc ]init];
    
    // Creo una suma de dos cantidades de dolares
    MGCMoney *sum = [[MGCMoney dollarWithAmount:5]plus:[MGCMoney dollarWithAmount:5]];
    
    // Objeto que reducirá o convertira a dolares
    MGCMoney *reduced = [broker reduce: sum toCurrency: @"USD"];
    
    // Compruebo la coversión o reducción más simple posible, covierto dolare en dolares
    // es decir, si cojo 10 y los convierto a dolares que siga siendo lo mismo.
    XCTAssertEqualObjects(sum, reduced, @"Conversion to same currency should be a NOP");
}

// Test para comprobar que: $10 = €5 => 2:1
-(void) testReduction{
    
    MGCBroker *broker = [MGCBroker new];
    // El borker necesita saber las tasas de conversión, se las decimos
    [broker addRate: 2 fromCurrency:@"USD" toCurrency:@"EUR"];
    
    MGCMoney *dollars = [MGCMoney dollarWithAmount:10];
    MGCMoney *euros = [MGCMoney euroWithAmount:5];
    
    MGCMoney *converted = [broker reduce:dollars
                              toCurrency:@"EUR"];
    
    // Compruebo que son iguales
    XCTAssertEqualObjects(converted, euros, @"$10 = €5 => 2:1");
    
}













@end
