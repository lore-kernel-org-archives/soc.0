Return-Path: <SRS0=XhkW=HK=collabora.com=angelogioacchino.delregno@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02B84C4167B
	for <soc@archiver.kernel.org>; Wed, 29 Nov 2023 11:39:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C35AEC433CA; Wed, 29 Nov 2023 11:39:53 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AE723C433C8;
	Wed, 29 Nov 2023 11:39:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AE723C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collabora.com
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7AF7B6601F02;
	Wed, 29 Nov 2023 11:39:50 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701257990;
	bh=pH7RUt8IOckoGEbgFhlgxvz/PFthiMUJhJu0F2NKeDc=;
	h=From:To:Cc:Subject:Date:From;
	b=LwBrUqrTal0pEiuZjGMjnfife8jV2A1ujAWw4c9i5/FoPZKvHIgdqZwUlM0TigTyi
	 2BPTvpZMEowzUf41yz9vWTKBkcO5HwfrbrJJ5EmLd33RXtG7Gx3GbPp8ipL7nnVqco
	 L8VUtzsi2mMSOwZ7hNMfsk97wcE/qPMG+FIGfGLF8yvdjlW91iqhXtDrM/aSLCVNO9
	 1oVftWZyEczGVbDaWSoRrI6UGE2eWJ7NShcV2NPaMu6P1ZR309n2LJtmGT69ckC6af
	 fsT0mKxIalFZpNHanWQuD4xxZMNp4dpxnFSwa5UY7/K0IE03CCCsm5uNMizR+oJtTf
	 AoNW+VnVmtc/g==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [GIT PULL] MediaTek ARM64 Device Tree fixes for v6.7
Date: Wed, 29 Nov 2023 12:39:05 +0100
Message-ID: <20231129113905.134732-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git/ tags/mtk-dts64-fixes-for-6.7

for you to fetch changes up to 5943b8f7449df9881b273db07bdde1e7120dccf0:

  arm64: dts: mediatek: cherry: Fix interrupt cells for MT6360 on I2C7 (2023-11-29 10:37:53 +0100)

----------------------------------------------------------------
MediaTek ARM64 DeviceTree fixes for v6.7

Fixes for various MediaTek SoCs, including

MT7986: - eMMC HS400 mode failures
        - Cooling trips for emergency system shutdown
        - BPI-R3 machine SFP power limit and active cooling

MT8173: - EVB device tree unit_address_vs_reg warning

MT8183: - unit_address_vs_reg and simple_bus_reg warnings
        - Kukui device tree nodes naming consistency and
          adhering to bindings
        - Jacuzzi device tree unnecessary cells removed as
          those were producing avoid_unnecessary_addr_size

MT8186: - Power domains faults due to incorrect clocks
        - GPU speed bin nvmem cell name was wrong, producing
          issues with interpreting the speedbin with GPU OPPs

MT8195: - Local Arbiter (and whole system) ability to suspend
        - Cherry device tree interrupts_property warning

...and another unit_address_vs_reg warning on MT7622.

----------------------------------------------------------------
AngeloGioacchino Del Regno (7):
      arm64: dts: mediatek: mt8195: Fix PM suspend/resume with venc clocks
      arm64: dts: mediatek: mt8183: Fix unit address for scp reserved memory
      arm64: dts: mediatek: mt8183-evb: Fix unit_address_vs_reg warning on ntc
      arm64: dts: mediatek: mt8173-evb: Fix regulator-fixed node names
      arm64: dts: mediatek: mt8183: Move thermal-zones to the root node
      arm64: dts: mediatek: mt8186: Change gpu speedbin nvmem cell name
      arm64: dts: mediatek: cherry: Fix interrupt cells for MT6360 on I2C7

Eric Woudstra (1):
      arm64: dts: mt7986: fix emmc hs400 mode without uboot initialization

Eugen Hristev (3):
      arm64: dts: mediatek: mt8186: fix clock names for power domains
      arm64: dts: mediatek: mt7622: fix memory node warning check
      arm64: dts: mediatek: mt8183-kukui-jacuzzi: fix dsi unnecessary cells properties

Frank Wunderlich (2):
      arm64: dts: mt7986: define 3W max power to both SFP on BPI-R3
      arm64: dts: mt7986: change cooling trips

Hsin-Yi Wang (1):
      arm64: dts: mt8183: kukui: Fix underscores in node names

 arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts |   2 +-
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts             |   2 +-
 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts |  12 ++--
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi                |  24 ++++++--
 arch/arm64/boot/dts/mediatek/mt8173-evb.dts              |   4 +-
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts              |   4 +-
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi   |   8 ++-
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi           |  96 +++++++++++++++----------------
 arch/arm64/boot/dts/mediatek/mt8183.dtsi                 | 242 +++++++++++++++++++++++++++++++++++++++----------------------------------------
 arch/arm64/boot/dts/mediatek/mt8186.dtsi                 |  44 +++++++++------
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi          |   2 +-
 arch/arm64/boot/dts/mediatek/mt8195.dtsi                 |   6 +-
 12 files changed, 241 insertions(+), 205 deletions(-)

