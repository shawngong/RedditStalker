//
//  ViewController.m
//  RedditStalker
//
//  Created by Shawn Gong on 2017-05-27.
//  Copyright © 2017 Shawn Gong. All rights reserved.
//

#import "ViewController.h"
#import "SearchViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *mainView;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;
@property (weak, nonatomic) IBOutlet UIButton *clearHistory;
@property (weak, nonatomic) IBOutlet UITextField *searchField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSBundle mainBundle] loadNibNamed:@"LandingPage" owner:self options:nil];
    if (self.view) {
        [self.view addSubview:self.mainView];
    }
    
    if (self.searchButton) {
        [self.searchButton addTarget:self action:@selector(searchForUser) forControlEvents:UIControlEventTouchUpInside];
    }
    
    if (self.clearHistory) {
        [self.clearHistory addTarget:self action:@selector(clearPrevHistory) forControlEvents:UIControlEventTouchUpInside];
    }
    
    // On enter search
    if (self.searchField) {
        [self.searchField addTarget:self action:@selector(searchForUser) forControlEvents:UIControlEventEditingDidEndOnExit];
    }
    
    // Dismiss keyboard
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
}

- (void)dismissKeyboard
{
    [self.view endEditing:YES];
}

- (void)searchForUser
{
    NSString *trimmedString = [self.searchField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if (trimmedString.length != 0) {
        SearchViewController *searchViewController = [SearchViewController new];
        searchViewController.searchedUsername = trimmedString;
        
        self.searchField.text = @"";
        
        [self.navigationController pushViewController:searchViewController animated:YES];
    }
}

- (void)clearPrevHistory
{
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return NO;
}

@end
