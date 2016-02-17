//
//  MGCMoneyTest.m
//  PracticaTDD
//
//  Created by MacBook Pro on 12/2/16.
//  Copyright © 2016 weblogmerlos.com. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MGCMoney.h"

@interface MGCMoneyTest : XCTestCase

@end

@implementation MGCMoneyTest

-(void) testCurrencies{
    
    XCTAssertEqualObjects(@"EUR", [[MGCMoney euroWithAmount:1] currency], @"The currency of euros should be EUR");
    
    XCTAssertEqualObjects(@"USD", [[MGCMoney dollarWithAmount:1] currency], @"The currency of $1 should be USD");
}

-(void)testMultiplication{
    
    // Instancio un objeto de la clase que posteriormente crearé
    // Ahora lo instancio con el inicializador de la clase padre
    MGCMoney *euro = [MGCMoney euroWithAmount:5];
    MGCMoney *ten = [MGCMoney euroWithAmount:10];
    // A euro le mando el mensaje 'times' que multiplicará por dos
    MGCMoney *total = [euro times:2];
    
    XCTAssertEqualObjects(total, ten, @"€5 * 2 should be €10");
}

// Test de igualdad, es decir, me aseguro que, por ejemplo, 5€ = 5€ pase lo que pase.
-(void) testEquality{
    
    MGCMoney *five = [MGCMoney euroWithAmount:5];
    MGCMoney *ten = [MGCMoney euroWithAmount:10];
    
    // Me aseguro que el primero multiplicado
    // por  dos es  siempre  igual al segundo.
    MGCMoney *total = [five times:2];
    
    // Compruebo  si el  primer  objeto, 'ten', es  igual  al objeto 'total'.
    // Para ello tengo que  sobreescribir el método 'isEqual' en 'MGCMoney.m'
    // de mi modelo que tendrá efecto sobre éste  ==> 'XCTAssertEqualObjects'
    XCTAssertEqualObjects(ten, total, @"Equivalent objects should be equal!");
    XCTAssertEqualObjects([MGCMoney dollarWithAmount:4],
                          [[MGCMoney dollarWithAmount:2] times:2],
                          @"Equivalent objets should be equal!");
}

-(void) testDifferentCurrenies{
    
    // Test para comprobar que 1$ != 1€
    MGCMoney *euro = [[MGCMoney alloc]initWithAmount:1 currency:@"EUR"];
    MGCMoney *dollar = [[MGCMoney alloc]initWithAmount:1 currency:@"USD"];
    
    XCTAssertNotEqualObjects(euro, dollar, @"Different curriecies should not be equal!");
}

-(void) testHash{
    
    MGCMoney *a = [MGCMoney euroWithAmount:2];
    MGCMoney *b = [MGCMoney euroWithAmount:2];
    // El hash lo que devuelve es un entero largo sin signo,
    // no es un  objeto por tanto  uso la  de Equal a secas.
    
    XCTAssertEqual([a hash], [b hash], @"Equal objects must have same hash");
    XCTAssertEqual([[MGCMoney dollarWithAmount:1]hash],
                   [[MGCMoney dollarWithAmount:1]hash],
                   @"Equal objects must have same hash");
    
}

// Compruebo que guardar cosas en 'amount' funciona
-(void)testAmountStorage{
    
    MGCMoney *euro = [MGCMoney euroWithAmount:2];
    
    // Con esto hago que el warnig de '@selector' se me tranquilice el muchacho
#pragma clang diagnostic push// 'push' mete directivas al compilador para que ignore warnings
#pragma clang diagnostic ignored "-Wundeclared-selector"
    // Envío este mensaje para poder acceder a la interfaz privada donde se encuetra
    // 'amount' que  es  la  categoría  creada  anteriormente ==>'MGCMoney-Private.h'
    // ==>[euro performSelector:<#(SEL)#>];
    // Me aseguro de que cuando recupere amount va a ser 2
    XCTAssertEqual(2, [[euro performSelector:@selector(amount)]integerValue],
                   @"The values retrived should be the same as the stored");
    XCTAssertEqual(2, [[[MGCMoney dollarWithAmount:2] performSelector:@selector(amount)]integerValue],
                   @"The values retrived should be the same as the stored");
    
#pragma clang diagnostic pop// con 'pop' lo saco
}

-(void) testSimpleAddition{

    // Añadiendo una cantidad, plus, a x dolares
    // y  compruebo  que  sean  objetos  iguales
    XCTAssertEqualObjects([[MGCMoney dollarWithAmount:5] plus:
                           [MGCMoney dollarWithAmount:5]],
                           [MGCMoney dollarWithAmount:10],
                           @"$5 + $5 =$10");
}













@end
