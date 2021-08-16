Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88E07C4338F
	for <soc@archiver.kernel.org>; Mon, 16 Aug 2021 21:21:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6B5BC60232; Mon, 16 Aug 2021 21:21:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6BD0260F41;
	Mon, 16 Aug 2021 21:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1629148862;
	bh=Emb5YdknXpn4P/KykFLgzd9ybCudZq6evQKOErNRsXw=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uY4jgdpmOYYtQcwbgBiQ6zdFzrp6bjR/5qMdlmO+L7xhifBm6K+KNROdwbUEll9iI
	 LSGc6JxhYXSJL6LJW1uRbyP0Anhc+15QPqLbQsvtnNsBbOYg1CZbfmSFUL7lbdL3QE
	 +ilUKJHSEIGKLM6kBld2eMde5tdYuQNfjNzoC4LHRE5mshnG6hcyIXY5Vx7WDEamug
	 NQNn4WN2PKvyTq07EjwMXskHpESSktdI3KD8J4MMM69o48jmd+siNFAmcT02Jmx34S
	 XIyZV8m0NT4169XO42TYWd9UJB+4+9ZvMPRX1TiNtQmjww5ZOk+c88u4GQX/e6dDWA
	 xZi4dD28ysoVg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Shawn Guo <shawnguo@kernel.org>,
	soc@kernel.org,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	kernel@pengutronix.de,
	Stefan Agner <stefan@agner.ch>,
	linux-arm-kernel@lists.infradead.org,
	Li Yang <leoyang.li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	linux-imx@nxp.com
Subject: Re: [GIT PULL 1/4] i.MX DT bindings update for 5.15
Date: Mon, 16 Aug 2021 23:20:50 +0200
Message-Id: <162914852265.237905.13250400572485864130.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210814133853.9981-1-shawnguo@kernel.org>
References: <20210814133853.9981-1-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Sat, 14 Aug 2021 21:38:50 +0800, Shawn Guo wrote:
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-bindings-5.15
> 
> [...]

Merged into arm/dt, thanks!

merge commit: fe3be9941e3c5cebd59d3ad02477db86af85e2da

       Arnd
