//
//  YP_ChioceViewController.m
//  DaBaiCai
//
//  Created by 王烨谱 on 2016/11/24.
//  Copyright © 2016年 大白菜. All rights reserved.
//

#import "YP_ChioceViewController.h"
#import "YP_ChoiceViewModel.h"

@interface YP_ChioceViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, copy) void (^cellClick)(NSString *name);
@property(nonatomic, strong)NSMutableArray *modelArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong)YP_ChoiceViewModel *viewModel;
@end

@implementation YP_ChioceViewController
#pragma mark ------------setting,getting-----------
-(YP_ChoiceViewModel *)viewModel{
    if (_viewModel== nil) {
        _viewModel = [[YP_ChoiceViewModel alloc]init];
    }
    return _viewModel;
}

-(NSMutableArray *)modelArray{
    if(_modelArray == nil){
        _modelArray = [NSMutableArray new];
    }
    return _modelArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self requestData];
    
    
    // Do any additional setup after loading the view from its nib.
}

-(void)requestData{
    WS(weakSelf)
    [self.viewModel setBlockWithReturnBlock:^(id returnValue, ListDataStatus returnStatus) {
        NSArray *dataArray = returnValue;
        [weakSelf.modelArray addObjectsFromArray:dataArray];
        [weakSelf.tableView reloadData];
    } WithErrorBlock:^(ListDataStatus errorCode) {
        
    } WithShowMsgBlock:^(id msgCode) {
        
    } WithFailureBlock:^(ListDataStatus state) {
        
    } withHadMoreBlock:^(BOOL hadMore) {
        
    }];
    [self.viewModel fretchKindAreaNetworkData];
}

#pragma mark -------------UITableViewDelegate,UITableViewDataSource------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.modelArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView  dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.modelArray[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    !self.cellClick ? : self.cellClick(self.modelArray[indexPath.row]);
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark ------------block--------------
- (void)cellClick:(void (^)(NSString *name))callBack
{
    self.cellClick = callBack;
}
@end
