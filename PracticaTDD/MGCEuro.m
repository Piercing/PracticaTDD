//
//  PracticaTDD.m
//  PracticaTDD
//
//  Created by MacBook Pro on 10/2/16.
//  Copyright © 2016 weblogmerlos.com. All rights reserved.
//

#import "MGCEuro.h"
#import "MGCMoney-Private.h"
@implementation MGCEuro

// Con este método me aseguro que MGCEuro sea inmutable
-(MGCEuro *) times:(NSInteger)multiplier{
    // Nueva instancia
    MGCEuro *newEuro = [[MGCEuro alloc]initWithAmount:[self.amount integerValue] * multiplier];
    return  newEuro;
}


@end
