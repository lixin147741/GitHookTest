//
//  ViewController.m
//  Test
//
//  Created by 李鑫 on 2018/7/19.
//  Copyright © 2018年 李鑫. All rights reserved.
//

#import "ViewController.h"
#import "MEBCollectionItemCell.h"
#import "MEBItemSelectEntity.h"
#import "MEBItemSelectView.h"
#import "Masonry.h"
#import "RACSubject.h"
#import "RACSignal+Operations.h"
#import "RACScheduler.h"


@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    RACSubject *s1 = [RACSubject subject];
    RACSubject *s2 = [RACSubject subject];
    
    [[s1 deliverOn:[RACScheduler scheduler]] subscribeNext:^(id x) {
        sleep(5);
        NSLog(@"a");
    }];
    [[s2 deliverOn:[RACScheduler scheduler]] subscribeNext:^(id x) {
        NSLog(@"b");
    }];

    
    [s1 sendNext:nil];
    [s2 sendNext:nil];
    
//    [self buildCollectionView];
}

- (void)buildCollectionView {
    MEBItemSelectEntity *entity1 = [[MEBItemSelectEntity alloc] initWithTitle:@"带客"];
    MEBItemSelectEntity *entity2 = [[MEBItemSelectEntity alloc] initWithTitle:@"提效"];
    MEBItemSelectEntity *entity3 = [[MEBItemSelectEntity alloc] initWithTitle:@"服务"];
    MEBItemSelectView *itemSelectView = [[MEBItemSelectView alloc] initWithItems:@[entity1, entity2, entity3]];
    
    [self.view addSubview:itemSelectView];
    itemSelectView.backgroundColor = [UIColor blueColor];
    
    [itemSelectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.view);
        make.trailing.equalTo(self.view);
        make.top.equalTo(self.view).offset(20);
        make.height.equalTo(@44);
    }];
}


@end
