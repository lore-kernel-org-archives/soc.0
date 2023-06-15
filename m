Return-Path: <gregkh@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75585EB64D9
	for <soc@archiver.kernel.org>; Thu, 15 Jun 2023 15:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 39024C433C8; Thu, 15 Jun 2023 15:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99B98C433C0;
	Thu, 15 Jun 2023 15:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1686841224;
	bh=EoG092+beaSnQr2vJ3NUrwGrGf3QWovGqmmxwzEvM6Q=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=q/s8r0Z6Uab26/N0tGr4mIo+AZMXoMHdWxVQUC5m/3cvbjgrfqSHA+K9t8rpKYRNB
	 aZLO38wkT39hYSVahv0dNLm0+PBojevl3CSsYj/FddvoOay8K6J/kcRRy9rEOCsmMb
	 4EmPUVSQdxDbNieNrB4ilwF3/wSwVPLRu85pE5xY=
Date: Thu, 15 Jun 2023 17:00:21 +0200
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
Message-ID: <2023061500-tipper-tightwad-8843@gregkh>
References: <20230612025355.547871-1-ychuang570808@gmail.com>
 <20230612025355.547871-2-ychuang570808@gmail.com>
 <2023061338-lunchbox-snorkel-e6a9@gregkh>
 <f8eb6114-8248-8886-b301-c2886e50e016@gmail.com>
 <2023061356-matchbook-footwear-d142@gregkh>
 <35e768ad-7f15-48a4-9c38-09570026cf71@app.fastmail.com>
 <2023061555-enlighten-worshiper-c92d@gregkh>
 <502240f7-2cac-4fe6-9e27-f9861db3666d@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <502240f7-2cac-4fe6-9e27-f9861db3666d@app.fastmail.com>

On Thu, Jun 15, 2023 at 04:01:55PM +0200, Arnd Bergmann wrote:
> On Thu, Jun 15, 2023, at 12:19, Greg Kroah-Hartman wrote:
> > On Tue, Jun 13, 2023 at 05:44:23PM +0200, Arnd Bergmann wrote:
> >> On Tue, Jun 13, 2023, at 16:49, Greg KH wrote:
> >> I don't see how Jacky can come up with a patch to do this correctly
> >> without more specific guidance to what exactly you are looking for,
> >> after the last 123 people that added support for a new port got
> >> that merged.
> >
> > I keep complaining about this, when I notice it.  Just use the "default"
> > port type in the serial driver and don't add a new type here and it
> > should just work, right?
> >
> >> I checked debian codesearch and found only three obscure packages that
> >> accidentally include this header instead of including linux/serial.h,
> >> a couple of lists of all kernel headers, and none that include it on
> >> purpose. I agree that this header should really not exist in uapi,
> >> but the question is what exactly to do about it.
> >> 
> >> Possible changes would be:
> >> 
> >> - add a special value PORT_* constant other than PORT_UNKNOWN that
> >>   can be used by serial drivers instead of a unique value, and
> >>   ensure that the serial core can handle drivers using it.
> >
> > Why do we need a special constant?
> 
> The "default" value is 0, which translates to PORT_UNKNOWN, and the
> serial core code prevents this from working. I think Jacky tried
> to use this the last one or two times you commented on it, and
> it did not work.

Ah, thanks, that makes sense.

> Setting it to a plain '1' as Jacky suggested in his reply is the
> same as PORT_8250, which may or may not be a good choice here.

Odds are it would be fine :)

> Since the number is exported to userspace in serial_struct,
> it might be better to pick a new constant such as
> 
> #define PORT_SERIAL_GENERIC (-1)
> 
> in order to be less ambiguous. It's a signed integer, so -1
> would work here this would clearly be a special value, or
> another option might be to use 255 as something that is
> slightly less special but still recognizable as something
> that may have a special meaning.

A new constant would be good, 255 is nice, and then we can move everyone
to use it unless they can specifically show a reason why it will not
work for them.

I think originally this was used to do device-specific ioctls, right?
That shouldn't be happening anymore, hopefully...

thanks,

greg k-h
