Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484BE21128A
	for <soc@lists.linux.dev>; Thu,  6 Mar 2025 11:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741260957; cv=none; b=OMAlGlUR2/DkqAQW1FebvhHpM4gS7KrlRCmV5poB9L+DhFhsQYwUXqZimQim4P9X1+LPFhE5KYy+EdcVTIN8H2Q5yLVzqj562+rCF8fSVvvrEFKGHkfFb3JcebacEIxDaJ4AF0JFHih0onF0HiENexVEoYAVUaqip60GM/umRLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741260957; c=relaxed/simple;
	bh=0ZHgv7nRbD8P28kALnuW0vC0/HoWUjGwU/Ooe1oBnu0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YElpNiahQipxmjp5SP8roRwIR/9pQV5oeQoZI/xVLcsLeR4Yx2TGW4Hf8EoCVPKtD9xtKnMa09UdkERKPFHQqX/9SXjE+um2/k3KdTS9BNIKlhV7IDa6ggeTl2W9BQaxWrcuRvoUQEFBCZ7aylSX2VuGxjXyl5/VXaHat0NPclU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=eEy4dZMQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="eEy4dZMQ"
Received: by smtp.kernel.org (Postfix)
	id 36F93C4CEE8; Thu,  6 Mar 2025 11:35:57 +0000 (UTC)
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 63FC1C4CEE2;
	Thu,  6 Mar 2025 11:35:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 63FC1C4CEE2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741260948;
	bh=0ZHgv7nRbD8P28kALnuW0vC0/HoWUjGwU/Ooe1oBnu0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eEy4dZMQo3CVN+KP8hz/3SFgSYBv8/zSSzKnLzGTTODAS4QWbPLHmqASyWGSQYDCO
	 /ro8UzZHJYq5vfzXLmj5FUasZ+K1E13gsP8C2D+ausmWJmgC5lO2cEMQfwc6yjKeS6
	 6DW5+YjxDt20Aszcb6SfPvhHHaRX2U3X/tmgl58TbUTkcz4bIG7EMQRTW5kl3E0uGS
	 c9Tz1PLsL9nQdwxuTw/OivsQG+UlG66opi0Au4gcbDJjxR2pDgcEQIdAbtIVPjRtw3
	 WN6PHkTlG55G6piv9Ov868MaE4uYSIV2jYFWQxnjwm5ub+ccOr4VIqFDcWrvxJmaPS
	 eT8uv0we1+tRw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3540D17E0649;
	Thu,  6 Mar 2025 12:35:48 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: matthias.bgg@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [GIT,PULL,2/2] MediaTek driver updates for v6.15
Date: Thu,  6 Mar 2025 12:34:53 +0100
Message-ID: <20250306113540.148342-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250306113540.148342-1-angelogioacchino.delregno@collabora.com>
References: <20250306113540.148342-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-soc-for-v6.15

for you to fetch changes up to 1e12efbee8f3fe09d23ad75d2e38a6335ca2d159:

  soc: mediatek: mtk-socinfo: Add extra entry for MT8395AV/ZA Genio 1200 (2025-03-06 11:54:21 +0100)

----------------------------------------------------------------
MediaTek driver	updates for v6.15

This adds entries for new and missing SoCs in the MediaTek SoCInfo
driver (MT8370AV/AZA, MT8390AV/AZA) and	an extra entry for a new
revision of the	MT8395AV/ZA SoC.

The MediaTek SoCInfo driver also gets its SoC attribute	information
restructured: now the family, machine and soc_id fields are correctly
populated.

MT8188 gains support for the secondary Display Parallel Interface
used for HDMI, and for the Display Stream Compression component
routing through mmsys and mutex tables.

All of the MMSYS drivers get an important overhaul: it was found that,
in multiple cases, the tables contained wrong mask/value pairs, hence
those were doing either nothing or breaking routings.
The mmsys tables were converted to use a newly introduced macro that
will perform a compile time check, making sure that each table entry's
value fits in the declared register mask.

Thanks to the new macro, multiple MediaTek SoCs got multiple fixes in
their MMSYS tables, addressing issues that were severely impacting the
functionality of the display controller pipelines.

----------------------------------------------------------------
AngeloGioacchino Del Regno (8):
      soc: mediatek: mtk-mutex: Add DPI1 SOF/EOF to MT8188 mutex tables
      soc: mediatek: mtk-mmsys: Fix MT8188 VDO1 DPI1 output selection
      soc: mediatek: mtk-mmsys: Add compile time check for mmsys routes
      soc: mediatek: mt8188-mmsys: Migrate to MMSYS_ROUTE() macro
      soc: mediatek: mt8167-mmsys: Fix missing regval in all entries
      soc: mediatek: mt8365-mmsys: Fix routing table masks and values
      soc: mediatek: mmsys: Migrate all tables to MMSYS_ROUTE() macro
      soc: mediatek: mt8188-mmsys: Add support for DSC on VDO0

Fei Shao (1):
      soc: mediatek: mtk-socinfo: Restructure SoC attribute information

Louis-Alexis Eyraud (4):
      soc: mediatek: mtk-socinfo: Add entry for MT8370AV/AZA Genio 510
      soc: mediatek: mtk-socinfo: Add entry for MT8390AV/AZA Genio 700
      soc: mediatek: mtk-socinfo: Avoid using machine attribute in SoC detection log
      soc: mediatek: mtk-socinfo: Add extra entry for MT8395AV/ZA Genio 1200

 drivers/soc/mediatek/mt8167-mmsys.h |  31 +++--
 drivers/soc/mediatek/mt8173-mmsys.h |  99 +++++++---------
 drivers/soc/mediatek/mt8183-mmsys.h |  50 ++++----
 drivers/soc/mediatek/mt8186-mmsys.h |  88 ++++++--------
 drivers/soc/mediatek/mt8188-mmsys.h | 266 +++++++++++++++++++------------------------
 drivers/soc/mediatek/mt8192-mmsys.h |  71 +++++-------
 drivers/soc/mediatek/mt8195-mmsys.h | 632 +++++++++++++++++++++++++++++++++++++++++++----------------------------------------------------------
 drivers/soc/mediatek/mt8365-mmsys.h |  84 ++++++--------
 drivers/soc/mediatek/mtk-mmsys.h    |  14 +++
 drivers/soc/mediatek/mtk-mutex.c    |   6 +
 drivers/soc/mediatek/mtk-socinfo.c  |  22 +++-
 11 files changed, 597 insertions(+), 766 deletions(-)

