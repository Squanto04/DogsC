//
//  JLSubBreed.h
//  Dogs-C
//
//  Created by Jordan Lamb on 10/9/19.
//  Copyright © 2019 Squanto Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JLSubBreed : NSObject


@property (nonatomic, copy, readonly) NSString * name;
@property (nonatomic, copy, readonly) NSArray * imageURLs;

- (instancetype)initWithName:(NSString *)name
                   imageURLs:(NSArray *)imageURLs;

@end

NS_ASSUME_NONNULL_END
