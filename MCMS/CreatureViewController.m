//
//  CreatureViewController.m
//  MCMS
//
//  Created by Brittany Kimbrough on 5/19/15.
//  Copyright (c) 2015 Bryon Finke. All rights reserved.
//

#import "CreatureViewController.h"
#import "MagicalCreature.h"

@interface CreatureViewController ()

@property BOOL edit;
@property (weak, nonatomic) IBOutlet UITextField *editNameInput;
@property (weak, nonatomic) IBOutlet UIButton *updateCreature;

@end

@implementation CreatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.editNameInput setHidden:YES];
    [self.updateCreature setHidden:YES];
}
- (IBAction)editButtonClicked:(UIBarButtonItem *)sender {
    [self.editNameInput setHidden:NO];
    [self.updateCreature setHidden:NO];
    if ([sender.title isEqualToString:@"Edit"]) {
        sender.title = @"Done";
        self.edit = YES;
        [self.editNameInput setHidden:NO];
        [self.updateCreature setHidden:NO];
    } else {
        sender.title = @"Edit";
        self.edit = NO;
        [self.editNameInput setHidden:YES];
        [self.updateCreature setHidden:YES];
    }
}
- (IBAction)updateCreature:(id)sender {
    self.creature.name = self.editNameInput.text;
    self.title = self.creature.name;
}

@end
