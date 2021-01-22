Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58EFCC433E6
	for <soc@archiver.kernel.org>; Fri, 22 Jan 2021 22:43:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 35CD923AAC; Fri, 22 Jan 2021 22:43:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0638723B1C;
	Fri, 22 Jan 2021 22:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611355422;
	bh=57EbRnivljg6xRuDuPzY8uwa7RZ6p5vUA+cjf2TDp9k=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Rj4vUoHwZGFCwckyq9bhhBikOsef1yI0fVtsR5NBjChVf8gkKSTnoUKGHBP8BD+oW
	 jSpA3jvTCSULl5g21FBey/pseD3Sr7ry8c6OsCOjbS2F2kG+0qksunleHZwk/mqhKa
	 v5c6bZK6z05ruO7Dgr2cJ8g46kjffr0NgIwvYtmSJmm6Yr1XaVVSNConVlgNJp5I27
	 oiRsT9JCdlkouj+Z+Raw4wiZvmdumR2dhC4zcgCMp3RzDyyA4zlvtg7L2ONZJtKAYR
	 DgoTJXGufb6zZx5Hm7sm3LPfqNq+1Uoh4+W8Ix+8/0T20lxHcLPUrKz4OY/iDQOfrL
	 kaaFGksVvnH9w==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: dts: nomadik: Fix up MMC node names
Date: Fri, 22 Jan 2021 23:43:31 +0100
Message-Id: <161135518055.1310202.2511846197804284625.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210122222038.2888747-1-linus.walleij@linaro.org>
References: <20210122222038.2888747-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 22 Jan 2021 23:20:38 +0100, Linus Walleij wrote:
> Fix the node names for the MMC/SD card controller to conform
> to the standard node name mmc@..

Applied to arm/dt, thanks!

[1/1] ARM: dts: nomadik: Fix up MMC node names
      commit: f5e4bf9060d34f93519e319d71ee71d779a41084

       Arnd
