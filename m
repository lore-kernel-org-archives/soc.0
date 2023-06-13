Return-Path: <gregkh@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07586EB64D7
	for <soc@archiver.kernel.org>; Tue, 13 Jun 2023 14:50:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E1173C43392; Tue, 13 Jun 2023 14:50:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F599C433D9;
	Tue, 13 Jun 2023 14:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1686667800;
	bh=znVlS383QcPAJMIi6xyS/RHDDZMixq5EbRxcyi8PeP8=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=WYPiKb0mjnYLlod7XUsLPAMdFVFaG0OaVz7BW/zZ2W+2qMj69nPVeYKB5eicsJ1EW
	 N0iyQtczZtnuaQOqhmihYGdGcq1ZKorbsp/gjS/GLAd5NzoFu9r60eY18Ouf4Dv6+J
	 oDl3yitjDKMGkfL4F6JYWQKEyrB2ctTLI4FK5C68=
Date: Tue, 13 Jun 2023 16:49:54 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jacky Huang <ychuang570808@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, lee@kernel.org,
	mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
	jirislaby@kernel.org, tmaimon77@gmail.com, catalin.marinas@arm.com,
	will@kernel.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-serial@vger.kernel.org,
	arnd@arndb.de, soc@kernel.org, schung@nuvoton.com,
	mjchen@nuvoton.com, Jacky Huang <ychuang3@nuvoton.com>
Subject: Re: [PATCH v14 1/1] tty: serial: Add Nuvoton ma35d1 serial driver
 support
Message-ID: <2023061356-matchbook-footwear-d142@gregkh>
References: <20230612025355.547871-1-ychuang570808@gmail.com>
 <20230612025355.547871-2-ychuang570808@gmail.com>
 <2023061338-lunchbox-snorkel-e6a9@gregkh>
 <f8eb6114-8248-8886-b301-c2886e50e016@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f8eb6114-8248-8886-b301-c2886e50e016@gmail.com>

On Tue, Jun 13, 2023 at 06:58:32PM +0800, Jacky Huang wrote:
> Dear Greg,
> 
> 
> On 2023/6/13 下午 06:28, Greg KH wrote:
> > On Mon, Jun 12, 2023 at 02:53:55AM +0000, Jacky Huang wrote:
> > > From: Jacky Huang <ychuang3@nuvoton.com>
> > > 
> > > This adds UART and console driver for Nuvoton ma35d1 Soc.
> > > It supports full-duplex communication, FIFO control, and
> > > hardware flow control.
> > You get a full 72 columns for your changelog :)
> > 
> > > --- a/include/uapi/linux/serial_core.h
> > > +++ b/include/uapi/linux/serial_core.h
> > > @@ -279,4 +279,7 @@
> > >   /* Sunplus UART */
> > >   #define PORT_SUNPLUS	123
> > > +/* Nuvoton MA35 SoC */
> > > +#define PORT_MA35	124
> > > +
> > Why is this change needed?  What userspace code is going to rely on it?
> > 
> > thanks,
> > 
> > greg k-h
> 
> Because the serial driver requires a port->type, and almost all serial
> drivers defined their port type here. We follow the practice of most serial
> drivers here.
> If we don't do it this way, we would have to directly assign a value to
> port->type. However, such modifications were questioned in the past,
> which is why we changed it back to defining the port type in serial_core.h.

I really really want to get rid of this list, as it's a UAPI that no one
uses.  So please don't use it, it doesn't help anything, and while the
serial driver might require it, it doesn't actually do anything with
that field, right?  So why don't we just set all of the values to the
same one?

thanks,

greg k-h
