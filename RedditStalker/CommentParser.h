//
//  CommentParser.h
//  RedditStalker
//
//  Created by Shawn Gong on 2017-05-28.
//  Copyright © 2017 Shawn Gong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RedditUserCommentParseDelegate.h"

@interface CommentParser : NSObject<RedditUserCommentParseDelegate>

- (NSArray *)commentsFromJSON:(NSData *)objectNotation error:(NSError *)error;

@end
