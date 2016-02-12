//
//  PracticaTDD.m
//  PracticaTDD
//
//  Created by MacBook Pro on 10/2/16.
//  Copyright © 2016 weblogmerlos.com. All rights reserved.
//

#import "MGCEuro.h"

@interface MGCEuro()
// Oculto la propiedad amount, la elimino del punto h
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
    // Nueva instancia
    MGCEuro *newEuro = [[MGCEuro alloc]initWithAmount:self.amount * multiplier];
    return  newEuro;
}

#pragma mark - Overwritten
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
