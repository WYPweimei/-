//
//  YP_CurrentTableViewCell.m
//  YP_ChoiseKinds
//
//  Created by 王烨谱 on 2016/11/24.
//  Copyright © 2016年 王烨谱. All rights reserved.
//

#import "YP_CurrentTableViewCell.h"
#import "YP_CurrentCollectionViewCell.h"
#import "YP_ChoiceModel.h"
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
@interface YP_CurrentTableViewCell()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>

@property (nonatomic, strong) YP_ChoiceModel *model;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) UICollectionViewFlowLayout *layout;//布局类
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (nonatomic, copy) void (^cellClick)(YP_ChoiceModel *model);


@end

@implementation YP_CurrentTableViewCell

#pragma mark -------------------setting,getting-------------------
-(UICollectionViewFlowLayout *)layout{
    if (_layout == nil) {
        _layout = [[UICollectionViewFlowLayout alloc]init];
        _layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _layout.minimumLineSpacing = 0;
        _layout.minimumInteritemSpacing = 0;
    }
    return _layout;
}

-(CGFloat)height{//返回当前的高度
    NSInteger row;
    if (self.model.openShowItmes.count%4 == 0) {
        row = self.model.openShowItmes.count/4;
    }else{
        row = self.model.openShowItmes.count/4 + 1;
    }
    return 44 + 5 + 5 + row * 44;
}
//初始化CELL
+ (instancetype)cell
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] lastObject];
}

- (void)awakeFromNib {
    [super awakeFromNib];

    [self configCollectionView];
    // Initialization code
}

-(void)configCollectionView{
    self.collectionView.collectionViewLayout = self.layout;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.pagingEnabled = YES;
    UINib *nib = [UINib nibWithNibName:NSStringFromClass([YP_CurrentCollectionViewCell class]) bundle:nil];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:NSStringFromClass([YP_CurrentCollectionViewCell class])];
}

#pragma mark ----------UICollectionViewDelegateFlowLayout,UICollectionViewDataSource---------------
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.model.openShowItmes.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    YP_CurrentCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([YP_CurrentCollectionViewCell class]) forIndexPath:indexPath];
    if (cell == nil) {
        cell = [YP_CurrentCollectionViewCell cell];
    }
    ShowItmes *model = self.model.openShowItmes[indexPath.row];
    [cell upDataUIViewWithModel:model];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    ShowItmes *model = self.model.openShowItmes[indexPath.row];
    if (self.model.multipleChoice) {
        for (int i = 0; i < self.model.openShowItmes.count; i ++) {
            ShowItmes *allModel = self.model.openShowItmes[i];
            if (i != indexPath.row) {
               allModel.selected = NO;
            }else{
               allModel.selected = YES;
            }
        }
        if (model.selected) {
            self.model.detailName = model.name;
        }else{
            self.model.detailName = @"";
        }
        !self.cellClick ? : self.cellClick(self.model);
        [self.collectionView reloadData];
        return;
    }
    if (model.selected) {
        model.selected = NO;
    }else{
        model.selected = YES;
    }
    if (model.selected) {
        self.model.detailName = model.name;
    }else{
        self.model.detailName = @"";
    }
    !self.cellClick ? : self.cellClick(self.model);
    [self.collectionView reloadItemsAtIndexPaths:@[indexPath]];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGSize size = CGSizeMake((kScreenWidth- 10)/4, 44);
    return size;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

-(void)upDataUIViewWithModel:(YP_ChoiceModel *)model{
    self.model = model;
    self.titleLabel.text = model.name?model.name:@"";
    [self.collectionView reloadData];
}

#pragma mark ------------block--------------
- (void)cellClick:(void (^)(YP_ChoiceModel *model))callBack
{
    self.cellClick = callBack;
}

@end
