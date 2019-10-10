//
//  JLImageCollectionViewCell.m
//  Dogs-C
//
//  Created by Jordan Lamb on 10/9/19.
//  Copyright © 2019 Squanto Inc. All rights reserved.
//

#import "JLImageCollectionViewCell.h"
#import "JLBreedController.h"

@implementation JLImageCollectionViewCell

- (void)prepareForReuse
{
    [super prepareForReuse];
    self.dogImageView.image = [UIImage imageNamed:@"dog"];
}

- (void)setImageURL:(NSURL *)imageURL
{
    [JLBreedController.sharedInstance fetchImageData:imageURL completion:^(NSData *imageData, NSError *error) {
        if (error || !imageData) {
            NSLog(@"Error fetching image data %@", error);
            return;
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            self.dogImageView.image = [UIImage imageWithData:imageData];
        });
    }];
}

@end
