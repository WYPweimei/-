//
//  YP_ChoiceDelegateModel.h
//  YP_ChoiseKinds
//
//  Created by 王烨谱 on 2016/11/24.
//  Copyright © 2016年 王烨谱. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YP_ChoiceModel;
@interface YP_ChoiceDelegateModel : NSObject<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong)NSMutableArray *modelArray;

- (void)cellClick:(void (^)(YP_ChoiceModel *model,NSIndexPath *index))callBack;

- (void)buttonClick:(void (^)(BOOL clear))buttonClick;
@end
