//
//  ViewController.m
//  MCMS
//
//  Created by Bryon Finke on 5/19/15.
//  Copyright (c) 2015 Bryon Finke. All rights reserved.
//

#import "ViewController.h"
#import "MagicalCreature.h"
#import "CreatureViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameInput;
@property (weak, nonatomic) IBOutlet UITableView *creaturesTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MagicalCreature *creature1 = [[MagicalCreature alloc]init];
    MagicalCreature *creature2 = [[MagicalCreature alloc]init];
    MagicalCreature *creature3 = [[MagicalCreature alloc]init];

    creature1.name = @"Smaug";
    creature2.name = @"Trogdor";
    creature3.name = @"Falcor";

    creature1.awesomeness = @"This is creature 1";
    creature2.awesomeness = @"This is creature 2";
    creature3.awesomeness = @"This is creature 3";

    NSNumber* noObj = [NSNumber numberWithBool:NO];
    creature1.accessories = [NSMutableArray arrayWithObjects:@"sword", @"mace", nil];
    creature1.accessories = [NSMutableArray arrayWithObjects:noObj, noObj, nil];
    creature2.accessories = [NSMutableArray arrayWithObjects:@"knife", @"cannon", nil];
    creature2.accessories = [NSMutableArray arrayWithObjects:noObj, noObj, nil];
    creature3.accessories = [NSMutableArray arrayWithObjects:@"nunchucks", @"sheild", nil];
    creature3.accessories = [NSMutableArray arrayWithObjects:noObj, noObj, nil];

    creature1.image = [UIImage imageNamed:@"creature_1"];
    creature2.image = [UIImage imageNamed:@"creature_2"];
    creature3.image = [UIImage imageNamed:@"creature_3"];

    self.creatures = [NSMutableArray arrayWithObjects:creature1, creature2, creature3, nil];
}

- (void)viewDidAppear:(BOOL)animated {
    [self.creaturesTableView reloadData];
}

- (IBAction)addCreature:(id)sender {
    MagicalCreature *creature = [[MagicalCreature alloc]init];
    creature.name = self.nameInput.text;
    [self.creatures addObject:creature];
    [self.creaturesTableView reloadData];
    self.nameInput.text = @"";
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.creatures.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"creatureID"];
    MagicalCreature *creature = [self.creatures objectAtIndex:indexPath.row];
    cell.textLabel.text = creature.name;
    return cell;
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSIndexPath *indexPath = [self.creaturesTableView indexPathForCell:sender];
    MagicalCreature *creature = [self.creatures objectAtIndex:indexPath.row];
    CreatureViewController *vc = segue.destinationViewController;
    vc.creature = creature;
}

@end
