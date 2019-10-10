//
//  JLImageCollectionViewController.h
//  Dogs-C
//
//  Created by Jordan Lamb on 10/9/19.
//  Copyright © 2019 Squanto Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JLBreedController.h"
#import "Dogs_C-Swift.h"
#import "JLImageCollectionViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface JLImageCollectionViewController : UICollectionViewController

@property (nonatomic, strong) JLBreed * breed;
@property (nonatomic, strong) JLSubBreed * subBreed;
@property (nonatomic) NSArray * imageURLs;

-(void)fetchImageURLs;

@end

NS_ASSUME_NONNULL_END
