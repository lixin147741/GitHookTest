//
//  MEBCollectionItemCell.m
//  Test
//
//  Created by 李鑫 on 2018/7/31.
//  Copyright © 2018年 李鑫. All rights reserved.
//

#import "MEBCollectionItemCell.h"
#import "MEBItemSelectEntity.h"

#define HEXCOLOR(hexValue)              [UIColor colorWithRed : ((CGFloat)((hexValue & 0xFF0000) >> 16)) / 255.0 green : ((CGFloat)((hexValue & 0xFF00) >> 8)) / 255.0 blue : ((CGFloat)(hexValue & 0xFF)) / 255.0 alpha : 1.0]

@interface MEBCollectionItemCell ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIView *bottomShortLine;

@end

@implementation MEBCollectionItemCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)configWithEntity:(MEBItemSelectEntity *)entity {
    self.titleLabel.text = entity.title;
    self.titleLabel.textColor = entity.isSelect ? HEXCOLOR(0xFF6633) : HEXCOLOR(0x333333);
    self.bottomShortLine.hidden = !entity.isSelect;
}

- (void)setupViews {
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.bottomShortLine];
    
    self.titleLabel.frame = self.contentView.bounds;
    self.bottomShortLine.frame = CGRectMake(0, self.contentView.bounds.size.height - 2, self.contentView.bounds.size.width, 2);
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = HEXCOLOR(0x333333);
        _titleLabel.font = [UIFont systemFontOfSize:16 weight:UIFontWeightMedium];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

- (UIView *)bottomShortLine {
    if (!_bottomShortLine) {
        _bottomShortLine = [[UIView alloc] init];
        _bottomShortLine.backgroundColor = HEXCOLOR(0xFF6633);
    }
    return _bottomShortLine;
}

@end
