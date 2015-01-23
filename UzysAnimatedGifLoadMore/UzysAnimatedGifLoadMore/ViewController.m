//
//  ViewController.m
//  UzysAnimatedGifLoadMore
//
//  Created by Uzysjung on 2014. 9. 25..
//  Copyright (c) 2014년 Uzys. All rights reserved.
//
/*
 resource from
 
 https://dribbble.com/shots/1853041-Slack-Loader?list=searches&tag=load_more&offset=474
 https://dribbble.com/shots/1813893-Bouncing-Sammy?list=searches&tag=load_more&offset=563
 https://dribbble.com/shots/1773881-Fruit-Animation?list=searches&tag=gif&offset=54
 https://dribbble.com/shots/1776423-Inbox-by-Gmail-Animated-Icon?list=searches&tag=gif&offset=94
 https://dribbble.com/shots/1559273-Its-never-too-late?list=searches&tag=gif&offset=143
 https://dribbble.com/shots/1574930-Farm-Truck-animated?list=searches&tag=gif&offset=273
 https://dribbble.com/shots/406120--GIF-Superbowl-XLVI?list=searches&tag=gif&offset=27

 http://ezgif.com/

 */
#import "UIScrollView+UzysAnimatedGifLoadMore.h"
#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,assign) BOOL isLoading;
@property (nonatomic,assign) BOOL useActivityIndicator;
@property (nonatomic,strong) NSMutableArray *pData;

@end
#define IS_IOS7 (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1 && floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_7_1)
#define IS_IOS8  ([[[UIDevice currentDevice] systemVersion] compare:@"8" options:NSNumericSearch] != NSOrderedAscending)
#define IS_IPHONE6PLUS ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) && [[UIScreen mainScreen] nativeScale] == 3.0f)

#define CELLIDENTIFIER @"CELL"
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setupDataSource];
    if(IS_IOS7 || IS_IOS8)
        self.automaticallyAdjustsScrollViewInsets = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"UzysAnimatedGifLoadMore";
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CELLIDENTIFIER];
    
    __weak typeof(self) weakSelf =self;
    [self.tableView addLoadMoreActionHandler:^{
        [weakSelf insertRowAtBottom];
        
    } ProgressImagesGifName:@"farmTruck@2x.gif" LoadingImagesGifName:@"bounce_sammy@2x.gif" ProgressScrollThreshold:30 LoadingImageFrameRate:30];
    
    // If you did not change scrollview inset, you don't need code below.


    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    //    Manually trigger
    [self.tableView triggerLoadMoreActionHandler];
}



#pragma mark UITableView DataManagement
- (void)setupDataSource {
    self.pData = [NSMutableArray array];
    [self.pData addObject:@"0"];
    [self.pData addObject:@"1"];
    [self.pData addObject:@"2"];
    [self.pData addObject:@"3"];
    [self.pData addObject:@"4"];
    [self.pData addObject:@"5"];
    [self.pData addObject:@"6"];
    [self.pData addObject:@"7"];
    
    for(int i=0; i<8; i++)
        [self.pData addObject:[NSDate dateWithTimeIntervalSinceNow:-(i*100)]];
}

- (void)insertRowAtBottom {
    __weak typeof(self) weakSelf = self;
    self.isLoading =YES;
    int64_t delayInSeconds = 2.8;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        
        NSInteger rows = [weakSelf.tableView numberOfRowsInSection:0];
        [weakSelf.tableView beginUpdates];
        [weakSelf.pData addObject:[NSDate date]];
        
        [weakSelf.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:rows inSection:0]] withRowAnimation:UITableViewRowAnimationAutomatic];
        [weakSelf.tableView endUpdates];
        
        //Stop PullToRefresh Activity Animation
        [weakSelf.tableView stopLoadMoreAnimation];
        weakSelf.isLoading =NO;
    });
}

