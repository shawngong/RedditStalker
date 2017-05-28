//
//  RedditCommentData.h
//  RedditStalker
//
//  Created by Shawn Gong on 2017-05-28.
//  Copyright © 2017 Shawn Gong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RedditCommentData : NSObject

@property (strong, nonatomic) NSString *body;
@property (strong, nonatomic) NSString *score;
@property (strong, nonatomic) NSString *subreddit;

@end
