Return-Path: <SRS0=sGaX=HX=collabora.com=angelogioacchino.delregno@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A20C4167B
	for <soc@archiver.kernel.org>; Tue, 12 Dec 2023 11:46:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 984F2C433C8; Tue, 12 Dec 2023 11:46:04 +0000 (UTC)
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 27E0DC433C9;
	Tue, 12 Dec 2023 11:46:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 27E0DC433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702381561;
	bh=mk0Ql/32iCQN6Zu9d7ds86iUmRmNQGYWE06oEVTqv3g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JbBffc3kCZpXpDx69DvcidNpBgGjp1a1lFqlq6HAp3c7P37YrciwWlP5aHJK8zgLB
	 N1FYICfIIgfk7wwkm1rMercEQJy1hv6hOaa9F6SDoTd0aTN5gse7ij6LLWctE0i55u
	 m4VezcqJUsqiW6mG82TLsyDc8DCYyVNUGdsIt6fcOwt+Mr9bp6GiO+KGBhCZrbDsyK
	 Q3vgTBYIJfzQZvVLxR0rksOvdynEJARx3AVmrZtzXlLpPvjFqI4yUcEJXES8bZbRwx
	 5QVD48y1pW7sRPKDVZFbezXVo2FCmSaG/Nuz+UvaOIqJZz6JK46abNbbJCOzY0C3jm
	 3kJBWkiYE0q/A==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 122FF378145C;
	Tue, 12 Dec 2023 11:46:01 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [GIT,PULL,3/3] MediaTek ARM64 defconfig updates for v6.8
Date: Tue, 12 Dec 2023 12:44:29 +0100
Message-ID: <20231212114515.121695-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231212114515.121695-1-angelogioacchino.delregno@collabora.com>
References: <20231212114515.121695-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git/ tags/mtk-defconfig-for-v6.8

for you to fetch changes up to ebb78614ce2ff73be14ed7339b832e24e381d3fc:

  arm64: defconfig: Enable configs for MT8195-Cherry-Tomato Chromebook (2023-12-12 11:52:15 +0100)

----------------------------------------------------------------
MediaTek ARM64 defconfig updates for v6.8

Those defconfig changes enable booting the MT8173 Chromebooks with the
enablement of the DA9211 regulator driver and adds modules for sound,
AudioDSP, DisplayPort and LVTS Thermal for MT8192/MT8195, and module
for the ChromeOS Keyboard LED backlight which is present on various
Google Chromebooks.

----------------------------------------------------------------
Nícolas F. R. A. Prado (1):
      arm64: defconfig: Enable configs for MT8195-Cherry-Tomato Chromebook

Vignesh Raman (1):
      arm64: defconfig: Enable DA9211 regulator

 arch/arm64/configs/defconfig | 13 +++++++++++++
 1 file changed, 13 insertions(+)

