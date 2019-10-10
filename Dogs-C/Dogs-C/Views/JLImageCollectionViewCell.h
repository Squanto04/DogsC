//
//  JLImageCollectionViewCell.h
//  Dogs-C
//
//  Created by Jordan Lamb on 10/9/19.
//  Copyright © 2019 Squanto Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JLImageCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *dogImageView;
@property (nonatomic, strong) NSURL *imageURL;

@end

NS_ASSUME_NONNULL_END
