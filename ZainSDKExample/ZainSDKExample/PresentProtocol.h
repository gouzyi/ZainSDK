//
//  PresentProtocol.h
//  ZainSDKExample
//
//  Created by zainguo on 2020/3/9.
//  Copyright © 2020 zainguo. All rights reserved.
//

#ifndef PresentProtocol_h
#define PresentProtocol_h

@protocol PersonDelegate <NSObject>

@required

@optional
- (void)didClickButtonWithNum:(NSString *_Nullable)num indexPath:(NSIndexPath *_Nonnull)indexPath;

@end


#endif /* PresentProtocol_h */
