Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE703225A31
	for <soc@lists.linux.dev>; Tue, 22 Jul 2025 20:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753217423; cv=none; b=G3P7u57X3BaBnJyOi3JP7BIBxFoU6CwLZi70gJSird6fyXHq2H+d0Dh6dnGKOo3vopR628DM22v/GqwpQ/hibZ1kv5RscfeRcapsBuWb1kAFsnxrF4dh+DE5k927aXpRkOhM/63koFG3COJ+BDiN1J3QqoLAqyOimzdhC3zyQ3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753217423; c=relaxed/simple;
	bh=f/I8/fIH0xU5nAu3HC77uSsvJqxvUNcTGIKRn1NEDCc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=QRCX6UZUDOaSuGTE2A5qmzz/Sb8Gbyyi7/nV1G9nMyKt7FxJSu8OWrGsJ1rMp3OWifo91UsKcdDiAzCyT+0EIhkXHpdjz5as2HsRuQzhhVnzTom6w1Zd0oPsHMvO//tScgKul6jChq9Y+1FoOGThpsLx26qWd47ZFGM553sbLyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eQCzqO/G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eQCzqO/G"
Received: by smtp.kernel.org (Postfix)
	id 897E9C4CEF6; Tue, 22 Jul 2025 20:50:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F667C4CEEB
	for <soc@kernel.org>; Tue, 22 Jul 2025 20:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753217423;
	bh=f/I8/fIH0xU5nAu3HC77uSsvJqxvUNcTGIKRn1NEDCc=;
	h=Subject:From:Date:To:Cc:From;
	b=eQCzqO/GTav+pjkU26TrT3xy92LYB4tDPFHCye98HMaJUlE4WfvDqZzgjA582abMg
	 RNlp4Ok/39Y0qoGP67RO60K0PznXCbLC36c5rGVWWhEelqYGz+sst5b3iqmX5LvMOo
	 BGE878qvon3NjZoR2KjGGBSopBovXANa10xDRPJ7GHN+Xbb9P6nHrIj+p0ECQsANH/
	 ls7tYQ5lDPaQjYWw1cDw6KEUxo2f0hNsH+JNYRYosDqyyKOHpPiCoOJjmhDkX8YchJ
	 pwDP8gT+O9iQl0PO7fodxQlF0YYy2AXaKpxyxqiCqHboIFrR5W+mV+wJdmq8UXSt2Y
	 sZ3t+WrXW1XBQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EE8D3383BF5D;
	Tue, 22 Jul 2025 20:50:42 +0000 (UTC)
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
 <175321744158.949540.5554961953760118970.git-patchwork-summary@kernel.org>
Date: Tue, 22 Jul 2025 20:50:41 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: Axiado AX3000 SoC and Evaluation Board Support
  Submitter: Harshit Shah <hshah@axiado.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=984867
  Lore link: https://lore.kernel.org/r/20250722-axiado-ax3000-soc-and-evaluation-board-support-v6-0-543979a60ccf@axiado.com
    Patches: [v6,01/10] dt-bindings: vendor-prefixes: Add Axiado Corporation
             [v6,02/10] dt-bindings: arm: axiado: add AX3000 EVK compatible strings
             [v6,03/10] dt-bindings: gpio: cdns: convert to YAML
             [v6,04/10] dt-bindings: gpio: cdns: add Axiado AX3000 GPIO variant
             [v6,05/10] dt-bindings: serial: cdns: add Axiado AX3000 UART controller
             [v6,06/10] dt-bindings: i3c: cdns: add Axiado AX3000 I3C controller
             [v6,07/10] arm64: add Axiado SoC family
             [v6,08/10] arm64: dts: axiado: Add initial support for AX3000 SoC and eval board
             [v6,09/10] arm64: defconfig: enable the Axiado family
             [v6,10/10] MAINTAINERS: Add entry for Axiado

Patch: [GIT,PULL] More Qualcomm Arm32 DeviceTree updates for v6.17
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=984048
  Lore link: https://lore.kernel.org/r/20250720030959.285762-1-andersson@kernel.org

Series: [GIT,PULL,1/2] arm64: dts: ti: K3 devicetree updates for v6.17
  Submitter: Vignesh Raghavendra <vigneshr@ti.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=982586
  Lore link: https://lore.kernel.org/r/a0401460-8c67-4c29-a6cf-fa4bdf33bc7d@ti.com
    Patches: [GIT,PULL,1/2] arm64: dts: ti: K3 devicetree updates for v6.17
             [GIT,PULL,2/2] arm64: Kconfig: Updates for v6.17 for TI K3 platforms

Patch: [GIT,PULL] Allwinner device tree changes for 6.17
  Submitter: Chen-Yu Tsai <wens@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=982623
  Lore link: https://lore.kernel.org/r/aHaQFe3Lr8Qzyb1M@wens.tw

Patch: [GIT,PULL] RISC-V SoC defconfig for v6.17
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=983052
  Lore link: https://lore.kernel.org/r/20250716-defrost-regime-20a55ed925ad@spud

Patch: [GIT,PULL] amlogic ARM64 DT updates for v6.17
  Submitter: Neil Armstrong <neil.armstrong@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=982831
  Lore link: https://lore.kernel.org/r/3d93b621-9544-4a68-85db-6f87a9e8fa5c@linaro.org

Patch: [GIT,PULL] Qualcomm Arm64 DeviceTree updates for v6.17
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=982777
  Lore link: https://lore.kernel.org/r/20250716031059.76348-1-andersson@kernel.org

Patch: [GIT,PULL,RESEND] RISC-V SpacemiT Devicetrees for v6.17
  Submitter: Yixun Lan <dlan@gentoo.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=982278
  Lore link: https://lore.kernel.org/r/20250715014214-GYA540030@gentoo

Series: [GIT,PULL,1/4] MediaTek arm32 updates for v6.17
  Submitter: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=981411
  Lore link: https://lore.kernel.org/r/20250711083656.33538-1-angelogioacchino.delregno@collabora.com
    Patches: [GIT,PULL,1/4] MediaTek arm32 updates for v6.17


Total patches: 19

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


