//
//  YP_ChoiceViewModel.h
//  YP_ChoiseKinds
//
//  Created by 王烨谱 on 2016/11/24.
//  Copyright © 2016年 王烨谱. All rights reserved.
//

#import "ViewModelClass.h"
@class YP_ChoiceModel;

@interface YP_ChoiceViewModel : ViewModelClass

-(NSMutableArray *)fretchConfigData;

-(void)fretchKindAreaNetworkData;//根据城市返回数据

@end
