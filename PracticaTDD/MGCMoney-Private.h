//
//  MGCMoney-Private.h
//  PracticaTDD
//
//  Created by MacBook Pro on 12/2/16.
//  Copyright © 2016 weblogmerlos.com. All rights reserved.
//

// Header privado, para semiocultar propiedades
// Creo la property 'amount' para la superclase y sus subclases
#import <Foundation/Foundation.h>
#import "MGCMoney.h"

@interface MGCMoney ()
@property(nonatomic, strong) NSNumber *amount;
@end