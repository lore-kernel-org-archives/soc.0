Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AF33C433ED
	for <soc@archiver.kernel.org>; Thu,  1 Apr 2021 20:15:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2738B610CB; Thu,  1 Apr 2021 20:15:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2ACDF610F8;
	Thu,  1 Apr 2021 20:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617308155;
	bh=XyOedY3GvxM8g3yhvQbM1EJ+8ZaAGE8Dtz0iDbw5w/U=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O1j085a/WXhlOcSAn7pwt/1fJwnC0jJ920Xhm8Zat9GmDecoNsPhqWymgj2Yhx4H3
	 Dim9UtG+6QzwuVlP2WvmdXHOjWQ8pTWYSncqOhQtpkAuLzclk/yGD7rHBuWgChbXiB
	 S6u/N1uAzn8RIhc4DKQe6+VyOTIA67Ate3SUF6OAPrlprzqc3zQmP8PNci9/WXw+Zg
	 UozyY1/3tTGNA9wCxu0PvAq6hPDPM8gWreK5ZnmWFp+k1NFYBLIkJwTZgbsq2ZbBSk
	 +DJbP+u1uhs2u9EkXxMDz5fYR5CVrz22ywQjjF+dr66t9ngoNanWTJNTNO9IujUkht
	 4jAYZAWiU9jKQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	Shawn Guo <shawnguo@kernel.org>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	Fabio Estevam <festevam@gmail.com>,
	linux-imx@nxp.com,
	Li Yang <leoyang.li@nxp.com>,
	Stefan Agner <stefan@agner.ch>
Subject: Re: [GIT PULL 4/6] i.MX device tree change for 5.13
Date: Thu,  1 Apr 2021 22:15:24 +0200
Message-Id: <161730808632.655497.14668701970057565320.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210331041019.31345-4-shawnguo@kernel.org>
References: <20210331041019.31345-1-shawnguo@kernel.org> <20210331041019.31345-4-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 31 Mar 2021 12:10:17 +0800, Shawn Guo wrote:
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt-5.13
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 4f662ba2be220044bb965f36826723c8f1e14eec

       Arnd
