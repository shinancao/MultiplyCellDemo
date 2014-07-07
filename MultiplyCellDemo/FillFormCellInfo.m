//
//  FillFormCellInfo.m
//  MultiplyCellDemo
//
//  Created by Shinancao on 14-7-6.
//  Copyright (c) 2014年 Shinancao. All rights reserved.
//

#import "FillFormCellInfo.h"

#define kXIBName @"FillFormCell"
#import "NSDate+convenience.h"

@implementation FillFormCellInfo

- (void)loadCells
{
    [[NSBundle mainBundle]loadNibNamed:kXIBName owner:self options:nil];
}

+ (float)heightForRow:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        return 88.f;
    }
    return 44.f;
}

//没有必要这么写
//- (UITableViewCell *)typeCell
//{
//    if (_typeCell!=nil) {
//        NSLog(@"aaa");
//        return _typeCell;
//    }
//    _typeCell = [[[NSBundle mainBundle]loadNibNamed:kXIBName owner:self options:nil] objectAtIndex:0];
//    return _typeCell;
//}
//
//- (UITableViewCell *)reasonCell
//{
//    
//    if (_reasonCell !=nil) {
//        NSLog(@"bbbb");
//        return _reasonCell;
//    }
//    _reasonCell = [[[NSBundle mainBundle]loadNibNamed:kXIBName owner:self options:nil] objectAtIndex:1];
//    return _reasonCell;
//}
//
//- (UITableViewCell *)timeCell
//{
//    if (_timeCell!=nil) {
//        NSLog(@"ccc");
//        return _timeCell;
//    }
//    _timeCell = [[[NSBundle mainBundle]loadNibNamed:kXIBName owner:self options:nil] objectAtIndex:2];
//    return _timeCell;
//}
//
//- (UITableViewCell *)phoneCell
//{
//    if (_phoneCell!=nil) {
//        return _phoneCell;
//    }
//    _phoneCell = [[[NSBundle mainBundle]loadNibNamed:kXIBName owner:self options:nil] lastObject];
//    return _phoneCell;
//}

- (void)setLeaveFormType:(NSString *)leaveFormType
{
    if (leaveFormType == nil || [leaveFormType isEqualToString:@""]) {
        leaveFormType = @"未选择";
    }
    UILabel *label = (UILabel *)[self.typeCell.contentView viewWithTag:100];
    label.text = leaveFormType;
    
    _leaveFormType = leaveFormType;
}

- (void)setLeaveReason:(NSString *)leaveReason
{
    NSString *str = @"已填写";
    if (leaveReason == nil || [leaveReason isEqualToString:@""]) {
        leaveReason = @"";
        str = @"未填写";
    }
    UILabel *label = (UILabel *)[self.reasonCell.contentView viewWithTag:100];
    label.text = str;
    
    _leaveReason = leaveReason;
}

- (void)setBeginTime:(NSDate *)beginTime
{
    UILabel *label = (UILabel *)[self.timeCell.contentView viewWithTag:100];
    label.text = [NSDate parseString:beginTime format:@"yyyy/MM/dd HH:mm"];
    _beginTime = beginTime;
}

- (void)setEndTime:(NSDate *)endTime
{
    UILabel *label = (UILabel *)[self.timeCell.contentView viewWithTag:101];
    label.text = [NSDate parseString:endTime format:@"yyyy/MM/dd HH:mm"];
    _endTime = endTime;
}

- (void)setPhoneNum:(NSString *)phoneNum
{
    UILabel *label = (UILabel *)[self.phoneCell.contentView viewWithTag:100];
    if (phoneNum == nil || [phoneNum isEqualToString:@""]) {
        label.text = @"未填写";
    }
    else{
        label.text = phoneNum;
    }
    _phoneNum = phoneNum;
}

@end
