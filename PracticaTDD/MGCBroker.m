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
@property(nonatomic, strong) NSMutableDictionary *rates;
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

// Método cutre para devolver divisas
-(MGCMoney *)reduce:(MGCMoney *) money
         toCurrency:(NSString *) currency{
    
    return money;
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
}


#pragma mark -utils
-(NSString *) keyFromCurrency:(NSString *) fromCurrency
                   toCurrency:(NSString *) toCurrency{
    
    // Devuelve una cadena
    return [NSString stringWithFormat:@"%@-%@", fromCurrency, toCurrency];
    
}










@end
