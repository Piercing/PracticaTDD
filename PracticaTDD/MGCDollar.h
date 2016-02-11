//
//  MGCDollar.h
//  PracticaTDD
//
//  Created by MacBook Pro on 11/2/16.
//  Copyright © 2016 weblogmerlos.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MGCDollar : NSObject

-(id)initWithAmount:(NSInteger) amount;
-(MGCDollar *) times:(NSInteger)multiplier;

@end
