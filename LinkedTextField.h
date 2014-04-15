//
//  LinkedTextField.h
//  ReadMyStori
//
//  Created by Swapnil Luktuke
//

#import <UIKit/UIKit.h>

@class LinkedTextField;

@protocol LinkeTexFieldDelegate <NSObject>

/**
 * linkedTextFieldDidBecomeFirstResponder is called when the text field becomes first responder
 * this can be useful for making changes in UI to accomodate for keyboard
 *
 */
-(void)linkedTextFieldDidBecomeFirstResponder:(LinkedTextField *)linkedTextField;

@end


/**
 *LinkedTextField provides an accessory view for the keyboard with a done button to dismiss the keyboard
 * In addition, it provides two IBOutlets nextTextField and previousTextField which when available can be navigated between using the 'Next' and 'Previous' button on the keyboard accessory
 *
 */


@interface LinkedTextField : UITextField

@property(strong, nonatomic) IBOutlet id<LinkeTexFieldDelegate> linkedTextFieldDelegate;

@property (strong, nonatomic) IBOutlet UITextField *nextTextField, *previousTextField;

-(void)returnTapped;

@end



@interface LinkedTextFieldAccessoryView : UIToolbar

-(id)initWithLinkedTextField:(LinkedTextField *)textField;

@end