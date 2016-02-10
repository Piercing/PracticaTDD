//
//  PracticaTDD.m
//  PracticaTDD
//
//  Created by MacBook Pro on 10/2/16.
//  Copyright © 2016 weblogmerlos.com. All rights reserved.
//

#import "MGCEuro.h"

@interface MGCEuro()
@property(nonatomic) NSInteger amount;
@end

@implementation MGCEuro

-(id)initWithAmount:(NSInteger) amount{
    
    if(self = [super init]){
        
        _amount = amount;
    }
    return self;
}

// Con este método me aseguro que MGCEuro sea inmutable
-(MGCEuro *) times:(NSInteger)multiplier{
    // Nueva instancia, y oculto 'amount'
    MGCEuro *newEuro = [[MGCEuro alloc]initWithAmount:self.amount * multiplier];
    return  newEuro;
}
@end
