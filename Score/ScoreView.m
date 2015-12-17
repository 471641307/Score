//
//  ScoreView.m
//  Score
//
//  Created by Strai on 15/12/16.
//  Copyright © 2015年 泛华金融. All rights reserved.
//

#import "ScoreView.h"

@interface ScoreView (){
    float angle; /**初始角度 */
    int time; /**<次数 */
    float maxTime; /**<最大次数 */
    NSTimer *timer;
    UILabel *scoreLabel;
    int addingScore;
}

@end
@implementation ScoreView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        angle = 3.9; //对应起点0的角度
        UIImageView *backImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 500/2.0, 434/2.0)];
        backImageView.center = CGPointMake(self.center.x, backImageView.center.y);
        backImageView.image = [UIImage imageNamed:@"quan"];
        [self addSubview:backImageView];
        
        _arrowView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 358/2.0, 358/2.0)];
        _arrowView.image = [UIImage imageNamed:@"jiantou"];
        _arrowView.center = CGPointMake(backImageView.center.x, backImageView.center.y + 16.5);
        [self addSubview:_arrowView];
        CGAffineTransform transform = CGAffineTransformMakeRotation(M_PI * 1.24);
        _arrowView.transform = transform;
        
        scoreLabel = [[UILabel alloc] initWithFrame:_arrowView.frame];
        scoreLabel.backgroundColor = [UIColor clearColor];
        scoreLabel.textAlignment = NSTextAlignmentCenter;
        scoreLabel.font = [UIFont systemFontOfSize:20];
        scoreLabel.text = @"0";
        [self addSubview:scoreLabel];
    }
    return self;
}

- (void)timerFire{
    timer = [NSTimer scheduledTimerWithTimeInterval: 0.01 target:self selector:@selector(transformAction) userInfo: nil repeats: YES];
}

- (void)setScore:(int)score{
    _score = score;
    [self setMaxAngle];
}

- (void)setMaxAngle{
    if (_score >= 0 && _score < 420) {
        maxTime = _score / (420 / (1.57 / 0.015));
    }
    
    if (_score >= 420 && _score < 600) {
        maxTime = (_score - 420) / (180 / (1.57 / 0.01)) + 1.57 / 0.015;
    }
    
    if (_score >= 600 && _score <= 750) {
        maxTime = (_score - 600) / (150 / (1.57 / 0.007)) + 1.57 / 0.01 + 1.57 / 0.015;
    }
}

- (void)transformAction{
    if (angle >= 3.9 + 1.57 * 3 || time >= maxTime) {
        [timer invalidate];
        scoreLabel.text = [NSString stringWithFormat:@"%@",@(_score)];
        return;
    }
    
    if (angle >= 3.9 && angle < 3.9 + 1.57) {  //1圈=3.14*2  4分之一圈=1.57
        angle = angle + 0.015;
        addingScore = addingScore + (420 / (1.57 / 0.015));
    }
    
    if (angle >= 3.9 + 1.57 && angle < 3.9 + 1.57 * 2) {
        if (addingScore < 420) {
            addingScore = 420;
        }
        angle = angle + 0.01;
        addingScore = addingScore + (180 / (1.57 / 0.01));
    }
    
    if (angle >= 3.9 + 1.57 * 2 && angle < 3.9 + 1.57 * 3) {
        if (addingScore < 600) {
            addingScore = 600;
        }
        angle = angle + 0.007;
//        addingScore = addingScore + (150 / (1.57 / 0.007));
        if(time % 2 == 0){
            addingScore ++;
        }
    }

    scoreLabel.text = [NSString stringWithFormat:@"%@",@(addingScore)];
    time ++;
    CGAffineTransform transform = CGAffineTransformMakeRotation(angle);
    _arrowView.transform = transform;
    
}
@end
