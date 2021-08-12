Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C06FC4338F
	for <soc@archiver.kernel.org>; Thu, 12 Aug 2021 20:44:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2AE81610FD; Thu, 12 Aug 2021 20:44:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CB6ED610A3;
	Thu, 12 Aug 2021 20:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1628801061;
	bh=ptodn14ZQiYyFJvxrpcOtswpVmzfOzl8SaLJcD6g+hk=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e/jt6mM8bc7TKK39hbhQYPHFgIUTyZaQKfC22bWTbWZ7hlnstiQv8O8sSkb9nqcBU
	 yjxkjQr1lYImgmmhMnsk7O8p7Up9684fdSM5SHjkTEtjDBtZPEVvYYmRxUb7gtfJD9
	 8Nd7xxo85EKHL2kSm/3YDgEgP4/jEdnChpDFXqXYbzlbr96ccnr/8UpLPpZ8qtLSjg
	 Wo0rN5Zl6QTrCkzbYujrvpS76JWf1msuFj5MW9UHMVeKsIKh7a5oex531ezWY95Cfw
	 mWCz/itOlvrD8zJMiR3jDi8EYBjbL21Ldq89ulYm9ZZyD5FDcAq9i5DSnABRqul/vB
	 JCrJYVSgrereA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Shawn Guo <shawnguo@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-imx@nxp.com,
	Fabio Estevam <festevam@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	kernel@pengutronix.de,
	Mark Brown <broonie@kernel.org>,
	Robin Gong <yibin.gong@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [GIT PULL] i.MX eCSPI errata handling for 5.15
Date: Thu, 12 Aug 2021 22:44:04 +0200
Message-Id: <162880092609.1372486.17696747808216287202.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210809071838.GF30984@dragon>
References: <20210809071838.GF30984@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 9 Aug 2021 15:18:39 +0800, Shawn Guo wrote:
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-ecspi-5.15
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: a41461b6c400442fce28f706b7e9d03d3cab8f9e

       Arnd
