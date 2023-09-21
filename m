Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DCFCE7D0A2
	for <soc@archiver.kernel.org>; Thu, 21 Sep 2023 20:25:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 538D5C433CB; Thu, 21 Sep 2023 20:25:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C70BC433C8;
	Thu, 21 Sep 2023 20:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695327907;
	bh=Edia7usUSi6tMGLQlsnG94o1xfqKLbWGIvtTbnC+Mrw=;
	h=Date:From:To:List-Id:Cc:Subject:In-Reply-To:References:From;
	b=jXd/2OVypONgfqKW/S/C/qd6oPaWFcNI2F4fIrwN94+qx4Nwx7aAHfO08fBvJLi2E
	 6B1btUfa5I+7GGy7T4zt9X8/RcXKQ3VuAUwyKMe/ywRMHJz0Kfm6WM2EDZBDM45bKE
	 6VpwuUJF9w5YiEQMo8+7I2pwvjtwhXCQdhqf7XRNAur/FU8Tvd07P+OZv0+5tvXhHs
	 KJgwduGYMFlR4ZrhLdtAqTG8SYVBWds4GNlITMrOUlUq3wpcdkkiI21nCQSmzXRqDe
	 hmsWigkdBka1Iue/oftFeu1PXouAX7OfByry2K8/D+7LEl9nbPUI75vHGqYjslnhaD
	 e/SG27Z/ONi9w==
Date: Thu, 21 Sep 2023 22:25:01 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Andy Shevchenko <andy@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Arnd Bergmann
 <arnd@arndb.de>, soc@kernel.org, arm@kernel.org, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 3/7] platform: cznic: turris-omnia-mcu: Add support
 for MCU connected GPIOs
Message-ID: <20230921222453.4b3bdb4c@thinkpad>
In-Reply-To: <ZQwS/DXBt/kyyU5r@smile.fi.intel.com>
References: <20230919103815.16818-1-kabel@kernel.org>
	<20230919103815.16818-4-kabel@kernel.org>
	<ZQmbd211FzPjA97r@smile.fi.intel.com>
	<20230920190818.50b2018b@dellmb>
	<ZQwS/DXBt/kyyU5r@smile.fi.intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello Andy,

On Thu, 21 Sep 2023 12:55:08 +0300
Andy Shevchenko <andy@kernel.org> wrote:

> > checkpatch warns: 
> >   ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP  
> 
> So, fix checkpatch then. It has false positives, because it doesn't know
> if the actual error code will sneak outside the kernel or not. But in
> the subsystem we internally use ENOTSUPP.

I will change it, sorry, checkpatch warning confused me.

> > > > +	rising = reply[0] | (reply[2] << 8) | (reply[4] << 16) |
> > > > +		 (reply[6] << 24);
> > > > +	falling = reply[1] | (reply[3] << 8) | (reply[5] << 16) |
> > > > +		  (reply[7] << 24);    
> > > 
> > > With a help of two masks, you can access to the both edges as to
> > >   64-bit value and simplify the code.  
> > 
> > Huh? As in
> >   rising = reply & 0x00ff00ff00ff00ff;
> >   falling = reply & 0xff00ff00ff00ff00;
> > ?
> > But then I can't or the rising bit with the corresponding falling bit
> > to get pending...
> > Or I guess i can with:
> >   pending = rising & (pending >> 8);
> > 
> > Am I understanding you correctly?
> > 
> > But then I would need to store the mask in driver data as a 64-bit
> > value with half the data not used. Also the CPU is 32-bit.  
> 
> If you use proper bitmaps, perhaps this will be easier. You can use one for
> each and merge them whenever you want (with bitmap_or() call) or split (with
> bitmap_and() respectively):
> 
> 	bitmap_or(full, raising, failing); // merge
> 	bitmap_and(raising, full, rasing_mask); // split

Hmm. But then what? I or the result and use it as pending interrupt
bitmap, to be iterated over. The indexes of the bits correspond to the
constants in the MCU API.

So after your suggestion I have rising and falling containgin
  rising = 00rr00rr00rr00rr; /* r means rising bits */
  falling = 00ff00ff00ff00ff; /* f means falling bits */
  pending = rising | falling;
which means:
  pending = pp00pp00pp00pp; /* p means pending bits */
But these bit positions do not correspond to the interrupt number
anymore.

I still think the de-interleaving of the buffer from
  rr ff rr ff rr ff rr ff
into two words:
  rising = rrrrrrrr;
  falling = ffffffff;
is simpler...

Or am I wrong?

> > > > +void omnia_mcu_unregister_gpiochip(struct omnia_mcu *mcu)
> > > > +{
> > > > +	if (!(mcu->features & FEAT_NEW_INT_API))
> > > > +
> > > >   cancel_delayed_work_sync(&mcu->button_release_emul_work); +
> > > > +	mutex_destroy(&mcu->lock);    
> > > 
> > > Wrong order?  
> > 
> > No, the mutex may be used in the work. Can't destroy it first. Or am I
> > misunderstanding something?  
> 
> I mean you are using a lot of devm(), can mutex be used in IRQ or whatever
> that can be triggered after this call?

OK, I think I need to free the irq before canceling the work. Thank you!

Marek
