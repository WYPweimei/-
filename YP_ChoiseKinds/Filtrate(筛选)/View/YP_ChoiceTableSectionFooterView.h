//
//  YP_ChoiceTableSectionFooterView.h
//  YP_ChoiseKinds
//
//  Created by 王烨谱 on 2016/11/24.
//  Copyright © 2016年 王烨谱. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YP_ChoiceTableSectionFooterView : UIView

+ (instancetype)cell;

- (void)buttonClick:(void (^)(BOOL clear))buttonClick;

@end
