//
//  YP_ChoiceTableSectionFooterView.m
//  YP_ChoiseKinds
//
//  Created by 王烨谱 on 2016/11/24.
//  Copyright © 2016年 王烨谱. All rights reserved.
//

#import "YP_ChoiceTableSectionFooterView.h"

@interface YP_ChoiceTableSectionFooterView()
@property (nonatomic, copy) void (^buttonClick)(BOOL clear);

@property (weak, nonatomic) IBOutlet UIButton *reSetButton;//重置按钮
@property (weak, nonatomic) IBOutlet UIButton *sureButton;//确定按钮

@end

@implementation YP_ChoiceTableSectionFooterView

-(void)awakeFromNib{
    [super awakeFromNib];
    self.reSetButton.layer.borderColor = [UIColor colorWithString:@"#666666"].CGColor;
    self.reSetButton.layer.borderWidth = 0.5;
    self.reSetButton.layer.cornerRadius = 5;
    self.reSetButton.layer.masksToBounds = YES;
    
    self.sureButton.layer.cornerRadius = 5;
    self.sureButton.layer.masksToBounds = YES;
}

//初始化CELL
+ (instancetype)cell
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] lastObject];
}

#pragma mark ---------xibAction-----------
- (IBAction)reSetAction:(UIButton *)sender {//重置
    !self.buttonClick ? : self.buttonClick(YES);
}
- (IBAction)sureAction:(UIButton *)sender {//确定
    !self.buttonClick ? : self.buttonClick(NO);
}


#pragma mark ------------block--------------
- (void)buttonClick:(void (^)(BOOL clear))buttonClick
{
    self.buttonClick = buttonClick;
}
@end
