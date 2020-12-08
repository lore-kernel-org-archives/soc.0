Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A4A7C433FE
	for <soc@archiver.kernel.org>; Tue,  8 Dec 2020 23:32:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4AD3123AC8; Tue,  8 Dec 2020 23:32:42 +0000 (UTC)
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results:mail.kernel.org; dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Tony Lindgren <tony@atomide.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Tero Kristo <t-kristo@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Ohad Ben-Cohen <ohad@wizery.com>,
	linux-omap@vger.kernel.org,
	arm@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [GIT PULL 1/4] Driver changes for omaps for genpd support
Date: Wed,  9 Dec 2020 00:31:44 +0100
Message-Id: <160747024154.3766805.2738479830140196782.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <pull-1606806458-694517@atomide.com>
References: <pull-1606806458-694517@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 1 Dec 2020 09:18:46 +0200, Tony Lindgren wrote:
> The following changes since commit e7ae08d398e094e1305dee823435b1f996d39106:
> 
>   bus: ti-sysc: Fix bogus resetdone warning on enable for cpsw (2020-10-26 10:08:53 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.11/genpd-drivers-signed
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: e5b14e46a2ad023fbb388c42e24ff7117d0f135a

       Arnd
