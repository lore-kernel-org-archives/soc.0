Return-Path: <gregkh@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DE1FEB64D9
	for <soc@archiver.kernel.org>; Thu, 15 Jun 2023 10:19:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 35F7BC433CB; Thu, 15 Jun 2023 10:19:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E3C9C433C9;
	Thu, 15 Jun 2023 10:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1686824350;
	bh=vK4OGzRcIodcyrM8zyOoh1I/GTxmCFcsnHvxeZf6ZzA=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=vHockrRaOiPvI7vhzL0WwIil5Cp1/MJJKjHyjAENxD3PON9UbAaOc+2+CqUxISOuc
	 JeyijojgBEg+UcCu2fa0jovwKcG8fmVmgFYdFFw8nZwSLiAA/ubKjizIChHaZ7AUTx
	 1z1m0lQ5wZKBtajtrwziGxlwzrAcMu/y3PxGHAkU=
Date: Thu, 15 Jun 2023 12:19:07 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Jacky Huang <ychuang570808@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	krzysztof.kozlowski+dt@linaro.org, Lee Jones <lee@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jiri Slaby <jirislaby@kernel.org>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-serial@vger.kernel.org,
	soc@kernel.org, schung@nuvoton.com, mjchen@nuvoton.com,
	Jacky Huang <ychuang3@nuvoton.com>
Subject: Re: [PATCH v14 1/1] tty: serial: Add Nuvoton ma35d1 serial driver
 support
Message-ID: <2023061555-enlighten-worshiper-c92d@gregkh>
References: <20230612025355.547871-1-ychuang570808@gmail.com>
 <20230612025355.547871-2-ychuang570808@gmail.com>
 <2023061338-lunchbox-snorkel-e6a9@gregkh>
 <f8eb6114-8248-8886-b301-c2886e50e016@gmail.com>
 <2023061356-matchbook-footwear-d142@gregkh>
 <35e768ad-7f15-48a4-9c38-09570026cf71@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <35e768ad-7f15-48a4-9c38-09570026cf71@app.fastmail.com>

On Tue, Jun 13, 2023 at 05:44:23PM +0200, Arnd Bergmann wrote:
> On Tue, Jun 13, 2023, at 16:49, Greg KH wrote:
> > On Tue, Jun 13, 2023 at 06:58:32PM +0800, Jacky Huang wrote:
> >> 
> >> On 2023/6/13 下午 06:28, Greg KH wrote:
> >> > On Mon, Jun 12, 2023 at 02:53:55AM +0000, Jacky Huang wrote:
> >> > > From: Jacky Huang <ychuang3@nuvoton.com>
> >> > > 
> >> > > This adds UART and console driver for Nuvoton ma35d1 Soc.
> >> > > It supports full-duplex communication, FIFO control, and
> >> > > hardware flow control.
> >> > You get a full 72 columns for your changelog :)
> >> > 
> >> > > --- a/include/uapi/linux/serial_core.h
> >> > > +++ b/include/uapi/linux/serial_core.h
> >> > > @@ -279,4 +279,7 @@
> >> > >   /* Sunplus UART */
> >> > >   #define PORT_SUNPLUS	123
> >> > > +/* Nuvoton MA35 SoC */
> >> > > +#define PORT_MA35	124
> >> > > +
> >> > Why is this change needed?  What userspace code is going to rely on it?
> >> > 
> >> > thanks,
> >> > 
> >> > greg k-h
> >> 
> >> Because the serial driver requires a port->type, and almost all serial
> >> drivers defined their port type here. We follow the practice of most serial
> >> drivers here.
> >> If we don't do it this way, we would have to directly assign a value to
> >> port->type. However, such modifications were questioned in the past,
> >> which is why we changed it back to defining the port type in serial_core.h.
> >
> > I really really want to get rid of this list, as it's a UAPI that no one
> > uses.  So please don't use it, it doesn't help anything, and while the
> > serial driver might require it, it doesn't actually do anything with
> > that field, right?  So why don't we just set all of the values to the
> > same one?
> 
> I don't see how Jacky can come up with a patch to do this correctly
> without more specific guidance to what exactly you are looking for,
> after the last 123 people that added support for a new port got
> that merged.

I keep complaining about this, when I notice it.  Just use the "default"
port type in the serial driver and don't add a new type here and it
should just work, right?

> I checked debian codesearch and found only three obscure packages that
> accidentally include this header instead of including linux/serial.h,
> a couple of lists of all kernel headers, and none that include it on
> purpose. I agree that this header should really not exist in uapi,
> but the question is what exactly to do about it.
> 
> Possible changes would be:
> 
> - add a special value PORT_* constant other than PORT_UNKNOWN that
>   can be used by serial drivers instead of a unique value, and
>   ensure that the serial core can handle drivers using it.

Why do we need a special constant?

> - move all values used by the 8250 driver from serial_core.h
>   to serial.h, as this driver actually uses the constants.

Makes sense.

> - Move the remaining contents of uapi/linux/serial.h into the 
>   non-uapi version.
> 
> - Change all drivers that only reference a single PORT_*
>   value to use the generic one.

I think this is the best thing to do.

thanks,

greg k-h
