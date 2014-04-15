//
//  LinkedTextField.m
//  ReadMyStori
//
//  Created by Swapnil Luktuke
//

#import "LinkedTextField.h"

@interface LinkedTextField ()

@end

@implementation LinkedTextField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setUpInutAccessoryView];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        [self setUpInutAccessoryView];
    }
    return self;
}


-(void)setUpInutAccessoryView {
    self.inputAccessoryView = [[LinkedTextFieldAccessoryView alloc] initWithLinkedTextField:self];
}


-(void)returnTapped {
    if(self.nextTextField) {
        [self.nextTextField becomeFirstResponder];
    }
    else {
        [self resignFirstResponder];
    }
}


-(BOOL)becomeFirstResponder {
    if([super canBecomeFirstResponder]) {
        if([self.linkedTextFieldDelegate respondsToSelector:@selector(linkedTextFieldDidBecomeFirstResponder:)]) {
            [self.linkedTextFieldDelegate linkedTextFieldDidBecomeFirstResponder:self];
        }
    }
    return [super becomeFirstResponder];
}

@end



@interface LinkedTextFieldAccessoryView ()

@property (strong, nonatomic) LinkedTextField *textField;

-(void)next;
-(void)previous;
-(void)done;

@end

@implementation LinkedTextFieldAccessoryView

-(id)initWithLinkedTextField:(LinkedTextField *)textField {
    self = [super init];
    if(self) {
        [self setBarStyle:UIBarStyleBlackTranslucent];
        [self sizeToFit];
        self.textField = textField;
        
        NSMutableArray *itemsArray = [NSMutableArray array];
        
        
//        if(textField && textField.previousTextField) {
            UIBarButtonItem *previousButton = [[UIBarButtonItem alloc] initWithTitle:@"Prev" style:UIBarButtonItemStyleBordered target:self action:@selector(previous)];
            [itemsArray addObject:previousButton];
//        }
        
//        if(textField && textField.nextTextField) {
            UIBarButtonItem *nextButton = [[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStyleBordered target:self action:@selector(next)];
            [itemsArray addObject:nextButton];
//        }
        
        UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        [itemsArray addObject:flexibleSpace];
        
        UIBarButtonItem *doneButton =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(done)];
        [itemsArray addObject:doneButton];

//        NSArray *itemsArray = [NSArray arrayWithObjects:previousButton, nextButton, flexibleSpace, doneButton, nil];
        
        [self setItems:itemsArray];
    }
    return self;
}


-(void)next {
    if(self.textField && self.textField.nextTextField) {
        [self.textField.nextTextField becomeFirstResponder];
    }
}

-(void)previous {
    if(self.textField && self.textField.previousTextField) {
        [self.textField.previousTextField becomeFirstResponder];
    }
}

-(void)done {
    if(self.textField) {
        [self.textField resignFirstResponder];
    }
}


@end

