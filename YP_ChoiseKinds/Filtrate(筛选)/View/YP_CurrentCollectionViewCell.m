//
//  YP_CurrentCollectionViewCell.m
//  YP_ChoiseKinds
//
//  Created by 王烨谱 on 2016/11/24.
//  Copyright © 2016年 王烨谱. All rights reserved.
//

#import "YP_CurrentCollectionViewCell.h"
#import "YP_ChoiceModel.h"

@interface YP_CurrentCollectionViewCell()

@end

@implementation YP_CurrentCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.titleLabel.layer.cornerRadius = self.titleLabel.frame.size.height/2;
    self.titleLabel.layer.borderColor = [UIColor orangeColor].CGColor;
    self.titleLabel.layer.borderWidth = 1;
    self.titleLabel.layer.masksToBounds = YES;
    
    // Initialization code
}

//初始化CELL
+ (instancetype)cell
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] lastObject];
}

-(void)upDataUIViewWithModel:(ShowItmes *)model{
    self.titleLabel.text = model.name?model.name:@"";
    if (model.selected) {
        self.titleLabel.layer.borderColor = [UIColor colorWithString:@"#f57f17"].CGColor;
        self.titleLabel.textColor = [UIColor colorWithString:@"#f57f17"];
        self.titleLabel.layer.masksToBounds = YES;
    }else{
        self.titleLabel.layer.borderColor = [UIColor colorWithString:@"#999999"].CGColor;
        self.titleLabel.textColor = [UIColor colorWithString:@"#999999"];
        self.titleLabel.layer.masksToBounds = YES;
    }
}
@end
