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

    self.creatures = [NSMutableArray arrayWithObjects:creature1, creature2, creature3, nil];
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
    vc.title = creature.name;
}

@end
