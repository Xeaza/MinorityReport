//
//  ViewController.m
//  MinorityReport
//
//  Created by Taylor Wright-Sanson on 10/2/14.
//  Copyright (c) 2014 Taylor Wright-Sanson. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UILabel *theFutureLabel;
@property (weak, nonatomic) IBOutlet UILabel *thePreCogs;
@property CGPoint originalCenterPoint;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.originalCenterPoint = self.theFutureLabel.center;
}

- (IBAction)onDrag:(UIPanGestureRecognizer *)panGesture {
    CGPoint point = [panGesture locationInView:self.view];
    self.theFutureLabel.center = point;

    if (panGesture.state == UIGestureRecognizerStateEnded) {
        [UIView animateWithDuration:1.0 animations:^{
            self.theFutureLabel.center = self.originalCenterPoint;
        }];
    }
    else {
        if (CGRectContainsPoint(self.thePreCogs.frame, point)) {
            self.theFutureLabel.backgroundColor = [UIColor redColor];
            self.theFutureLabel.text = @"A ficticious and incriminating future";
            [self.theFutureLabel sizeToFit];
        }
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
