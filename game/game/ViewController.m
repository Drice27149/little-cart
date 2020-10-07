//
//  ViewController.m
//  game
//
//  Created by 陈连章 on 2020/10/2.
//  Copyright © 2020 陈连章. All rights reserved.
//

#include "ViewController.h"
#include "implementation.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Hero* hero[15];
    generateHero(hero);
    int size = 11;
    int round = 10;
    for(int rnd = 0; rnd < round; rnd++){
        int a = arc4random_uniform(size)+1;
        int b = arc4random_uniform(size)+1;
        if(a==b) b = (b+1)%size+1;
        pickTwoAndFight(hero[a],hero[b]);
    }
}


@end
