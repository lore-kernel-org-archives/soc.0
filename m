Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4921AC433F5
	for <soc@archiver.kernel.org>; Tue,  5 Oct 2021 05:37:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id EDD99611C0; Tue,  5 Oct 2021 05:37:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 48F6060F5D;
	Tue,  5 Oct 2021 05:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633412229;
	bh=41CIk7shucRgUscAz7kkLcFEPBUhYpo/1QGM6ZbZF8w=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=DOXGDJ8ImpFevYB9xvVVYe50B5ajtEdKxZK1+NT/Fh7tmugPE4FBe/+XYeCH7pIiG
	 MTstKkEVhvlytt7XX+AptMa/cFM1wxim6xnAJqgXPAlafSdulgAJovtooJay/E76qt
	 GAfUiNJtcNeDlCIOLTJP7zTsSGNsy2MS0voYfyhWkFLVHHXjKb3Sr8Ewg9OAv8fXfY
	 W/7Q1r8x3nSSbGZPHlPHLPqcOSKIwQM0zHYGMOsG6s7rMa0conk0a4g/LVMoXqaW7Z
	 QraKQfq8JdUvv0ywDFnkpP9iWWv5iWHicPHPCwJcWkwL1eNXNeSwdZYIQ0l3K2+CZ1
	 YxwEPlOXMzy3w==
Date: Tue, 5 Oct 2021 13:37:03 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Marcel Ziswiler <marcel.ziswiler@toradex.com>
List-Id: <soc.lore.kernel.org>
Cc: "soc@kernel.org" <soc@kernel.org>,
	Max Krummenacher <max.krummenacher@toradex.com>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"linux-imx@nxp.com" <linux-imx@nxp.com>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"frowand.list@gmail.com" <frowand.list@gmail.com>,
	"olof@lixom.net" <olof@lixom.net>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"arnd@arndb.de" <arnd@arndb.de>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 8/9] ARM: dts: colibri-imx6ull-emmc: add device tree
Message-ID: <20211005053702.GK20743@dragon>
References: <20210920144938.314588-1-marcel@ziswiler.com>
 <20210920144938.314588-9-marcel@ziswiler.com>
 <20211005032834.GG20743@dragon>
 <ebfcf9b509a768d5495f362bd82df9d628dee69d.camel@toradex.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ebfcf9b509a768d5495f362bd82df9d628dee69d.camel@toradex.com>
User-Agent: Mutt/1.9.4 (2018-02-28)

On Tue, Oct 05, 2021 at 04:13:18AM +0000, Marcel Ziswiler wrote:
> On Tue, 2021-10-05 at 11:28 +0800, Shawn Guo wrote:
> > On Mon, Sep 20, 2021 at 04:49:37PM +0200, Marcel Ziswiler wrote:
> > > From: Max Krummenacher <max.krummenacher@toradex.com>
> > > 
> > > Add a device tree for a Colibri iMX6ULL 1GB which has a eMMC instead of
> > > the raw NAND used on other SKUs.
> > > 
> > > Related-to: ELB-4056, ELB-4058, ELB-4070
> > 
> > Not sure what this tag is.
> 
> Yeah, sorry, those are references to Toradex specific tickets. Would even be partially public [1]. But also
> does not really matter that much. I have to remember removing such stuff in the future.
> 
> > Dropped it and applied patch.
> 
> Thanks!
> 
> BTW: Was the following patch [2] already applied earlier? I don't recall having seen any applied message from
> you about it though.

I may have forgot to reply, but it was applied weeks ago.

https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git/commit/?h=imx/fixes&id=c54467482ffd407a4404c990697f432bfcb6cdc4

Shawn

> 
> [1] https://developer.toradex.com/software/linux/release-details
> [2] [PATCH v4 2/9] ARM: imx_v6_v7_defconfig: enable fb
> https://lore.kernel.org/all/20210920144938.314588-3-marcel@ziswiler.com/
