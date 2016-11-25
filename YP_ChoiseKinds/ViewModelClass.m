//
//  ViewModelClass.m
//  Scaffold
//
//  Created by ceshi on 16/9/13.
//  Copyright © 2016年 Ly. All rights reserved.
//

#import "ViewModelClass.h"

@implementation ViewModelClass

-(NSMutableArray *)modelArray{
    if (_modelArray == nil) {
        _modelArray = [NSMutableArray new];
    }
    return _modelArray;
}


#pragma 接收穿过来的block
-(void)setBlockWithReturnBlock: (ReturnValueBlock) returnBlock
                WithErrorBlock: (ErrorCodeBlock) errorBlock
              WithShowMsgBlock: (ShowMsgBlock)msgBlock
              WithFailureBlock: (FailBlock) failureBlock

{
    _returnBlock = returnBlock;
    _errorBlock = errorBlock;
    _failureBlock = failureBlock;
    _msgBlock = msgBlock;
}

-(void) setBlockWithReturnBlock: (ReturnValueBlock) returnBlock
                 WithErrorBlock: (ErrorCodeBlock) errorBlock
               WithFailureBlock: (FailBlock) failureBlock
{
    _returnBlock = returnBlock;
    _errorBlock = errorBlock;
    _failureBlock = failureBlock;
}

// 扩展
-(void)setBlockWithReturnBlock: (ReturnValueBlock) returnBlock
                WithErrorBlock: (ErrorCodeBlock) errorBlock
              WithShowMsgBlock: (ShowMsgBlock)msgBlock
              WithFailureBlock: (FailBlock) failureBlock
              withHadMoreBlock: (HadMoreBlock)hadMore{
    _returnBlock = returnBlock;
    _errorBlock = errorBlock;
    _failureBlock = failureBlock;
    _msgBlock = msgBlock;
    _hadMoreBlock = hadMore;
}


-(ListDataStatus)exchangeNetErrorStringTOStatusWithString:(NSString *)error{
    ListDataStatus status;
    if ([error isEqualToString:kNetworkStatusServerBusyMessage]) {
        status = ListDataStatusFailedNoData;
    }else if([error isEqualToString:kNetworkStatusNoNetworkMessage]){
        status = ListDataStatusFailedNoNetwork;
    }else if([error isEqualToString:kNetworkStatusTimeOutMessage]){
        status = ListDataStatusFailedTimeOut;
    }else{
        status = ListDataStatusFailedTimeOut;
    }
    return status;
}
@end
