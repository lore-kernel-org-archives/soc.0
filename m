Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C74EC3DA42
	for <soc@archiver.kernel.org>; Tue,  9 Jul 2024 09:30:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 56927C4AF0B; Tue,  9 Jul 2024 09:30:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 414E8C4AF0A
	for <soc@kernel.org>; Tue,  9 Jul 2024 09:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720517438;
	bh=SwRvfhL2PcBneWQb2A5IByuBTvVEke855md2FyGNpA0=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=e7QuZwmFbBlKTUiw4S8dIcWqkchhO2Ru3OmKyK41PUEO9Uw7omzV1OGzAiDyUgIDy
	 JkCKSqxt+D+Mf+wPHD3qB3WBek08Ofo+V1mIHotDofr1U8do6dyaqn6i3Swy8mdrBO
	 XQwtN+lfdN57CNWzg9aMsZJF2+awM5bUHfdIJQLPeu9xltrXKTNzeXV301c+SqEyso
	 /l8/2NT5uxdkUGVkDGiSP/SwGezA/PIIdiBW9urZUuV6dGsHpkpWrtnwkiD9DdHPVr
	 xRVATRxa1R7/MxEySv2hJe0CDQMSJ2WtX7DXX1svHVRJRcSN4pjQh90sdsXyy6Dtqe
	 UW+4bFeYY9LOw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 25970C4332E;
	Tue,  9 Jul 2024 09:30:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172051743809.12156.3149014597990388422.git-patchwork-summary@kernel.org>
Date: Tue, 09 Jul 2024 09:30:38 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] memory: drivers for v6.11
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=867419
  Lore link: https://lore.kernel.org/r/20240702070212.8291-1-krzysztof.kozlowski@linaro.org

Patch: [GIT,PULL] soc: ti: Driver updates for v6.11
  Submitter: Nishanth Menon <nm@ti.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=868857
  Lore link: https://lore.kernel.org/r/20240705151449.s4rngkehjn73favn@stream

Patch: arm64: stm32: enable scmi regulator for stm32
  Submitter: Alexandre Torgue <alexandre.torgue@foss.st.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=868830
  Lore link: https://lore.kernel.org/r/20240705134554.2833835-1-alexandre.torgue@foss.st.com

Series: [GIT,PULL,1/3] Allwinner SoC fixes for 6.10
  Submitter: Chen-Yu Tsai <wens@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=867613
  Lore link: https://lore.kernel.org/r/ZoQY5k21RQLOrBQ3@wens.tw
    Patches: [GIT,PULL,1/3] Allwinner SoC fixes for 6.10
             [GIT,PULL,2/3] Allwinner SoC driver changes for 6.11

Patch: [GIT,PULL] Qualcomm driver updates for v6.11
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=868626
  Lore link: https://lore.kernel.org/r/20240705034410.13968-1-andersson@kernel.org

Patch: [GIT,PULL] RISC-V cache drivers for v6.11
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=869097
  Lore link: https://lore.kernel.org/r/20240707-whoever-undesired-c5f6e96ae403@spud

Patch: [GIT,PULL] Reset controller updates for v6.11, part 2
  Submitter: Philipp Zabel <p.zabel@pengutronix.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=867928
  Lore link: https://lore.kernel.org/r/20240703100809.2773890-1-p.zabel@pengutronix.de

Series: [GIT,PULL,1/2] arm64: dts: samsung: DTS for v6.11
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=867403
  Lore link: https://lore.kernel.org/r/20240702063514.6215-1-krzysztof.kozlowski@linaro.org
    Patches: [GIT,PULL,1/2] arm64: dts: samsung: DTS for v6.11
             [GIT,PULL,2/2,-,drivers] soc: samsung: exynos-pmu: add support for PMU_ALIVE non atomic registers

Patch: [GIT,PULL] RISC-V firmware drivers for v6.11
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=869094
  Lore link: https://lore.kernel.org/r/20240707-lukewarm-film-8a9da40a1c27@spud


Total patches: 11

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


