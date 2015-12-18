//
//  ScoreView.h
//  Score
//
//  Created by Strai on 15/12/16.
//  Copyright © 2015年 泛华金融. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScoreView : UIView
@property (nonatomic, strong) UIImageView *arrowView;
@property (nonatomic) int score; /**<分数 */

- (void)timerFire;
- (void)reset;
@end
