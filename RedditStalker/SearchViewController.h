//
//  SearchViewController.h
//  RedditStalker
//
//  Created by Shawn Gong on 2017-05-27.
//  Copyright © 2017 Shawn Gong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RedditUserCommentParseDelegate.h"


@interface SearchViewController : UIViewController

@property (strong, nonatomic) id delegate;
@property (strong, nonatomic) NSString *searchedUsername;

@end
