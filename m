Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4CD20899C
	for <soc@lists.linux.dev>; Wed, 19 Mar 2025 22:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742422289; cv=none; b=H558jCYDyQNuRYUs/ykcP00Rp4/POObkLA7DZ52tF4TxHQtpcvNqe6BT0skc9H0Hpktc1SUO+th4DMV7exyOwqUbEgkhLBOW5eChdzQmmau8VA4xP8cWWZheAGrt6xEAdyeUzFC/y6WfkOc2jteZWtMHTeAxunf9nmjJNE9vHpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742422289; c=relaxed/simple;
	bh=5pWS/G6pZ19ZhrJmRzFwYFM6bEYgk8JPCrk8affVAfU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=sNKWEW6TVAaDSOc6+IKHxllEinQlOXTSy91nqMWbBk+t6M+apPzcrqVPa47SwVVRxxWUVUFSIqEAdFl0fNR5REpJK8KiJiBFuruW8oDdI8/kPiGVmeYoBXHhPXtRCGB0RJfkgYJC17jffTf2rpBdUaALuc4zE7i1kfxw4F1IMKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VInlPmJc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VInlPmJc"
Received: by smtp.kernel.org (Postfix)
	id 4DA37C4CEEA; Wed, 19 Mar 2025 22:11:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3013AC4CEE4
	for <soc@kernel.org>; Wed, 19 Mar 2025 22:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742422289;
	bh=5pWS/G6pZ19ZhrJmRzFwYFM6bEYgk8JPCrk8affVAfU=;
	h=Subject:From:Date:To:Cc:From;
	b=VInlPmJcI0qVPGE6NglmvBNOtc0Rwgjedq/hOveZgo79wlu33tY1JyE6isUxRwpkk
	 xXC8NpqdQcBcZeqdGXrGLJxXMcZ4Hse1E1V8qCfksSG2+gR4zPYspKGSs2u2s1Pqrp
	 aJKbJA2djRz3/OON2ac87Afi8G0g9zXLVCnsRHKP2JWgmPMRH9znzFnSIWUjTWsr5W
	 g9pjxRD7ShZVjL8qH/n4qYnSzMM1DAEut0yekLSudVnC+zEDJqua+F+7OGApL+SEB7
	 FZI05bfz86afYWUYUgzeTGakKP3y1z0ANXd8nwB0JDVv8f0qGDggRdTkEdgpYKDRI/
	 tOHbI6yJOU+fA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EFFC93806654;
	Wed, 19 Mar 2025 22:12:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174242232447.1211847.18418037539183197281.git-patchwork-summary@kernel.org>
Date: Wed, 19 Mar 2025 22:12:04 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] RISC-V SpacemiT Devicetrees for v6.15
  Submitter: Yixun Lan <dlan@gentoo.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=942904
  Lore link: https://lore.kernel.org/r/20250312003023-GYA76989@gentoo

Patch: [GIT,PULL] RISC-V Devicetrees for v6.15
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=945114
  Lore link: https://lore.kernel.org/r/20250318-favorite-presuming-bf2fcf55bf6a@spud

Patch: [GIT,PULL] Qualcomm Arm64 defconfig updates for v6.15
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=945619
  Lore link: https://lore.kernel.org/r/20250319144354.2281720-1-andersson@kernel.org

Patch: [GIT,PULL] arm64: dts: hisilicon dts updates for v6.15
  Submitter: Wei Xu <xuwei5@hisilicon.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=945122
  Lore link: https://lore.kernel.org/r/67D968A9.7080504@hisilicon.com

Patch: [GIT,PULL] RISC-V Sophgo Devicetrees for v6.15
  Submitter: Chen Wang <unicorn_wang@outlook.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=944565
  Lore link: https://lore.kernel.org/r/PN0PR01MB10393CEC71B623E0A779E7393FEDF2@PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM

Patch: [GIT,PULL] More Qualcomm driver updates for v6.15
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=945609
  Lore link: https://lore.kernel.org/r/20250319142448.2279164-1-andersson@kernel.org

Patch: soc: samsung: include linux/array_size.h where needed
  Submitter: Arnd Bergmann <arnd@kernel.org>
  Committer: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=940733
  Lore link: https://lore.kernel.org/r/20250305211446.43772-1-arnd@kernel.org

