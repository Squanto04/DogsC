//
//  JLBreed.h
//  Dogs-C
//
//  Created by Jordan Lamb on 10/9/19.
//  Copyright © 2019 Squanto Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JLBreed : NSObject

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) NSArray *subBreeds;
@property (nonatomic, copy, readonly) NSArray *imageURLs;

- (JLBreed *)initWithName:(NSString *)name
                subBreeds:(NSArray *)subBreeds
                    imageURLs:(NSArray *)imageURLs;

@end
