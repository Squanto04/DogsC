//
//  JLSubBreed.m
//  Dogs-C
//
//  Created by Jordan Lamb on 10/9/19.
//  Copyright © 2019 Squanto Inc. All rights reserved.
//

#import "JLSubBreed.h"

@implementation JLSubBreed

- (instancetype)initWithName: (NSString *)name imageURLs:(NSArray *)imageURLs
{
    
    self = [super init];
    if(self) {
        _name = name;
        _imageURLs = imageURLs;
    }
    return self;
}

@end
