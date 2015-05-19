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
@property (weak, nonatomic) IBOutlet UILabel *creatureName;
@property (weak, nonatomic) IBOutlet UILabel *creatureDetail;
@property (weak, nonatomic) IBOutlet UIImageView *creatureImage;
@property (weak, nonatomic) IBOutlet UITableView *accessoriesTableView;

@end

@implementation CreatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.creatureName.text = self.creature.name;
    self.creatureDetail.text = self.creature.awesomeness;
    self.creatureImage.image = self.creature.image;
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
    self.creatureName.text = self.creature.name;
}
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.creature.accessories.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"accessoryID"];
    NSString *accessory = [self.creature.accessories objectAtIndex:indexPath.row];
    cell.textLabel.text = accessory;
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView cellForRowAtIndexPath:indexPath].textLabel.textColor = [UIColor greenColor];
    NSNumber* yesObj = [NSNumber numberWithBool:YES];
    [self.creature.accessoryStatues removeObjectAtIndex:indexPath];
    [self.creature.accessoryStatues insertObject:yesObj atIndex:indexPath];
}

@end
