Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 622C8C433FE
	for <soc@archiver.kernel.org>; Tue,  5 Oct 2021 13:50:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 434D061503; Tue,  5 Oct 2021 13:50:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 2C1F861244
	for <soc@kernel.org>; Tue,  5 Oct 2021 13:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633441809;
	bh=2wrUxC+IBEqOA8iZycVugmx24HFPdxWTDfUA/WMsfMI=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=JBxUr3uLVvkXo7f3AqtHHdeaf9ARh6QjJIsGgoLoZxa5A8s0nMO/DlAqMMDn0AQs6
	 LONSDCW3R/4y6vyf7saaF6hpPbRth+P0Etqam56Dv0YTBijTvSFMaCIi5HvWIMNCEw
	 jBCVOkxWmVY3VtT9w0N36uGFmmOzjHHAnSXI/XXpoe9TRmJwuQRlMbIe0cogyadzRT
	 F3tWsaoRy+LIyhV8t/WH/UNmbdQUFIjx/qZweb/X5kqEc3l5W67WgFP2t044lrnrH9
	 QTNisWRyJyqcQ9x5t0bAvsl7TY9ot4CrTKAB++Lw2qrtk0q0X3zeJrjX58QP8fDlyl
	 pMiPbA/Sg3Vrw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 1D8FB60A0E;
	Tue,  5 Oct 2021 13:50:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163344180906.2242.8622420238965149885.git-patchwork-summary@kernel.org>
Date: Tue, 05 Oct 2021 13:50:09 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (refs/heads/arm/fixes):

Patch: MAINTAINERS: Add Vignesh to TI K3 platform maintainership
  Submitter: Nishanth Menon <nm@ti.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=547275
  Lore link: https://lore.kernel.org/r/20210915121308.26795-1-nm@ti.com
Patch: ARM: omap1: move omap15xx local bus handling to usb.c
  Submitter: Arnd Bergmann <arnd@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=553543
  Lore link: https://lore.kernel.org/r/20210927144118.2464881-1-arnd@kernel.org
Patch: [GIT,PULL,v2] arm64: dts: juno: fixes for v5.15-rc1
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=553369
  Lore link: https://lore.kernel.org/r/20210927105249.3583380-1-sudeep.holla@arm.com
Patch: [GIT,PULL] i.MX fixes for 5.15
  Submitter: Shawn Guo <shawnguo@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=551465
  Lore link: https://lore.kernel.org/r/20210923063356.GK13480@dragon
Patch: [GIT,PULL] ARM: at91: fixes for 5.15 #2
  Submitter: Nicolas Ferre <nicolas.ferre@microchip.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=557099
  Lore link: https://lore.kernel.org/r/20211004114344.19304-1-nicolas.ferre@microchip.com
Patch: [GIT,PULL] OP-TEE fix for v5.15
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=547253
  Lore link: https://lore.kernel.org/r/20210915113813.GA509196@jade
Patch: dove: mark 'putc' as inline
  Submitter: Arnd Bergmann <arnd@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=553317
  Lore link: https://lore.kernel.org/r/20210927095343.1015422-1-arnd@kernel.org
Patch: ARM: defconfig: gemini: Restore framebuffer
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=551231
  Lore link: https://lore.kernel.org/r/20210922200933.1825752-1-linus.walleij@linaro.org
Patch: [RESEND] ARM: sharpsl_param: work around -Wstringop-overread warning
  Submitter: Arnd Bergmann <arnd@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=553551
  Lore link: https://lore.kernel.org/r/20210927145332.2784005-1-arnd@kernel.org

Total patches: 9

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


