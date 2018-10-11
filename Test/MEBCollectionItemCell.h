//
//  MEBCollectionItemCell.h
//  Test
//
//  Created by 李鑫 on 2018/7/31.
//  Copyright © 2018年 李鑫. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MEBItemSelectEntity;



@interface MEBCollectionItemCell : UICollectionViewCell

- (void)configWithEntity:(MEBItemSelectEntity *)entity;

@end
