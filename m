Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51A39C433EF
	for <soc@archiver.kernel.org>; Wed, 20 Oct 2021 14:50:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 35ABC6138B; Wed, 20 Oct 2021 14:50:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 358DC610A1;
	Wed, 20 Oct 2021 14:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634741450;
	bh=Z5+UTrR17kZse33IBvH6TAo2pcZtD+hXyaksbzLQJy4=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iI7W7qANHi8ewOG70L/ICmUTlG4FD8eTBcn+xb8p0Pr3ql9qk2Jm4YQVWnvjyT4+s
	 BXI2I1KtepMoVESXW8Yj/KrW1Jr6dRUTMMTCPY1+suKAz4Horbqd6awxc6d/hzuYyC
	 +TmXDUVEzBX9yyULKlp4pf1WE7Cf7ewQhCfzgeQ4Bxf8Fc8PEIdrKvxU8o5TV6R6XB
	 Gs15uNt8OeuOaWO0rXnMSLfAbzt6uqbqM+tTxeFwINW84eTjLSpwUCXFrKdjAitwCU
	 bazAlCwLx9jyYki3Kk/gG//rn6vMRHYn9Yx5XCuc29FBDqxmnrTQ2O0E0oJbjHacd9
	 mwsgnklpw9Jdg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org,
	Shawn Guo <shawnguo@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-imx@nxp.com,
	kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Agner <stefan@agner.ch>,
	Li Yang <leoyang.li@nxp.com>
Subject: Re: [GIT PULL 1/6] i.MX DT bindings update for 5.16
Date: Wed, 20 Oct 2021 16:50:18 +0200
Message-Id: <163474139787.4099414.8954767744128108224.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211016140138.1603-1-shawnguo@kernel.org>
References: <20211016140138.1603-1-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Sat, 16 Oct 2021 22:01:33 +0800, Shawn Guo wrote:
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-bindings-5.16
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 353bbb3d07e836738869a74e23f2deba0a34aa80

       Arnd
