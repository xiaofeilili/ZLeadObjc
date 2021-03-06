//
//  ZLShopTopView.m
//  ZLead
//
//  Created by dmy on 2019/5/25.
//  Copyright © 2019 Beijing tai chi HuaQing information systems co., LTD. All rights reserved.
//

#import "ZLShopTopView.h"

@interface ZLShopTopView ()
@property (nonatomic, strong) UIImageView *shopLogo;
@property (nonatomic, strong) UILabel *shopNameLabel;
@property (nonatomic, strong) UIButton *shopChangeButton;
@property (nonatomic, strong) UIButton *notificationButton;
@end

@implementation ZLShopTopView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];

    }
    return self;
}

- (void)setupViews {
    self.shopLogo = [[UIImageView alloc] initWithFrame:CGRectMake(15, 10, 46, 46)];
    self.shopLogo.backgroundColor = [UIColor colorWithHexString:@"#E76B00"];
    self.shopLogo.layer.cornerRadius = 23;
    self.shopLogo.layer.masksToBounds = YES;
    [self addSubview:self.shopLogo];
    
    self.shopNameLabel = [[UILabel alloc] init];
    self.shopNameLabel.text = @"店铺名称";
    self.shopNameLabel.font = [UIFont boldSystemFontOfSize:15];
    [self addSubview:self.shopNameLabel];
    
    self.shopChangeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.shopChangeButton.backgroundColor = [UIColor redColor];
    [self.shopChangeButton addTarget:self action:@selector(changeShopButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.shopChangeButton];
    
    
    self.notificationButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:self.notificationButton];
    
    [self settingSubViewsLayout];
}

- (void)settingSubViewsLayout {
    __weak __typeof(self) weakSelf = self;
//    CGFloat rightSpace = ScreenWidth - 46;
//    [self.shopLogo mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(weakSelf).offset(10);
//        make.left.equalTo(weakSelf).offset(15);
////        make.right.equalTo(weakSelf).offset(-rightSpace);
//        make.height.mas_equalTo(46).priorityHigh();
//        make.width.mas_equalTo(46).priorityHigh();
//    }];
    
    
    [self.shopNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.shopLogo);
        make.left.equalTo(self.shopLogo.mas_right).offset(2);
        make.width.mas_lessThanOrEqualTo(120);
        make.height.mas_equalTo(45);
        make.centerY.equalTo(weakSelf.shopLogo);
    }];
    
    [self.shopChangeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.shopNameLabel.mas_right).offset(2);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(40);
        make.centerY.equalTo(self.shopLogo);
    }];
    
    
    [self.notificationButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-25);
        make.height.mas_equalTo(16);
        make.width.mas_equalTo(20);
        make.top.equalTo(self.shopLogo.mas_top).offset(4);
    }];
    
}

#pragma mark - UIButton Actions

- (void)changeShopButtonAction {
    if (self.changeShopBlock) {
        self.changeShopBlock();
    }
}

@end
