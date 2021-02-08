Return-Path: <SRS0=uQV0=HK=linuxfoundation.org=gregkh@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4533C433E6
	for <soc@archiver.kernel.org>; Mon,  8 Feb 2021 16:46:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A39A364E92; Mon,  8 Feb 2021 16:46:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0233864E8C;
	Mon,  8 Feb 2021 16:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1612802783;
	bh=rRjfEFof8z2zXcMybZQcZB0Y/Qk60nFQBUIR9y+gZcg=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=niQVPo5DuPZMzD/Vyz4i+otHijqhyUCs3iVnF+GWM6b9S6F9J5962+nbClDEk1CBn
	 fEW5OMAdEX9e09OcBx+WrkB7lktjjCfkL4iPl3vKox/88GoUR3pOP9TuKf1+7Z292Z
	 GcTmQ6BTQ1pWRZqntPnDohc0xGICbYR8nQgnFEjc=
Date: Mon, 8 Feb 2021 17:46:20 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Hector Martin <marcan@marcan.st>
List-Id: <soc.lore.kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, soc@kernel.org,
	linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org,
	Arnd Bergmann <arnd@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Olof Johansson <olof@lixom.net>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 05/18] tty: serial: samsung_tty: add support for Apple
 UARTs
Message-ID: <YCFq3DqOzv4//6Vw@kroah.com>
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-6-marcan@marcan.st>
 <87lfc1l4lo.wl-maz@kernel.org>
 <e842f37d-d788-2d34-05e4-86ef94aed8f5@marcan.st>
 <73116feaa00de9173d1f2c35ce16e08f@kernel.org>
 <7adf8ede-f7ff-7c62-d0fd-9ab4eaf25741@marcan.st>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7adf8ede-f7ff-7c62-d0fd-9ab4eaf25741@marcan.st>

On Tue, Feb 09, 2021 at 01:18:21AM +0900, Hector Martin wrote:
> On 08/02/2021 19.34, Marc Zyngier wrote:
> > On 2021-02-07 09:12, Hector Martin 'marcan' wrote:
> > > On 06/02/2021 22.15, Marc Zyngier wrote:
> > > > Do you actually need a new port type here? Looking at the driver
> > > > itself, it is mainly used to work out the IRQ model. Maybe introducing
> > > > a new irq_type field in the port structure would be better than
> > > > exposing this to userspace (which should see something that is exactly
> > > > the same as a S3C UART).
> > > 
> > > Well... every S3C variant already has its own port type here.
> > > 
> > > #define PORT_S3C2410    55
> > > #define PORT_S3C2440    61
> > > #define PORT_S3C2400    67
> > > #define PORT_S3C2412    73
> > > #define PORT_S3C6400    84
> > > 
> > > If we don't introduce a new one, which one should we pretend to be? :)
> > 
> > Pick one! :D
> 
> *queries /dev/urandom* :-)
> 
> > > I agree that it might make sense to merge all of these into one,
> > > though; I don't know what the original reason for splitting them out
> > > is. But now that they're part of the userspace API, this might not be
> > > a good idea. Though, unsurprisingly, some googling suggests there are
> > > zero users of these defines in userspace.
> > 
> > I don't think we can do that, but I don't think we should keep adding
> > to this unless there is a very good reason. Greg would know, I expect.
> 
> Greg, what do you think? Add more PORT_ UART types for Samsung variants, or
> overload one of the existing ones and deal with it in the driver?

I HATE adding new PORT_ types, as I am almost positive no one uses them,
but as they are in the uapi files, we can't delete them.

So, just use an existing one, why do you want a new one?  If you don't
have a userspace tool that requires it, don't bother.

Just use PORT_8250 and be done with it.  I should force all new drivers
to use that as well :)

thanks,

greg k-h
