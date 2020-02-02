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

//Cell的初始化
+(instancetype)cellWithTableView:(UITableView *)tableView messageModel:(MessageModel *)model{
    
    static NSString *identifier=@"WeChatCell";

    WeChatCell *cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    //cell的重用
    if (cell==nil)
    {
        cell=[[WeChatCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier messageModel:model];
    }
    return cell;
}

//获取文本高度
+(CGFloat)tableHeightWithModel:(MessageModel *)model
{
    
    CGFloat masTop=10;
    if (model.showMessageTime)
    {
        masTop=37;
    }
    if (model.messageType==MessageTypeText)
    {
        CGFloat maxWith=AppFrameWidth-leftWith-rightWith-14-12-4;
        
        UIFont *textFont=[UIFont fontWithName:@"PingFangSC-Regular" size:16];
        
        NSDictionary *attributes=@{NSFontAttributeName:textFont};
        CGRect rect=[model.messageText boundingRectWithSize:CGSizeMake(maxWith, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];//计算
        
        return rect.size.height+26+masTop+20;
    }
    else if (model.messageType==MessageTypeImage)
    {
        CGSize cgsize=[self imageShowSize:model.imageSmall];
        return 40+cgsize.height+20;
    }
    return 0;
}

//自定义cell
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
    }//遍历移除默认的cell组件
    
    CGFloat masTop=10;
    
    if (model.showMessageTime)
    {
        masTop=37;
        
        //设置时间标签
        UILabel *timeLabel=[[UILabel alloc] init];
        
        timeLabel.font=[UIFont fontWithName:@"PingfangSC-Regular" size:10];
        timeLabel.backgroundColor=[UIColor colorWithRed:0.6 green:0.5 blue:1 alpha:0.2];
        timeLabel.textColor=[UIColor whiteColor];
        timeLabel.text=model.messageTime;
        timeLabel.textAlignment=NSTextAlignmentCenter;//居中
        
        timeLabel.layer.masksToBounds=YES;
        timeLabel.layer.cornerRadius=4;//圆角
        timeLabel.layer.borderColor=(__bridge CGColorRef _Nullable)([UIColor colorWithRed:0.6 green:0.5 blue:1 alpha:0.5]);
        timeLabel.layer.borderWidth=1;
        [self.contentView addSubview:timeLabel];
    }
        
    else {
        ;
    }
    //文本框图片
        UIImageView *contextBack=[[UIImageView alloc] init];
        contextBack.userInteractionEnabled=YES;
        
        self.coversImageView=[[UIImageView alloc] init];
        self.coversImageView.userInteractionEnabled=YES;
        
        
       

        
        
        if (model.messageType==MessageTypeText)
        {
            if (model.messageSenderType==MessageSenderTypeZN)
            {
                //头像
                CGFloat maxWith=AppFrameWidth-leftWith-rightWith-14-12-4;
                UIImageView *logoImage=[[UIImageView alloc] init];
                logoImage.frame=CGRectMake(10, masTop, 60, 60);
                UIImage *u1=[UIImage imageNamed:@"1.png"];
                [logoImage setImage:u1];
                [self.contentView addSubview:logoImage];
                
                
                UIFont *textFont=[UIFont fontWithName:@"PingFangSC-Regular" size:16];
                
                NSDictionary *attributes=@{NSFontAttributeName:textFont};
                
                //消息文本框
                CGRect rect=[model.messageText boundingRectWithSize:CGSizeMake(maxWith, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
                //参数1:提供尺寸 宽度自适应高度
                //参数2:自适应设置（以行为矩形区域自适应，以字体字形自适应）
                //参数3:文字属性 通常是字体大小(要用字典存）
                //参数4:绘制上下文 做底层排版时用，填nil
                contextBack.frame=CGRectMake(leftWith, masTop, rect.size.width+26, rect.size.height+26);
                contextBack.image=[[UIImage imageNamed:@"4"] stretchableImageWithLeftCapWidth:10 topCapHeight:25];
                [self.contentView addSubview:contextBack];
                
                
                //消息文字
                UILabel *textMessageLabel=[[UILabel alloc] init];
                textMessageLabel.frame=CGRectMake(leftWith+12, masTop+14, rect.size.width, rect.size.height);
                textMessageLabel.numberOfLines=0;
                textMessageLabel.lineBreakMode=NSLineBreakByWordWrapping;
                textMessageLabel.font=textFont;
                textMessageLabel.textColor=[UIColor colorWithRed:0.5 green:0.6 blue:1 alpha:0.8];
                textMessageLabel.text=model.messageText;
                [self.contentView addSubview:textMessageLabel];
            }
            
            else if (model.messageSenderType==MessageSenderTypeUser)
            {
                //头像
                CGFloat maxWith=AppFrameWidth-leftWith-rightWith-14-12-4;
                
                UIImageView *logoImage=[[UIImageView alloc] init];
                logoImage.frame=CGRectMake(AppFrameWidth-10-60, masTop, 60, 60);
                [logoImage setImage:[UIImage imageNamed:@"2"]];
                [self.contentView addSubview:logoImage];
                
                
                UIFont *textFont=[UIFont fontWithName:@"PingFangSC-Regular" size:16];
                NSDictionary *attributes=@{NSFontAttributeName:textFont};
                
                CGRect rect=[model.messageText boundingRectWithSize:CGSizeMake(maxWith, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
                
                
                contextBack.frame=CGRectMake(AppFrameWidth-(rect.size.width+26)-leftWith+12, masTop, rect.size.width+26, rect.size.height+26);
                contextBack.image=[[UIImage imageNamed:@"3"] stretchableImageWithLeftCapWidth:10 topCapHeight:25];
                [self.contentView addSubview: contextBack];
                
                
                UILabel *textMessageLabel=[[UILabel alloc] init];
                textMessageLabel.frame=CGRectMake(AppFrameWidth-(rect.size.width+26)-leftWith+12, masTop+14, rect.size.width, rect.size.height);
                textMessageLabel.numberOfLines=0;
                textMessageLabel.lineBreakMode=NSLineBreakByWordWrapping;
                textMessageLabel.font=textFont;
                textMessageLabel.textColor=[UIColor colorWithRed:0.5 green:0.6 blue:1 alpha:0.8];
                textMessageLabel.text=model.messageText;
                [self.contentView addSubview:textMessageLabel];

            }
        }
        else if (model.messageType==MessageTypeImage)
        {
            if (model.messageSenderType==MessageSenderTypeZN)
            {
                UIImageView *logoImage=[[UIImageView alloc] init];
                logoImage.frame=CGRectMake(10, masTop, 60, 60);
                [logoImage setImage:[UIImage imageNamed:@"1"]];
                [self.contentView addSubview:logoImage];
                
                
                CGSize imageSize=[WeChatCell imageShowSize:model.imageSmall];
                
                UIImageView *imageViewMask=[[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"5"]stretchableImageWithLeftCapWidth:10 topCapHeight:25]];
                
                imageViewMask.frame=CGRectMake(0, 0, imageSize.width, imageSize.height);
                contextBack.frame=CGRectMake(leftWith, masTop, imageSize.width, imageSize.height);
                contextBack.image=model.imageSmall;
                contextBack.layer.mask=imageViewMask.layer;
                [self.contentView addSubview:contextBack];
            }
            
            else if(model.messageSenderType==MessageSenderTypeUser)
            {
                UIImageView *logoImage=[[UIImageView alloc] init];
                logoImage.frame=CGRectMake(AppFrameWidth-10-40, masTop, 40, 40);
                [logoImage setImage:[UIImage imageNamed:@"2"]];
                [self.contentView addSubview:logoImage];
                
                CGSize imageSize=[WeChatCell imageShowSize:model.imageSmall];
                
                UIImageView *imageViewMask=[[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"6"]stretchableImageWithLeftCapWidth:10 topCapHeight:25]];
                
                imageViewMask.frame=CGRectMake(0, 0, imageSize.width, imageSize.height);
                

                contextBack.frame=CGRectMake(AppFrameWidth-leftWith-imageSize.width, masTop, imageSize.width, imageSize.height);
                
                contextBack.image=model.imageSmall;
                contextBack.layer.mask=imageViewMask.layer;
                [self.contentView addSubview:imageViewMask];
                
            }
        }
        //长按事件
        UILongPressGestureRecognizer *longPressGesture=[[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressBubbleView:)];
        [contextBack addGestureRecognizer:longPressGesture];
        
        UITapGestureRecognizer *singleTap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap1:)];
        UITapGestureRecognizer *doubleTap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTap:)];
        [doubleTap setNumberOfTapsRequired:2];
        [singleTap requireGestureRecognizerToFail:doubleTap];
        [contextBack addGestureRecognizer:doubleTap];
        [contextBack addGestureRecognizer:singleTap];
        
        self.coversImageView.frame=contextBack.frame;
        
        if (model.messageSenderType==MessageSenderTypeZN)
        {
            self.coversImageView.image=[[UIImage imageNamed:@"4"]stretchableImageWithLeftCapWidth:10 topCapHeight:25];
        }
        
        else
        {
            self.coversImageView.image=[[UIImage imageNamed:@"3"]stretchableImageWithLeftCapWidth:10 topCapHeight:25];
        }
        
        [self.contentView addSubview:self.coversImageView];
        self.coversImageView.hidden=YES;
        
        UITapGestureRecognizer *singleTap2=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap2:)];
        [self.coversImageView addGestureRecognizer:singleTap2];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(menuControllerWillHidden:) name:UIMenuControllerWillHideMenuNotification object:nil];
    
    return self;
}
                                                                                                                                                                                                                                                                                            

