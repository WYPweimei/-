//
//  ViewModelClass.h
//  Scaffold
//
//  Created by ceshi on 16/9/13.
//  Copyright © 2016年 Ly. All rights reserved.
//

#import <Foundation/Foundation.h>
//定义返回请求数据的block类型
typedef void (^ReturnValueBlock) (id returnValue , ListDataStatus returnStatus);
typedef void (^ErrorCodeBlock) (ListDataStatus errorCode);
typedef void (^ShowMsgBlock) (id msgCode);
typedef void (^FailBlock)(ListDataStatus state);
//typedef void (^NetWorkBlock)(BOOL netConnetState);∫

// 扩展
typedef void (^HadMoreBlock)(BOOL hadMore);

@interface ViewModelClass : NSObject

@property(nonatomic, strong)NSMutableArray *modelArray;//存储的model数组

@property (strong, nonatomic) ReturnValueBlock returnBlock;//正确返回
@property (strong, nonatomic) ErrorCodeBlock errorBlock;//错误
@property (strong, nonatomic) ShowMsgBlock msgBlock;//提示信息
@property (strong, nonatomic) FailBlock failureBlock;//没有获取到数据返回
@property (strong, nonatomic) HadMoreBlock hadMoreBlock;//是否有更多数据

// 传入交互的Block块
-(void)setBlockWithReturnBlock: (ReturnValueBlock) returnBlock
                 WithErrorBlock: (ErrorCodeBlock) errorBlock
              WithShowMsgBlock: (ShowMsgBlock)msgBlock
               WithFailureBlock: (FailBlock) failureBlock;


// 传入交互的Block块
//-(void)setBlockWithReturnBlock: (ReturnValueBlock) returnBlock
//                WithErrorBlock: (ErrorCodeBlock) errorBlock
//              WithFailureBlock: (FailBlock) failureBlock;


// 扩展
-(void)setBlockWithReturnBlock: (ReturnValueBlock) returnBlock
                WithErrorBlock: (ErrorCodeBlock) errorBlock
              WithShowMsgBlock: (ShowMsgBlock)msgBlock
              WithFailureBlock: (FailBlock) failureBlock
              withHadMoreBlock: (HadMoreBlock)hadMore;

//将错误网络返回文字转换成网络状态
-(ListDataStatus)exchangeNetErrorStringTOStatusWithString:(NSString *)error;
@end
