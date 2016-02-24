//
//  MGCBroker.m
//  PracticaTDD
//
//  Created by MacBook Pro on 18/2/16.
//  Copyright © 2016 weblogmerlos.com. All rights reserved.
//

#import "MGCBroker.h"
#import "MGCMoney.h"


@interface MGCBroker ()
@end

@implementation MGCBroker

// Tengo que inicializar el diccionario rates,
// para ello sobreescribo el init de NSObject

-(id)init{
    if (self = [super init]){
        _rates = [@{}mutableCopy];
    }
    return self;
}

// Método para devolver divisas, reduce 'x'
// dinero al tipo de moneda que le pasamos
-(id<MGCMoney>)reduce:(id<MGCMoney>) money
         toCurrency:(NSString *) currency{
    
    // double dispatch, va y vuelve la info
    return [money reduceToCurrency:currency
                        withBroker:self];
    

}

-(void)addRate:(NSInteger) rate
  fromCurrency:(NSString *) fromCurrency
    toCurrency:(NSString *) toCurrency{
    
    // Creo un diccionario para ir guardando
    // A  rates le  añado  un objeto, convierto 'rate' de 'NSInteger' a 'NSNumber' empaquetándolo  con '@(rate)'
    // La clave tiene que ser una cadena que indique de que divisa a que divisa vamos, creo un método para ello
    [self.rates setObject:@(rate)
                   forKey:[self keyFromCurrency:fromCurrency
                                     toCurrency:toCurrency]];
    
    NSNumber *invRate = @(1.0/rate);
    [self.rates setObject: invRate
                   forKey:[self keyFromCurrency:toCurrency
                                     toCurrency:fromCurrency]];
}


#pragma mark -utils
-(NSString *) keyFromCurrency:(NSString *) fromCurrency
                   toCurrency:(NSString *) toCurrency{
    
    // Devuelve una cadena
    return [NSString stringWithFormat:@"%@-%@", fromCurrency, toCurrency];
    
}










@end
