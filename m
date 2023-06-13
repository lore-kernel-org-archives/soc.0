Return-Path: <gregkh@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49763EB64D0
	for <soc@archiver.kernel.org>; Tue, 13 Jun 2023 14:49:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 186ABC43392; Tue, 13 Jun 2023 14:49:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74A5AC433D9;
	Tue, 13 Jun 2023 14:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1686667746;
	bh=orxct/oN6swXctqI+9T2kxrUI5rzPDKvrJI+it0u3f0=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=nAP+EdFSGdzRDaD6XUzSb+6ZjHz41PIvfaGT44Owgb6uu6w5//nviYrlaQpcjfYc1
	 uJ8P1RDUx0uVuuhmlCV7StorZVq5iPAh7CJy9anlWfvp97sTODsp244AMMubu1GqS+
	 2rqI1NWcNbH2o4jtsyganD2vdIZhR0C/3z7AVxas=
Date: Tue, 13 Jun 2023 16:48:53 +0200
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
Message-ID: <2023061312-outsource-triumph-7dd6@gregkh>
References: <20230612025355.547871-1-ychuang570808@gmail.com>
 <20230612025355.547871-2-ychuang570808@gmail.com>
 <2023061325-distant-gaffe-8871@gregkh>
 <0e40cbe6-0e88-b300-3507-5fa92eadb46d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0e40cbe6-0e88-b300-3507-5fa92eadb46d@gmail.com>

On Tue, Jun 13, 2023 at 07:03:11PM +0800, Jacky Huang wrote:
> Dear Greg,
> 
> 
> On 2023/6/13 下午 06:29, Greg KH wrote:
> > On Mon, Jun 12, 2023 at 02:53:55AM +0000, Jacky Huang wrote:
> > > From: Jacky Huang <ychuang3@nuvoton.com>
> > > 
> > > This adds UART and console driver for Nuvoton ma35d1 Soc.
> > > It supports full-duplex communication, FIFO control, and
> > > hardware flow control.
> > You don't specify here what your tty device name is going to be, why?
> > 
> > It's not written anywhere, is that intentional?
> > 
> > Same for your tty major/minor, what numbers are you using that might
> > also be in use by a different device in the system?
> > 
> > thanks,
> > 
> > greg k-h
> 
> I will add description about the tty name to the log.
> In practical testing, we specified in the u-boot parameters
> to use ttyNVT0 for the console, and it worked fine.

Where did you pick that name from?  Why can't you use the "default" uart
name instead?

I thought we had a list of tty names around somewhere, but I can't find
it right now...

thanks,

greg k-h
