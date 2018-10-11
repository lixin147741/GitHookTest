//
//  MEBItemSelectEntity.m
//  erpboss
//
//  Created by 李鑫 on 2018/7/31.
//  Copyright © 2018年 Meituan. All rights reserved.
//

#import "MEBItemSelectEntity.h"

@implementation MEBItemSelectEntity

- (instancetype)initWithTitle:(NSString *)title {
    self = [super init];
    if (self) {
        self.title = title;
        self.isSelect = NO;
    }
    return self;
}

@end
