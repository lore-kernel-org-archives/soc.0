Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4AF2C433ED
	for <soc@archiver.kernel.org>; Thu,  1 Apr 2021 10:23:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 806E2610D2; Thu,  1 Apr 2021 10:23:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 58482610CA;
	Thu,  1 Apr 2021 10:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617272635;
	bh=echKhk/+du5revw56d9N1TtPnxzuzBPGHd3iaQ496Xk=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UxuCUS8Ewavw1VGOPNOhxECVjCSTnSE2hTmRdj80WAgBHauG0SU1ub8DXfDKZu5KF
	 7VvXgHEEDctKtAwWqd57pztmBDHjvQdM1uF68y1PIaxWg9ieLAx/KOWpAXR3g/FU1L
	 iFEDzr3lUl2kuLF5J5pLsKB4WHP56yvDJpfLSjBPqJvQrBPrLUSBO/wlADdJm2G5mn
	 hPJ7v/mNTTdTXAQHLMiAo3jEzCJEAWEsJwdjGaU9+WJ7JRGX+Muf1iKEArUp8iwmyj
	 56+Tcwz7mKTTkVaTCdpULUEBTo+eT9HjIBvPB3LTGopF73Bq7V/h7IQYIukxDWkMLE
	 UCNVhQOH7ZvrQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Shawn Guo <shawnguo@kernel.org>,
	arm@kernel.org,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-imx@nxp.com,
	kernel@pengutronix.de,
	Stefan Agner <stefan@agner.ch>,
	Fabio Estevam <festevam@gmail.com>,
	Li Yang <leoyang.li@nxp.com>
Subject: Re: [GIT PULL] i.MX fixes for 5.12, round 2
Date: Thu,  1 Apr 2021 12:23:32 +0200
Message-Id: <161727243755.583633.10590032736575762334.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210330090236.GQ22955@dragon>
References: <20210330090236.GQ22955@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 30 Mar 2021 17:02:37 +0800, Shawn Guo wrote:
> The following changes since commit e4817a1b6b77db538bc0141c3b138f2df803ce87:
> 
>   ARM: dts: imx6ull: fix ubi filesystem mount failed (2021-03-18 12:06:28 +0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-5.12-2
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: 89e21e1ad92373b7306b9b8494d45781598ce72f

       Arnd
