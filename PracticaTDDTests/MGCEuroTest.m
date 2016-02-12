//
//  MGCEuroTest.m
//  PracticaTDD
//
//  Created by MacBook Pro on 10/2/16.
//  Copyright © 2016 weblogmerlos.com. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MGCEuro.h"

@interface MGCEuroTest : XCTestCase

@end

@implementation MGCEuroTest

-(void)testMultiplication{
    
    // Instancio un objeto de la clase que posteriormente crearé
    MGCEuro *euro = [[MGCEuro alloc ]initWithAmount:5];
    MGCEuro *ten = [[MGCEuro alloc]initWithAmount:10];
    // A euro le mando el mensaje 'times' que multiplicará por dos
    MGCEuro *total = [euro times:2];
    
    XCTAssertEqualObjects(total, ten, @"€5 * 2 should be €10");
}

// Test de igualdad, es decir, me aseguro que, por ejemplo, 5€ = 5€ pase lo que pase.
-(void) testEquality{
    
    MGCEuro *five = [[MGCEuro alloc]initWithAmount:5];
    MGCEuro *ten = [[MGCEuro alloc]initWithAmount:10];
    
    // Me aseguro que el primero multiplicado
    // por  dos es  siempre  igual al segundo.
    MGCEuro *total = [five times:2];
    
    // Compruebo  si el  primer  objeto, 'ten', es  igual  al objeto 'total'.
    // Para  ello tengo que  sobreescribir el método 'isEqual' en 'MGCEuro.m'
    // de mi modelo que tendrá efecto sobre éste  ==> 'XCTAssertEqualObjects'
    XCTAssertEqualObjects(ten, total, @"Equivalent objects should be equal!");
}

-(void) testHash{
    
    MGCEuro *a = [[MGCEuro alloc]initWithAmount:2];
    MGCEuro *b = [[MGCEuro alloc]initWithAmount:2];
    // El hash lo que devuelve es un entero largo sin signo,
    // no es un  objeto por tanto  uso la  de Equal a secas.
    
    XCTAssertEqual([a hash], [b hash], @"Equal objects must have same hash");

}

// Compruebo que guardar cosas en 'amount' funciona
-(void)testAmountStorage{
    
    MGCEuro *euro = [[MGCEuro alloc]initWithAmount:2];

// Con esto hago que el warnig de '@selector' se me tranquilice el muchacho
#pragma clang diagnostic push// 'push' mete directivas al compilador para que ignore warnings
#pragma clang diagnostic ignored "-Wundeclared-selector"
    // Envío este mensaje para poder acceder a la interfaz privada donde se encuetra
    // 'amount' que  es  la  categoría  creada  anteriormente ==>'MGCMoney-Private.h'
    // ==>[euro performSelector:<#(SEL)#>];
    // Me aseguro de que cuando recupere amount va a ser 2
    XCTAssertEqual(2, [[euro performSelector:@selector(amount)]integerValue], @"The values retrived should be the same as the stored");
#pragma clang diagnostic pop// con 'pop' lo saco
}















@end
