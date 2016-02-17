//
//  MGCMoney.h
//  PracticaTDD
//
//  Created by MacBook Pro on 12/2/16.
//  Copyright © 2016 weblogmerlos.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MGCMoney : NSObject

+(id) euroWithAmount:(NSInteger) amount;
+(id) dollarWithAmount:(NSInteger) amount;

-(id)initWithAmount:(NSInteger) amount;

-(id)times:(NSInteger) multiplier;

@end
