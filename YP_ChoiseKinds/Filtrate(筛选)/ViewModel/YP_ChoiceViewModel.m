//
//  YP_ChoiceViewModel.m
//  YP_ChoiseKinds
//
//  Created by 王烨谱 on 2016/11/24.
//  Copyright © 2016年 王烨谱. All rights reserved.
//

#import "YP_ChoiceViewModel.h"
#import "YP_ChoiceModel.h"
#import "YYModel.h"

@implementation YP_ChoiceViewModel


-(NSMutableArray *)fretchConfigData{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"choiceView.plist" ofType:nil];
    NSMutableDictionary *dataDic = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    return [self processConfigData:dataDic];
}

- (NSMutableArray *)processConfigData:(NSDictionary *)dataDic{
    NSMutableArray *modelArray = [NSMutableArray new];
    NSMutableArray *dataArray = dataDic[@"purchaseType"];
    for (NSMutableDictionary *choiceDic in dataArray) {
        YP_ChoiceModel *model = [YP_ChoiceModel yy_modelWithDictionary:choiceDic];
        model.detailName = @"";
        model.height = 44;
        NSMutableArray *itmesArray = [NSMutableArray new];
        NSArray *openShowItmesArray = choiceDic[@"openShowItmes"];
        for (NSDictionary *itmeDic in openShowItmesArray) {
            ShowItmes *itme = [ShowItmes yy_modelWithDictionary:itmeDic];
            [itmesArray addObject:itme];
        }
        model.openShowItmes = itmesArray;
        [modelArray addObject:model];
    }
    return modelArray;
}

-(void)fretchKindAreaNetworkData{
    NSArray *dataArray = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"11",@"12"];
    !self.returnBlock ? : self.returnBlock(dataArray,ListDataStatusHadData);
}
@end
