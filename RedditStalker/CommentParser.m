//
//  CommentParser.m
//  RedditStalker
//
//  Created by Shawn Gong on 2017-05-28.
//  Copyright © 2017 Shawn Gong. All rights reserved.
//

#import "CommentParser.h"
#import "RedditCommentData.h"

@interface CommentParser()

@end

@implementation CommentParser

- (NSArray *)commentsFromJSON:(NSData *)objectNotation error:(NSError *)error
{
    NSError *localError = nil;
    NSDictionary *parsedObject = [NSJSONSerialization JSONObjectWithData:objectNotation options:NSJSONReadingMutableContainers error:&localError];
    
    if (localError != nil) {
        error = localError;
        return nil;
    }
    
    NSMutableArray *comments = [NSMutableArray new];
    
    NSArray *commentsArray = [[parsedObject valueForKey:@"data"] valueForKey:@"children"];
    NSLog(@"Count %lu", commentsArray.count);
    
    for (NSDictionary *comment in commentsArray) {
        NSDictionary *dataOfComment = [comment valueForKey:@"data"];
        RedditCommentData *tmp = [RedditCommentData new];
        
        for (NSString *key in dataOfComment) {
            if ([tmp respondsToSelector:NSSelectorFromString(key)]) {
                [tmp setValue:[dataOfComment valueForKey:key] forKey:key];
            }
        }
        
        [comments addObject:tmp];
    }
    
    return comments;
}

- (void)fetchingDataFailedWithError:(NSError *)error;
{
    
}

@end
