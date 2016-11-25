//
//  YP_ChoiceModel.h
//  YP_ChoiseKinds
//
//  Created by 王烨谱 on 2016/11/24.
//  Copyright © 2016年 王烨谱. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YP_ChoiceModel : NSObject

@property(nonatomic, assign)CGFloat height;
@property(nonatomic, strong)NSString *name;//显示的名字
@property(nonatomic, strong)NSString *detailName;//选中之后的名字
@property(nonatomic, strong)NSString *showOpenCollection;//直接显示collectionView
@property(nonatomic, strong)NSString *puchTypeOpenCollectionView;//点击显示collectionView
@property(nonatomic, strong)NSString *puchTypeOtherCtro;//点击跳转下一页面
@property(nonatomic, strong)NSString *nextCtroName;
@property(nonatomic, strong)NSArray *openShowItmes;//显示的下面数组
@property(nonatomic, strong)NSString *multipleChoice;//展示的Itme是否单选


@end

@interface ShowItmes :NSObject

@property(nonatomic, assign)BOOL selected;//是不是选中了
@property(nonatomic, strong)NSString *name;//显示的名字
@property(nonatomic, strong)NSString *openShowUNSelectedImageName;//没有选中的图片
@property(nonatomic, strong)NSString *openItmesSelectedImageName;//选中的图片

@end

