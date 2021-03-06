//
//  MGCWallet.m
//  PracticaTDD
//
//  Created by MacBook Pro on 24/2/16.
//  Copyright © 2016 weblogmerlos.com. All rights reserved.
//

#import "MGCWallet.h"

@interface MGCWallet ()
@property(nonatomic, strong)NSMutableArray *moneys;
@end

@implementation MGCWallet

-(id) initWithAmount:(NSInteger)amount currency:(NSString *)currency{
    
    if (self = [super init]){
        MGCMoney *money = [[MGCMoney alloc]initWithAmount:amount
                                                 currency:currency];
        
        _moneys = [NSMutableArray array];
        [_moneys addObject:money];
    }
    return  self;
}

-(id<MGCMoney>) plus:(MGCMoney *)money{
    // Para sumar un nuevo billete lo meto en el array
    [self.moneys addObject: money];
    // Me  devuelvo a mi mismo, ya  con la  suma hecha.
    return self;
}

-(id<MGCMoney>) times:(NSInteger)multiplier{
    
    // Para  multiplicar  un 'wallet' por  dos  recorro
    // el  array  y  cada  de  sus   objetos   entiende
    // el  mensaje  'times',  pues   le  mando  a  cada
    // uno  el  'times', me   devuelve  un  nuevo valor
    // y lo voy  metiendo en un  nuevo  array obtniendo
    // así un nuevo array con los valores multiplicados
    NSMutableArray *newMoneys = [NSMutableArray arrayWithCapacity:self.moneys.count];
    
    for (MGCMoney *each in self.moneys) {
        MGCMoney *newMoney = [each times:multiplier];
        [newMoneys addObject: newMoney];
    }
    self.moneys = newMoneys;
    return self;
}

-(id<MGCMoney>) reduceToCurrency:(NSString *) currency
                      withBroker:(MGCBroker *) broker{
    // Recorro  el  array y a cada uno de ellos le mando
    // este  mensaje. Me  va  a  devolver  un 'money' ya
    // convertido,  y  los   voy  sumando   simplementes.
    // Se lo mando a cada uno de los elementos del array
    // de 'money' que tengo.
    
    MGCMoney *result = [[MGCMoney alloc] initWithAmount:0 currency:currency];
    
    for (MGCMoney *each in self.moneys) {
        result = [result plus:[each reduceToCurrency:currency withBroker:broker]];
    }
    return result;
}










@end
