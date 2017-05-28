//
//  RedditUserData.h
//  RedditStalker
//
//  Created by Shawn Gong on 2017-05-28.
//  Copyright © 2017 Shawn Gong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RedditCommentData.h"

@interface RedditUserData : NSObject

@property (strong, nonatomic) NSString *userName;
@property (strong, nonatomic) NSArray *userComments;
@property (strong, nonatomic) RedditCommentData *lastCommentSeen;

@end
