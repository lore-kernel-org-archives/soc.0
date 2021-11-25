Return-Path: <SRS0=/X4i=QM=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5039EC433EF
	for <soc@archiver.kernel.org>; Thu, 25 Nov 2021 21:21:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 14476C93057; Thu, 25 Nov 2021 21:21:10 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6D4F9C9304D;
	Thu, 25 Nov 2021 21:21:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6D4F9C9304D
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f174.google.com with SMTP id 132so12888940qkj.11;
        Thu, 25 Nov 2021 13:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+/OW3wrVevZ7BrAo2Iv8SBFUTqErMKF99iq98AyaJuQ=;
        b=BYGFEn2AipI3XVGkSfRNlgsYFHNHjS0mZFBTrUs7463BtbbFurE1MOfE8Lm4KKwbZp
         WbWqqoqvjnc+KUsj0ZIFA7GEbCmzACammWNPjnDCHmYSEP+nS2OUSdmrpxtUQkFFYX1C
         wftpnhyR2/xopVMxUb5ZlyuoQEomsPZmyBGuho3LcpECiU+BUwUy1vcVtmTO6/tZsiDM
         l82Gi+BBsoFWmcHBJ1xocFqaG3QZ/3UHl5n8GiE/44GRhNrbG4OIpy42s+SDgKwWpntS
         Ik1dnppRuYNbPxEgf0TzXTukZdqkcFlsxzMHkMp66G4mK/ycmP3tLr3Dn4Cl59dFyeUV
         4eCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+/OW3wrVevZ7BrAo2Iv8SBFUTqErMKF99iq98AyaJuQ=;
        b=ukcmp2Z1ETaWxjAP8jrx1m0QB0ngGedYQI1y63Yd2WJuj6isUNyZwAT3ph+VFhI7ZG
         QbiLbXyTIYXACEXM7p/0938B+p7o9hqdVSXufL6r/Mg/NN3rYxxUcciQSKdMm9g7H6Iz
         9W4+ZlzREIy278HgGf1FbRIStMhphU7RVXg4+oDjSKSD2AJzvqjvuHfuu6d/XBtatx/R
         rfEH00+FRD3jw2ZzmjR1Yi6ccEYvKeoCK9laKtwU5PESdgznYJKiqkP7ggN4Ty48SRw2
         Rd/J6Plte+5pl96QuxwH6wiS4pcoHMK8heJHrdBmZlFLj4QQTUY4L22cipN7ACnvCtNV
         1Aaw==
X-Gm-Message-State: AOAM530wwYcvh3l2/LVnBPu39hLM83tz5G+p5AlIhgi5IDvz0KgdmZA6
	FyrsWQtVj80JwTrEXwppmHKOknOHyA5tKA==
X-Google-Smtp-Source: ABdhPJxJqedCq5mAxFvnEbbvX7ZL4WWJh5ADKidIhXX1idV0DDal8O3tIM6z0UJH1W+kfX2LLKtklw==
X-Received: by 2002:ac8:5894:: with SMTP id t20mr11743905qta.450.1637874894924;
        Thu, 25 Nov 2021 13:14:54 -0800 (PST)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id j22sm2068175qko.68.2021.11.25.13.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 13:14:54 -0800 (PST)
From: Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To: linux-imx@nxp.com
List-Id: <soc.lore.kernel.org>
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	ulf.hansson@linaro.org,
	aisheng.dong@nxp.com,
	stefan@agner.ch,
	linus.walleij@linaro.org,
	gregkh@linuxfoundation.org,
	arnd@arndb.de,
	olof@lixom.net,
	soc@kernel.org,
	linux@armlinux.org.uk,
	abel.vesa@nxp.com,
	adrian.hunter@intel.com,
	jirislaby@kernel.org,
	giulio.benetti@benettiengineering.com,
	nobuhiro1.iwamatsu@toshiba.co.jp,
	Mr.Bossman075@gmail.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH v3 05/13] dt-bindings: imx: Add clock binding for i.MXRT1050
Date: Thu, 25 Nov 2021 16:14:35 -0500
Message-Id: <20211125211443.1150135-6-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211125211443.1150135-1-Mr.Bossman075@gmail.com>
References: <20211125211443.1150135-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Giulio Benetti <giulio.benetti@benettiengineering.com>

Add the clock binding doc for i.MXRT1050.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Giulio: added all clocks up to IMXRT1050_CLK_USBOH3]
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
[Jesse: added clocks from IMXRT1050_CLK_IPG_PDOF to
IMXRT1050_CLK_DMA_MUX and moved IMXRT1050_CLK_END on]
---
V1->V2:
* Nothing done
V2->V3:
* Added GPT binding
---
 include/dt-bindings/clock/imxrt1050-clock.h | 73 +++++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 include/dt-bindings/clock/imxrt1050-clock.h

