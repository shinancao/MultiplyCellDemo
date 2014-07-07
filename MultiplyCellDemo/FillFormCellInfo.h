//
//  FillFormCellInfo.h
//  MultiplyCellDemo
//
//  Created by Shinancao on 14-7-6.
//  Copyright (c) 2014年 Shinancao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FillFormCellInfo : NSObject
@property (strong, nonatomic) IBOutlet UITableViewCell *typeCell;
@property (strong, nonatomic) IBOutlet UITableViewCell *reasonCell;
@property (strong, nonatomic) IBOutlet UITableViewCell *timeCell;
@property (strong, nonatomic) IBOutlet UITableViewCell *phoneCell;

@property (strong, nonatomic) NSString *leaveFormType;
@property (strong, nonatomic) NSString *leaveReason;  //请假理由
@property (strong, nonatomic) NSDate *beginTime;
@property (strong, nonatomic) NSDate *endTime;
@property (strong, nonatomic) NSString *phoneNum;  //手机号码

- (void)loadCells;

+ (float)heightForRow:(NSIndexPath *)indexPath;

@end

