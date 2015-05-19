//
//  MagicalCreature.m
//  MCMS
//
//  Created by Bryon Finke on 5/19/15.
//  Copyright (c) 2015 Bryon Finke. All rights reserved.
//

#import "MagicalCreature.h"

@implementation MagicalCreature

-(instancetype)initWithName: (NSString *)name andAwesomeness: (NSString *)stuff;
{
    self = [super init];
    if (self) {
        self.name = name;
        self.awesomeness = stuff;
    }
    return self;
}

@end
