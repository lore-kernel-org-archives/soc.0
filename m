Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EF62C433FE
	for <soc@archiver.kernel.org>; Wed,  9 Dec 2020 20:27:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6A92023CD0; Wed,  9 Dec 2020 20:27:23 +0000 (UTC)
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
Subject: Re: [GIT PULL 2/4] Update am335x to boot without platform data
Date: Wed,  9 Dec 2020 21:27:16 +0100
Message-ID: <160754553209.2241259.6092930072303562425.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <pull-1606806458-694517@atomide.com-2>
References: <pull-1606806458-694517@atomide.com> <pull-1606806458-694517@atomide.com-2>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID: <20201209202716.5jSswPxHCPWT1Sys2GI3fJSj7bC6MzoqXb6gdEa7lMY@z>

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 1 Dec 2020 09:18:47 +0200, Tony Lindgren wrote:
> The following changes since commit 57df7e370d2ab83a64c07acd157acfed4169f114:
> 
>   remoteproc/wkup_m3: Use reset control driver if available (2020-11-16 12:57:40 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.11/genpd-am335x-signed
> 
> [...]

I ended up making a top-level branch "arm/omap-genpd" for the omap
genpd changes, as they touch both code and DT files.

Merged into arm/omap-genpd, thanks!

merge commit: d36edb048f48babb3fbf9a4b249df115b7fab152

       Arnd
