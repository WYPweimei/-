//
//  ViewController.m
//  YP_ChoiseKinds
//
//  Created by 王烨谱 on 2016/11/24.
//  Copyright © 2016年 王烨谱. All rights reserved.
//

#import "ViewController.h"
#import "YP_TopView.h"
#import "YP_ChoiceView.h"
// 获取设备屏幕的物理尺寸
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
@interface ViewController ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollViewContentWidthCons;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet YP_TopView *topView;
@property (nonatomic, strong)YP_ChoiceView *choiceView;


@end

@implementation ViewController

-(YP_ChoiceView *)choiceView{
    if (_choiceView == nil) {
        _choiceView = [[YP_ChoiceView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    }
    return _choiceView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scrollViewContentWidthCons.constant = 1000;
    self.topView.backColor = [UIColor redColor];
    self.topView.titleArr = @[@"sadas",@"sadas",@"sadas",@"sadas",@"sadas",@"sadas",@"sadas",@"sadas",@"sadas",@"sadas"];
    self.topView.titleFont = [UIFont systemFontOfSize:14];
    [self.topView TapBlcokAction:^(UITapGestureRecognizer *tap) {
        
    }];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)FiltrateAction:(UIButton *)sender {
    [self.choiceView showWithSuperView:self.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
