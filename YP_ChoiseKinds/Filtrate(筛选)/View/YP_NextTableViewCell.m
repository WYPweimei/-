//
//  YP_NextTableViewCell.m
//  YP_ChoiseKinds
//
//  Created by 王烨谱 on 2016/11/24.
//  Copyright © 2016年 王烨谱. All rights reserved.
//

#import "YP_NextTableViewCell.h"
#import "YP_ChoiceModel.h"

@interface YP_NextTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;

@end

@implementation YP_NextTableViewCell

//初始化CELL
+ (instancetype)cell
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] lastObject];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

-(void)upDataUIViewWithModel:(YP_ChoiceModel *)model{
    self.titleLabel.text = model.name?model.name:@"";
    self.detailLabel.text = model.detailName?model.detailName:@"";
}
@end
