Return-Path: <matthias.bgg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6902C05027
	for <soc@archiver.kernel.org>; Wed,  1 Feb 2023 15:23:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A2FA7C4339B; Wed,  1 Feb 2023 15:23:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B6B6C433D2;
	Wed,  1 Feb 2023 15:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675264993;
	bh=h4OAdNLGTl7QV1ccMvekdSmUKvfc4KIrhpMIwbFKwMA=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=gVT0ZUiWU50X38T62LULz5A27k3HOFmR7sjmqOF4FzE2B8iK8PRIfbq0aZSJckGcm
	 n3Nt5zpVhZs0X3K0YMBC47MBi+2KsPio5qRygc2vHA+v9DiHJ5nXIIAyWyiEBiX6XR
	 w54qqUjVMaax6RZiLKXShE8Sy+86RT7yyeqxzDLN6952aLCxToitHJw1y4OXz1gM3g
	 ryTKfcn408hqilEPHni/Vt6LV/arfgGRZkuEruMpA3MOdxkbMwfyn065lkmKRy+n8s
	 UQ1TxL0aMl0QGuzad7GyPDemk/00I516sssXC3c9v4QumtpXBq/XrS6D27eisu1w6u
	 AyOs0Y6btj81g==
From: matthias.bgg@kernel.org
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	arnd@arndb.de,
	olof@lixom.net
Cc: matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] MAINTAINERS: Update entry for MediaTek SoC support
Date: Wed,  1 Feb 2023 16:22:56 +0100
Message-Id: <20230201152256.19514-1-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Matthias Brugger <matthias.bgg@gmail.com>

The linux-mediatek IRC channel has moved to liber.chat for quite some
time. Apart from that, not all patches are also send to LKML, so add
this ML explicitly.

And last but not least:
Angelo does a wunderfull job in reviewing patches for all kind of
devices from MediaTek.

Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 MAINTAINERS | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index fff91967379c9..3bdebf4952ce9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2376,11 +2376,14 @@ F:	drivers/rtc/rtc-mt7622.c
 
 ARM/Mediatek SoC support
 M:	Matthias Brugger <matthias.bgg@gmail.com>
+R:	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+L:	linux-kernel@vger.kernel.org
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 W:	https://mtk.wiki.kernel.org/
-C:	irc://chat.freenode.net/linux-mediatek
+C:	irc://irc.libera.chat/linux-mediatek
+F:	arch/arm/boot/dts/mt2*
 F:	arch/arm/boot/dts/mt6*
 F:	arch/arm/boot/dts/mt7*
 F:	arch/arm/boot/dts/mt8*
@@ -2388,7 +2391,7 @@ F:	arch/arm/mach-mediatek/
 F:	arch/arm64/boot/dts/mediatek/
 F:	drivers/soc/mediatek/
 N:	mtk
-N:	mt[678]
+N:	mt[2678]
 K:	mediatek
 
 ARM/Mediatek USB3 PHY DRIVER
-- 
2.39.0

