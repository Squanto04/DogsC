//
//  JLBreed.m
//  Dogs-C
//
//  Created by Jordan Lamb on 10/9/19.
//  Copyright © 2019 Squanto Inc. All rights reserved.
//

#import "JLBreed.h"
#import "JLSubBreed.h"

@implementation JLBreed

- (JLBreed *)initWithName:(NSString *)name subBreeds:(NSArray<JLSubBreed *> *)subBreeds imageURLs:(NSArray *)imageURLs
{
    self = [super init];
    if (self)
    {
        _name = name;
        _subBreeds = subBreeds;
        _imageURLs = imageURLs;
    }
    return self;
}

@end
