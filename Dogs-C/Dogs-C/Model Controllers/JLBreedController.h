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

NS_ASSUME_NONNULL_BEGIN

@interface JLBreedController : NSObject

@property (nonatomic, copy) NSArray<JLBreed *> *breeds;

+ (instancetype)sharedInstance;

- (void)fetchBreeds:(void(^)(NSArray<JLBreed *> *fetchedBreeds))completion;

- (void)fetchBreedImageURLs:(JLBreed *)breed completion:(void(^)(NSArray<NSString *> *breedImageURLs))completion;

- (void)fetchSubBreedImageURLs:(JLBreed *)breed subBreed:(JLSubBreed *)subBreed completion:(void(^)(NSArray<NSString *> *breedImageURLs))completion;

- (void)fetchImageData:(NSURL *)url completion:(void(^) (NSData *imageData, NSError *error))completion;

@end

NS_ASSUME_NONNULL_END
