Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0942D205E3B
	for <soc@lists.linux.dev>; Fri, 11 Jul 2025 08:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752223029; cv=none; b=GUViVCWqqHwWvHrIyV1j9En4tfepyEmNvMif5g6SjGmh6zmVvwhLfVEWrkCsPHmdbIT8wKL7BFAzuSyXHxJZsn+4l4Tqem1mkJweWY05VqOwE5Ez46Kk5hHgkGPq4KSDXUzcBPJigs1YccnX6MGrVOu1PJTd92dWctRrDNUNtEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752223029; c=relaxed/simple;
	bh=j0KwSRWAMzpxi0sUamLXH8TO5qMWBSAVIq0YPSx3YtE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dZK5N5hPDcd0mG+/RYcaLTTc16zo0xKYRin9xgQp+bm435m6ebcwRu5/Gz2jLrKFqM9MrHSgAL+WLK9+WRjbNgUKrnfgMZkMA2ehzbvVIt+H+nF4Q7c3iLgxXc7RQXtj8s3U+QnF6tXM+P50WGR9wOSYRxb0egAaT+zELLDF50k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Lhf2SKMd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Lhf2SKMd"
Received: by smtp.kernel.org (Postfix)
	id F0B4BC4CEEF; Fri, 11 Jul 2025 08:37:08 +0000 (UTC)
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 505C9C4CEF7;
	Fri, 11 Jul 2025 08:37:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 505C9C4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1752223020;
	bh=j0KwSRWAMzpxi0sUamLXH8TO5qMWBSAVIq0YPSx3YtE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Lhf2SKMdZhYdSdZUOwxYzkzFJ0FDModoZdPuIOBCQOzN4NznsCDvq7M/EewNcQnJd
	 CYMHHQBTofK5CY0UW81jo2XNcGejlW9Mt/R+lnvrzZH1nVLaDPqPe4mk0NPmsEOD4x
	 YBapT2/IoM7GODRfxaLBC7Q1mVP55UAqKWH5ogMlev/5+1oeH9YiasEAeW3QDB4Y35
	 wgC/qwE3OnrX4wRYelzb8C27DpeRkdFdn/Acc2xKMe8XJFH40204HNq2iqVKG/OK/3
	 zMvZk39f9122LIOvorBq7pB5uNgkL0DOLvo7b1JTb8EK/oFkLxZreyuLF8/698eLRW
	 mTwy0gVlJDERA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A9E9B17E0FD4;
	Fri, 11 Jul 2025 10:36:59 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: matthias.bgg@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [GIT,PULL,3/4] MediaTek ARM64 DTS updates for v6.17
Date: Fri, 11 Jul 2025 10:36:47 +0200
Message-ID: <20250711083656.33538-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250711083656.33538-1-angelogioacchino.delregno@collabora.com>
References: <20250711083656.33538-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-dts64-for-v6.17

for you to fetch changes up to a9b906f15995e18b700a7e7791865ecf2f1cee65:

  arm64: dts: mediatek: mt8395-genio-1200-evk: Add MT6359 PMIC key support (2025-07-07 11:37:56 +0200)

----------------------------------------------------------------
MediaTek ARM64 DeviceTree updates for v6.17

This adds new machines and improves support for already supported
MediaTek SoCs.

In particular:
 - New machine: MT8186 Steelix Squirtle Chromebook
 - Steelix-Voltorb's two dts are merged in one

...and improvements for already supported SoCs and machines:
 - Added reserved memory for AFE DMA for MT8173/83/86/92,
   aligning audio related memory allocation between all of
   the Chromebook SoCs
 - Added second source components for Steelix, and marked the
   multiple trackpads for Asurada as such
 - MediaTek Genio 1200: Enabled support for the Audio DSP and sound
 - MediaTek Genio 510/700/1200: Added support for the PMIC Keys
 - MediaTek MT7988: Added Cache Coherent Interconnect for CPU DVFS
 - MT7988A-BananaPi-R4: Enabled CCI, added GPIO LEDs
 - Airoha EN7581: Added ethernet nodes to Evaluation Board

----------------------------------------------------------------
Chen-Yu Tsai (9):
      arm64: dts: mediatek: mt8173: Reserve memory for audio frontend
      arm64: dts: mediatek: mt8183-kukui: Reserve memory for audio frontend
      arm64: dts: mediatek: mt8186-corsola: Reserve memory for audio frontend
      arm64: dts: mediatek: mt8192-asurada: Reserve memory for audio frontend
      dt-bindings: arm: mediatek: Merge MT8186 Voltorb entries
      dt-bindings: arm: mediatek: Add MT8186 Squirtle Chromebooks
      arm64: dts: mediatek: mt8186-steelix: Mark second source components for probing
      arm64: dts: mediatek: mt8186: Merge Voltorb device trees
      arm64: dts: mediatek: mt8186: Add Squirtle Chromebooks

Frank Wunderlich (5):
      dt-bindings: interconnect: add mt7988-cci compatible
      arm64: dts: mediatek: mt7988: add cci node
      arm64: dts: mediatek: mt7988a-bpi-r4: add proc-supply for cci
      arm64: dts: mediatek: mt7988a-bpi-r4: drop unused pins
      arm64: dts: mediatek: mt7988a-bpi-r4: add gpio leds

Laura Nao (1):
      arm64: dts: mediatek: mt8192-asurada-spherion: Mark trackpads as fail-needs-probe

Lorenzo Bianconi (1):
      arm64: dts: airoha: en7581: Add ethernet nodes to EN7581 SoC evaluation board

Louis-Alexis Eyraud (3):
      arm64: dts: mediatek: mt8395-genio-1200-evk: Enable Audio DSP and sound card
      arm64: dts: mediatek: mt8390-genio-common: Add Home MT6359 PMIC key support
      arm64: dts: mediatek: mt8395-genio-1200-evk: Add MT6359 PMIC key support

 Documentation/devicetree/bindings/arm/mediatek.yaml                                     |   7 +--
 Documentation/devicetree/bindings/interconnect/mediatek,cci.yaml                        |  11 +++--
 arch/arm64/boot/dts/airoha/en7581-evb.dts                                               |   8 +++
 arch/arm64/boot/dts/airoha/en7581.dtsi                                                  |  49 +++++++++++++++++++
 arch/arm64/boot/dts/mediatek/Makefile                                                   |   4 +-
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi                               | 113 +++++++++----------------------------------
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi                                               |  33 +++++++++++++
 arch/arm64/boot/dts/mediatek/mt8173.dtsi                                                |   9 ++++
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi                                          |  11 +++++
 arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dts                                | 107 ++++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix.dtsi                                |   9 +++-
 arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327683.dts                     |   2 +
 arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262148.dts                    |   2 +
 arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dts                       |  13 -----
 .../dts/mediatek/{mt8186-corsola-voltorb-sku589825.dts => mt8186-corsola-voltorb.dts}   |   5 +-
 arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi                                        |  18 ++++---
 arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts                             |   7 +++
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi                                        |  17 ++++++-
 arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi                                   |   4 ++
 arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts                                  |  61 ++++++++++++++++++++++-
 20 files changed, 366 insertions(+), 124 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dts
 delete mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dts
 rename arch/arm64/boot/dts/mediatek/{mt8186-corsola-voltorb-sku589825.dts => mt8186-corsola-voltorb.dts} (76%)

