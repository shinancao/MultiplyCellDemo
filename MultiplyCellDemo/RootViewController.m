//
//  RootViewController.m
//  MultiplyCellDemo
//
//  Created by Shinancao on 14-7-6.
//  Copyright (c) 2014年 Shinancao. All rights reserved.
//

#import "RootViewController.h"
#import "FillFormCellInfo.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define kMainFrameHeight  [[[UIDevice currentDevice] systemVersion] floatValue]>= 7 ? [ [UIScreen mainScreen]bounds].size.height : [ [UIScreen mainScreen]applicationFrame].size.height

#define kMainFrameWidth [ [UIScreen mainScreen]applicationFrame].size.width

@interface RootViewController ()<UITableViewDataSource, UITableViewDelegate>
{
    UITableView *_tableView;
    FillFormCellInfo *_fillFormCellInfo;
}
@end

@implementation RootViewController

- (id)init
{
    if (self = [super init]) {
        _fillFormCellInfo = [[FillFormCellInfo alloc]init];
    }
    return self;
}

- (void)loadView
{
    self.view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kMainFrameWidth, kMainFrameHeight)];
    self.view.backgroundColor = UIColorFromRGB(0xf4f4f4);
    float height = 44*5+10*4+64;
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kMainFrameWidth, height) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    _tableView.bounces = NO;
    [self.view addSubview:_tableView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor lightGrayColor];
    [button setTitle:@"提交" forState:UIControlStateNormal];
    button.frame = CGRectMake(10, CGRectGetMaxY(_tableView.frame)+15.f, CGRectGetWidth(self.view.frame)-20, 40.f);
    [self.view addSubview:button];
    [button addTarget:self action:@selector(submitAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"表单申请";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)submitAction:(id)sender
{
    NSLog(@"ttt");
}

#pragma mark - UITableview delegate and datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10.f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [FillFormCellInfo heightForRow:indexPath];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //对于这样的每行cell都不一样的，无需整体刷新，所以也不会存在tableview重用时导致的叠加现象，所以不用弄cellIdentifier，用一个cellInfo包含了所有的cell，在其他任何地方都可以改变cell上的内容，无需刷新
    
    [_fillFormCellInfo loadCells];
    
    if (indexPath.section == 0) {
        return _fillFormCellInfo.typeCell;
    }
    else if (indexPath.section == 1){
        NSCalendar *gregorian = [[NSCalendar alloc]
                                 initWithCalendarIdentifier:NSGregorianCalendar];
        NSDateComponents *components = [gregorian components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit fromDate:[NSDate date]];
        [components setHour:9];
        [components setMinute:30];
        NSDate *beginTime = [gregorian dateFromComponents:components];
        [components setHour:18];
        [components setMinute:30];
        NSDate *endTime = [gregorian dateFromComponents:components];
        _fillFormCellInfo.beginTime = beginTime;
        _fillFormCellInfo.endTime = endTime;

        return _fillFormCellInfo.timeCell;
    }
    else if (indexPath.section == 3){
        return _fillFormCellInfo.reasonCell;
    }
    else if (indexPath.section == 2){
        return _fillFormCellInfo.phoneCell;
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
