Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E790C4361B
	for <soc@archiver.kernel.org>; Wed,  9 Dec 2020 20:27:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2161C23D24; Wed,  9 Dec 2020 20:27:29 +0000 (UTC)
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
Subject: Re: [GIT PULL 4/4] Remaining genpd changes for omaps for v5.11
Date: Wed,  9 Dec 2020 21:27:18 +0100
Message-Id: <160754553212.2241259.9032518428414266749.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <pull-1606806458-694517@atomide.com-4>
References: <pull-1606806458-694517@atomide.com> <pull-1606806458-694517@atomide.com-4>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 1 Dec 2020 09:18:49 +0200, Tony Lindgren wrote:
> The following changes since commit df6c2ec872a62cf81dff86ef62818dea89cc9d98:
> 
>   ARM: OMAP2+: Drop legacy remaining legacy platform data for am4 (2020-11-16 13:11:17 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.11/genpd-rest-signed
> 
> [...]

Merged into arm/omap-genpd, thanks!

merge commit: 7fbee7e3386cb51e5ebc60c4d7cea13ffeab31d6

       Arnd
