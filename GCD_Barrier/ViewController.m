//
//  ViewController.m
//  GCD_Barrier
//
//  Created by Jney on 2017/7/28.
//  Copyright © 2017年 Jney. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

/**
 GCD中的dispatch_barrier_async函数的使用(栅栏函数)
 */
- (IBAction)cgd_barrier:(UIButton *)sender {
    
    /**
     珊栏函数的作用
     珊栏函数(dispatch_barrier_async)后面的任务必定在珊栏函数前面的任务同时完成之后才被执行
     珊栏函数前后的任务都是异步执行的
     */
    //创建一个队列
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        NSLog(@"任务一");
    });
    dispatch_async(queue, ^{
        NSLog(@"任务二");
    });
    dispatch_async(queue, ^{
        NSLog(@"任务三");
    });
    dispatch_async(queue, ^{
        NSLog(@"任务四");
    });
    dispatch_async(queue, ^{
        NSLog(@"任务五");
    });
    dispatch_barrier_async(queue, ^{
        NSLog(@"以上任务全部执行完毕,现在执行特定任务");
    });
    dispatch_async(queue, ^{
        NSLog(@"特殊任务之后一");
    });
    dispatch_async(queue, ^{
        NSLog(@"特殊任务之后二");
    });
    dispatch_async(queue, ^{
        NSLog(@"特殊任务之后三");
    });
    dispatch_async(queue, ^{
        NSLog(@"特殊任务之后四");
    });
    dispatch_async(queue, ^{
        NSLog(@"特殊任务之后五");
    });
}

/**
 dispatch_group_notify使用,常用与当所有异步请求完成后执行某项任务
 */
- (IBAction)gcd_group:(UIButton *)sender {
    
    ///创建一个队列组
    dispatch_group_t group = dispatch_group_create();
    //创建一个队列
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_async(group, queue, ^{
        NSLog(@"执行任务一");
    });
    dispatch_group_async(group, queue, ^{
        NSLog(@"执行任务二");
    });
    dispatch_group_async(group, queue, ^{
        NSLog(@"执行任务三");
    });
    dispatch_group_async(group, queue, ^{
        NSLog(@"执行任务四");
    });
    dispatch_group_async(group, queue, ^{
        NSLog(@"执行任务五");
    });
    dispatch_group_async(group, queue, ^{
        NSLog(@"执行任务六");
    });

    //当提交到队列dispatch_queue_t queue上的所有任务执行完毕时会执行dispatch_group_notify里的dispatch_block_t block的代码
    dispatch_group_notify(group, queue, ^{
        NSLog(@"以上任务全部执行完毕,现在执行特定任务");
    });
}


@end
