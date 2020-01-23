//
//  WeChatCell.m
//  killcoldness
//
//  Created by ios group on 2020/1/20.
//  Copyright © 2020年 s. All rights reserved.
//

#import "WeChatCell.h"
#import "MessageModel.h"

@implementation WeChatCell

+(instancetype)cellWithTableView:(UITableView *)tableView messageMode:(MessageModel *)model
{
    static NSString *identifier=@"WeChatCell";

    WeChatCell *cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    //
    if (cell==nil)
    {
        cell=[[WeChatCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier messageModel:model];
    }
    return cell;
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier messageModel:(MessageModel*)model
{
    
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self)
    {
        self.selectionStyle=UITableViewCellSelectionStyleNone;
        self.messageModel=model;
    }
    
    for(UIView *view in [self.contentView subviews])
    {
        [view removeFromSuperview];
    }//遍历移除默认的cell
    
    CGFloat masTop=10;
    

    if (model.showMessageTime)
    {
        masTop=37;
        UILabel *timeLabel=[[UILabel alloc] init];
        
        timeLabel.font=[UIFont fontWithName:@"AppleGothic" size:10];
        timeLabel.backgroundColor=[UIColor colorWithRed:0.6 green:0.5 blue:1 alpha:0.2];
        timeLabel.textColor=[UIColor whiteColor];
        timeLabel.text=model.messageTime;
        timeLabel.textAlignment=NSTextAlignmentCenter;//居中
        
        timeLabel.layer.masksToBounds=YES;
        timeLabel.layer.cornerRadius=4;
        timeLabel.layer.borderColor=(__bridge CGColorRef _Nullable)([UIColor colorWithRed:0.6 green:0.5 blue:1 alpha:0.5]);
        timeLabel.layer.borderWidth=1;
        [self.contentView addSubview:timeLabel];
        
        UIImageView *contextBack=[[UIImageView alloc] init];
        contextBack.userInteractionEnabled=YES;
        
        self.coversImageView=[[UIImageView alloc] init];
        self.coversImageView.userInteractionEnabled=YES;
        
        if (model.messageType==MessageTypeText)
        {
            if (model.messageSenderType==MessageSenderTypeZN)
            {
                UIImageView *logoImage=[[UIImageView alloc] init];
                logoImage.frame=CGRectMake(10, masTop, 40, 40);
                UIImage *u1=[UIImage imageNamed:@"1.png"];
                [logoImage setImage:u1];
                [self.contentView addSubview:logoImage];
                
                
            }
        }
    }
    
    
    
    
    return self;
}
                                                                                                                                                                                                                                                                                            


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
