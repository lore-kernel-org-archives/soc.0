Return-Path: <SRS0=E8+R=L4=collabora.com=angelogioacchino.delregno@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E75C16B13
	for <soc@archiver.kernel.org>; Tue, 23 Apr 2024 10:29:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EFB5CC32782; Tue, 23 Apr 2024 10:29:23 +0000 (UTC)
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C0071C116B1;
	Tue, 23 Apr 2024 10:29:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C0071C116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713868160;
	bh=hsq561AxuVCDMkVVr3KrrBiS05FJM8tJfKXLDp6j3Vw=;
	h=From:To:Cc:Subject:Date:From;
	b=ZM26dtH+V2u28qJ1PfbeQNZZEB57ttSmZ8fndx9P9M26TnMSEFfUZDRoUK/cvdVLQ
	 0BVvYkjtqyWiH1kjrOklVw5tP2V2Tw9gBfuP8pE1zwcNgaPGrUvnufcpjm+tbbQ7AV
	 Te3Hvlr7Vz3U3hI/GjWZ3ies4Tsqsl5VYUIjRSHJe8356JJDIA4NjeVssXMpHkVO3+
	 9zBnh34cthfAdHyPdg6I1slec8tPa6iIKUZ9a3mifriV+oaF4nhK4Q9bcgAmfuntwJ
	 ULZybsTcjC/kRs4a4g2V5DUMzXGosBzzaahwVs2c+PEo8ZQ6Y122/4SHfML1lj3Ygo
	 MBEgAINTiABkw==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 88E2437820AB;
	Tue, 23 Apr 2024 10:29:20 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [GIT,PULL,1/2] MediaTek ARM64 Device Tree fixes for v6.9
Date: Tue, 23 Apr 2024 12:28:57 +0200
Message-ID: <20240423102915.371782-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git/ tags/mtk-dts64-fixes-for-v6.9

for you to fetch changes up to 3baac7291effb501c4d52df7019ebf52011e5772:

  arm64: dts: mediatek: mt2712: fix validation errors (2024-04-05 09:52:47 +0200)

----------------------------------------------------------------
MediaTek ARM64 DTS fixes for v6.9

This fixes some dts validation issues against bindings for multiple SoCs,
GPU voltage constraints for Chromebook devices, missing gce-client-reg
on various nodes (performance issues) on MT8183/92/95, and also fixes
boot issues on MT8195 when SPMI is built as module.

----------------------------------------------------------------
Ikjoon Jang (1):
      arm64: dts: mediatek: mt8183: Add power-domains properity to mfgcfg

Nícolas F. R. A. Prado (5):
      arm64: dts: mediatek: mt8192: Add missing gce-client-reg to mutex
      arm64: dts: mediatek: mt8195: Add missing gce-client-reg to vpp/vdosys
      arm64: dts: mediatek: mt8195: Add missing gce-client-reg to mutex
      arm64: dts: mediatek: mt8195: Add missing gce-client-reg to mutex1
      arm64: dts: mediatek: cherry: Describe CPU supplies

Pin-yen Lin (4):
      arm64: dts: mediatek: mt8192-asurada: Update min voltage constraint for MT6315
      arm64: dts: mediatek: mt8195-cherry: Update min voltage constraint for MT6315
      arm64: dts: mediatek: mt8183-kukui: Use default min voltage for MT6358
      arm64: dts: mediatek: mt8186-corsola: Update min voltage constraint for Vgpu

Rafał Miłecki (9):
      arm64: dts: mediatek: mt7622: fix clock controllers
      arm64: dts: mediatek: mt7622: fix IR nodename
      arm64: dts: mediatek: mt7622: fix ethernet controller "compatible"
      arm64: dts: mediatek: mt7622: drop "reset-names" from thermal block
      arm64: dts: mediatek: mt7986: drop invalid properties from ethsys
      arm64: dts: mediatek: mt7986: drop "#reset-cells" from Ethernet controller
      arm64: dts: mediatek: mt7986: drop invalid thermal block clock
      arm64: dts: mediatek: mt7986: prefix BPI-R3 cooling maps with "map-"
      arm64: dts: mediatek: mt2712: fix validation errors

 arch/arm64/boot/dts/mediatek/mt2712-evb.dts              |  8 ++++----
 arch/arm64/boot/dts/mediatek/mt2712e.dtsi                |  3 ++-
 arch/arm64/boot/dts/mediatek/mt7622.dtsi                 | 34 ++++++++++++++--------------------
 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts |  6 +++---
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi                |  8 ++------
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi           |  1 -
 arch/arm64/boot/dts/mediatek/mt8183.dtsi                 |  1 +
 arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi         |  2 +-
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi         |  6 +++---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi                 |  1 +
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi          | 36 ++++++++++++++++++++++++++++++++++--
 arch/arm64/boot/dts/mediatek/mt8195.dtsi                 |  5 +++++
 12 files changed, 70 insertions(+), 41 deletions(-)

