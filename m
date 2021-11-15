Return-Path: <SRS0=wqws=QC=socionext.com=sugaya.taichi@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72DB8C4321E
	for <soc@archiver.kernel.org>; Mon, 15 Nov 2021 09:31:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 51BBF61C14; Mon, 15 Nov 2021 09:31:01 +0000 (UTC)
Received: from mx.socionext.com (mx.socionext.com [202.248.49.38])
	by mail.kernel.org (Postfix) with ESMTP id A6E586321F;
	Mon, 15 Nov 2021 09:31:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A6E586321F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=socionext.com
Received: from unknown (HELO kinkan2-ex.css.socionext.com) ([172.31.9.52])
  by mx.socionext.com with ESMTP; 15 Nov 2021 18:30:57 +0900
Received: from mail.mfilter.local (m-filter-1 [10.213.24.61])
	by kinkan2-ex.css.socionext.com (Postfix) with ESMTP id A1662205C83D;
	Mon, 15 Nov 2021 18:30:57 +0900 (JST)
Received: from 172.31.9.53 (172.31.9.53) by m-FILTER with ESMTP; Mon, 15 Nov 2021 18:30:57 +0900
Received: from yuzu2.css.socionext.com (yuzu2 [172.31.9.57])
	by iyokan2.css.socionext.com (Postfix) with ESMTP id 8DF1D3DD5F;
	Mon, 15 Nov 2021 18:30:57 +0900 (JST)
Received: from scorpio.e01.socionext.com (aries.syh.socionext.com [10.213.112.88])
	by yuzu2.css.socionext.com (Postfix) with ESMTP id 7315FB6291;
	Mon, 15 Nov 2021 18:30:57 +0900 (JST)
From: Sugaya Taichi <sugaya.taichi@socionext.com>
To: Rob Herring <robh+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	orito.takao@socionext.com,
	sugaya.taichi@socionext.com,
	Masami Hiramatsu <masami.hiramatsu@linaro.org>,
	Jassi Brar <jaswinder.singh@linaro.org>
Subject: [PATCH v2 4/4] MAINTAINERS: Add entry to MAINTAINERS for Milbeaut
Date: Mon, 15 Nov 2021 18:30:56 +0900
Message-Id: <1636968656-14033-5-git-send-email-sugaya.taichi@socionext.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1636968656-14033-1-git-send-email-sugaya.taichi@socionext.com>
References: <1636968656-14033-1-git-send-email-sugaya.taichi@socionext.com>

Add entry to MAINTAINERS for Milbeaut that supported minimal drivers.

Signed-off-by: Sugaya Taichi <sugaya.taichi@socionext.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7a2345c..a9387cc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2263,6 +2263,15 @@ L:	linux-iio@vger.kernel.org
 S:	Maintained
 F:	drivers/counter/microchip-tcb-capture.c
 
+ARM/MILBEAUT ARCHITECTURE
+M:	Taichi Sugaya <sugaya.taichi@socionext.com>
+M:	Takao Orito <orito.takao@socionext.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	arch/arm/boot/dts/milbeaut*
+F:	arch/arm/mach-milbeaut/
+N:	milbeaut
+
 ARM/MIOA701 MACHINE SUPPORT
 M:	Robert Jarzmik <robert.jarzmik@free.fr>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
2.7.4

