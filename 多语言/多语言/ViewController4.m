//
//  ViewController4.m
//  多语言
//
//  Created by niexiaobo on 2017/9/26.
//  Copyright © 2017年 niexiaobo. All rights reserved.
//

#import "ViewController4.h"

@interface ViewController4 ()

@end

@implementation ViewController4

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *testLab = [[UILabel alloc]initWithFrame:self.view.bounds];
    testLab.text = @"草莓";
    testLab.textAlignment = 1;
    [self.view addSubview:testLab];
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

@end
