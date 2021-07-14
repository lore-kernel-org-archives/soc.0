Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5850C07E9A
	for <soc@archiver.kernel.org>; Wed, 14 Jul 2021 07:55:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8E14C6135A; Wed, 14 Jul 2021 07:55:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8EFA861360;
	Wed, 14 Jul 2021 07:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626249310;
	bh=RkyDlFfl7pt4O8HlQ7bFms0Rkc42NKziOoBVucrtoPs=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=AKyI6KXaBLBsyzveuQZu5mptmf3Hbt++okcyzTQG+pRCw/LmG0l4PNEQHVY5X1eMI
	 460MQqD0kCsDM8gLBrcMr2RcOHDeVvtvKkklsADhRjLknW4oI7/kHiB9dQrFemWj1L
	 sS92zCJ8ws6vANfZ9Ybzx5kQUmVuYAd6Qw6lHpy5540fqFGTyrYEN9zkRiKGdXWuG7
	 0FZP3iE/E4QkVYVnSt3q4TClbfn+x19l/06uB0z8kvC5tBNYfBdyRZeY/NFcNm5ITm
	 lU1kCllHuhEc67EHjQwClyQCkGietowhihO8y2tplVystqwVOWrm+seavrAI+AdLkt
	 sVXTHKM9uwK6A==
Date: Wed, 14 Jul 2021 15:55:05 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Russell King <rmk+kernel@armlinux.org.uk>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] ARM: dts: add SolidRun SolidSense support
Message-ID: <20210714075504.GI4419@dragon>
References: <E1ludJj-0001rl-GY@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1ludJj-0001rl-GY@rmk-PC.armlinux.org.uk>
User-Agent: Mutt/1.9.4 (2018-02-28)

On Sat, Jun 19, 2021 at 04:55:31PM +0100, Russell King wrote:
> Add support for the SolidRun SolidSense platform, which is a
> Hummingboard2 with a daughter card with two Nordic software defined
> radios and a couple of bi-color LEDs.
> 
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>

Applying: ARM: dts: add SolidRun SolidSense support
.git/rebase-apply/patch:280: trailing whitespace.
		};		
warning: 1 line adds whitespace errors.

I fixed it up and applied.

Shawn
