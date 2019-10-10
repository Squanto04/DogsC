//
//  JLSubBreedsTableViewController.h
//  Dogs-C
//
//  Created by Jordan Lamb on 10/9/19.
//  Copyright © 2019 Squanto Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JLBreed.h"

NS_ASSUME_NONNULL_BEGIN

@interface JLSubBreedsTableViewController : UITableViewController

@property (nonatomic, strong) JLBreed * breed;

@end

NS_ASSUME_NONNULL_END