Series: arm64: dts: AMD Seattle clean-ups
  Submitter: Rob Herring (Arm) <robh@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=941290
  Lore link: https://lore.kernel.org/r/20250306-dt-amd-fixes-v1-0-011c423ba99a@kernel.org
    Patches: [1/4] arm64: dts: amd/seattle: Base Overdrive B1 on top of B0 version
             [2/4] arm64: dts: amd/seattle: Move and simplify fixed clocks
             [3/4] arm64: dts: amd/seattle: Fix bus, mmc, and ethernet node names
             [4/4] arm64: dts: amd/seattle: Drop undocumented "spi-controller" properties

Patch: [GIT,PULL] Microchip AT91 DT updates for v6.15
  Submitter: Claudiu Beznea <claudiu.beznea@tuxon.dev>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=943211
  Lore link: https://lore.kernel.org/r/20250312173755.975074-1-claudiu.beznea@tuxon.dev

Series: [GIT,PULL,1/2] arm64: dts: ti: K3 devicetree updates for v6.15
  Submitter: Vignesh Raghavendra <vigneshr@ti.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=943151
  Lore link: https://lore.kernel.org/r/5d612c0e-4cd4-469a-9856-dd4552d74412@ti.com
    Patches: [GIT,PULL,1/2] arm64: dts: ti: K3 devicetree updates for v6.15
             [GIT,PULL,2/2] arm64: defconfig: Updates for v6.15 for TI K3 platforms

Patch: [GIT,PULL] Amlogic drivers updates for v6.15
  Submitter: Neil Armstrong <neil.armstrong@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=944776
  Lore link: https://lore.kernel.org/r/eeaa8d3b-4fc3-4dae-92b8-0fc590e1a070@linaro.org

Patch: [GIT,PULL] Microchip AT91 SoC updates for v6.15
  Submitter: Claudiu Beznea <claudiu.beznea@tuxon.dev>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=943212
  Lore link: https://lore.kernel.org/r/20250312173755.975074-2-claudiu.beznea@tuxon.dev

Patch: [GIT,PULL] ARM: zynq: dts: changes for 6.15
  Submitter: Michal Simek <monstr@monstr.eu>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=944022
  Lore link: https://lore.kernel.org/r/CAHTX3d+DZo3thrakBf=QCq91QFeChoizuhVa6oBBj9E+sdEXAQ@mail.gmail.com

Series: [GIT,PULL,1/4] samsung: drivers for v6.15
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=942022
  Lore link: https://lore.kernel.org/r/20250309185601.10616-1-krzysztof.kozlowski@linaro.org
    Patches: [GIT,PULL,1/4] samsung: drivers for v6.15
             [GIT,PULL,2/4] arm64: dts: samsung: DTS for v6.15
             [GIT,PULL,3/4] ARM: samsung: soc/drivers for v6.15

Patch: [GIT,PULL] memory: drivers for v6.15
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=944411
  Lore link: https://lore.kernel.org/r/20250316143503.17620-1-krzysztof.kozlowski@linaro.org

Patch: [GIT,PULL] arm64: dts: ZynqMP DT changes for v6.15
  Submitter: Michal Simek <monstr@monstr.eu>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=944016
  Lore link: https://lore.kernel.org/r/CAHTX3d+u1VmxP4vm0peQS-ST7o0BuCpKUPRVCSLMfAAb=eV3Xg@mail.gmail.com

Patch: [GIT,PULL] Third and final batch of Apple SoC DT updates for v6.15
  Submitter: Sven Peter <sven@svenpeter.dev>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=941931
  Lore link: https://lore.kernel.org/r/20250309113212.48137-1-sven@svenpeter.dev

Patch: [GIT,PULL] Reset controller updates for v6.15
  Submitter: Philipp Zabel <p.zabel@pengutronix.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=944098
  Lore link: https://lore.kernel.org/r/20250314164406.744117-1-p.zabel@pengutronix.de

Patch: [GIT,PULL] soc: ti: Driver updates for v6.15
  Submitter: Nishanth Menon <nm@ti.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=943094
  Lore link: https://lore.kernel.org/r/20250312113826.ka63nijuftgs6h52@mocker

Patch: [GIT,PULL] Allwinner device tree changes for 6.15
  Submitter: Chen-Yu Tsai <wens@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=943597
  Lore link: https://lore.kernel.org/r/Z9LTOHJDY2p0lNG0@wens.tw


Total patches: 26

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


