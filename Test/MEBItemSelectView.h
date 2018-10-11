//
//  MEBItemSelectView.h
//  erpboss
//
//  Created by 李鑫 on 2018/7/31.
//  Copyright © 2018年 Meituan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MEBItemSelectEntity.h"

@interface MEBItemSelectView : UIView

- (instancetype)initWithItems:(NSArray<MEBItemSelectEntity *> *)items;

@end
