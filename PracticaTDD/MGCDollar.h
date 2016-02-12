//
//  MGCDollar.h
//  PracticaTDD
//
//  Created by MacBook Pro on 11/2/16.
//  Copyright © 2016 weblogmerlos.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MGCMoney.h"

@interface MGCDollar : MGCMoney

-(MGCDollar *) times:(NSInteger)multiplier;

@end
