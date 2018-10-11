//
//  MEBItemSelectEntity.h
//  erpboss
//
//  Created by 李鑫 on 2018/7/31.
//  Copyright © 2018年 Meituan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MEBItemSelectEntity : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) BOOL isSelect;

- (instancetype)initWithTitle:(NSString *)title;

@end
