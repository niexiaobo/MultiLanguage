//
//  ViewController.m
//  多语言
//
//  Created by niexiaobo on 2017/9/26.
//  Copyright © 2017年 niexiaobo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong)UILabel *testLab;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addUIView];
}

/*添加控件*/
- (void)addUIView {
    //测试文本
    self.testLab = [[UILabel alloc]initWithFrame:CGRectMake((self.view.frame.size.width - 200)/2.0, 100, 200, 60)];
    self.testLab.text = NSLocalizedStringFromTable(@"测试文本", @"EnglishLocalize", nil);
    self.testLab.textAlignment = 1;
    [self.view addSubview:self.testLab];
    
    
    //添加切换按钮
    UIButton *chineseBtn = [[UIButton alloc]initWithFrame:CGRectMake((self.view.frame.size.width - 200)/2.0, 200, 200, 60)];
    [chineseBtn setTitle:@"切换语言" forState:0];
    [chineseBtn setTitleColor:[UIColor blueColor] forState:0];
    [chineseBtn addTarget:self action:@selector(exchangeText:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:chineseBtn];
    
    //添加切换按钮
    UIButton *typeBtn = [[UIButton alloc]initWithFrame:CGRectMake((self.view.frame.size.width - 200)/2.0, 300, 200, 60)];
    [typeBtn setTitle:@"手动<->系统" forState:0];
    [typeBtn setTitleColor:[UIColor blueColor] forState:0];
    [typeBtn addTarget:self action:@selector(exchangetypeBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:typeBtn];

}

/*
 改变本地存储数据
 通过NSUserDefaults在沙盒中存入key=appLanguage的字符串,用来判断手动修改的当前语言
 
 注意:本文中只判断中文和英文,加入其它语言需要添加判断
 */
- (void)exchangeText:(UIButton *)sender {
    
    if (![[NSUserDefaults standardUserDefaults] objectForKey:appLanguageType]) {
        NSArray  *languages = [NSLocale preferredLanguages];
        NSString *language = [languages objectAtIndex:0];
        if ([language hasPrefix:@"en"]) {
            [[NSUserDefaults standardUserDefaults] setObject:@"zh-Hans" forKey:appLanguageType];
        }else{
            [[NSUserDefaults standardUserDefaults] setObject:@"en" forKey:appLanguageType];
            
        }
    }
    
    [self showLbl];
}

/*
 切换系统还是手动模式 系统:0 手动:1
 系统:手动设置无效,跟随手机系统语言
 手动:系统设置无效,跟随手动设置语言
 */
- (void)exchangetypeBtn:(UIButton *)sender {
    sender.selected = !sender.selected;
    [sender setTitle:sender.selected ? @"手动" : @"系统" forState:0];
    [[NSUserDefaults standardUserDefaults] setInteger:sender.selected ? 1 : 0 forKey:appLanguageChangeTypeKey];
    
    [self showLbl];
}


/*更新文本*/
- (void)showLbl {
    //这里才是label
    self.testLab.text = XBLocalizedString(@"测试文本");
    
    
    /*
    如果整个系统生效,通过UIApplication重新设置window:
    HomePageController *home = [[HomePageController alloc]init];
    self.window.rootViewController = home;
    [self.window makeKeyAndVisible];
     */
}


/*
1.初始化设置语言
2.在
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions方法中
 
3.注意:本文中只判断中文和英文,加入其它语言需要添加判断
 
 */
- (void)initLanguagesSetting {
    
    //初始化语言
    if (![[NSUserDefaults standardUserDefaults] objectForKey:appLanguageType]) {
        NSArray  *languages = [NSLocale preferredLanguages];
        NSString *language = [languages objectAtIndex:0];
        if ([language hasPrefix:@"en"]) {
            [[NSUserDefaults standardUserDefaults] setObject:@"en" forKey:appLanguageType];
        }else{
            [[NSUserDefaults standardUserDefaults] setObject:@"zh-Hans" forKey:appLanguageType];
        }
    }
    //初始化设置类型
    [[NSUserDefaults standardUserDefaults] setInteger:appLanguageChangeTypeValue != 1 ? 1 : 0 forKey:appLanguageChangeTypeKey];
    
    
}

@end
