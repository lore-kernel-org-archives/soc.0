Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27C26C4167B
	for <soc@archiver.kernel.org>; Wed,  9 Dec 2020 17:10:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D669623C81; Wed,  9 Dec 2020 17:10:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607533810;
	bh=CuPFNrjG+nJa9Wlu/ousTWqSqjZ2pb9LEFXBvEn7Hc8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=tFNmvXua25Ql7wiDhySYd+negV7MMMlOBtmD6CDq/JIbuyhu3swSK5637JH4prSjV
	 2Q3tzjiIS89gU6U3J+80qNjMwc0/9Na3pxJLkx897P51t8aV/VCPp1jwvpFtYOeRt5
	 vAj3MnQWlaq1cpFM8VEv76mqygOTu1jVZc1RjH05Dq5oDpz56vZ4AN4i2P5PN3aVy5
	 I6eOlI0eC8COhlYe2q/JzkxBIu3IqIv2BK6XDdFKPcMDDeYJZhrJJv5ziJ1LRSP53J
	 OM18iQAxywotEmie5iLRZzSfXJgJ/55TTOSCdDu9A4SRyE1P6lDvnFdbhHdEmTSiX5
	 jeaYA2MZCOzdg==
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: Kconfig: meson: drop pinctrl
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <160753381073.14869.12843431611502849491.git-patchwork-notify@kernel.org>
Date: Wed, 09 Dec 2020 17:10:10 +0000
References: <20201207230156.10198-1-khilman@baylibre.com>
In-Reply-To: <20201207230156.10198-1-khilman@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (refs/heads/for-next):

On Mon,  7 Dec 2020 15:01:56 -0800 you wrote:
> Don't automatically select pinctrl drivers, leave it up to defaults in
> drivers/pinctrl/meson, which default to built-in, but are also now
> optionally configurable as modules as of
> commit 9c65441ec823 ("pinctrl/meson: enable building as modules")
> 
> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
> 
> [...]

Here is the summary with links:
  - arm64: Kconfig: meson: drop pinctrl
    https://git.kernel.org/soc/soc/c/dcb11100cd5d

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


