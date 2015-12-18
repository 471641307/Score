//
//  ViewController.m
//  Score
//
//  Created by Strai on 15/12/16.
//  Copyright © 2015年 泛华金融. All rights reserved.
//

#import "ViewController.h"
#import "ScoreView.h"

#define kScreenWith [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController (){
    ScoreView *scoreView;
    UITextField *scoreField;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    scoreView = [[ScoreView alloc] initWithFrame:CGRectMake(0, 20, kScreenWith, 200)];
    [self.view addSubview:scoreView];
    
    scoreField = [[UITextField alloc] initWithFrame:CGRectMake(0, 260, 150, 45)];
    scoreField.center = CGPointMake(self.view.center.x/2.0, scoreField.center.y);
    scoreField.placeholder = @"请输入分数";
    scoreField.keyboardType = UIKeyboardTypeNumberPad;
    scoreField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    scoreField.layer.borderWidth = 1;
    [self.view addSubview:scoreField];
    
    UIButton *submitBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 260, 150, 45)];
    [submitBtn setTitle:@"提交" forState:UIControlStateNormal];
    submitBtn.backgroundColor = [UIColor blueColor];
    submitBtn.center = CGPointMake(self.view.center.x + self.view.center.x/2.0, submitBtn.center.y);
    [submitBtn addTarget:self action:@selector(timerFireAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:submitBtn];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

#pragma mark - action
- (void)timerFireAction:(id)sender{
    [scoreView reset];
    if (scoreField.text && [scoreField.text integerValue] > 0 && [scoreField.text integerValue] <= 750 ) {
        scoreView.score = [scoreField.text intValue];
        [scoreView timerFire];
    }
}

@end
