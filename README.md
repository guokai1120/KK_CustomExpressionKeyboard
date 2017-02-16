# KK_CustomExpressionKeyboard

1.借鉴代码 LBZKeyBoardView
2.用于评论可以回复表情的键盘
3.用法：直接将LZBKeyBoardView文件夹拖入工程
4.调用：参考viewController

@property (nonatomic, strong) UILabel *textLabel;
@property (nonatomic, strong) LZBKeyBoardToolEmojiBar *keyboardView ;


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
