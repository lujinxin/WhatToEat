//
//  ViewController.m
//  WhatToEat
//
//  Created by 陆金鑫 on 16/8/12.
//  Copyright © 2016年 陆金鑫. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController {
    
    NSMutableArray *_foodArr;
    NSTimer *_timer;
    int _resultId;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    _foodArr = [NSArray arrayWithObjects:@"屎", @"屎", @"屎", @"屎", @"不吃了！", @"不吃了！", @"不吃了！", @"不吃了！", @"黄焖鸡", @"炒面", @"拉面", @"热干面", @"馄饨", @"凉皮儿", @"炸鸡", @"肯德基", @"刀削面", @"肉夹馍", @"米线", @"杂酱面", @"烤肉", @"烤冷面", @"烤鸭", @"火锅", @"川菜", @"驴肉火烧", @"油泼面", @"泡面", @"烩面", @"螺蛳粉", @"麻辣烫", @"饺子", @"盖饭", @"撸串", @"羊蝎子", @"小龙虾", @"海鲜", @"炒饭", @"炒饼", @"羊蝎子", nil];
    
    //从 plist 文件中获取
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"Menu" ofType:@"plist"];
    _foodArr = [[NSMutableArray alloc] initWithContentsOfFile:plistPath];
    
    _checkButton.target = self;
    _checkButton.action = @selector(checkBtnAct:);
    
    
}


- (IBAction)checkBtnAct:(id)sender {
    
    _tipLabel.stringValue = @"今天吃什么，吃什么？";
    
    [_timer invalidate];
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.04 target:self selector:@selector(gogogo) userInfo:nil repeats:YES];
    
    [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSDefaultRunLoopMode];
    
    
}


- (void)gogogo {
    
    _resultId = arc4random() % _foodArr.count;
    _resultLabel.stringValue = _foodArr[_resultId];
    
}


- (IBAction)stopBtnAct:(id)sender {
    
    if (_resultId >= 0 && _resultId <= 7) {
        _tipLabel.stringValue = @"没错！你没看错！确实是屎！";
    } else if (_resultId >= 8 && _resultId <= 15){
        _tipLabel.stringValue = @"爱吃不吃！";
    } else {
        _tipLabel.stringValue = @"就这么愉快地决定了！";
    }
    
    [_timer invalidate];
    _timer = nil;
    
    
}





- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

@end
