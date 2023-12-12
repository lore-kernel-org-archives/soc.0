Return-Path: <SRS0=sGaX=HX=collabora.com=angelogioacchino.delregno@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15710C4332F
	for <soc@archiver.kernel.org>; Tue, 12 Dec 2023 11:46:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D32C7C433CB; Tue, 12 Dec 2023 11:46:03 +0000 (UTC)
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A5A5EC433C7;
	Tue, 12 Dec 2023 11:46:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A5A5EC433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702381560;
	bh=2Y3KVaSzJ8l1vh+CQj1Z22GPqsVVwxjVN8I5a3BrYuw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=doWvRxNJ2HFSUoBWutbIziHnL5tT5WVWEfoR4jPR0JBu8xP6q1+HDARUKdowFzGBl
	 dAJLiEV1Yz8TdEDouMQ2Gz6yFR/dQQ0tZeHB54nzhjYIlzKeBZTAeVcZO6tsDxul3G
	 eGQxsWgDd7pY1CwnqyOzO1MfHLoh7q2jyMMg0SowzbEmMTJS/WGMRq3bQrcX0i4JB+
	 Ojc9Vc6olX+ULrjGpv7z5MVn9NVfVbCWHy3gdOkp7YaJ+/L5ffyX4AG3iG/crtVpxx
	 ZP169G2896AvDDnwakzzXIhd1Mj7rNIGWdFLywR5wLYHeUKs19195ldLrJ4ickwQk1
	 Wzt3F4Wyy/kTQ==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 84DBB378145B;
	Tue, 12 Dec 2023 11:46:00 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [GIT,PULL,2/3] MediaTek soc driver updates for v6.8
Date: Tue, 12 Dec 2023 12:44:28 +0100
Message-ID: <20231212114515.121695-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231212114515.121695-1-angelogioacchino.delregno@collabora.com>
References: <20231212114515.121695-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-soc-for-v6.8

for you to fetch changes up to 2bfbf82956e2de75249ce83901800c68d17d9e62:

  soc: mediatek: mtk-svs: Constify runtime-immutable members of svs_bank (2023-12-11 11:36:15 +0100)

----------------------------------------------------------------
MediaTek soc driver updates for v6.8

This adds a refactoring of the MediaTek Smart Voltage Scaling (SVS)
driver and the addition of support for MT8186 and MT8195 in it, and
adds support for the MT8188 VDOSYS and resets in the MMSYS driver.

----------------------------------------------------------------
AngeloGioacchino Del Regno (17):
      soc: mediatek: mtk-svs: Subtract offset from regs_v2 to avoid conflict
      soc: mediatek: mtk-svs: Convert sw_id and type to enumerations
      soc: mediatek: mtk-svs: Build bank name string dynamically
      soc: mediatek: mtk-svs: Reduce memory footprint of struct svs_bank
      soc: mediatek: mtk-svs: Change the thermal sensor device name
      soc: mediatek: mtk-svs: Add a map to retrieve fused values
      soc: mediatek: mtk-svs: Add SVS-Thermal coefficient to SoC platform data
      soc: mediatek: mtk-svs: Move t-calibration-data retrieval to svs_probe()
      soc: mediatek: mtk-svs: Commonize efuse parse function for most SoCs
      soc: mediatek: mtk-svs: Drop supplementary svs per-bank pointer
      soc: mediatek: mtk-svs: Commonize MT8192 probe function for MT8186
      soc: mediatek: mtk-svs: Remove redundant print in svs_get_efuse_data
      soc: mediatek: mtk-svs: Compress of_device_id entries
      soc: mediatek: mtk-svs: Cleanup of svs_probe() function
      soc: mediatek: mtk-svs: Check if SVS mode is available in the beginning
      soc: mediatek: mtk-svs: Use ULONG_MAX to compare floor frequency
      soc: mediatek: mtk-svs: Constify runtime-immutable members of svs_bank

Hsiao Chien Sung (4):
      soc: mediatek: Support MT8188 VDOSYS1 in mtk-mmsys
      soc: mediatek: Support MT8188 VDOSYS1 Padding in mtk-mmsys
      soc: mediatek: Support reset bit mapping in mmsys driver
      soc: mediatek: Add MT8188 VDOSYS reset bit map

Mark Tseng (2):
      soc: mediatek: svs: Add support for MT8195 SoC
      soc: mediatek: svs: Add support for MT8186 SoC

yu-chang.lee (1):
      soc: mediatek: mmsys: Add support for MT8188 VPPSYS

 drivers/soc/mediatek/mt8188-mmsys.h    |  210 ++++++++++++
 drivers/soc/mediatek/mtk-mmsys.c       |   39 +++
 drivers/soc/mediatek/mtk-mmsys.h       |   32 ++
 drivers/soc/mediatek/mtk-mutex.c       |   51 +++
 drivers/soc/mediatek/mtk-svs.c         | 1678 +++++++++++++++++++++++++++++++++++++++++++++++++++++------------------------------------
 include/linux/soc/mediatek/mtk-mmsys.h |    8 +
 6 files changed, 1342 insertions(+), 676 deletions(-)

