//
//  ViewController.m
//  Dolt
//
//  Created by Sonam Mehta on 1/13/14.
//  Copyright (c) 2014 Sonam Mehta. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
{
    
    __weak IBOutlet UITableView *myTableView;
    NSMutableArray *items;
    __weak IBOutlet UITextField *myTextField;
    BOOL editButtonState;
    __weak IBOutlet UIButton *editButton;
}

@end

@implementation ViewController

- (IBAction)onEditButtonPressed:(id)sender {
    
    if (editButtonState == YES) {
        [editButton setTitle:@"Done" forState:UIControlStateNormal];
        editButtonState = NO;
    } else {
        [editButton setTitle:@"Edit" forState:UIControlStateNormal];
        editButtonState = YES;
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	items = [NSMutableArray arrayWithObjects: @"One",@"Two",@"Three", nil];
    editButtonState = YES;
}

- (IBAction)onAddButtonPressed:(id)sender
{
    [items addObject:myTextField.text];
    [myTableView reloadData];
      myTextField.text = nil;
    
    
  
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myReuseIdentifier"];
    cell.textLabel.text = [NSString stringWithFormat:myTextField.text, indexPath.row];
    cell.textLabel.text = [items objectAtIndex:indexPath.row%items.count];
    
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.textLabel.textColor = [UIColor greenColor];
    if (editButtonState == NO) {
        [items removeObjectAtIndex:indexPath.row];
        [myTableView reloadData];
    }
    
}






@end
