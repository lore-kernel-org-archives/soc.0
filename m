Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9E93BBFA9
	for <soc@lists.linux.dev>; Thu, 30 Jul 2026 08:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785400377; cv=pass; b=kqmwwIiLhLykVFW2Cuz6s6jyO4wOwbVp2G9mxUvYkTwP5NMf5rTI0HQyHCIX/LtYl7KWWngb6qEII3XBihC1jfx/zU/IVaM4ycXZmFIk9eZo9oV+rf8gL+Le07PuG/lSQV2i1/BmWdzBMea04JWz+1WL4QSOhIy+HK3BV+Vf6aY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785400377; c=relaxed/simple;
	bh=zwE0qptctD4Vx8UNaJjRHbNvZ7ftCwYmm5ExAmdvNVw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pcIqOxUVvW/W5cPdQpSGS2gyIIYOmDi5W32uTRoRHKk3XGD1+C/1/m+6u2GKEzXo/SSpAqhuOSKE3wr+7NhNDcfj4G5bmACFx4CL5/40QBWmdElcwtWRavG44FQJFaUoOw5fFv2V3fV47YFAWjLKPZoNmTGksMPUK8PEGneUMj0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=H0cba5VK; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="H0cba5VK"
Received: by smtp.kernel.org (Postfix)
	id 008201F000E9; Thu, 30 Jul 2026 08:32:56 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1785400375;
	b=Erg0pDd79fweYM5S/t+if+P5V0Gktwvf43OwtYeFKubWwwYdi9S+1xT13+1/eCRYQKxC
	 Ijz3Z1c5HLfNED05eU6TwbV+zf66Doj/9TZLyiGjRPMjLDVtV4vcdoG8eALJYUL2DzuxF
	 NlHPscxPbQ+QPbS9zNSiUuocLgHxM8ZWcwovmOtdPz7gO1brCqtN7y7ftsYXgKDl582VL
	 PVWcm2eEBLGEJzXnKxsCSmF9WlTRNmJrJXb73G0RvHvAkGk5A/syHz8XgB2AOUF73WFP6
	 nP4d7b0NteanaWW3ClGiOyLJ0QjtmNPoUKrhpd50Y0b0xzkD4I8bXNa96bsNiClcRXw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1785400375;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=J1JPH9AKZzJchBn7pDlPot8tRe7bTeB76GJZrx18aD4=;
	b=HgIFj5XQDeFAmYziHwgu3oOBrdGtKqwPW6UuzYtN3hdRVgHiYeIQdHMhNSvlbV5OQ4XJ
	 Iv1d/2rdwRyJIPaLMKq+NRA2smBvUmZNzVoszy2YaUxgHWS8XZ/jms0bjezMzHsTNFykE
	 HTVl/VB3VPAsiXIPE6dXvvaF32fatSoNHbCCZDBg+ezuDIhc0J7UqE+g5gqfVGz3z2iKj
	 5GyDJDLQRdio0eh1Wmk/SBl3ehJfogC7FzWZIjmAfFDueM5Ieo2xTaBAong3cCbH4WN56
	 yVzfxqkXhv0r/IOHNIG5pccVak6j85kMZMvq85AxNhbD7xeBLmn06ixkCFqYIBsr8/A==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=H0cba5VK;
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 37D591F00A3A;
	Thu, 30 Jul 2026 08:32:54 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=H0cba5VK
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 37D591F00A3A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785400372;
	bh=zwE0qptctD4Vx8UNaJjRHbNvZ7ftCwYmm5ExAmdvNVw=;
	h=From:To:Cc:Subject:Date:From;
	b=H0cba5VKUrs7eXqNSH0twaGS4pg2YkxSc0lARup7d2xePB2QTFrFaJmbunMYWBX8T
	 Eo2XNUQdYlagiHtOqgNNCuKPAGkhN5OIUqrqFYKV9/LaPaNoOH02PHjFUCwAW1l4Nk
	 H5DQneFCuWDedkMlhYhakEO1/NZld5aZ065BQyqtHNKoXIcTlZnnCCaZrBUrhFfbH4
	 ulT1pqhNAxqdM8EmIIGKIsRsIzzNMVcQmACF573oGPd6WJAVQyHiDiKeNhXL+lQhXd
	 Ud+02GS4ktGf6flAeP0jXiNpCm6PfcZi4nFdfdufi/kaQs3Zc/nudlmHgsvzoTk2hN
	 roR2ow/pIvCJQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8DAF417E063E;
	Thu, 30 Jul 2026 10:32:52 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	matthias.bgg@gmail.com