#pragma mark UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.pData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CELLIDENTIFIER];
    
    if([[self.pData objectAtIndex:indexPath.row] isKindOfClass:[NSString class]] && [[self.pData objectAtIndex:indexPath.row] isEqualToString:@"0"])
    {
        cell.textLabel.textColor = [UIColor blackColor];
        cell.textLabel.text = @"Progress by Image Array";
    }
    else if([[self.pData objectAtIndex:indexPath.row] isKindOfClass:[NSString class]] &&[[self.pData objectAtIndex:indexPath.row] isEqualToString:@"1"])
    {
        cell.textLabel.textColor = [UIColor blackColor];
        cell.textLabel.text = @"Loading/Progress by Image Array";
    }
    else if([[self.pData objectAtIndex:indexPath.row] isKindOfClass:[NSString class]] &&[[self.pData objectAtIndex:indexPath.row] isEqualToString:@"2"])
    {
        cell.textLabel.textColor = [UIColor blackColor];
        cell.textLabel.text = @"FarmTruck/NeverTooLate";
    }
    else if([[self.pData objectAtIndex:indexPath.row] isKindOfClass:[NSString class]] &&[[self.pData objectAtIndex:indexPath.row] isEqualToString:@"3"])
    {
        cell.textLabel.textColor = [UIColor blackColor];
        cell.textLabel.text = @"Inbox/Fruit";
    }
    else if([[self.pData objectAtIndex:indexPath.row] isKindOfClass:[NSString class]] &&[[self.pData objectAtIndex:indexPath.row] isEqualToString:@"4"])
    {
        cell.textLabel.textColor = [UIColor blackColor];
        
        NSString *strLabel = [NSString stringWithFormat:@"Alpha Transition %@",self.tableView.loadMoreAlphaTransition ?@"ON":@"OFF"];
        cell.textLabel.text = strLabel;
    }
    else if([[self.pData objectAtIndex:indexPath.row] isKindOfClass:[NSString class]] &&[[self.pData objectAtIndex:indexPath.row] isEqualToString:@"5"])
    {
        cell.textLabel.textColor = [UIColor blackColor];
        
        NSString *strLabel = [NSString stringWithFormat:@"Variable Size %@",self.tableView.loadMoreVariableSize ?@"ON":@"OFF"];
        cell.textLabel.text = strLabel;
    }
    else if([[self.pData objectAtIndex:indexPath.row] isKindOfClass:[NSString class]] &&[[self.pData objectAtIndex:indexPath.row] isEqualToString:@"6"])
    {
        cell.textLabel.textColor = [UIColor blackColor];
        cell.textLabel.text = @"Manually Trigger";
    }
    else if([[self.pData objectAtIndex:indexPath.row] isKindOfClass:[NSString class]] &&[[self.pData objectAtIndex:indexPath.row] isEqualToString:@"7"])
    {
        cell.textLabel.textColor = [UIColor blackColor];
        NSString *strLabel;
        if(self.useActivityIndicator)
        {
            NSArray *IndicatorStyle = @[@"WhiteLarge",@"White",@"Gray"];
            strLabel = [NSString stringWithFormat:@"Indcator Style %@",IndicatorStyle[self.tableView.loadMoreActivityIndcatorStyle]];
        }
        else
        {
            strLabel = @"UIActivityIndicator non-exist. (Tap \'Progress Image by Array\')";
        }
        cell.textLabel.text = strLabel;
    }
    else
    {
        NSDate *date = [self.pData objectAtIndex:indexPath.row];
        cell.textLabel.textColor = [UIColor grayColor];
        cell.textLabel.text = [NSDateFormatter localizedStringFromDate:date dateStyle:NSDateFormatterLongStyle timeStyle:NSDateFormatterMediumStyle];
    }
    
    cell.contentView.backgroundColor = [UIColor whiteColor];
    
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(self.isLoading)
    {
        [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
        return;
    }
    if([[self.pData objectAtIndex:indexPath.row] isKindOfClass:[NSString class]] && [[self.pData objectAtIndex:indexPath.row] isEqualToString:@"0"])
    {
        [self.tableView removeLoadMoreActionHandler];
        
        __weak typeof(self) weakSelf =self;
        
        NSMutableArray *progress =[NSMutableArray array];
        for (int i=0;i<201;i++)
        {
            NSString *fname = [NSString stringWithFormat:@"super_%03d.gif",i];
            [progress addObject:[UIImage imageNamed:fname]];
        }
        [self.tableView addLoadMoreActionHandler:^{
            [weakSelf insertRowAtBottom];
            
        } ProgressImages:progress ProgressScrollThreshold:60];
        self.useActivityIndicator = YES;
    }
    else if([[self.pData objectAtIndex:indexPath.row] isKindOfClass:[NSString class]] && [[self.pData objectAtIndex:indexPath.row] isEqualToString:@"1"])
    {
        [self.tableView removeLoadMoreActionHandler];
        
        __weak typeof(self) weakSelf =self;
        
        NSMutableArray *progress =[NSMutableArray array];
        for (int i=0;i<201;i++)
        {
            NSString *fname = [NSString stringWithFormat:@"super_%03d.gif",i];
            [progress addObject:[UIImage imageNamed:fname]];
        }
        NSMutableArray *loading =[NSMutableArray array];
        for (int i=0;i<201;i++)
        {
            NSString *fname = [NSString stringWithFormat:@"slack_%03d.gif",i];
            [loading addObject:[UIImage imageNamed:fname]];
        }
        [self.tableView addLoadMoreActionHandler:^{
            [weakSelf insertRowAtBottom];
            
        } ProgressImages:progress LoadingImages:loading ProgressScrollThreshold:70 LoadingImagesFrameRate:30];
        self.useActivityIndicator = YES;
    }
    else if([[self.pData objectAtIndex:indexPath.row] isKindOfClass:[NSString class]] && [[self.pData objectAtIndex:indexPath.row] isEqualToString:@"2"])
    {
        [self.tableView removeLoadMoreActionHandler];
        
        __weak typeof(self) weakSelf =self;
        [self.tableView addLoadMoreActionHandler:^{
            [weakSelf insertRowAtBottom];
            
        } ProgressImagesGifName:@"farmtruck@2x.gif" LoadingImagesGifName:@"nevertoolate@2x.gif" ProgressScrollThreshold:60 LoadingImageFrameRate:30];
        self.useActivityIndicator = NO;
        
        
    }
    else if([[self.pData objectAtIndex:indexPath.row] isKindOfClass:[NSString class]] && [[self.pData objectAtIndex:indexPath.row] isEqualToString:@"3"])
    {
        [self.tableView removeLoadMoreActionHandler];
        
        __weak typeof(self) weakSelf =self;
        [self.tableView addLoadMoreActionHandler:^{
            [weakSelf insertRowAtBottom];
            
        } ProgressImagesGifName:@"inbox@2x.gif" LoadingImagesGifName:@"fruit_animation@2x.gif" ProgressScrollThreshold:70 LoadingImageFrameRate:30];
        self.useActivityIndicator = NO;
        

    }
    else if([[self.pData objectAtIndex:indexPath.row] isKindOfClass:[NSString class]] && [[self.pData objectAtIndex:indexPath.row] isEqualToString:@"4"])
    {
        self.tableView.loadMoreAlphaTransition = !self.tableView.loadMoreAlphaTransition;
        
    }
    else if([[self.pData objectAtIndex:indexPath.row] isKindOfClass:[NSString class]] && [[self.pData objectAtIndex:indexPath.row] isEqualToString:@"5"])
    {
        self.tableView.loadMoreVariableSize = !self.tableView.loadMoreVariableSize;
    }
    else if([[self.pData objectAtIndex:indexPath.row] isKindOfClass:[NSString class]] && [[self.pData objectAtIndex:indexPath.row] isEqualToString:@"6"])
    {
        [self.tableView triggerLoadMoreActionHandler];
    }
    else if([[self.pData objectAtIndex:indexPath.row] isKindOfClass:[NSString class]] && [[self.pData objectAtIndex:indexPath.row] isEqualToString:@"7"])
    {
        static NSInteger styleCnt =0;
        styleCnt++;
        if(styleCnt >2)
            styleCnt = 0;
        self.tableView.loadMoreActivityIndcatorStyle = styleCnt;
    }
    
    [self.tableView reloadData];
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}

@end
