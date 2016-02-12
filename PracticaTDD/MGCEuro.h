//
//  PracticaTDD.h
//  PracticaTDD
//
//  Created by MacBook Pro on 10/2/16.
//  Copyright © 2016 weblogmerlos.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MGCMoney.h"

@interface MGCEuro : MGCMoney


-(MGCEuro *) times:(NSInteger)multiplier;

@end
