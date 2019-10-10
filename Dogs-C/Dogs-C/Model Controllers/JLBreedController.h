//
//  JLBreedController.h
//  Dogs-C
//
//  Created by Jordan Lamb on 10/9/19.
//  Copyright © 2019 Squanto Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JLBreed.h"
#import "JLSubBreed.h"


@interface JLBreedController : NSObject

+ (instancetype)sharedInstance;

- (void)fetchBreeds:(void(^)(NSArray<JLBreed *> *fetchedBreeds))completion;

- (void)fetchBreedImageURLs:(JLBreed *)breed completion:(void(^)(NSArray<NSString *> *breedImageURLs))completion;

- (void)fetchSubBreedImageURLs:(JLSubBreed *)subBreed breed:(JLBreed *)breed completion:(void (^) (NSArray *))completion;

- (void)fetchImageData:(NSURL *)url completion:(void(^) (NSData *imageData, NSError *error))completion;

@end

