//
//  MGCBroker.h
//  PracticaTDD
//
//  Created by MacBook Pro on 18/2/16.
//  Copyright © 2016 weblogmerlos.com. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MGCMoney;
@interface MGCBroker : NSObject

-(MGCMoney *)reduce:(MGCMoney *) money
         toCurrency:(NSString *) currency;

-(void)addRate:(NSInteger)rate
  fromCurrency:(NSString *) fromCurrency
    toCurrency:(NSString *)toCurrency;
@end
