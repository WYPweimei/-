//
//  YP_CurrentCollectionViewCell.h
//  YP_ChoiseKinds
//
//  Created by 王烨谱 on 2016/11/24.
//  Copyright © 2016年 王烨谱. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YP_ChoiceModel.h"
@interface YP_CurrentCollectionViewCell : UICollectionViewCell

+ (instancetype)cell;

-(void)upDataUIViewWithModel:(ShowItmes *)model;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;


@end
