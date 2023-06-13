Return-Path: <gregkh@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A1D6C7EE2E
	for <soc@archiver.kernel.org>; Tue, 13 Jun 2023 10:29:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 42147C4339C; Tue, 13 Jun 2023 10:29:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4FA7C4339B;
	Tue, 13 Jun 2023 10:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1686652179;
	bh=GKjykxi8jkpJPrEh4DwtTX4rkA8LohqIze6xn3gvCgg=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=KrHiw4yGlWzLr+Y0L8kgwzDfaDjiz6V36vUT6Iu3GS3yBWOvnqdGIc8k+ZAazWNdw
	 GiVI06RIJFsN4Cup5bm6FxEhcEKNjFziI0RZfXPo5HB4xmvglnOW3wvtexlp5N6s1n
	 e1Ep8Orhyb6ZT7tsfJeR+35txiJzQfFBl+Ccx3mU=
Date: Tue, 13 Jun 2023 12:29:36 +0200
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
Message-ID: <2023061325-distant-gaffe-8871@gregkh>
References: <20230612025355.547871-1-ychuang570808@gmail.com>
 <20230612025355.547871-2-ychuang570808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612025355.547871-2-ychuang570808@gmail.com>

On Mon, Jun 12, 2023 at 02:53:55AM +0000, Jacky Huang wrote:
> From: Jacky Huang <ychuang3@nuvoton.com>
> 
> This adds UART and console driver for Nuvoton ma35d1 Soc.
> It supports full-duplex communication, FIFO control, and
> hardware flow control.

You don't specify here what your tty device name is going to be, why?

It's not written anywhere, is that intentional?

Same for your tty major/minor, what numbers are you using that might
also be in use by a different device in the system?

thanks,

greg k-h