Subject: [GIT,PULL,1/3] MediaTek ARM64 Device Tree updates for v7.3
Date: Thu, 30 Jul 2026 10:32:44 +0200
Message-ID: <20260730083249.13867-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-dts64-for-v7.3

for you to fetch changes up to 3dc552c1bab6e83bb45af0a49f3a900845a24495:

  arm64: dts: mediatek: mt6359: use proper compatible for rtc (2026-07-21 15:16:45 +0200)

----------------------------------------------------------------
MediaTek ARM64 DeviceTree updates

This adds a couple of fixes and improvements for multiple
MediaTek SoCs.

In particular:
- Indentation/whitespace fixes for some devicetrees
- Documentation improvements for MediaTek Mute-X
- dtbs-check warnings fixes
  - MT8390 Tungsten boards: removal of unnecessary cells
  - MT6795 SoC: removal of deprecated property in UART DMA
- MT6359 PMIC's RTC now uses the correct compatible string
- MT8183/86/88/92/95 SoCs gain support for the UART DMA IPs
- MT8186 gets a new CCI OPP table to resolve lockups
- MT8188/83 Chromebooks now got the correct SPI NOR supply
- MT8192 Asurada drops support for the (unused) MMC1 port
- MediaTek Genio 510/700/1200 EVKs and Radxa NIO-12L now get
  their PMIC power input tree completed with assignment of
  the correct supplies

----------------------------------------------------------------
AngeloGioacchino Del Regno (8):
      arm64: dts: mediatek: tungsten-smarc: Remove unnecessary cells
      arm64: dts: mediatek: mt6795: Remove deprecated UART DMA property
      arm64: dts: mediatek: mt8183: Add and use UART AP_DMA controller
      arm64: dts: mediatek: mt8186: Add and use UART AP_DMA controller
      arm64: dts: mediatek: mt8188: Add and use UART AP_DMA controller
      arm64: dts: mediatek: mt8192: Add and use UART AP_DMA controller
      arm64: dts: mediatek: mt8195: Add and use UART AP_DMA controller
      dt-bindings: soc: mediatek: mutex: Improve title and description

Chen-Yu Tsai (3):
      arm64: dts: mediatek: mt8183-kukui: Add supply for SPI NOR flash
      arm64: dts: mediatek: mt8188-geralt: Add supply for SPI NOR flash
      arm64: dts: mediatek: mt8192-asurada: Disable mmc1 on Spherion

Krzysztof Kozlowski (1):
      arm64: dts: mediatek: Correct indentation and whitespace

Louis-Alexis Eyraud (4):
      arm64: dts: mediatek: mt8390-genio-common: Add MT6365 PMIC supplies
      arm64: dts: mediatek: mt8395-genio-common: Add MT6365 PMIC supplies
      arm64: dts: mediatek: mt8395-radxa-nio-12l: Add MT6365 PMIC supplies
      arm64: dts: mediatek: mt6359: use proper compatible for rtc

Mark Tseng (1):
      arm64: dts: mediatek: mt8186: change CCI OPP scaling mapping

 Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml |  17 ++++++-----
 arch/arm64/boot/dts/mediatek/mt6359.dtsi                           |   2 +-
 arch/arm64/boot/dts/mediatek/mt6795.dtsi                           |   4 +--
 arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi              |   6 ++--
 arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dts         |   4 +--
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi                     |   2 ++
 arch/arm64/boot/dts/mediatek/mt8183.dtsi                           |  22 +++++++++++++
 arch/arm64/boot/dts/mediatek/mt8186.dtsi                           | 112 ++++++++++++++++++++++++++++++++++++++++---------------------------
 arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi                    |   1 +
 arch/arm64/boot/dts/mediatek/mt8188.dtsi                           |  33 ++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts        |   4 +++
 arch/arm64/boot/dts/mediatek/mt8192.dtsi                           |  17 +++++++++++
 arch/arm64/boot/dts/mediatek/mt8195.dtsi                           |  37 ++++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi              |  19 +++++++++++-
 arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi            |   4 ---
 arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi              |  17 +++++++++++
 arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts              |  17 +++++++++++
 17 files changed, 252 insertions(+), 66 deletions(-)

