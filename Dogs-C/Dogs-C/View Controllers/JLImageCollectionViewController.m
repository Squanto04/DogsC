//
//  JLImageCollectionViewController.m
//  Dogs-C
//
//  Created by Jordan Lamb on 10/9/19.
//  Copyright © 2019 Squanto Inc. All rights reserved.
//

#import "JLImageCollectionViewController.h"

@interface JLImageCollectionViewController ()

@end

@implementation JLImageCollectionViewController

static NSString * const reuseIdentifier = @"imageCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.breed.name.capitalizedString;
    if(self.subBreed){
        NSString *title = [[self.subBreed.name.capitalizedString stringByAppendingString:@" "]
                           stringByAppendingString:self.breed.name.capitalizedString];
        self.title = title;
    }
    [self fetchImageURLs];
}


#pragma mark <UICollectionViewDataSource>
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.imageURLs.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    JLImageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    NSURL *imageURL = [NSURL URLWithString:self.imageURLs[indexPath.row]];
    cell.imageURL = imageURL;
    return cell;
}

- (void)fetchImageURLs
{
     if(self.subBreed)
     {
         [[JLBreedController sharedInstance] fetchSubBreedImageURLs: self.subBreed breed: self.breed completion:^(NSArray *fetchedURLs) {
             self.imageURLs = fetchedURLs;
             dispatch_async(dispatch_get_main_queue(), ^{
                 [[self collectionView] reloadData];
             });
         }];
     } else {
         [[JLBreedController sharedInstance] fetchBreedImageURLs:self.breed completion:^(NSArray *fetchedURLs) {
             self.imageURLs = fetchedURLs;
             dispatch_async(dispatch_get_main_queue(), ^{
                 [[self collectionView] reloadData];
             });
         }];
     }
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"toDetailVC"])
    {
        NSIndexPath *indexPath = [[self.collectionView indexPathsForSelectedItems]firstObject];
        NSURL *dogImageURL = [NSURL URLWithString:self.imageURLs[indexPath.row]];
        JLDetailViewController *destinationVC = segue.destinationViewController;
        destinationVC.dogImageURL = dogImageURL;
        if(self.breed){
            destinationVC.breed = self.breed;
        }
        if(self.subBreed){
            destinationVC.subBreed = self.subBreed;
        }
    }
}

@end
