Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F9A2C0F6E
	for <soc@lists.linux.dev>; Fri, 23 Jan 2026 11:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769167058; cv=none; b=i+yr82CsdzfFM7OzNIbLx2Z9sEhK6KxE/i1mkeC9LPkC6EjKhfmIOIa8XJclhSiEZ6iYui+dwNJjXkYp6qX00cBdWWYlYX+u5UGYWoEzG8sTj8kiyU6yeX6x5XynP6bnhQUQRLxHUkJIEMB1FkUgZzfHRMnd7cnSclIwrfgUCVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769167058; c=relaxed/simple;
	bh=ENlMl1bSYsG6/Pc0nHKNqHh4izRF0rIkuDpxCOw7iCI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KpD1JFU58aOQyD794l9iLG8XOvig7HQCAnX6smxQVWDcb+OnaFvQ6kQhOetgzW90PoWI/Y+ylUSMhVHpTvHJZnovdhhWbuL9dfRh9qcoDtCCLHw2J7LXOTQ7/aDqdvdQTgFkKmb0yg4u14QLvjIU1Sf9GU4CVd33C8SIRicmFBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=KJmt4Zkf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="KJmt4Zkf"
Received: by smtp.kernel.org (Postfix)
	id 27813C116D0; Fri, 23 Jan 2026 11:17:38 +0000 (UTC)
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BBA83C2BC86;
	Fri, 23 Jan 2026 11:17:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BBA83C2BC86
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1769167047;
	bh=ENlMl1bSYsG6/Pc0nHKNqHh4izRF0rIkuDpxCOw7iCI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KJmt4ZkfuZZ+ROiqdfXOXk0cxTl1nSDtbS8QuZGIwfeWQ5M8jaig8D0x6Zgh2C1rD
	 gMfhgQBHcHDTd+6R/GA3HatW92WUp21bkXXI2M2SRpo5FSn8x3IK5THdfONVUdM1ls
	 KA9eEOFuKgKhjYde9zTDdOncFEpkx/KswQlJm7vMkN0gJ7dr2ryK5NucHXWNWQh/4/
	 XuRYXP1QsawbCvUdvH9QwxnbaB/Q319jWNtHwqwI8ZGijbTWCoMxo6YUmtb+FcXMHR
	 y5ju6m+2s52BF7jqoF4QswuQdDAvJOdY3uqWtJuUXyFSthoh32IgGqAku1VvPtMOL/
	 qkkOIT88RNRxw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 99C8B17E0CB0;
	Fri, 23 Jan 2026 12:17:27 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: matthias.bgg@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [GIT,PULL,2/3] MediaTek driver updates for v6.20
Date: Fri, 23 Jan 2026 12:17:21 +0100
Message-ID: <20260123111724.28631-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260123111724.28631-1-angelogioacchino.delregno@collabora.com>
References: <20260123111724.28631-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git/ mtk-soc-for-v6.20

for you to fetch changes up to 22ce09ce1af574747fce072c3f62c29c440538d7:

  soc: mediatek: mtk-cmdq: Add mminfra_offset adjustment for DRAM addresses (2026-01-19 12:57:46 +0100)

----------------------------------------------------------------
MediaTek soc driver updates

This adds:
 - A socinfo entry for the MT8371 Genio 520 SoC
 - Support for the Dynamic Voltage and Frequency Scaling
   Resource Controller (DVFSRC) version 4, found in the
   new MediaTek Kompanio Ultra (MT8196) SoC
 - Initial support for the CMDQ mailbox found in the MT8196.
 - A memory leak fix in the MediaTek SVS driver's debug ops.

----------------------------------------------------------------
AngeloGioacchino Del Regno (5):
      soc: mediatek: mtk-dvfsrc: Change error check for DVFSRCv4 START cmd
      soc: mediatek: mtk-dvfsrc: Add and propagate DVFSRC bandwidth type
      soc: mediatek: mtk-dvfsrc: Add a new callback for calc_dram_bw
      soc: mediatek: mtk-dvfsrc: Write bandwidth to EMI DDR if present
      soc: mediatek: mtk-dvfsrc: Add support for DVFSRCv4 and MT8196

Jason-JH Lin (8):
      mailbox: mtk-cmdq: Add cmdq private data to cmdq_pkt for generating instruction
      mailbox: mtk-cmdq: Add GCE hardware virtualization configuration
      mailbox: mtk-cmdq: Add mminfra_offset configuration for DRAM transaction
      mailbox: mtk-cmdq: Add driver data to support for MT8196
      soc: mediatek: mtk-cmdq: Add cmdq_get_mbox_priv() in cmdq_pkt_create()
      soc: mediatek: mtk-cmdq: Add pa_base parsing for hardware without subsys ID support
      soc: mediatek: mtk-cmdq: Extend cmdq_pkt_write API for SoCs without subsys ID
      soc: mediatek: mtk-cmdq: Add mminfra_offset adjustment for DRAM addresses

Louis-Alexis Eyraud (1):
      soc: mediatek: mtk-socinfo: Add entry for MT8371AV/AZA Genio 520

Nicolas Frattaroli (3):
      dt-bindings: soc: mediatek: dvfsrc: Document clock
      soc: mediatek: mtk-dvfsrc: Get and Enable DVFSRC clock
      soc: mediatek: mtk-dvfsrc: Rework bandwidth calculations

Zilin Guan (1):
      soc: mediatek: svs: Fix memory leak in svs_enable_debug_write()

 Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8183-dvfsrc.yaml |   6 ++
 drivers/mailbox/mtk-cmdq-mailbox.c                                         |  74 +++++++++++++-
 drivers/soc/mediatek/mtk-cmdq-helper.c                                     |  77 +++++++++++++-
 drivers/soc/mediatek/mtk-dvfsrc.c                                          | 364 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++------
 drivers/soc/mediatek/mtk-socinfo.c                                         |   1 +
 drivers/soc/mediatek/mtk-svs.c                                             |   5 +-
 include/linux/mailbox/mtk-cmdq-mailbox.h                                   |  19 ++++
 include/linux/soc/mediatek/mtk-cmdq.h                                      |  93 +++++++++++++++++
 8 files changed, 598 insertions(+), 41 deletions(-)

