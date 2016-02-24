//
//  MGCMoney.h
//  PracticaTDD
//
//  Created by MacBook Pro on 12/2/16.
//  Copyright © 2016 weblogmerlos.com. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MGCMoney;
@class MGCBroker;

@protocol MGCMoney <NSObject>

-(id)initWithAmount:(NSInteger) amount
           currency:(NSString *)currency;

// Times devuelve un objeto que implementa
// el protocolo 'MGCMoney'
-(id<MGCMoney>) times:(NSInteger) multiplier;

-(id<MGCMoney>) plus:(MGCMoney *) other;

-(id<MGCMoney>) reduceToCurrency:(NSString *) currency withBroker:(MGCBroker *) broker;

@end
@interface MGCMoney : NSObject<MGCMoney>

@property (nonatomic, strong, readonly) NSNumber *amount;
@property (nonatomic, readonly) NSString *currency;

+(id) euroWithAmount:(NSInteger) amount;
+(id) dollarWithAmount:(NSInteger) amount;


@end
