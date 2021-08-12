Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1762C4338F
	for <soc@archiver.kernel.org>; Thu, 12 Aug 2021 21:20:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D15066109F; Thu, 12 Aug 2021 21:20:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id BB46B6108C
	for <soc@kernel.org>; Thu, 12 Aug 2021 21:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1628803217;
	bh=OMuLNeogitT2X/nn8UDmG7X6P+Ec3hstkr2rDi9Afqc=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=cgvuIuq0sNQvZAKlKSJ4GUtaK4kNrK902PILr6aZ/BZN4I2HHHRklH6Gca8HH88ya
	 iiz2Fqaplm0Fmyhgdu9qEtELEDnb3rVzqrCOUov+RN1EHvJo5osBGo6SD8wzC529KN
	 ihbR8oqjnWX0dgy3Dhv2iYnPSyrnBgqXVGRQpMCNnlssnxVIekB+4rX1+4qyfygB/z
	 RqmvTSWskQHIyhHopZ4h49WP1gIWOGdrQjEuyLMctOMWI6o7c/v2zfgzAeiRfLe/xc
	 qgbCHJmkIAU79SlwWVFSbUV6UZbIFYMMBLXOR1WXgezgBnRZlrqCl0s60pMAjl1+Vo
	 9S+Zz9f9P3z0A==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id A92B2608FA;
	Thu, 12 Aug 2021 21:20:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162880321763.12191.15969382753314164082.git-patchwork-summary@kernel.org>
Date: Thu, 12 Aug 2021 21:20:17 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (refs/heads/arm/fixes):

Patch: ARM: configs: Update the nhk8815_defconfig
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=527987
  Lore link: https://lore.kernel.org/r/20210807225518.3607126-1-linus.walleij@linaro.org

Total patches: 1

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


