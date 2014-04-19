//
//  ViewController.h
//  Skocko
//
//  Created by Marko Digital on 2/15/14.
//  Copyright (c) 2014 BeoApps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


@property (weak, nonatomic) IBOutlet UICollectionView *collectionViewChoices;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionViewResults;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionViewHidden;
@property (weak, nonatomic) IBOutlet UIButton *buttonChoice1;
@property (weak, nonatomic) IBOutlet UIButton *buttonChoice2;
@property (weak, nonatomic) IBOutlet UIButton *buttonChoice3;
@property (weak, nonatomic) IBOutlet UIButton *buttonChoice4;
@property (weak, nonatomic) IBOutlet UIButton *buttonChoice5;
@property (weak, nonatomic) IBOutlet UIButton *buttonChoice6;
@property (weak, nonatomic) IBOutlet UIButton *buttonReset;

@end