//获取图片尺寸
+(CGSize)imageShowSize:(UIImage *)image
{
    CGFloat imageWide=image.size.width;
    CGFloat imageHeight=image.size.height;
    
    if (imageWide>=imageHeight)//宽度大于高度
    {
        return CGSizeMake(MAX_IMAGE_WH, imageHeight*MAX_IMAGE_WH/imageWide);
    }
    
    else
    {
        return CGSizeMake(imageWide*MAX_IMAGE_WH/imageHeight, MAX_IMAGE_WH);
    }
    
    return CGSizeZero;
}

//长按后的阴影
-(void)longPressBubbleView:(UILongPressGestureRecognizer *)sender
{
    if (sender.state==UIGestureRecognizerStateBegan)
    {
        [self showMenuControllerInView:self bgView:sender.view];
    }
}

//设置menuController
-(void)showMenuControllerInView:(WeChatCell *)inView bgView:(UIView *)supView
{
    
    self.coversImageView.hidden=NO;
    [self becomeFirstResponder];
    
    MessageModel *messageModel=self.messageModel;
    
    UIMenuItem *copyTextItem1=[[UIMenuItem alloc] initWithTitle:@"复制" action:@selector(copyTextSender1:)];
    UIMenuItem *deleteTextItem2=[[UIMenuItem alloc] initWithTitle:@"删除" action:@selector(deleteTextSender2:)];
    UIMenuItem *saveTextItem3=[[UIMenuItem alloc] initWithTitle:@"保存" action:@selector(saveTextSender3:)];
    UIMenuItem *selectTextItem4=[[UIMenuItem alloc] initWithTitle:@"多选" action:@selector(selectTextSender4:)];
    
    UIMenuController *menu=[UIMenuController sharedMenuController];
    
    [menu setTargetRect:supView.frame inView:inView];
    [menu setArrowDirection:UIMenuControllerArrowDefault];
    
    if (messageModel.messageType==MessageTypeText)
    {
        [menu setMenuItems:@[copyTextItem1,deleteTextItem2,selectTextItem4]];
    }
    else if(messageModel.messageType==MessageTypeImage)
    {
        [menu setMenuItems:@[copyTextItem1,deleteTextItem2,saveTextItem3,selectTextItem4]];
    }
    
    [menu setMenuVisible:YES animated:YES];
}


//剪贴板
-(BOOL)canBecomeFirstResponder
{
    return YES;
}

-(BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    if (action==@selector(copyTextSender1:))
        return true;
    else if(action==@selector(deleteTextSender2:))
        return true;
    else
        return false;
}


-(void)copyTextSender1:(id)sender
{
    //UIPasteboard *pasteBoard=[UIPasteboard generalPasteboard];
    
}

-(void)deleteTextSender2:(id)sender
{
    
}

-(void)saveTextSender3:(id)sender
{
    
}
-(void)selectTextSender4:(id)sender
{
    
}

-(void)copyImaggeSender:(id)sender
{
    //UIImageWriteToSavedPhotosAlbum(<#UIImage * _Nonnull image#>, <#id  _Nullable completionTarget#>, <#SEL  _Nullable completionSelector#>, <#void * _Nullable contextInfo#>)
}

-(void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
}


-(void)handleSingleTap1:(id)sender
{
    
}

-(void)handleSingleTap2:(id)sender
{
    
}

-(void)handleDoubleTap:(id)sender
{
    
}

-(void)menuControllerWillHidden:(id)sender
{
    if (!self.coversImageView.isHidden) {
        self.coversImageView.hidden=YES;
    }
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
