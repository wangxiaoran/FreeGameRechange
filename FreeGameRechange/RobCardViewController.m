//
//  RobCardViewController.m
//  FreeGameRechange
//
//  Created by wangxr on 14-6-20.
//  Copyright (c) 2014年 wangxr. All rights reserved.
//

#import "RobCardViewController.h"
#import "StartViewController.h"
@interface RobCardViewController ()<UITableViewDelegate>
{
    UIButton * hotButton;
    UIButton * allButton;
    UIImageView * tabHighlightIV;
}
@property (nonatomic,retain)UIScrollView * scrollView;
@property (nonatomic,retain)UITableView * hotTableView;
@property (nonatomic,retain)UITableView * allTableView;
@end

@implementation RobCardViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"抢卡大厅";
    }
    return self;
}
- (NSString *)tabImageName
{
	return @"Card-Icon";
}

- (NSString *)tabTitle
{
	return self.title;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImageView * backImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
    backImageView.image = [UIImage imageNamed:@"tab-background"];
    [self.view addSubview:backImageView];
    tabHighlightIV = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 150, 30)];
    tabHighlightIV.image = [UIImage imageNamed:@"tab-highlight"];
    [backImageView addSubview:tabHighlightIV];
    hotButton = [UIButton buttonWithType:UIButtonTypeCustom];
    hotButton.frame = CGRectMake(0, 0, self.view.frame.size.width/2, 40);
    [hotButton setTitle:@"最新" forState:UIControlStateNormal];
    [hotButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [hotButton addTarget:self action:@selector(moveToHot) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:hotButton];
    allButton = [UIButton buttonWithType:UIButtonTypeCustom];
    allButton.frame = CGRectMake(self.view.frame.size.width/2, 0, self.view.frame.size.width/2, 40);
    [allButton setTitle:@"全部" forState:UIControlStateNormal];
    [allButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [allButton addTarget:self action:@selector(moveToAll) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:allButton];
    
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 40, self.view.frame.size.width, self.view.frame.size.height-40)];
    _scrollView.contentSize = CGSizeMake(self.view.frame.size.width*2, _scrollView.frame.size.height);
    _scrollView.delegate = self;
    _scrollView.pagingEnabled = YES;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    [self.view addSubview: _scrollView];
    
    self.hotTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, _scrollView.frame.size.width, _scrollView.frame.size.height)];
    [_scrollView addSubview:_hotTableView];
    self.allTableView = [[UITableView alloc] initWithFrame:CGRectMake(_scrollView.frame.size.width, 0, _scrollView.frame.size.width, _scrollView.frame.size.height)];
    [_scrollView addSubview:_allTableView];
}
- (void)moveToHot
{
    if (_scrollView.contentOffset.x>=self.view.frame.size.width) {
        [_scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    }
    [[StartViewController sharedStartViewController] showLoginViewController];
}
- (void)moveToAll
{
    if (_scrollView.contentOffset.x<self.view.frame.size.width) {
        [_scrollView setContentOffset:CGPointMake(self.view.frame.size.width, 0) animated:YES];
    }
}
#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if ([scrollView isEqual: _scrollView]) {
        tabHighlightIV.frame = CGRectMake(5 + scrollView.contentOffset.x/2, tabHighlightIV.frame.origin.y,tabHighlightIV.frame.size.width ,tabHighlightIV.frame.size.height );
        if (tabHighlightIV.center.x>self.view.frame.size.width/2) {
            [hotButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [allButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }else{
            [hotButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [allButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        }
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
