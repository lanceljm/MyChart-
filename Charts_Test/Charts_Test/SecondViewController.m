//
//  SecondViewController.m
//  Charts_Test
//
//  Created by ljm on 2017/7/14.
//  Copyright © 2017年 ljm. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = RGB(201, 236, 121);
 
    [self setupUI];

}

- (void) setupUI
{
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH / 3, 45)];
    btn.center = self.view.center;
    btn.backgroundColor = RGB(96, 197, 248);
    [btn setTitle:@"退出" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void) btnClicked
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"确定退出？" preferredStyle:UIAlertControllerStyleAlert];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
       textField.placeholder = @"请输入密码";
    }];
    UIAlertAction *alertion = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
        exit(0);
    }] ;

    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alert addAction:alertion];
    [alert addAction:cancel];
    
    [self presentViewController:alert animated:YES completion:nil];
}

@end
