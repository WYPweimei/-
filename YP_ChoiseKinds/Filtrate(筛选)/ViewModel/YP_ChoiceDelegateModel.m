//
//  YP_ChoiceDelegateModel.m
//  YP_ChoiseKinds
//
//  Created by 王烨谱 on 2016/11/24.
//  Copyright © 2016年 王烨谱. All rights reserved.
//

#import "YP_ChoiceDelegateModel.h"
#import "YP_ChoiceModel.h"
#import "YP_CurrentTableViewCell.h"
#import "YP_NextTableViewCell.h"
#import "YP_ChoiceTableSectionFooterView.h"
@interface YP_ChoiceDelegateModel()

@property (nonatomic, copy) void (^buttonClick)(BOOL clear);
@property (nonatomic, copy) void (^cellClick)(YP_ChoiceModel *model,NSIndexPath *index);

@end
@implementation YP_ChoiceDelegateModel


#pragma mark ----------UITableViewDelegate,UITableViewDataSource------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.modelArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    YP_ChoiceModel *model = self.modelArray[indexPath.row];
    if ([model.puchTypeOtherCtro integerValue] == 1) {
        YP_NextTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([YP_NextTableViewCell class])];
        if (cell == nil) {
            cell = [YP_NextTableViewCell cell];
        }
        [cell upDataUIViewWithModel:model];
        model.height = 44;
        return cell;
    }else{
        YP_CurrentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([YP_CurrentTableViewCell class])];
        if (cell == nil) {
            cell = [YP_CurrentTableViewCell cell];
        }
        WS(weakSelf)
        [cell cellClick:^(YP_ChoiceModel *model) {
            !weakSelf.cellClick ? : weakSelf.cellClick(model,indexPath);
        }];
        [cell upDataUIViewWithModel:model];
        model.height = [cell height];
        return cell;
    }
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    YP_ChoiceTableSectionFooterView *headView = [YP_ChoiceTableSectionFooterView cell];
    WS(weakSelf)
    [headView buttonClick:^(BOOL clear) {
        !weakSelf.buttonClick ? : weakSelf.buttonClick(clear);
    }];
    return headView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 40;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    YP_ChoiceModel *model = self.modelArray[indexPath.row];
    return model.height;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    YP_ChoiceModel *model = self.modelArray[indexPath.row];
    if ([model.puchTypeOtherCtro integerValue] == 1) {
        !self.cellClick ? : self.cellClick(model,indexPath);
    }else{
        
    }
}

#pragma mark ------------block--------------
- (void)cellClick:(void (^)(YP_ChoiceModel *model,NSIndexPath *index))callBack
{
    self.cellClick = callBack;
}

- (void)buttonClick:(void (^)(BOOL clear))buttonClick
{
    self.buttonClick = buttonClick;
}

@end
