//
//  ViewController.m
//  KKNotificationCenter
//
//  Created by Annie Lee on 2019/1/30.
//  Copyright © 2019 Annie Lee. All rights reserved.
//

#import "ViewController.h"
#import "KKNotificationCenter.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addButtons];
}

- (void)addButtons {
    
    UIButton *addButton = [[UIButton alloc] initWithFrame:CGRectMake(150, 150, 150, 100)];
    [addButton setTitle:@"ADD" forState:normal];
    [addButton setTitleColor:[UIColor darkGrayColor] forState:normal];
    [self.view addSubview:addButton];
    [addButton addTarget:self action:@selector(addKKNotification) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *postButton = [[UIButton alloc] initWithFrame:CGRectMake(150, 350, 150, 100)];
    [postButton setTitle:@"POST" forState:normal];
    [postButton setTitleColor:[UIColor blueColor] forState:normal];
    [self.view addSubview:postButton];
    [postButton addTarget:self action:@selector(postKKNotification) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *removeButton = [[UIButton alloc] initWithFrame:CGRectMake(150, 550, 150, 100)];
    [removeButton setTitle:@"REMOVE" forState:normal];
    [removeButton setTitleColor:[UIColor redColor] forState:normal];
    [self.view addSubview:removeButton];
    [removeButton addTarget:self action:@selector(removeKKNotification) forControlEvents:UIControlEventTouchUpInside];
}

- (void)addKKNotification {
    
    NSLog(@"ADD");
    
    [[KKNotificationCenter defaultCenter] addObserver:self selector:@selector(getKKNotification) name:@"ANNIE_TEST" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getNSNotification) name:@"ANNIE_TEST" object:nil];
}

- (void)postKKNotification {
    
    NSLog(@"POST");

    NSNotification *notification = [[NSNotification alloc] initWithName:@"ANNIE_TEST" object:self userInfo:nil];
    
    [[KKNotificationCenter defaultCenter] postNotification:notification];
    
    [[NSNotificationCenter defaultCenter] postNotification:notification];
}

- (void)removeKKNotification {
    
    NSLog(@"REMOVE");
    
    [[KKNotificationCenter defaultCenter] removeObserver:self];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)getKKNotification {
    
    NSLog(@"KKKKKK");
}

- (void)getNSNotification {
    
    NSLog(@"NSNSNS");
}

@end
