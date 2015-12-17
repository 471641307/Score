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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    ScoreView *scoreView = [[ScoreView alloc] initWithFrame:CGRectMake(0, 100, kScreenWith, 400)];
    scoreView.score = 430;
    [scoreView timerFire];
    [self.view addSubview:scoreView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
