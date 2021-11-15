Return-Path: <SRS0=wqws=QC=socionext.com=sugaya.taichi@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D87F1C43217
	for <soc@archiver.kernel.org>; Mon, 15 Nov 2021 09:31:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B1F4E63215; Mon, 15 Nov 2021 09:31:00 +0000 (UTC)
Received: from mx.socionext.com (mx.socionext.com [202.248.49.38])
	by mail.kernel.org (Postfix) with ESMTP id 09FE56321A;
	Mon, 15 Nov 2021 09:30:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 09FE56321A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=socionext.com
Received: from unknown (HELO kinkan2-ex.css.socionext.com) ([172.31.9.52])
  by mx.socionext.com with ESMTP; 15 Nov 2021 18:30:57 +0900
Received: from mail.mfilter.local (m-filter-2 [10.213.24.62])
	by kinkan2-ex.css.socionext.com (Postfix) with ESMTP id 97F5F205C83E;
	Mon, 15 Nov 2021 18:30:57 +0900 (JST)
Received: from 172.31.9.53 (172.31.9.53) by m-FILTER with ESMTP; Mon, 15 Nov 2021 18:30:57 +0900
Received: from yuzu2.css.socionext.com (yuzu2 [172.31.9.57])
	by iyokan2.css.socionext.com (Postfix) with ESMTP id 739183DD5F;
	Mon, 15 Nov 2021 18:30:57 +0900 (JST)
Received: from scorpio.e01.socionext.com (aries.syh.socionext.com [10.213.112.88])
	by yuzu2.css.socionext.com (Postfix) with ESMTP id 58642B6292;
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
Subject: [PATCH v2 3/4] ARM: dts: milbeaut: set clock phandle to uart node
Date: Mon, 15 Nov 2021 18:30:55 +0900
Message-Id: <1636968656-14033-4-git-send-email-sugaya.taichi@socionext.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1636968656-14033-1-git-send-email-sugaya.taichi@socionext.com>
References: <1636968656-14033-1-git-send-email-sugaya.taichi@socionext.com>

Set clock phandle to uart node for Milbeaut M10V support.

Signed-off-by: Sugaya Taichi <sugaya.taichi@socionext.com>
---
 arch/arm/boot/dts/milbeaut-m10v.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/milbeaut-m10v.dtsi b/arch/arm/boot/dts/milbeaut-m10v.dtsi
index 9f70784..75f0c0a 100644
--- a/arch/arm/boot/dts/milbeaut-m10v.dtsi
+++ b/arch/arm/boot/dts/milbeaut-m10v.dtsi
@@ -85,6 +85,7 @@
 			reg = <0x1e700010 0x10>;
 			interrupts = <0 141 0x4>, <0 149 0x4>;
 			interrupt-names = "rx", "tx";
+			clocks = <&clk 2>;
 		};
 
 	};
-- 
2.7.4

