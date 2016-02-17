//
//  MGCMoney.h
//  PracticaTDD
//
//  Created by MacBook Pro on 12/2/16.
//  Copyright © 2016 weblogmerlos.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MGCMoney : NSObject

@property (nonatomic, readonly) NSString *currency;

+(id) euroWithAmount:(NSInteger) amount;
+(id) dollarWithAmount:(NSInteger) amount;

-(id)initWithAmount:(NSInteger) amount
           currency:(NSString *)currency;

-(id)times:(NSInteger) multiplier;

-(MGCMoney *) plus:(MGCMoney *) other;

@end
