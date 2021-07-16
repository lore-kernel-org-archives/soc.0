Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6D92C63793
	for <soc@archiver.kernel.org>; Fri, 16 Jul 2021 21:22:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2463961410; Fri, 16 Jul 2021 21:22:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 0E49F6140A;
	Fri, 16 Jul 2021 21:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626470526;
	bh=9EikVeKDW7BX+OJ0BZhHUtkAW6schU7JlUuX2G3oXXY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=qy0/GVkoQIexPNLPc1ojGsgAb7CJSewi7gPtRXz0PMz4N2ClS6IfqQYzzuSRtiodq
	 PK2/yGshTBFw4bUcsvGZ/pSckD5l/qrJ0tS0uXcMbAjND9i/kIbTASfRQRsgsAJ1ez
	 UiTKfvUPrqJHk63ah+DoOgeginhT5tlkH0ep/tgihf+EDk3s1nII+Jl/CyNA6B2bAy
	 Z/X16MXqRzVH62/N3UE3p4jU5TdEM2YKpfktXiJNdkJMUe7wwMl0k0d41GT64kKqTx
	 KGn2qp99UFgBsoax7fcr/oe6uZmN1Wm90xMuXpo7glCL9Npi+yFcTOR0/rX8n1Pa1f
	 yb2sHpRyW8HGA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 079C260ACA;
	Fri, 16 Jul 2021 21:22:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: multi_v7_defconfig: Make NOP_USB_XCEIV driver built-in
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162647052602.25202.10091257368755064642.git-patchwork-notify@kernel.org>
Date: Fri, 16 Jul 2021 21:22:06 +0000
References: <1625915095-23077-1-git-send-email-stefan.wahren@i2se.com>
In-Reply-To: <1625915095-23077-1-git-send-email-stefan.wahren@i2se.com>
To: Stefan Wahren <stefan.wahren@i2se.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (refs/heads/arm/fixes):

On Sat, 10 Jul 2021 13:04:55 +0200 you wrote:
> The usage of usb-nop-xceiv PHY on Raspberry Pi boards with BCM283x has
> been a "regression source" a lot of times. The last case is breakage of
> USB mass storage boot has been commit e590474768f1 ("driver core: Set
> fw_devlink=on by default") for multi_v7_defconfig. As long as
> NOP_USB_XCEIV is configured as module, the dwc2 USB driver defer probing
> endlessly and prevent booting from USB mass storage device. So make
> the driver built-in as in bcm2835_defconfig and arm64/defconfig.
> 
> [...]

Here is the summary with links:
  - ARM: multi_v7_defconfig: Make NOP_USB_XCEIV driver built-in
    https://git.kernel.org/soc/soc/c/ab37a7a890c1

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


