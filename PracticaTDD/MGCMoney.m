//
//  MGCMoney.m
//  PracticaTDD
//
//  Created by MacBook Pro on 12/2/16.
//  Copyright © 2016 weblogmerlos.com. All rights reserved.
//

#import "MGCMoney.h"
#import "NSObject+GNUStepAddons.h"



@interface MGCMoney ()
@property(nonatomic, strong) NSNumber *amount;
@end

@implementation MGCMoney

#pragma Mark - Class Methods
// Apartir de  ahora  creo  instancias  de  dollar
// y  euro  con  estos   dos   métodos  de   clase
// eliminando así los inicalizadores de sus clases
+(id) euroWithAmount:(NSInteger) amount{
    
    return [[MGCMoney alloc]initWithAmount:amount currency:@"EUR"];
}
+(id) dollarWithAmount:(NSInteger) amount{
    
    return [[MGCMoney alloc]initWithAmount:amount currency:@"USD"];
}

#pragma Mark - Init Methods
-(id)initWithAmount:(NSInteger) amount currency:(NSString *)currency{
    
    if(self = [super init]){
        // Con esto lo empaqueto dentro de un NSNumber ==> '@(amount)'
        _amount = @(amount);
        _currency = currency;
    }
    return self;
}

-(id<MGCMoney>) times:(NSInteger)multiplier{
    
    // Nueva instancia
    MGCMoney *newMoney = [[MGCMoney alloc]
                          initWithAmount:[self.amount integerValue] * multiplier
                          currency:self.currency];
    return  newMoney;
    
}

-(id<MGCMoney>) plus:(MGCMoney *) other{
    
    NSInteger totalAmount = [self.amount integerValue] + [other.amount integerValue];
    
    MGCMoney *total = [[MGCMoney alloc]initWithAmount:totalAmount currency:self.currency];
    
    return total;
}

// Sobreescribo  el   método   description
// para una salida con formato a lo humano.
#pragma mark - Overwritten
-(NSString *) description{
    
    return [NSString stringWithFormat:@"<%@: %@ %@>",
            [self class],self.currency, self.amount];
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
    
    // Compruebo  primero  que  tienen  la misma  divisa
    if ([self.currency isEqual:[object currency]]) {
        // Hago la comparación más sencilla posible para
        // pasar  el test, si  amount  es igual a amount,
        // es decir, comparar la cantidad.
        return [self amount] == [object amount];
    }else{
        return NO;
    }
    
}

// Sobreescribo  aquí el método 'Hash' ya  que sino en los test llamará al
// de la superclase y lo que quiero es que llame a éste que es su subclase
-(NSUInteger) hash{                // el 'hash' es lo mismo que el 'amount'
    
    // Lo  más  sencillo de implementar  aquí para que se
    // cumpla que dos ojetos iguales tengan el mismo hash
    // es  decirle que extraiga de amount su valor entero.
    return [self.amount integerValue];
}

@end
