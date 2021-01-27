//
//  LoginViewModel.h
//  BuildingUI_MFSPattern
//
//  Created by Uber on 12/01/2021.
//  Copyright © 2021 Mobile. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoginViewModel : NSObject

@property (nonatomic, strong) NSString* imageName;
@property (nonatomic, strong) NSString* signInBtnTitle;
@property (nonatomic, strong) NSString* signUpBtnTitle;

#pragma mark - Actions

- (void) signUpBtnAction;
- (void) signInBtnAction;

#pragma mark - Initialization

+ (LoginViewModel*) defaultMockup;

#pragma mark - Helpers
/*--------------------------------------------------------------------------------------------------------------
 Compares data models for identity.
 --------------------------------------------------------------------------------------------------------------*/
- (BOOL) isEqualToModel:(LoginViewModel*)object;


@end

NS_ASSUME_NONNULL_END
