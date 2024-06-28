Return-Path: <SRS0=iiGd=N6=collabora.com=angelogioacchino.delregno@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A032C3064D
	for <soc@archiver.kernel.org>; Fri, 28 Jun 2024 09:38:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4E9A4C32781; Fri, 28 Jun 2024 09:38:12 +0000 (UTC)
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4D308C32786;
	Fri, 28 Jun 2024 09:38:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4D308C32786
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1719567484;
	bh=HWXWQGMN6XK1cULlsC0zviWvUKjRyKwx7itg8l1XpCs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e5HL0fSN3Q3NPEajOCDv3cjG5Dru58dgb0P/Yk7IA76JRT6UrG9o80+bvdEgN0Lkx
	 73J3J36A+MfFAon1UR0Oyo42xDfvSvadrbhHAvSIWgAbIionlBEbA6hr1z7R3L9ePm
	 ZBQmuJ54UnYiyZi9ZOHyWMmdQ5aQicu0Dsyt6fCET4SKFtXqmlkKt3NHzf8nxdpAwl
	 RztzGO2aGo0th0d+dhozDCojGqlF5l59JvKUhuS60+pqW6FntlBqc/DoMjNlNntNhC
	 /roA33HDEve7pkex4ZgfSMAXID0A4R8BQnm4yJXKzYltDT+f7Wm7rbYgpcbp+RRQfo
	 LBN1hdGGHEDdg==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0F5E837821F6;
	Fri, 28 Jun 2024 09:38:04 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [GIT,PULL,2/3] MediaTek ARM32 DTS updates for v6.11
Date: Fri, 28 Jun 2024 11:37:58 +0200
Message-ID: <20240628093801.126013-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240628093801.126013-1-angelogioacchino.delregno@collabora.com>
References: <20240628093801.126013-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-dts32-for-v6.11

for you to fetch changes up to c04774af7ae392322e204dd20117e6c5162e0fe4:

  arm: dts: mediatek: Declare drive-strength numerically (2024-06-24 12:49:30 +0200)

----------------------------------------------------------------
MediaTek ARM32 DTS updates for v6.11

This adds a single commit that cleans up the drive-strength
value assignment on all devicetrees using the deprecated
MTK_DRIVE_(x)mA definition.

----------------------------------------------------------------
AngeloGioacchino Del Regno (1):
      arm: dts: mediatek: Declare drive-strength numerically

 arch/arm/boot/dts/mediatek/mt2701-evb.dts |  2 +-
 arch/arm/boot/dts/mediatek/mt7623.dtsi    | 18 +++++++++---------
 2 files changed, 10 insertions(+), 10 deletions(-)

