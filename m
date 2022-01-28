Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8203C433EF
	for <soc@archiver.kernel.org>; Fri, 28 Jan 2022 09:47:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 868C1C340ED; Fri, 28 Jan 2022 09:47:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58741C340E0;
	Fri, 28 Jan 2022 09:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1643363273;
	bh=8kkAnc+M0cCdAWnhA9HOtOgrwITX8K1+3Ru5bLRihCA=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=kU0gBpsvnnhYbrf28DhGRAN3nGnBZuN7LtqIy/cIY1fNLSDWKloerqX7A2vlp7U12
	 vB0gaZpTEcOebfR4ib/zaxX5JVHxPLfcoYR2iFIRDqqIJDD6cH/oqTVLx5Px5nNjfL
	 tpOxhZuqyLqn2txSoNieFF6sejN0tNl1Hci5WUVqmgYRev7OAChJJJS+YrsvEVmRCf
	 4wbQPAt0jmhfLix2wnz7b2B+L13UQfpjfD34+yqFYIX2BXhE2nooxsiK0FoW+kIBTc
	 NlEc+YIu1hQgkJ4IHgkFRpBVBv7xk/xV+KPZV2N9wbS3h3BwdzE0fCpqtk5Scg8oFS
	 4T3I7cu783QBA==
Date: Fri, 28 Jan 2022 17:47:44 +0800
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
Subject: Re: [PATCH v8 1/7] ARM: imx: Add initial support for i.MXRT10xx
 family
Message-ID: <20220128094743.GI4686@dragon>
References: <20220111212606.2072669-1-Mr.Bossman075@gmail.com>
 <20220111215415.2075257-1-Mr.Bossman075@gmail.com>
 <20220111215415.2075257-2-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220111215415.2075257-2-Mr.Bossman075@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)

On Tue, Jan 11, 2022 at 04:54:09PM -0500, Jesse Taube wrote:
> From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> 
> The i.MXRT10xx family of processors features NXP's implementation of the
> Arm Cortex-M7 core and in some case the Arm Cortex-M4 core too.
> 
> This patch aims to add an initial support for imxrt.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> [Jesse: removed SOC_IMXRT's 'depends on ARCH_MULTI_V7' and 'select
> ARM_GIC if ARCH_MULTI_V7']

Applied, thanks!
