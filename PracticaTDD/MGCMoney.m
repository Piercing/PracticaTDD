//
//  MGCMoney.m
//  PracticaTDD
//
//  Created by MacBook Pro on 12/2/16.
//  Copyright © 2016 weblogmerlos.com. All rights reserved.
//

#import "MGCMoney.h"
#import "NSObject+GNUStepAddons.h"
#import "MGCMoney-Private.h"

@implementation MGCMoney

-(id)initWithAmount:(NSInteger) amount{
    
    if(self = [super init]){
        // Con esto lo empaqueto dentro de un NSNumber ==> '@(amount)'
        _amount = @(amount);
    }
    return self;
}

-(MGCMoney *) times:(NSInteger)multiplier{
    // No se debe de llamar, sino que
    // debe de usar el de la subclase
    return [self subclassResponsability:_cmd];
}

// Sobreescribo  el   método   description
// para una salida con formato a lo humano.
#pragma mark - Overwritten
-(NSString *) description{
    
    return [NSString stringWithFormat:@"<%@ %ld>",
            [self class],(long)[self amount]];
}

// Sobreescribo el método 'isEqual:(id)object',ya que en el momento en el cual
// empiezo a crear objetos que puedan ser equivalentes tengo que implementarlo.
// Sino lo hago lo hará NSObject, y éste compara punteros, es decir, posicones
// de memoria, y si comparo dos objetos en un test sin implementar este método,
// siempre me va a devolver falso, ya que dichos objetos están en posciones distintas
// de memoria y son por tanto distintos objetos. Si lo implementamos, lo que hará, no
// es comparar las posciones de memoria de los objetos, sino comparar si esos objetos
// son del mismo tipo.
-(BOOL)isEqual:(id)object{
    // Hago la comparación más sencilla posible para
    // pasar  el test, si  amount  es igual a amount,
    // es decir, comparar la cantidad.
    return [self amount] == [object amount];
}

// Sobreescribo  aquí el método 'Hash' ya  que sino en los test llamará al
// de la superclase y lo que quiero es que llame a éste que es su subclase
-(NSUInteger) hash{
    
    // Lo  más  sencillo de implementar  aquí para que se
    // cumpla que dos ojetos iguales tengan el mismo hash
    // es decirle que es un entero largo sin signo (NSUInteger).
    return (NSUInteger) self.amount;
}

@end
