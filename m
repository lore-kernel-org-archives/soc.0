Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C949C6377C
	for <soc@archiver.kernel.org>; Fri, 16 Jul 2021 21:22:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E547561403; Fri, 16 Jul 2021 21:22:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id CE073613FD;
	Fri, 16 Jul 2021 21:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626470525;
	bh=ht6Rb55tFPLedAD7gxBpsHCek76Km9s9VXvLPG5bG4s=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=lfp4nGvirn7C8tmB7niaReYTNoikdjqCaLyI/QoY9Gl+qRmjrFHi6sXdDvfyVwqUY
	 1IV+0xZ2q2VZUoIcRTfSpIbVlDPS9qaGth3s2UU9LPkIF8Jzi5XGQLKtfsBw3QnyyJ
	 WL6t8z6jxfOkx/hWPevk7jqQJUDW+Q+WUPmVNnInRP+n+XVwvNe0Qgy6H+HtdsVDox
	 WM7e6SNrr20cLh1Qlw8VXE55wXTcMrUCQKTMWRG8Dg+tO+ISeD5+YoS4ZSFC9U27Ie
	 dTY1hJJ6QTWfkRP+cZf54fU0k5woaWkNNY+LsEqQv5qlKHyXbvbkMYQTSZQRKNwLdd
	 AeY6Iw7Du6JJg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id C5F07609EA;
	Fri, 16 Jul 2021 21:22:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] arm: Typo s/PCI_IXP4XX_LEGACY/IXP4XX_PCI_LEGACY/
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162647052580.25202.8251721693318839362.git-patchwork-notify@kernel.org>
Date: Fri, 16 Jul 2021 21:22:05 +0000
References: <82ce37c617293521f095a945a255456b9512769c.1626255077.git.geert+renesas@glider.be>
In-Reply-To: <82ce37c617293521f095a945a255456b9512769c.1626255077.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (refs/heads/arm/fixes):

On Wed, 14 Jul 2021 11:33:43 +0200 you wrote:
> Kconfig symbol PCI_IXP4XX_LEGACY does not exist, but IXP4XX_PCI_LEGACY
> does.
> 
> Fixes: d5d9f7ac58ea1041 ("ARM/ixp4xx: Make NEED_MACH_IO_H optional")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> 
> [...]

Here is the summary with links:
  - [v2] arm: Typo s/PCI_IXP4XX_LEGACY/IXP4XX_PCI_LEGACY/
    https://git.kernel.org/soc/soc/c/5f291bfd33c8

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


