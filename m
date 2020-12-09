Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E771C4361B
	for <soc@archiver.kernel.org>; Wed,  9 Dec 2020 16:41:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0197023BCD; Wed,  9 Dec 2020 16:41:49 +0000 (UTC)
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results:mail.kernel.org; dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: Kevin Hilman <khilman@baylibre.com>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-amlogic@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] arm64: Kconfig: meson: drop pinctrl
Date: Wed,  9 Dec 2020 17:41:37 +0100
Message-Id: <160753194753.3961338.16881051516363002534.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201207230156.10198-1-khilman@baylibre.com>
References: <20201207230156.10198-1-khilman@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 7 Dec 2020 15:01:56 -0800, Kevin Hilman wrote:
> Don't automatically select pinctrl drivers, leave it up to defaults in
> drivers/pinctrl/meson, which default to built-in, but are also now
> optionally configurable as modules as of
> commit 9c65441ec823 ("pinctrl/meson: enable building as modules")

Applied to arm/soc, thanks!

[1/1] arm64: Kconfig: meson: drop pinctrl
      commit: dcb11100cd5d3f5a191b7fba75422e3df792f3ff

       Arnd
