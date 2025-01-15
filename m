Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24ABC15688C
	for <soc@lists.linux.dev>; Wed, 15 Jan 2025 17:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736961184; cv=none; b=J+MRugTfrBw8Ie/yRqMOVCshT3DyGl9igxkcMxYHtuQl3RpucGA+9IL9nE+AVPF02qOonbS0ldom/aflny6JpHEtHmX9ur2Nw5R0YS98LXZOuQ4Vu3okWboX9mk1mR4v+Me0TqvNL5cAVXkojj1i0+0cjjUQS01vCMQ154W802U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736961184; c=relaxed/simple;
	bh=R0dIWplxhXGEXHPpmvZFHWmrjrmlTiHR8JHSX9dk3ms=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=lsMSa/7it6ZMEguWu//LpvsECr/cBUftAAE/RaD2dm729K7lW59kf6Z2bP9HC1nfGirai1TrXbMq08fufO59cAcEO4cnvs1ZpgWpEBvqd4mQZpl9c7GZQE0dzMmXJASB1LnV01w5w5fyQ/U5cCvAhcy9YBc+iLFI+CADwpE/CvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PIUJt9Wg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PIUJt9Wg"
Received: by smtp.kernel.org (Postfix)
	id BE026C4CEE0; Wed, 15 Jan 2025 17:13:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A854DC4CED1
	for <soc@kernel.org>; Wed, 15 Jan 2025 17:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736961183;
	bh=R0dIWplxhXGEXHPpmvZFHWmrjrmlTiHR8JHSX9dk3ms=;
	h=Subject:From:Date:To:Cc:From;
	b=PIUJt9Wgxi6H02GucnnA64wJ64KPLt6GCn8tZytaFIhPMNFzUy+vizrBptt7ERXqq
	 4glZmdWTEYXslcJ/ZYSu/VcPFMNUZefdIIB/+m1vZhrymxE70jXDJTX3GUtTVkk5Ch
	 lllS731hhL22ZOmQsZsxgNqcCFyL2n/jgUgSwKC7NWobwJBzfpW+aAgZlQxBA9QeoZ
	 8quIUXzMEFS4fT96I7KOA9qpge2VRIYmwOz3KY/9ovV2iPu3ESrQWTt+iJvrGjzOI8
	 JczRvprucuCecfPbtepTMWvuc6He5RlXdB35dwbARgIeSZFZ2ZDydEH8H66A2Ftc/G
	 raHwk2r4rInfA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B5C55380AA5F;
	Wed, 15 Jan 2025 17:13:27 +0000 (UTC)
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
 <173696120639.809051.4130483696654385681.git-patchwork-summary@kernel.org>
Date: Wed, 15 Jan 2025 17:13:26 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] Qualcomm driver updates for v6.14
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=924537
  Lore link: https://lore.kernel.org/r/20250111172901.391774-1-andersson@kernel.org

Series: ARM: config: stm32: Remove useless flags
  Submitter: Patrice CHOTARD <patrice.chotard@foss.st.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=919891
  Lore link: https://lore.kernel.org/r/20241220125506.3157268-1-patrice.chotard@foss.st.com
    Patches: [v2,1/4] ARM: configs: stm32: Remove FLASH_MEM_BASE and FLASH_SIZE in STM32 defconfig
             [v2,2/4] ARM: configs: stm32: Clean STM32 defconfig
             [v2,3/4] ARM: configs: stm32: Remove CRYPTO in STM32 defconfig
             [v2,4/4] ARM: configs: stm32: Remove useless flags in STM32 defconfig

Series: [GIT,PULL,1/4,defconfig] arm64: defconfig: enable Maxim TCPCI driver
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=921566
  Lore link: https://lore.kernel.org/r/20241231131742.134329-1-krzysztof.kozlowski@linaro.org
    Patches: [GIT,PULL,1/4,defconfig] arm64: defconfig: enable Maxim TCPCI driver
             [GIT,PULL,2/4,drivers] dt-bindings: soc: samsung: exynos-pmu: Add exynos990-pmu compatible

Patch: [GIT,PULL] RISC-V config for v6.14
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=925021
  Lore link: https://lore.kernel.org/r/20250113-colt-retired-6f95df3dc197@spud

Patch: [GIT,PULL] Microchip AT91 defconfig updates for v6.14
  Submitter: Claudiu <claudiu.beznea@tuxon.dev>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=922801
  Lore link: https://lore.kernel.org/r/20250107081424.758980-1-claudiu.beznea@tuxon.dev

Patch: [GIT,PULL] samsung: drivers: for v6.14, part two
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=924677
  Lore link: https://lore.kernel.org/r/20250112180846.64154-1-krzysztof.kozlowski@linaro.org

Series: [GIT,PULL,1/4] soc: ti: Driver updates for v6.14
  Submitter: Nishanth Menon <nm@ti.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=924390
  Lore link: https://lore.kernel.org/r/20250110210753.exsx5yxmxpcdn64y@amicably
    Patches: [GIT,PULL,1/4] soc: ti: Driver updates for v6.14
             [GIT,PULL,2/4] arm64: defconfig: Driver updates for TI K3 platforms for v6.14
             [GIT,PULL,4/4] MAINTAINERS: TI updates for v6.14

Patch: [GIT,PULL] Qualcomm Arm64 defconfig updates for v6.14
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=924538
  Lore link: https://lore.kernel.org/r/20250111173306.392204-1-andersson@kernel.org

Series: [GIT,PULL,1/2] memory: drivers for v6.14
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=921577
  Lore link: https://lore.kernel.org/r/20241231133534.136771-1-krzysztof.kozlowski@linaro.org
    Patches: [GIT,PULL,1/2] memory: drivers for v6.14
             [GIT,PULL,2/2] memory: ti: for v6.14

Patch: [GIT,PULL] Reset controller fixes for v6.13
  Submitter: Philipp Zabel <p.zabel@pengutronix.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=925782
  Lore link: https://lore.kernel.org/r/20250115165404.1269500-1-p.zabel@pengutronix.de

Series: [GIT,PULL,1/3] MediaTek ARM64 DTS updates for v6.14
  Submitter: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=923312
  Lore link: https://lore.kernel.org/r/20250108100826.32458-1-angelogioacchino.delregno@collabora.com
    Patches: [GIT,PULL,1/3] MediaTek ARM64 DTS updates for v6.14
             [GIT,PULL,2/3] MediaTek driver updates for v6.14
             [GIT,PULL,3/3] MediaTek ARM64 defconfig updates for v6.14

Patch: [GIT,PULL] OP-TEE fix for v6.14
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=921783
  Lore link: https://lore.kernel.org/r/20250102140102.GA3082088@rayden

Patch: [GIT,PULL] Reset controller updates for v6.14 (v2)
  Submitter: Philipp Zabel <p.zabel@pengutronix.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=925785
  Lore link: https://lore.kernel.org/r/20250115170247.1303656-1-p.zabel@pengutronix.de


Total patches: 22

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


