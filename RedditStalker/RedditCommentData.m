//
//  RedditCommentData.m
//  RedditStalker
//
//  Created by Shawn Gong on 2017-05-28.
//  Copyright © 2017 Shawn Gong. All rights reserved.
//

#import "RedditCommentData.h"

@implementation RedditCommentData

- init
{
    self = [super init];
    self.score = @"0";
    self.body = @"";
    self.subreddit = @"";
    return self;
}

@end
