//
//  MGCDollar.m
//  PracticaTDD
//
//  Created by MacBook Pro on 11/2/16.
//  Copyright © 2016 weblogmerlos.com. All rights reserved.
//

#import "MGCDollar.h"

@interface MGCDollar()
// Oculto la propiedad amount, la elimino del punto h
@property(nonatomic) NSInteger amount;
@end

@implementation MGCDollar

-(id)initWithAmount:(NSInteger) amount{
    
    if(self = [super init]){
        
        _amount = amount;
    }
    return self;
}
// Con este método me aseguro que MGCEuro sea inmutable
-(MGCDollar *) times:(NSInteger)multiplier{
    // Nueva instancia
    MGCDollar *newDollar = [[MGCDollar alloc]
                            initWithAmount:self.amount * multiplier];
    return  newDollar;
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

@end
