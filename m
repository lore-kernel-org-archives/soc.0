Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 107EDC433E0
	for <soc@archiver.kernel.org>; Sat, 30 Jan 2021 00:00:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 769B264E09; Sat, 30 Jan 2021 00:00:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 5DA3364E00
	for <soc@kernel.org>; Sat, 30 Jan 2021 00:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611964809;
	bh=122pHu/+3A07pmTb9HLQ23madvclysgr/LNKAuaceRc=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=Kizxri28B2jyIFKKO2jbwlU7HL6QaiSckhtDB5EhQ4bV0OagBrAhP90oM/Jw3YyLq
	 oFkUbjNvLeIfoCMKYeTzBHwfLNVvU07YMSoIQ5DO8H/GLmVaz+vuSw8suWEV2Q/Aku
	 AjH2pX1kIcPSV7YeCuDTE46Ft98VQ7Mnh+fRrUJcKQ5P6uiyfcbcaeLJyoKHKztPS4
	 3I9rtncW2iiJfZ9UetxJ4IYPLppbV66bVa/AZFrRN4mz5HUI7Lv0euODil3RaYhAMI
	 6qlOOhVDQmNmOWG2DjY7LOzwwaHRhQakFM+vsPtkoZ3l116FUxPPsvYF3M0P9HZfCK
	 IrB2sbbeCxTXw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 52C506095B;
	Sat, 30 Jan 2021 00:00:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161196480928.10199.5786775702248924442.git-patchwork-summary@kernel.org>
Date: Sat, 30 Jan 2021 00:00:09 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (refs/heads/for-next):

Series: [GIT,PULL,1/2] SoC changes for omaps for v5.12
  Submitter: Tony Lindgren <tony@atomide.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=423821
  Lore link: https://lore.kernel.org/r/pull-1611845066-809577@atomide.com
    Patches: [GIT,PULL,1/2] SoC changes for omaps for v5.12
             [GIT,PULL,2/2] Devicetree changes for omaps for v5.12
Patch: ARM: multi_v7_defconfig: add STM32 CEC support
  Submitter: Alexandre TORGUE <alexandre.torgue@foss.st.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=424323
  Lore link: https://lore.kernel.org/r/20210129084842.29123-1-alexandre.torgue@foss.st.com
Patch: [GIT,PULL] STM32 DT changes for v5.12 #1
  Submitter: Alexandre TORGUE <alexandre.torgue@foss.st.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=424319
  Lore link: https://lore.kernel.org/r/5e8897a0-8f68-5e41-bfa0-ccdf1e23a3c1@foss.st.com
Patch: [GIT,PULL,v2] arm64: dts: hisilicon dts updates for v5.12
  Submitter: Wei Xu <xuwei5@hisilicon.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=424343
  Lore link: https://lore.kernel.org/r/6013D1C7.90902@hisilicon.com
Series: Renesas ARM SoC updates for v5.12 (take two)
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=424367
  Lore link: https://lore.kernel.org/r/20210129090815.2552425-1-geert+renesas@glider.be
    Patches: [GIT,PULL,1/2] Renesas ARM DT updates for v5.12 (take two)
             [GIT,PULL,2/2] Renesas driver updates for v5.12

Total patches: 7

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


