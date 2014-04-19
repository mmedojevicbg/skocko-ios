//
//  ChoicesCollectionViewDelegate.h
//  Skocko
//
//  Created by Marko Digital on 4/16/14.
//  Copyright (c) 2014 BeoApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface ChoicesCollectionViewDelegate : NSObject  <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) NSArray *choices;
@end
