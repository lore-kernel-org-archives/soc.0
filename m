Return-Path: <SRS0=iiGd=N6=collabora.com=angelogioacchino.delregno@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACED0C30659
	for <soc@archiver.kernel.org>; Fri, 28 Jun 2024 09:38:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 950A2C32781; Fri, 28 Jun 2024 09:38:13 +0000 (UTC)
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8AC0CC4AF0C;
	Fri, 28 Jun 2024 09:38:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8AC0CC4AF0C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1719567485;
	bh=gwCQ0evIwYjqKaT2ejjuFQ7K02f2CL1hfwcnELPQuiA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z+qtk3K0+X7F2daaBP5WcpXwsfeN9G+Rg4fgHMSi++y1JRJuSajDAFMyeXyW6OUsY
	 IOXQMwdwVVYLIxvK1lDJ0P33an+zAoyMtiHag8JErMa5muAkR/4k5ZhLQxG2w3E7Nc
	 9ejiZyOLAwT2lZytJwdbRA+8teZH5D5urF07EXkPONJ5INnCxp4zvGnWnbbZ3m9MBR
	 S8S4I1SogdaCfTSBBjYJrcCJE88wNTlREpthDYjJ3+EYT5+4EHTycNS+8CD6G63h0G
	 2pmRWG6TMqbplQ+HXxtzUtIF4TPDGtdH/bJgiYRDtcKJWpkqx3ybM6OKNc/saUvhCa
	 /U0bIFZuW8whg==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 03C1837821F9;
	Fri, 28 Jun 2024 09:38:04 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [GIT,PULL,3/3] MediaTek driver updates for v6.11
Date: Fri, 28 Jun 2024 11:37:59 +0200
Message-ID: <20240628093801.126013-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240628093801.126013-1-angelogioacchino.delregno@collabora.com>
References: <20240628093801.126013-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-soc-for-v6.11

for you to fetch changes up to 58de63ddd0ecc84548b8fd24c72deb3739365c78:

  soc: mtk-cmdq: Add cmdq_pkt_logic_command to support math operation (2024-06-27 12:41:51 +0200)

----------------------------------------------------------------
MediaTek driver updates for v6.11

This adds the previously missed Tone Curve Conversion (TCC)
MuteX bit to enable the same in MDP3 on the the MT8188 SoC,
disables 9-bit Alpha for display HDR support in MT8195 and
adds math operation support in the Global Command Engine for
all MediaTek SoCs, which will be used in the near future in
the ISP driver.

----------------------------------------------------------------
AngeloGioacchino Del Regno (1):
      soc: mediatek: mtk-mutex: Add MDP_TCC0 mod to MT8188 mutex table

Hsiao Chien Sung (1):
      soc: mediatek: Disable 9-bit alpha in ETHDR

Jason-JH.Lin (1):
      soc: mtk-cmdq: Add cmdq_pkt_logic_command to support math operation

 drivers/soc/mediatek/mtk-cmdq-helper.c | 34 ++++++++++++++++++++++++++++++++++
 drivers/soc/mediatek/mtk-mmsys.c       |  1 +
 drivers/soc/mediatek/mtk-mutex.c       |  1 +
 include/linux/soc/mediatek/mtk-cmdq.h  | 42 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 78 insertions(+)

