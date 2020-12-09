Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67028C433FE
	for <soc@archiver.kernel.org>; Wed,  9 Dec 2020 20:27:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3DD1B23CD2; Wed,  9 Dec 2020 20:27:26 +0000 (UTC)
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results:mail.kernel.org; dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Tony Lindgren <tony@atomide.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-omap@vger.kernel.org,
	arm@kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Tero Kristo <t-kristo@ti.com>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Ohad Ben-Cohen <ohad@wizery.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 3/4] Update am437x to boot without platform data
Date: Wed,  9 Dec 2020 21:27:17 +0100
Message-Id: <160754553210.2241259.15387534181695041690.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <pull-1606806458-694517@atomide.com-3>
References: <pull-1606806458-694517@atomide.com> <pull-1606806458-694517@atomide.com-3>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 1 Dec 2020 09:18:48 +0200, Tony Lindgren wrote:
> The following changes since commit 133ad7ab7005dc951fb66d3de9e29a8259fe9744:
> 
>   ARM: OMAP2+: Build hwmod related code as needed (2020-11-16 12:58:21 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.11/genpd-am437x-signed
> 
> [...]

Merged into arm/omap-genpd, thanks!

merge commit: 3614fb09f998c8f710142fb722ba216ddc79db24

       Arnd
