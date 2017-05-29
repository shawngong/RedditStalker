//
//  PreviousCommentsCollectionViewCell.h
//  RedditStalker
//
//  Created by Shawn Gong on 2017-05-27.
//  Copyright © 2017 Shawn Gong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PreviousCommentsCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *subredditLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *bodyLabel;


@end
