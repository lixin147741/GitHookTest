//
//  MEBItemSelectView.m
//  erpboss
//
//  Created by 李鑫 on 2018/7/31.
//  Copyright © 2018年 Meituan. All rights reserved.
//

#import "MEBItemSelectView.h"
#import "MEBCollectionItemCell.h"
#import "Masonry.h"

#define ISIPhoneX ([UIScreen mainScreen].bounds.size.height == 812)
#define MEBNavHeight (ISIPhoneX?88:64)

@interface MEBItemSelectView () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *itemSelectCollection;
@property (nonatomic, copy) NSArray<MEBItemSelectEntity *> *items;

@end

@implementation MEBItemSelectView

- (instancetype)initWithItems:(NSArray<MEBItemSelectEntity *> *)items {
    self = [super init];
    if (self) {
        [self setupSubviews];
        self.items = items;

        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.itemSelectCollection reloadData];
        });
    }
    return self;
}

- (void)setupSubviews {
    [self addSubview:self.itemSelectCollection];
    
    self.itemSelectCollection.frame = CGRectMake(0, 20, 360, 44);
    [self.itemSelectCollection mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self).offset(15);
        make.trailing.equalTo(self).offset(-15);
        make.top.equalTo(self).offset(MEBNavHeight-44);
        make.bottom.equalTo(self);
    }];
    [self setNeedsLayout];
    [self setNeedsDisplay];
    [self layoutSubviews];
}

- (UICollectionView *)itemSelectCollection {
    if (!_itemSelectCollection) {
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _itemSelectCollection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _itemSelectCollection.backgroundColor = [UIColor greenColor];
        [_itemSelectCollection registerClass:[MEBCollectionItemCell class] forCellWithReuseIdentifier:@"MEBCollectionItemCell"];
        _itemSelectCollection.delegate = self;
        _itemSelectCollection.dataSource = self;
    }
    return _itemSelectCollection;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.items.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MEBCollectionItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MEBCollectionItemCell" forIndexPath:indexPath];
    
    
    [cell configWithEntity:self.items[indexPath.row]];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(40, 50);
}

- (NSArray *)items {
    if (!_items) {
        _items = [NSArray array];
    }
    return _items;
}

@end
