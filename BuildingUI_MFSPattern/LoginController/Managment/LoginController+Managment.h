//
//  LoginController+Managment.h
//  BuildingUI_MFSPattern
//
//  Created by Uber on 12/01/2021.
//  Copyright © 2021 Mobile. All rights reserved.
//

#import "LoginController.h"

NS_ASSUME_NONNULL_BEGIN

@interface LoginController (Managment)

- (void) prepareUI;
- (void) removeSubviews;
- (void) initSubviews:(LoginViewModel*)viewModel;
- (void) updateStyles:(LoginViewModel*)viewModel;
- (void) bindDataFrom:(LoginViewModel*)viewModel;
- (void) resizeSubviews:(LoginViewModel*)viewModel;
- (void) addSubviewsToSuperView;

@end

NS_ASSUME_NONNULL_END
