Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E04E1C25B47
	for <soc@archiver.kernel.org>; Mon, 23 Oct 2023 19:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 97EC4C433CA; Mon, 23 Oct 2023 19:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7B4C3C433C8
	for <soc@kernel.org>; Mon, 23 Oct 2023 19:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698089430;
	bh=bnY6NcmLKOw1Ghk8VBP2htQT+I7HmCd48O5RiaQm9nw=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=oxDF9YsvxGib9G8dqpEULgfr1BLEUbpbVHjYIoPXUa1te05aYzEA2Z4jYi4tu6Pz9
	 s9Tq0cw1owwCTAeILZpaz8M+Z1XWkAWNis3LexrgGU8eB63woBoXnhkoYjqZOtdprT
	 HbhWF6MSv4b6InXSApcFdqhI4tDeFyZprI6CmMFlDXbj2aOPomIM+XwyARZtyYBSt2
	 NSnM8lxGxcm6jS0m1Ks5Ovos0BAiaXtT5RE1/wzFj46gjyEz3s1kgXRVNfRvGJs6zN
	 S6BZHbIPTfXYNyw6b1gl1kEWwkC8gz9j3gJU1o1fb7VvpWSTpddsW55UJg3LryDanm
	 lGXnMDRLYS2xA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5EF4AE4CC11;
	Mon, 23 Oct 2023 19:30:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169808943033.14534.4126128284179655767.git-patchwork-summary@kernel.org>
Date: Mon, 23 Oct 2023 19:30:30 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL,v2] Rockchip driver changes for 6.7
  Submitter: Heiko Stübner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=794685
  Lore link: https://lore.kernel.org/r/2171043.Icojqenx9y@phil

Patch: [GIT,PULL] ARM: mvebu: fixes for v6.6 (#1)
  Submitter: Gregory CLEMENT <gregory.clement@bootlin.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=794783
  Lore link: https://lore.kernel.org/r/875y32abqe.fsf@BL-laptop

Patch: riscv: dts: thead: convert isa detection to new properties
  Submitter: Jisheng Zhang <jszhang@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=795420
  Lore link: https://lore.kernel.org/r/20231022154135.3746-1-jszhang@kernel.org

Patch: [GIT,PULL] arm64: dts: samsung: second pull for v6.7
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=795728
  Lore link: https://lore.kernel.org/r/20231023165412.529762-1-krzysztof.kozlowski@linaro.org

Series: [GIT,PULL,1/2] arm64: dts: ti: K3 updates for v6.7
  Submitter: Vignesh Raghavendra <vigneshr@ti.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=794417
  Lore link: https://lore.kernel.org/r/f05c98b6-6274-4544-8fcd-0332c39244c9@ti.com
    Patches: [GIT,PULL,1/2] arm64: dts: ti: K3 updates for v6.7

Series: Update UniPhier armv8 devicetree
  Submitter: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=795486
  Lore link: https://lore.kernel.org/r/20231023021221.2884828-1-hayashi.kunihiko@socionext.com
    Patches: [1/2] arm64: dts: Update cache properties for socionext
             [2/2] arm64: dts: socionext: add missing cache properties

Patch: [GIT,PULL] ARM: mvebu: dt64 for v6.7 (#1)
  Submitter: Gregory CLEMENT <gregory.clement@bootlin.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=794794
  Lore link: https://lore.kernel.org/r/8734y6aaqb.fsf@BL-laptop

Patch: [RESEND,v2] arm64: dts: Update cache properties for socionext
  Submitter: Rob Herring <robh@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=795246
  Lore link: https://lore.kernel.org/r/20231020195022.4183862-2-robh@kernel.org

Patch: [GIT,PULL] arm64: dts: mediatek: Updates for v6.7 - third try
  Submitter: Matthias Brugger <matthias.bgg@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=794686
  Lore link: https://lore.kernel.org/r/298f159c-f80d-3ba8-fde9-b11b59e5a58e@gmail.com


Total patches: 10

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


