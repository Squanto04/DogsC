//
//  JLBreedController.m
//  Dogs-C
//
//  Created by Jordan Lamb on 10/9/19.
//  Copyright © 2019 Squanto Inc. All rights reserved.
//

#import "JLBreedController.h"

static NSString * const kBaseURLString = @"https://dog.ceo/api";
static NSString * const kBreedKey = @"breed";
static NSString * const kBreedsKey = @"breeds";
static NSString * const kListKey = @"list";
static NSString * const kAllKey = @"all";
static NSString * const kImagesKey = @"images";

@implementation JLBreedController

+ (JLBreedController *)sharedInstance
{
    static JLBreedController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [JLBreedController new];
    });
    return sharedInstance;
}

- (void)fetchBreeds:(void (^)(NSArray<JLBreed *> * _Nullable))completion
{
    NSURL *baseURL = [NSURL URLWithString:kBaseURLString];
    NSURL *breedsURL = [baseURL URLByAppendingPathComponent:kBreedsKey];
    NSURL *listURL = [breedsURL URLByAppendingPathComponent:kListKey];
    NSURL *finalURL = [listURL URLByAppendingPathComponent:kAllKey];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
            completion(nil);
            return;
        }
        if (response)
        {
            NSLog(@"%@", response);
        }
        if(!data)
        {
            NSLog(@"Error fetching breeds DATA from search term: %@", error);
            completion(nil);
            return;
        }
        NSDictionary *topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:2 error:&error];
        
        if (!topLevelDictionary|| ![topLevelDictionary isKindOfClass:[NSDictionary class]]){
            NSLog(@"Error fetching json dictionary %@", error);
            completion(nil);
            return;
        }
        
        NSDictionary *messagesDictionary = topLevelDictionary[@"messages"];
        NSMutableArray *breeds = [NSMutableArray new];
        for (id key in messagesDictionary)
        {
            NSMutableArray *subBreeds = [NSMutableArray new];
            for (NSString *name in messagesDictionary[key])
            {
                JLSubBreed *subBreed = [[JLSubBreed alloc] initWithName:name imageURLs:[NSMutableArray new]];
                [subBreeds addObject:subBreed];
            }
            JLBreed *breed = [[JLBreed alloc] initWithName:key subBreeds:subBreeds imageURLs:[NSMutableArray new]];
            [breeds addObject:breed];
        }
        completion(breeds);
    }] resume];
}

- (void)fetchBreedImageURLs:(JLBreed *)breed completion:(void (^)(NSArray<NSString *> * _Nullable))completion
{
    NSURL *baseURL = [NSURL URLWithString:kBaseURLString];
    NSURL *breedKeyURL = [baseURL URLByAppendingPathComponent:kBreedKey];
    NSURL *breedURL = [breedKeyURL URLByAppendingPathComponent:breed.name];
    NSURL *finalURL = [breedURL URLByAppendingPathComponent:kImagesKey];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
            completion(nil);
            return;
        }
        if (response)
        {
            NSLog(@"%@", response);
        }
        if (!data)
        {
            NSLog(@"Error fetching breeds DATA from search term: %@", error);
            completion(nil);
            return;
        }
        NSDictionary *topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:2 error:&error];
        
        if (!topLevelDictionary|| ![topLevelDictionary isKindOfClass:[NSDictionary class]]){
            NSLog(@"Error fetching json dictionary %@", error);
            completion(nil);
            return;
        }
        NSMutableArray *images = topLevelDictionary[@"message"];
        completion(images);
        
    }] resume];
}

- (void)fetchSubBreedImageURLs:(JLBreed *)breed subBreed:(JLSubBreed *)subBreed completion:(void (^)(NSArray<NSString *> * _Nullable))completion
{
    // Goal URL: https://dog.ceo/api/breed/hound/basset/images
    NSURL *baseURL = [NSURL URLWithString:kBaseURLString];
    NSURL *breedKeyURL = [baseURL URLByAppendingPathComponent:kBreedKey];
    NSURL *breedURL = [breedKeyURL URLByAppendingPathComponent:breed.name];
    NSURL *subBreedURL = [breedURL URLByAppendingPathComponent:subBreed.name];
    NSURL *finalURL = [subBreedURL URLByAppendingPathComponent:kImagesKey];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
            completion(nil);
            return;
        }
        if (response)
        {
            NSLog(@"%@", response);
        }
        if(!data)
        {
            NSLog(@"Error fetching breeds from search term:%@", error);
        }
        
        NSDictionary *topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:2 error:&error];
        
        if (!topLevelDictionary|| ![topLevelDictionary isKindOfClass:[NSDictionary class]]){
            NSLog(@"Error fetching JSON dictionary %@", error);
            completion(nil);
            return;
        }
        NSMutableArray *images = topLevelDictionary[@"images"];
        completion(images);
        
    }] resume];
}

- (void)fetchImageData:(NSURL *)url completion:(void (^)(NSData *imageData, NSError *error))completion
{
    [[[NSURLSession sharedSession]dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error){
            NSLog(@"Error fetching breeds from search term: %@", error);
            return completion(nil, error);
        }
        if(!data){
            NSLog(@"Error fetching breeds DATA from search term: %@", error);
            return completion(nil, error);
        }
        completion(data, nil);
    }]resume];
}

@end
