//
//  MGCDollar.m
//  PracticaTDD
//
//  Created by MacBook Pro on 11/2/16.
//  Copyright © 2016 weblogmerlos.com. All rights reserved.
//

#import "MGCDollar.h"
#import "MGCMoney-Private.h"

@implementation MGCDollar

// Con este método me aseguro que MGCEuro sea inmutable
-(MGCDollar *) times:(NSInteger)multiplier{
    // Nueva instancia
    MGCDollar *newDollar = [[MGCDollar alloc]
                            initWithAmount:[self.amount integerValue] * multiplier];
    return  newDollar;
}

#pragma mark - Overwritten









@end
