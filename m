Return-Path: <SRS0=E8+R=L4=collabora.com=angelogioacchino.delregno@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB9D3C10F15
	for <soc@archiver.kernel.org>; Tue, 23 Apr 2024 10:29:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B638EC32782; Tue, 23 Apr 2024 10:29:24 +0000 (UTC)
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2E1FEC2BD11;
	Tue, 23 Apr 2024 10:29:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2E1FEC2BD11
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713868161;
	bh=IiWauZeXanDlluFAPprUQdbikX6q3CijGw67XDNnEEA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Fgd/8/yI1y/TS24LWNczszOryq0wp0cUMFjKb5/OFfyEpj2WvZASiVat4/pQfmO8/
	 4fMUX6WutX/6MKG95WrDBBw8yxpmbwb8Yf/o9GpzBftLL3I1vUuSdMME95U4xXBGJt
	 hZJm/y9sCtDPhd4EeqdeY+Y2qCAFGETW4Ejb4GkhIuTUJnbTLeNbOloRLpVMsYxkog
	 L+5Dptk1xEPbSPMdsxtCrcmksogLhSow3n8h2XJVCPz3ix76K1o0ofqTg6iEoKYwy4
	 3tGBDj28EyRuS2R34BMcTxp5D1c2VJWt6kXjDgJ5aFxgZ76SQywKKNqKSBkEIro84t
	 nVcPg0Zpp7Xxw==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 14CF8378208C;
	Tue, 23 Apr 2024 10:29:21 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [GIT,PULL,2/2] MediaTek driver fixes for v6.9
Date: Tue, 23 Apr 2024 12:28:58 +0200
Message-ID: <20240423102915.371782-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240423102915.371782-1-angelogioacchino.delregno@collabora.com>
References: <20240423102915.371782-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git/ tags/mtk-soc-fixes-for-v6.9

for you to fetch changes up to ab6cd6bb33cc0bbb8dbf8cc264a1013b2019561e:

  soc: mediatek: mtk-socinfo: depends on CONFIG_SOC_BUS (2024-04-23 12:09:12 +0200)

----------------------------------------------------------------
MediaTek driver fixes for v6.9

This fixes the MediaTek SVS driver to look for the right thermal zone
names, and adds a missing Kconfig dependency for mtk-socinfo.

----------------------------------------------------------------
AngeloGioacchino Del Regno (1):
      soc: mediatek: mtk-svs: Append "-thermal" to thermal zone names

Daniel Golle (1):
      soc: mediatek: mtk-socinfo: depends on CONFIG_SOC_BUS

 drivers/soc/mediatek/Kconfig   | 1 +
 drivers/soc/mediatek/mtk-svs.c | 7 +++++--
 2 files changed, 6 insertions(+), 2 deletions(-)

