//
//  YP_CurrentTableViewCell.h
//  YP_ChoiseKinds
//
//  Created by 王烨谱 on 2016/11/24.
//  Copyright © 2016年 王烨谱. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YP_ChoiceModel;
@interface YP_CurrentTableViewCell : UITableViewCell

+ (instancetype)cell;

-(CGFloat)height;

-(void)upDataUIViewWithModel:(YP_ChoiceModel *)model;

- (void)cellClick:(void (^)(YP_ChoiceModel *model))callBack;

@end
