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

// Método para devolver divisas, reduce 'x'
// dinero al tipo de moneda que le pasamos
-(MGCMoney *)reduce:(MGCMoney *) money
         toCurrency:(NSString *) currency{
    
    MGCMoney *result;
    double rate = [[self.rates
                       objectForKey:[self keyFromCurrency:money.currency
                                               toCurrency:currency]]doubleValue];
    
    // compruebo que divisa de origen y destino son las mismas
    if ([money.currency isEqual:currency]) {
        result = money;
    }else if (rate == 0){
        // No hay tasa de conversión, excepción que te al canto
        [NSException raise:@"NoConversionRateException"
                    format:@"Must have a conversion from %@ to %@", money.currency, currency];
    }else{
        // Tengo conversión
        double rate = [[self.rates objectForKey:[self keyFromCurrency:money.currency
                                                              toCurrency:currency]] doubleValue];
        
        NSInteger newAmount = [money.amount integerValue] * rate;
        
        result = [[MGCMoney alloc]
                              initWithAmount:newAmount
                              currency:currency];
        
    }
    return result;
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
