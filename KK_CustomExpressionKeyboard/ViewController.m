//
//  ViewController.m
//  KK_CustomExpressionKeyboard
//
//  Created by Kaka on 2017/2/16.
//  Copyright © 2017年 Kaka. All rights reserved.
//

#import "ViewController.h"
#import "LZBKeyBoardToolEmojiBar.h"
@interface ViewController ()

@property (nonatomic, strong) UILabel *textLabel;
@property (nonatomic, strong) LZBKeyBoardToolEmojiBar *keyboardView ;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.keyboardView];
    [self.view addSubview:self.textLabel];
    self.textLabel.frame = CGRectMake(0, 50, [UIScreen mainScreen].bounds.size.width, 300);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

#pragma mark - lazy
- (LZBKeyBoardToolEmojiBar *)keyboardView
{
    if(_keyboardView == nil)
    {
        __weak typeof(self) weakSelf = self;
        _keyboardView = [LZBKeyBoardToolEmojiBar showKeyBoardWithConfigToolBarHeight:0 sendTextCompletion:^(NSString *sendText) {
            weakSelf.textLabel.text = sendText;
        }];
        [_keyboardView  setInputViewPlaceHolderText:@"请输入文字"];
    }
    return _keyboardView;
}

- (UILabel *)textLabel
{
    if(_textLabel == nil)
    {
        _textLabel = [UILabel new];
        _textLabel.textAlignment = NSTextAlignmentCenter;
        _textLabel.textColor = [UIColor redColor];
        _textLabel.text = @"显示输入框输入文字";
        _textLabel.numberOfLines = 0;
    }
    return _textLabel;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
