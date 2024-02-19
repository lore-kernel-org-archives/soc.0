Return-Path: <SRS0=DdBq=J4=collabora.com=angelogioacchino.delregno@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF015C48BC3
	for <soc@archiver.kernel.org>; Mon, 19 Feb 2024 13:12:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 96FD0C43399; Mon, 19 Feb 2024 13:12:38 +0000 (UTC)
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 93BEBC433C7;
	Mon, 19 Feb 2024 13:12:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 93BEBC433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1708348355;
	bh=OoYJXfbff7Gspv7yl5dq0o/qXCHZiJTyhWFMKa/hC6Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eWjNxx03q3oh2Rkk8ilacpB3btEsjLlfmhcUS4lQITV0uNVlQnWvhnrvyeXUAoAON
	 CKG5lWNBO1Y7yPvzdM85x5Q/4SylUgKUtMqLnM+uQ8Qu1CZeRjrwEddn2VNW/ezXVX
	 yB8f5ID/Ti85SLQ8e71KoLdC9BZ8+1vgx/PtVNKpZ6uiHtQyOkAt/znrb5AHij5SVp
	 GGw07PUy47x0DmBjqYIIPfoGdV6ilnK6jEZHdY/jwOzapITUuY+ZNtaTehYLh6v6yI
	 Q6qYDNQp2HAISUwVb44LCUZRaDXIzpd0flbIs/j0Gr4Vca5EgzVcDnVQ8/KgNG/qLI
	 fGTfQUA90pmEg==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 7C4F337820C3;
	Mon, 19 Feb 2024 13:12:35 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	matthias.bgg@gmail.com
Subject: [GIT,PULL,2/2] MediaTek soc driver updates for v6.9
Date: Mon, 19 Feb 2024 14:12:26 +0100
Message-ID: <20240219131230.157792-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240219131230.157792-1-angelogioacchino.delregno@collabora.com>
References: <20240219131230.157792-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-soc-for-v6.9

for you to fetch changes up to 54d21dea6a6c117f3cab4caa1f9c3ffafb515dd6:

  soc: mediatek: mtk-socinfo: Add extra entry for MT8183 (2024-01-31 09:41:43 +0100)

----------------------------------------------------------------
MediaTek soc driver updates for v6.9

The only addition here is the MediaTek SoC Information driver,
registering socinfo for various MediaTek SoCs.

----------------------------------------------------------------
Chen-Yu Tsai (2):
      soc: mediatek: mtk-socinfo: Clean up NVMEM cell read
      soc: mediatek: mtk-socinfo: Add extra entry for MT8183

William-tw Lin (1):
      soc: mediatek: mtk-socinfo: Add driver for getting chip information

 drivers/soc/mediatek/Kconfig       |   9 ++++
 drivers/soc/mediatek/Makefile      |   1 +
 drivers/soc/mediatek/mtk-socinfo.c | 191 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 201 insertions(+)
 create mode 100644 drivers/soc/mediatek/mtk-socinfo.c

