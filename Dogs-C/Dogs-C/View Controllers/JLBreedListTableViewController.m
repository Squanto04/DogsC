//
//  JLBreedListTableViewController.m
//  Dogs-C
//
//  Created by Jordan Lamb on 10/9/19.
//  Copyright © 2019 Squanto Inc. All rights reserved.
//

#import "JLBreedListTableViewController.h"
#import "JLBreedController.h"
#import "JLSubBreedsTableViewController.h"
#import "JLImageCollectionViewController.h"

@interface JLBreedListTableViewController ()

@property (nonatomic, copy) NSArray *breeds;

@end

@implementation JLBreedListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[JLBreedController sharedInstance] fetchBreeds:^(NSArray *breeds) {
        self.breeds = breeds;
        dispatch_async(dispatch_get_main_queue(), ^{
            [[self tableView] reloadData];
        });
    }];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.breeds.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"breedCell" forIndexPath:indexPath];
    cell.textLabel.text = [[self.breeds[indexPath.row] name] capitalizedString];;
    return cell;
}


#pragma mark - Navigation

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    JLBreed *breed = self.breeds[[[[self tableView] indexPathForSelectedRow] row]];
    if( [breed.subBreeds count] > 0)
    {
        [self performSegueWithIdentifier:@"toSubBreedVC" sender:self];
    } else {
        [self performSegueWithIdentifier:@"toImagesVC" sender:self];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    JLBreed * breed = self.breeds[[[[self tableView] indexPathForSelectedRow] row]];
    if([segue.identifier  isEqualToString: @"toSubBreedVC"])
    {
        //If it's to the SubBreedTableViewController. Send the breed to that landing pad.
        JLSubBreedsTableViewController *destinationVC = segue.destinationViewController;
        destinationVC.breed = breed;
        
    }else if([segue.identifier  isEqualToString: @"toImagesVC"]){
        JLImageCollectionViewController *destinationVC = segue.destinationViewController;
        destinationVC.breed = breed;
    }
}

@end
