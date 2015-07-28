//
//  NewPostViewController.m
//  potatohub
//
//  Created by Yan Gao on 7/28/15.
//  Copyright (c) 2015 ___THOUGHTWORKS___. All rights reserved.
//

#import "NewPostViewController.h"

@interface NewPostViewController ()
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *publishButton;

@end

@implementation NewPostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)buttonClicked:(id)sender {
    if ([((UIButton *)sender).titleLabel.text  isEqualToString: @"取消"]) {
        [self.view maskView];
    }
    if ([((UIButton *)sender).titleLabel.text  isEqualToString: @"发布"]) {
    }
}


@end
