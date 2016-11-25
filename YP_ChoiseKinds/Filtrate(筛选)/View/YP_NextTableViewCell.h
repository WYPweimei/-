//
//  YP_NextTableViewCell.h
//  YP_ChoiseKinds
//
//  Created by 王烨谱 on 2016/11/24.
//  Copyright © 2016年 王烨谱. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YP_ChoiceModel;
@interface YP_NextTableViewCell : UITableViewCell

+ (instancetype)cell;

-(void)upDataUIViewWithModel:(YP_ChoiceModel *)model;
@end
