Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F826C433E0
	for <soc@archiver.kernel.org>; Wed,  3 Feb 2021 12:10:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 23B0864F93; Wed,  3 Feb 2021 12:10:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 0CFAB64F8D
	for <soc@kernel.org>; Wed,  3 Feb 2021 12:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612354206;
	bh=AvCjn+7cqdWcP0Vi6HjPyuScY2Vsv+LC8EbLamCzOJU=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=QFb6gpYGSzcJ55A2/qCEeROAyaFoKJWLC4KQ20/Te3d+A30jwv5RBXJFWGJrHgRFF
	 tscLFH+DenJo5esbCnZVqEPubIw0E3IDvP47Wn4FwP2zwkgV6hNXopVOFMzHYbekW3
	 UTgWiMeGlAZ6IJRIRN3JS9NtYNVpy5yPetKQNFuW8KKWlsr9Rm8A2E4FtouC4wrpzL
	 dq84+0+t49LbseybzKzkRRggT3vcJXaMgcTp+HtMAz7Hffnge99mB/1Cat2BBDzhKm
	 QmpCD8v92Vc24jUa3L+0oYkY0lcUOVrlxs7rceNcMifU0R/ByyCziLkFx8Ui7FeOfU
	 QkRUMRsgf/PUw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id E49E86097A;
	Wed,  3 Feb 2021 12:10:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161235420587.15182.12245145447695451057.git-patchwork-summary@kernel.org>
Date: Wed, 03 Feb 2021 12:10:05 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (refs/heads/arm/fixes):

Patch: [RESEND,v2] ARM: dts: lpc32xx: Revert set default clock rate of HCLK PLL
  Submitter: Alexandre Belloni <alexandre.belloni@bootlin.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=426887
  Lore link: https://lore.kernel.org/r/20210203090320.GA3760268@piout.net

Total patches: 1

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


