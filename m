Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF7227B4E4
	for <soc@lists.linux.dev>; Tue, 20 May 2025 11:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747741445; cv=none; b=U+JNNJu8UjEC3zoU6oY3eGoPApztc+/9lIBisi1ymU9YB9otF1U4ByNRzp8y1VpTagwMJF353DpSHkYXwZPW0zImOMKr7Bxh19ix6gw45kKDHz8QZQ2ETPdYy8iNnm2P4IEymVs0s4JAwres8DXMQ6uFjbG39VzC0YY84jhEtd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747741445; c=relaxed/simple;
	bh=NvPfBC95cpbMqHq/ZrYCPGXtxnr17MynHiOainBiTNU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GDy9OvmB4KB+/XHCMmYRcrfSfRa+R/PlPsqDIYmLeK2In7oKEYG4a//nBG1mr7XiL/BBAhqZjzWxA9OR0CSBRJFLT2cQaR/DXjE8k28Sn3b1xOxHb0VgJej/NpNAaFnIs+L3Xe4+sHvEkkSRuYrwpBcT+FdqQigjoVGgkkRuABQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=jkxhWHN5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="jkxhWHN5"
Received: by smtp.kernel.org (Postfix)
	id 771AFC4CEED; Tue, 20 May 2025 11:44:04 +0000 (UTC)
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 96869C4CEE9;
	Tue, 20 May 2025 11:44:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 96869C4CEE9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747741440;
	bh=NvPfBC95cpbMqHq/ZrYCPGXtxnr17MynHiOainBiTNU=;
	h=From:To:Cc:Subject:Date:From;
	b=jkxhWHN5DwKKgttNYOkJj9NOfHV2KtPzj/f4MdbTcBFtfN92s5uU+E8I+o4Rgk+Z2
	 /tvsDe0HZXvvg6743JdQny3hW5CB1fjzhvjY9DflofRllOPCAKVJp0+2Aciid6Qgki
	 X0CzQfVSDu7WyGhwcVfugG3aSQjcynEQnfP6zbkGqr5BdB10Lk2OjaZKR93Kb9fKG/
	 E0uES9Zc0BaDGIGQzCKneLfrHkzqShOASWeAIgO24egAOGNs+wcRD965iPNcV92e9e
	 iWP0KW3WO9oCxzSGF5aPCN+0OiZBE7GtsEROmPTq6fvV36LxHILYU9VJhbb5mOuqq9
	 duAvD6Yz++bVg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 39A8817E00AD;
	Tue, 20 May 2025 13:44:00 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: matthias.bgg@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [GIT,PULL,1/2] Additional MediaTek ARM64 DTS updates for v6.16
Date: Tue, 20 May 2025 13:43:51 +0200
Message-ID: <20250520114356.1194450-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 1fe38d2a19950fa6dbc384ee8967c057aef9faf4:

  arm64: dts: mt6359: Add missing 'compatible' property to regulators node (2025-05-06 10:35:45 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-dts64-for-v6.16-2

for you to fetch changes up to 99af08feb7fad3df79bda1628e4ee8b6eb1f6a32:

  Revert "arm64: dts: mediatek: mt8390-genio-common: Add firmware-name for scp0" (2025-05-20 13:25:02 +0200)

----------------------------------------------------------------
Additional MediaTek ARM64 DTS updates for v6.16

This addresses devicetree binding warnings happening on	the
MDP3 nodes in mt8188 dts, reverts the commit adding the SCP
firmware-name as strongly suggested by Arnd, and also adds
some more late commits.

In particular:
 - MT6359 PMIC
   - Renamed PMIC RTC node to fix dtbs_check warning
 - MT7988(A)
   - Support for SPI controllers was added to SoC and BPI-R4
   - Support for XSPHY, USB and	PCIe2 was added	as well
   - Fan and cooling maps were added to	BPI-R4 machine
   - Added BananaPi R4 2G5 machine variant
 - MT8365
   - Added touchscreen support to MT8365 Genio EVK
 - MT8188
   - Addressed dtbs_check warnings for MDP3 nodes
 - MT8390 (Genio)
   - Reverted SCP firmware-name	addition

----------------------------------------------------------------
AngeloGioacchino Del Regno (2):
      arm64: dts: mediatek: mt8188: Address binding warnings for MDP3 nodes
      Revert "arm64: dts: mediatek: mt8390-genio-common: Add firmware-name for scp0"

Frank Wunderlich (9):
      dt-bindings: arm: mediatek: add bpi-r4 2g5 phy variant
      arm64: dts: mediatek: mt7988a-bpi-r4: allow hw variants of bpi-r4
      arm64: dts: mediatek: mt7988: Add xsphy for ssusb0/pcie2
      arm64: dts: mediatek: mt7988a-bpi-r4: enable xsphy
      arm64: dts: mediatek: mt7988: add spi controllers
      arm64: dts: mediatek: mt7988: move uart0 and spi1 pins to soc dtsi
      arm64: dts: mediatek: mt7988: add phy calibration efuse subnodes
      arm64: dts: mediatek: mt7988a-bpi-r4: Add fan and coolingmaps
      arm64: dts: mediatek: mt7988a-bpi-r4: configure spi-nodes

Julien Massot (2):
      arm64: dts: mediatek: mt8188: Add missing #reset-cells property
      arm64: dts: mt6359: Rename RTC node to match binding expectations

Lorenzo Bianconi (2):
      arm64: dts: airoha: en7581: Add gpio-ranges property for gpio controller
      arm64: dts: airoha: en7581: Add PCIe nodes to EN7581 SoC evaluation board

Louis-Alexis Eyraud (1):
      arm64: dts: mt8365-evk: Add goodix touchscreen support

 Documentation/devicetree/bindings/arm/mediatek.yaml         |   4 +
 arch/arm64/boot/dts/airoha/en7581-evb.dts                   |  30 ++
 arch/arm64/boot/dts/airoha/en7581.dtsi                      | 105 ++++++
 arch/arm64/boot/dts/mediatek/Makefile                       |   2 +
 arch/arm64/boot/dts/mediatek/mt6359.dtsi                    |   2 +-
 .../arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dts |  11 +
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts    | 400 +----------------------
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi   | 450 ++++++++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi                   | 115 +++++++
 arch/arm64/boot/dts/mediatek/mt8188.dtsi                    |  86 +++--
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts                 |  40 +++
 arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi       |   1 -
 12 files changed, 804 insertions(+), 442 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi

