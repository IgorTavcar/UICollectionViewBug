//
//  ViewController.h
//  UICollectionViewBug
//
//  Created by tigor on 23. 09. 13.
//  Copyright (c) 2013 RESONANCA IT d.o.o. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end