diff --git a/include/dt-bindings/clock/imxrt1050-clock.h b/include/dt-bindings/clock/imxrt1050-clock.h
new file mode 100644
index 000000000000..9811676d100b
--- /dev/null
+++ b/include/dt-bindings/clock/imxrt1050-clock.h
@@ -0,0 +1,73 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright(C) 2019
+ * Author(s): Giulio Benetti <giulio.benetti@benettiengineering.com>
+ */
+
+#ifndef __DT_BINDINGS_CLOCK_IMXRT1050_H
+#define __DT_BINDINGS_CLOCK_IMXRT1050_H
+
+#define IMXRT1050_CLK_DUMMY			0
+#define IMXRT1050_CLK_CKIL			1
+#define IMXRT1050_CLK_CKIH			2
+#define IMXRT1050_CLK_OSC			3
+#define IMXRT1050_CLK_PLL2_PFD0_352M		4
+#define IMXRT1050_CLK_PLL2_PFD1_594M		5
+#define IMXRT1050_CLK_PLL2_PFD2_396M		6
+#define IMXRT1050_CLK_PLL3_PFD0_720M		7
+#define IMXRT1050_CLK_PLL3_PFD1_664_62M		8
+#define IMXRT1050_CLK_PLL3_PFD2_508_24M		9
+#define IMXRT1050_CLK_PLL3_PFD3_454_74M		10
+#define IMXRT1050_CLK_PLL2_198M			11
+#define IMXRT1050_CLK_PLL3_120M			12
+#define IMXRT1050_CLK_PLL3_80M			13
+#define IMXRT1050_CLK_PLL3_60M			14
+#define IMXRT1050_CLK_PLL1_BYPASS		15
+#define IMXRT1050_CLK_PLL2_BYPASS		16
+#define IMXRT1050_CLK_PLL3_BYPASS		17
+#define IMXRT1050_CLK_PLL5_BYPASS		19
+#define IMXRT1050_CLK_PLL1_REF_SEL		20
+#define IMXRT1050_CLK_PLL2_REF_SEL		21
+#define IMXRT1050_CLK_PLL3_REF_SEL		22
+#define IMXRT1050_CLK_PLL5_REF_SEL		23
+#define IMXRT1050_CLK_PRE_PERIPH_SEL		24
+#define IMXRT1050_CLK_PERIPH_SEL		25
+#define IMXRT1050_CLK_SEMC_ALT_SEL		26
+#define IMXRT1050_CLK_SEMC_SEL			27
+#define IMXRT1050_CLK_USDHC1_SEL		28
+#define IMXRT1050_CLK_USDHC2_SEL		29
+#define IMXRT1050_CLK_LPUART_SEL		30
+#define IMXRT1050_CLK_LCDIF_SEL			31
+#define IMXRT1050_CLK_VIDEO_POST_DIV_SEL	32
+#define IMXRT1050_CLK_VIDEO_DIV			33
+#define IMXRT1050_CLK_ARM_PODF			34
+#define IMXRT1050_CLK_LPUART_PODF		35
+#define IMXRT1050_CLK_USDHC1_PODF		36
+#define IMXRT1050_CLK_USDHC2_PODF		37
+#define IMXRT1050_CLK_SEMC_PODF			38
+#define IMXRT1050_CLK_AHB_PODF			39
+#define IMXRT1050_CLK_LCDIF_PRED		40
+#define IMXRT1050_CLK_LCDIF_PODF		41
+#define IMXRT1050_CLK_USDHC1			42
+#define IMXRT1050_CLK_USDHC2			43
+#define IMXRT1050_CLK_LPUART1			44
+#define IMXRT1050_CLK_SEMC			45
+#define IMXRT1050_CLK_LCDIF_APB			46
+#define IMXRT1050_CLK_PLL1_ARM			47
+#define IMXRT1050_CLK_PLL2_SYS			48
+#define IMXRT1050_CLK_PLL3_USB_OTG		49
+#define IMXRT1050_CLK_PLL4_AUDIO		50
+#define IMXRT1050_CLK_PLL5_VIDEO		51
+#define IMXRT1050_CLK_PLL6_ENET			52
+#define IMXRT1050_CLK_PLL7_USB_HOST		53
+#define IMXRT1050_CLK_LCDIF_PIX			54
+#define IMXRT1050_CLK_USBOH3			55
+#define IMXRT1050_CLK_IPG_PDOF			56
+#define IMXRT1050_CLK_PER_CLK_SEL		57
+#define IMXRT1050_CLK_PER_PDOF			58
+#define IMXRT1050_CLK_DMA			59
+#define IMXRT1050_CLK_DMA_MUX			60
+#define IMXRT1050_CLK_GPT			70
+#define IMXRT1050_CLK_END			71
+
+#endif /* __DT_BINDINGS_CLOCK_IMXRT1050_H */
-- 
2.34.0

