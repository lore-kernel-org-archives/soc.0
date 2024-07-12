Return-Path: <SRS0=c8H3=OM=csgroup.eu=christophe.leroy@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D392C2BD09
	for <soc@archiver.kernel.org>; Fri, 12 Jul 2024 11:14:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4858CC4AF11; Fri, 12 Jul 2024 11:14:34 +0000 (UTC)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E0DF4C32786
	for <soc@kernel.org>; Fri, 12 Jul 2024 11:14:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E0DF4C32786
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WL8BG4Rh3z9sSV;
	Fri, 12 Jul 2024 13:14:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PNLWhsklM4Kq; Fri, 12 Jul 2024 13:14:30 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WL8BG3l3dz9sSN;
	Fri, 12 Jul 2024 13:14:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 711498B77B;
	Fri, 12 Jul 2024 13:14:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id HHz_Hri6Xeh5; Fri, 12 Jul 2024 13:14:30 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.233.171])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 1C5408B764;
	Fri, 12 Jul 2024 13:14:30 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] MAINTAINERS: Update FREESCALE SOC DRIVERS and QUICC ENGINE LIBRARY
Date: Fri, 12 Jul 2024 13:14:26 +0200
Message-ID: <b8dfd52128dfc916e9eb917c24f9b36e0b96bbd3.1720782462.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720782867; l=1668; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=xjST0qarLynHHkGyUFwQTtqcKTTd2pNjlTDyH4TlFf8=; b=Z1RbptALyZWQNjRr/X8SmFMGgrh0sGEjDVVeFz4Dl3te558JJWMrrJk6t4CciFFEVH/N/k3hd pRGmkEmm8t3DWPDyg8xf5EwJd/xZsvwwK+V3Ecu8rEhBw6BLUfOoEAv
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

FREESCALE SOC DRIVERS has been orphaned since
commit eaac25d026a1 ("MAINTAINERS: Drop Li Yang as their email address
stopped working")
QUICC ENGINE LIBRARY has Qiang Zhao as maintainer but he hasn't
responded for years and when Li Yang was still maintaining FREESCALE
SOC DRIVERS he was also handling QUICC ENGINE LIBRARY directly.

As a maintainer of LINUX FOR POWERPC EMBEDDED PPC8XX AND PPC83XX, I
also need FREESCALE SOC DRIVERS to be actively maintained, so add
myself as maintainer of FREESCALE SOC DRIVERS and QUICC ENGINE LIBRARY.

See below link for more context.

Link: https://lore.kernel.org/linuxppc-dev/20240219153016.ntltc76bphwrv6hn@skbuf/T/#mf6d4a5eef79e8eae7ae0456a2794c01e630a6756
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 MAINTAINERS | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2e68a68ae810..efb0cf61226e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8832,6 +8832,7 @@ F:	drivers/spi/spi-fsl-qspi.c
 
 FREESCALE QUICC ENGINE LIBRARY
 M:	Qiang Zhao <qiang.zhao@nxp.com>
+M:	Christophe Leroy <christophe.leroy@csgroup.eu>
 L:	linuxppc-dev@lists.ozlabs.org
 S:	Maintained
 F:	drivers/soc/fsl/qe/
@@ -8881,9 +8882,10 @@ S:	Maintained
 F:	drivers/tty/serial/ucc_uart.c
 
 FREESCALE SOC DRIVERS
+M:	Christophe Leroy <christophe.leroy@csgroup.eu>
 L:	linuxppc-dev@lists.ozlabs.org
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-S:	Orphan
+S:	Maintained
 F:	Documentation/devicetree/bindings/misc/fsl,dpaa2-console.yaml
 F:	Documentation/devicetree/bindings/soc/fsl/
 F:	drivers/soc/fsl/
-- 
2.44.0

