//
//  MGCMoney.m
//  PracticaTDD
//
//  Created by MacBook Pro on 12/2/16.
//  Copyright © 2016 weblogmerlos.com. All rights reserved.
//

#import "MGCMoney.h"
@interface MGCMoney ()
@property(nonatomic) NSInteger amount;
@end
@implementation MGCMoney



-(id)initWithAmount:(NSInteger) amount{
    
    if(self = [super init]){
        
        _amount = amount;
    }
    return self;
}
// Con este método me aseguro que MGCEuro sea inmutable
-(MGCMoney *) times:(NSInteger)multiplier{
    // No se debe de llamar, sino que
    // debe de usar el de la  subclase
    return self;
}

@end
