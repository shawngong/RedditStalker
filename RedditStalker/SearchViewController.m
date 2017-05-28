//
//  SearchViewController.m
//  RedditStalker
//
//  Created by Shawn Gong on 2017-05-27.
//  Copyright © 2017 Shawn Gong. All rights reserved.
//

#import "SearchViewController.h"
#import "PreviousCommentsCollectionViewCell.h"
#import <QuartzCore/QuartzCore.h>
#import "CommentParser.h"

static NSString *kCellReuseID = @"prevRedditComment";

@interface SearchViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UIView *mainView;
@property (weak, nonatomic) IBOutlet UICollectionView *previousCommentsCollectionView;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UILabel *user;
@property (weak, nonatomic) IBOutlet UIImageView *holderImage;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSBundle mainBundle] loadNibNamed:@"SearchResultsPage" owner:self options:nil];
    if (self.view) {
        [self.view addSubview:self.mainView];
    }
    
    if (self.backButton) {
        [self.backButton addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    }
    
    if (self.user) {
        self.user.text = [NSString stringWithFormat:@"/u/%@", self.searchedUsername];
    }
    
    if (self.holderImage) {
        [self.holderImage.layer setBorderColor: [[UIColor clearColor] CGColor]];
    }
    
    if (self.previousCommentsCollectionView) {
        [self.previousCommentsCollectionView setBackgroundColor:[UIColor clearColor]];
        [self.previousCommentsCollectionView setDataSource:self];
        [self.previousCommentsCollectionView setDelegate:self];
    }
    
    UINib *prevCommentsCollectionViewCell = [UINib nibWithNibName:@"PreviousCommentsCollectionViewCell" bundle:nil];
    if (prevCommentsCollectionViewCell) {
        [self.previousCommentsCollectionView registerNib:prevCommentsCollectionViewCell forCellWithReuseIdentifier:kCellReuseID];
    }
    
    self.delegate = [CommentParser new];
    
    [self getPrevCommentData:^void(){
        [self.previousCommentsCollectionView reloadData];
    }];
}

- (void)getPrevCommentData:(void (^)(void))completion
{
    NSString *urlAsString = [NSString stringWithFormat:@"https://www.reddit.com/user/%@/comments.json", self.searchedUsername];
    NSCharacterSet *set = [NSCharacterSet URLQueryAllowedCharacterSet];
    NSString *encodedUrlAsString = [urlAsString stringByAddingPercentEncodingWithAllowedCharacters:set];
    NSURLSession *getCommentsSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];

    [[getCommentsSession dataTaskWithURL:[NSURL URLWithString:encodedUrlAsString]
                      completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            NSLog(@"error: %@", error.description);
            [self.delegate fetchingDataFailedWithError:error];
        } else {
            [self.delegate commentsFromJSON:data error:nil];
        }
    }] resume];
    
}

// CollectionView Stuff

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    PreviousCommentsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellReuseID forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor greenColor];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    return CGSizeMake([[UIScreen mainScreen] bounds].size.width, 200);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)goBack
{
    [self.navigationController popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
