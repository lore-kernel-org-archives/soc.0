Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45EA1C433EF
	for <soc@archiver.kernel.org>; Fri, 28 Jan 2022 09:49:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0E563C340E6; Fri, 28 Jan 2022 09:49:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB302C340E0;
	Fri, 28 Jan 2022 09:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1643363367;
	bh=o4qvm7nfAgLDVE9vrxU5dnZstesCl5xbQiXps2m1WY4=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=UvVfy0wUmmbQUviXcvp1PJid9WwgRgn3r0eQ9DUpdkWfq8NcuyvKN+f8VeipBxIP1
	 qjp1RmfWtZXKRpzcBlwpUekgSdBhE56AsPC6uoDbL31s4LBoVlHt75BCphgZkPfnM6
	 OTugOM3iWS8Lkikr4GpDo/BvQl+YdcnzOgotBE2Tnb3pT7sKKdx6BLTcwzMdg8WBDj
	 8lsGTSkCDjemL0MV26qKO4nJViOIPxDvxxQa1l2vElCTwk0jHmyKa/mwOZXwt5hWOd
	 RH618aK0TirhVxVtrHSPbxxOhvhZ7usl1DMg/jfT57wrg9jwwFOAE2biMF0HlptACO
	 Yz1GcHFWN5Crg==
Date: Fri, 28 Jan 2022 17:49:18 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Jesse Taube <mr.bossman075@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-imx@nxp.com, mturquette@baylibre.com, sboyd@kernel.org,
	robh+dt@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, ulf.hansson@linaro.org, aisheng.dong@nxp.com,
	stefan@agner.ch, linus.walleij@linaro.org,
	gregkh@linuxfoundation.org, arnd@arndb.de, olof@lixom.net,
	soc@kernel.org, linux@armlinux.org.uk, abel.vesa@nxp.com,
	adrian.hunter@intel.com, jirislaby@kernel.org,
	giulio.benetti@benettiengineering.com,
	nobuhiro1.iwamatsu@toshiba.co.jp, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH v8 2/7] ARM: dts: imxrt1050-pinfunc: Add pinctrl binding
 header
Message-ID: <20220128094910.GJ4686@dragon>
References: <20220111212606.2072669-1-Mr.Bossman075@gmail.com>
 <20220111215415.2075257-1-Mr.Bossman075@gmail.com>
 <20220111215415.2075257-3-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220111215415.2075257-3-Mr.Bossman075@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)

On Tue, Jan 11, 2022 at 04:54:10PM -0500, Jesse Taube wrote:
> From: Jesse Taube <mr.bossman075@gmail.com>
> 
> Add binding header for i.MXRT1050 pinctrl device tree.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> [Jesse: move pinfunc from dt-bindings to dts folder]

Applied, thanks!
