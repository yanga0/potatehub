//
//  NewPostViewController.m
//  potatohub
//
//  Created by Yan Gao on 7/28/15.
//  Copyright (c) 2015 ___THOUGHTWORKS___. All rights reserved.
//

#import "NewPostViewController.h"
#import "Toast/UIView+Toast.h"
#import <AVOSCloud/AVObject.h>

@interface NewPostViewController ()
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *publishButton;
@property (weak, nonatomic) IBOutlet UITextField *postTitle;
@property (weak, nonatomic) IBOutlet UITextView *postDescription;
@property (weak, nonatomic) IBOutlet UITextField *bidStart;
@property (weak, nonatomic) IBOutlet UISwitch *postOnlyInGroups;

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
    }
    if ([((UIButton *)sender).titleLabel.text  isEqualToString: @"发布"]) {
        AVObject *post = [AVObject objectWithClassName:@"Post"];
        [post setObject:self.postTitle.text forKey:@"title"];
        [post setObject:self.postDescription.text forKey:@"content"];
        [post setObject:[NSNumber numberWithFloat:[self.bidStart.text floatValue]] forKey:@"bidStart"];
        [post setObject:[NSMutableArray array] forKey:@"photoUrls"];
        [post setObject:@"secondHand" forKey:@"postType"];
        [post setObject:[NSNumber numberWithBool: self.postOnlyInGroups.enabled] forKey:@"onlyInGroups"];
        [post save];
        [self.view makeToast:@"发布成功！" duration:1 position: [NSValue valueWithCGPoint:self.postDescription.center]];
//        [self.view ];
    }
}


@end
