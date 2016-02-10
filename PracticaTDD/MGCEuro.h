//
//  PracticaTDD.h
//  PracticaTDD
//
//  Created by MacBook Pro on 10/2/16.
//  Copyright © 2016 weblogmerlos.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MGCEuro : NSObject
@property(nonatomic,readonly) NSInteger amount;

-(id)initWithAmount:(NSInteger) amount;
-(MGCEuro *) times:(NSInteger)multiplier;
@end
