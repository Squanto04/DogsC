//
//  JLSubBreedsTableViewController.m
//  Dogs-C
//
//  Created by Jordan Lamb on 10/9/19.
//  Copyright © 2019 Squanto Inc. All rights reserved.
//

#import "JLSubBreedsTableViewController.h"
#import "JLBreedController.h"
#import "JLImageCollectionViewController.h"

@interface JLSubBreedsTableViewController ()

@end

@implementation JLSubBreedsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = [self.breed.name capitalizedString];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.breed.subBreeds count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"subBreedCell" forIndexPath:indexPath];
    cell.textLabel.text = [[self.breed.subBreeds[indexPath.row] name] capitalizedString];
    return cell;
}

- (void) setBreed:(JLBreed *)breed
{
    if (breed != _breed){
        _breed = breed;
        [self.tableView reloadData];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"toImagesVCFromSubBreed" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    JLSubBreed *subBreed = self.breed.subBreeds[[[[self tableView] indexPathForSelectedRow] row]];
    if([segue.identifier  isEqualToString: @"toImagesVCFromSubBreed"])
    {
        JLImageCollectionViewController *destinationVC = segue.destinationViewController;
        destinationVC.subBreed = subBreed;
        destinationVC.breed = self.breed;
    }
}

@end
