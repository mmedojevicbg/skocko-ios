//
//  HiddenCollectionViewDelegate.h
//  Skocko
//
//  Created by Marko Digital on 4/19/14.
//  Copyright (c) 2014 BeoApps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HiddenCollectionViewDelegate : UICollectionViewCell <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) NSArray *hidden;
@end
