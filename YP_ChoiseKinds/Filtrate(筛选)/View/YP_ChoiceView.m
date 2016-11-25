//
//  YP_ChoiceView.m
//  YP_ChoiseKinds
//
//  Created by 王烨谱 on 2016/11/24.
//  Copyright © 2016年 王烨谱. All rights reserved.
//

#import "YP_ChoiceView.h"
#import "YP_ChoiceViewModel.h"
#import "YP_ChoiceDelegateModel.h"
#import "YP_ChoiceModel.h"
#import "YP_ChioceViewController.h"

@interface YP_ChoiceView()

@property (nonatomic, copy) void (^buttonClick)(NSMutableArray *nameArray);
@property(nonatomic, strong)YP_ChoiceDelegateModel *delegateModel;
@property(nonatomic, strong)YP_ChoiceViewModel *viewModel;
@property(nonatomic, strong)UITableView *tableView;
@property(nonatomic, strong)NSMutableArray *choiceTitleArray;
@property (nonatomic, strong)UIButton *tableFooterButton;
@property(nonatomic, strong)UIButton *headerButton;

@end


@implementation YP_ChoiceView

#pragma mark --------------setting,getting--------------
-(UIButton *)tableFooterButton{
    if (_tableFooterButton == nil) {
        _tableFooterButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _tableFooterButton.frame = CGRectMake(0, 0, kScreenWidth, 1000);
        _tableFooterButton.backgroundColor = [[UIColor alloc]initWithRed:0 green:0 blue:0 alpha:0.5];
        [_tableFooterButton addTarget:self action:@selector(removeSelf) forControlEvents:UIControlEventTouchUpInside];
    }
    return _tableFooterButton;
}

-(UIButton *)headerButton{
    if (_headerButton == nil) {
        _headerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _headerButton.frame = CGRectMake(0, 0, kScreenWidth, 64 + 41);
        _headerButton.backgroundColor = [[UIColor alloc]initWithRed:0 green:0 blue:0 alpha:0];
        [_headerButton addTarget:self action:@selector(removeSelf) forControlEvents:UIControlEventTouchUpInside];    }
    return _headerButton;
}

-(NSMutableArray *)choiceTitleArray{
    if (_choiceTitleArray == nil) {
        _choiceTitleArray = [NSMutableArray new];
        for (int i = 0; i < self.delegateModel.modelArray.count; i ++) {
            [_choiceTitleArray addObject:@""];
        }
    }
    return _choiceTitleArray;
}
-(YP_ChoiceDelegateModel *)delegateModel{
    if (_delegateModel == nil) {
        _delegateModel = [[YP_ChoiceDelegateModel alloc]init];
        self.tableView.delegate = _delegateModel;
        self.tableView.dataSource = _delegateModel;
        _delegateModel.modelArray = [self.viewModel fretchConfigData];
    }
    return _delegateModel;
}

-(YP_ChoiceViewModel *)viewModel{
    if (_viewModel == nil) {
        _viewModel = [[YP_ChoiceViewModel alloc]init];
    }
    return _viewModel;
}

-(UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64 + 41, self.frame.size.width, self.frame.size.height) style:UITableViewStylePlain];
        _tableView.scrollEnabled = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [[UIColor alloc]initWithRed:0 green:0 blue:0 alpha:0];
    }
    return _tableView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
        WS(weakSelf)
        [self.delegateModel cellClick:^(YP_ChoiceModel *model, NSIndexPath *index) {
            if ([model.puchTypeOtherCtro integerValue] == 1) {
                YP_ChioceViewController *vc = [[YP_ChioceViewController alloc]init];
                [vc cellClick:^(NSString *name) {
                    [weakSelf.choiceTitleArray replaceObjectAtIndex:index.row withObject:name];
                    model.detailName = name;
                    [weakSelf.tableView reloadRowsAtIndexPaths:@[index] withRowAnimation:UITableViewRowAnimationFade];
                }];
                vc.title  = model.name;
                [self.viewController.navigationController pushViewController:vc animated:YES];
            }
            [weakSelf.choiceTitleArray replaceObjectAtIndex:index.row withObject:model.detailName];
        }];
        [self.delegateModel buttonClick:^(BOOL clear) {
            if (clear) {
                weakSelf.delegateModel.modelArray = [self.viewModel fretchConfigData];
                [weakSelf.tableView reloadData];
                weakSelf.choiceTitleArray = [[NSMutableArray alloc]initWithArray: @[@"",@"",@"",@""]];
            }else{
                [weakSelf removeSelf];
                !self.buttonClick ? : self.buttonClick(weakSelf.choiceTitleArray);
            }
        }];
    }
    return self;
}


-(void)initUI{
    self.backgroundColor = [[UIColor alloc]initWithRed:0 green:0 blue:0 alpha:0];
    [self addSubview:self.tableView];
    [self addSubview:self.headerButton];
    self.tableView.tableFooterView = self.tableFooterButton;
    self.tableView.contentSize = CGSizeMake(kScreenWidth, kScreenHeight);
}

#pragma MARK --------尾部视图点击方法-------------
-(void)removeSelf{
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

-(void)showWithSuperView:(UIView *)superView{
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 1;
    } completion:^(BOOL finished) {
        [superView addSubview:self];
    }];
}

//修改tableView坐标
-(void)changeTableViewFrame:(CGRect)frame{
    self.headerButton.frame = CGRectMake(0, 0, kScreenWidth, frame.origin.y);
    self.tableView.frame = frame;
}

#pragma mark ------------block--------------
- (void)buttonClick:(void (^)(NSMutableArray *nameArray))buttonClick
{
    self.buttonClick = buttonClick;
}
@end
