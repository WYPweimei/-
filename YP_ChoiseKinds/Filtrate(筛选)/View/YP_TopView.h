//
//  YP_TopView.h
//  YP_ChoiseKinds
//
//  Created by 王烨谱 on 2016/11/24.
//  Copyright © 2016年 王烨谱. All rights reserved.
//
#import <UIKit/UIKit.h>

typedef void(^TapBlcok) (UITapGestureRecognizer *tap);

@interface YP_TopView : UIView

@property (nonatomic, copy)TapBlcok tapBlock;
@property(nonatomic, strong)NSArray *titleArr;//文字数组
@property(nonatomic, strong)UIColor *backColor;//背景颜色
@property(nonatomic, strong)UIFont *titleFont;//文字的font
@property(nonatomic, assign)NSInteger viewTag;//点击的试图tag

- (instancetype)initWithFrame:(CGRect)frame
                     titleArr:(NSArray *)titleArr
                    backColor:(UIColor *)backColor
                    titleFont:(UIFont *)titleFont;


-(void)TapBlcokAction:(TapBlcok)block;

@end
