//
//  ViewController.m
//  UICollectionViewBug
//
//  Created by tigor on 23. 09. 13.
//  Copyright (c) 2013 RESONANCA IT d.o.o. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {
    // case A:
    dispatch_async(dispatch_get_main_queue(), ^{
        self.timer = [NSTimer timerWithTimeInterval:0.5 target:self selector:@selector(tick) userInfo:nil repeats:TRUE];
        [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    });
// case B:
//    self.timer = [NSTimer timerWithTimeInterval:0.5 target:self selector:@selector(tick) userInfo:nil repeats:TRUE];
//	[[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    
// case C:
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:<#(BOOL)#>:0.5 target:self selector:@selector(tick) userInfo:nil repeats:TRUE];
}

- (void)tick {
        [self.collectionView reloadData];
}

- (void)viewWillDisappear:(BOOL)animated {
    [_timer invalidate];
    self.timer = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    return [collectionView dequeueReusableCellWithReuseIdentifier:@"aCell" forIndexPath:indexPath];
}
@end
