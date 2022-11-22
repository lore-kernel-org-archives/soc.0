Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 355CAC433FE
	for <soc@archiver.kernel.org>; Tue, 22 Nov 2022 03:57:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F02A5C433D7; Tue, 22 Nov 2022 03:57:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C5C1C433C1;
	Tue, 22 Nov 2022 03:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669089442;
	bh=f3v83fx3HJjkh04iLUq4FRwchW/NJzsbnMr3HztA8+I=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=kTuFgJsQi0KvQIur+i++uPXsrBXDvUqnlA9+Pt4W8U2cxySde5ZqAEiviwjFpeiQx
	 Mkwt06NX8kXb+Hht0G3W+a64vGoIMFq+MhYfWlVCdLZX5vmTmwXxxbj9jhb/g5cqeh
	 KoXCVbSUWKrDh3FZ30g9B2FNgZwjAXMMM9OYPfTMWY+cqXufjY1q+0yLa6DXj1hZVD
	 cDsjpyg4GrG5JWnDSPx5+oNd4Za5ai82fAl9h32AK7KocD6D/fvetON64p9Y5WbCS4
	 OBjN69VJxztpwv3yx42uioNhZgWIUFExkdiqK6OPE2IAVWlfeLzYWvFjjV3kAvjSVM
	 +V92MWhbN6IYQ==
Date: Tue, 22 Nov 2022 11:57:16 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
	linux-arm-kernel@lists.infradead.org, soc@kernel.org,
	Marek Vasut <marex@denx.de>, kernel@dh-electronics.com,
	linux-kernel@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add DHCOR to the DH electronic i.MX6 board
 support
Message-ID: <20221122035715.GA25470@T480>
References: <20221117105131.7059-1-cniedermaier@dh-electronics.com>
 <cf1c2f76-a724-4609-8263-a5cf997895be@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cf1c2f76-a724-4609-8263-a5cf997895be@app.fastmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)

On Mon, Nov 21, 2022 at 09:43:06PM +0100, Arnd Bergmann wrote:
> On Thu, Nov 17, 2022, at 11:51, Christoph Niedermaier wrote:
> > Add DHCOR to the DH electronic i.MX6 board support to cover the
> > DHCOR i.MX6ULL SoM. It is a solderable SoM.
> >
> > Signed-off-by: Christoph Niedermaier <cniedermaier@dh-electronics.com>
> 
> The patch looks good to me, and while I could apply it directly to the
> soc tree, the normal way is to send this to the i.MX maintainers
> (added to Cc here).
> 
> Shawn, let me know if you want me to apply this directly,
> otherwise I assume it will be part of you next pull request. 

Hi Arnd,

Feel free to pick it up, as I do not plan to send you another PR for
6.2 merge window, unless there are something really urgent coming.

Shawn
