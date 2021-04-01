Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90B06C433B4
	for <soc@archiver.kernel.org>; Thu,  1 Apr 2021 21:06:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 65C54610F9; Thu,  1 Apr 2021 21:06:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5B2F761103;
	Thu,  1 Apr 2021 21:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617311181;
	bh=yEeBq9au/1/8SGwwI5LjOH2w9D5Ry/sCr4gyR7wQbhM=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jm16m2GRLCKZGoR7f+o+lo2k68SPS/Fm5Y1CSN2LapApz9x6lNE4biVR0JYvV44x9
	 BHZ68/2ev1yUTDLx/FOofYeovZowyzIGtAImOCAv2NpBx49gTbO3+atA4R9ODuxIBt
	 349MLygwvJdnsDyxQatJPlhQL0q/O3N9ojIyUYp5INhVrFECpk3giL78y0FiBeuQHf
	 PwDwhTN/NoDHoXx84RT97shhhKwhybNEj1DGMjAWEM2lbAQ/J4u8Ri+1UgdOVxdznu
	 qnjioFncHRTIgWd89lRtxKxd27wdUn4BWAj8RgSpwI1fmiVQ4Re1eeo2Ns1x9/vFHY
	 4MeIim9YUncOg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Shawn Guo <shawnguo@kernel.org>,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Li Yang <leoyang.li@nxp.com>,
	Stefan Agner <stefan@agner.ch>,
	linux-imx@nxp.com,
	kernel@pengutronix.de,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 6/6] i.MX defconfig change for 5.13
Date: Thu,  1 Apr 2021 23:06:07 +0200
Message-Id: <161731114623.662954.11029736079612919707.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210331041019.31345-6-shawnguo@kernel.org>
References: <20210331041019.31345-1-shawnguo@kernel.org> <20210331041019.31345-6-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 31 Mar 2021 12:10:19 +0800, Shawn Guo wrote:
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-defconfig-5.13
> 
> [...]

Merged into arm/defconfig, thanks!

merge commit: bbbd7b0120849d0d8022a5a211d3f1171ecf43cb

       Arnd
