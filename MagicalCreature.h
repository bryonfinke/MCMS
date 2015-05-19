//
//  MagicalCreature.h
//  MCMS
//
//  Created by Bryon Finke on 5/19/15.
//  Copyright (c) 2015 Bryon Finke. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MagicalCreature : NSObject

@property NSString *name;
@property NSString *awesomeness;
@property UIImage *image;
@property NSMutableArray *accessories;

-(instancetype)initWithName: (NSString *)name andAwesomeness: (NSString *)stuff;


@end
