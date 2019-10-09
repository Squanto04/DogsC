//
//  CRADog.m
//  DogsAndCatsC-Master
//
//  Created by Cody on 2/4/19.
//  Copyright © 2019 Cody Adcock. All rights reserved.
//

#import "CRABreed.h"

@implementation CRABreed

- (instancetype)initWithName: (NSString *)name subBreeds: (NSArray<CRASubBreed *> *)subBreeds imageURLs:(NSArray *)imageURLs
{
    
    self = [super init];
    if(self) {
        _name = name;
        _subBreeds = subBreeds;
        _imageURLs = imageURLs;
    }
    return self;
}

@end
