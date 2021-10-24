Return-Path: <SRS0=jRGM=PM=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86A31C433EF
	for <soc@archiver.kernel.org>; Sun, 24 Oct 2021 15:40:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6993560F70; Sun, 24 Oct 2021 15:40:47 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 371E360EBC;
	Sun, 24 Oct 2021 15:40:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 371E360EBC
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f50.google.com with SMTP id kd16so246588qvb.0;
        Sun, 24 Oct 2021 08:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IxYKSh+QdzBJn1YoTIi6gjxv21nMXY3wDp0TVq1y+NA=;
        b=NnjPKCAqxxMOqBfslfwk3NtxDQg1iKVGxJAnPDV77DlXajAwGp2pbIVq0HOfbujyYJ
         4sy32WRS+uaKwGuJhNzEGGmV6GE1RSiGkP3P+I2JXxn0smeLqXiqT4+Twyp6AQcA9Nod
         YOHmqOEpE3NOF6JSP2jHUSWukbYexcqRUHpwSQ1ytGgEe3aFXZQy6B444fDFXDlkFuuf
         jN65pegGggE5LMEN1H5Ako1+XNcXlGeUaYDvLA6kg8/T0UNRtOgyUQy9UAbtHZIq06a1
         kFnu3anWo6s9b5lUHWKbr56nsXn7neyPoVZ0RavTJpU6xe6kUuUwWw8OFuKRegogtdSy
         /pYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IxYKSh+QdzBJn1YoTIi6gjxv21nMXY3wDp0TVq1y+NA=;
        b=dblPdoi6U6TC/wsZtWYALEiY9u/i8p8IOfPIOqPg2hpDHR39uCTWfOcb/fzFTVLoQx
         wuZq01hyl3b8qVR3uLubGc9lp9FA/abXTABukZF/Ti96GZGmHkoQ5Tk0Y1NTKrGCUg/Y
         7alrZ8TeLurzWkvJtbegWcbiWjNCs17VYSEUAQgwm6w/uChg9R6wwX5KU+VPPWxIQAni
         DJE9c88N+4LM5lAdBMKBCW9a/LeFuHIMD6w13bCunK0C9sfbEf0EsP5++fi9qkTy6eEF
         qDAhRkbmX64mj2dCKF4Q3dAbeYFLC1Bzrgn8D4BU7CfyjBCW3JWMMZ1/Bg6G6iBrOmXg
         RcVQ==
X-Gm-Message-State: AOAM531jV78WxfAnIEX7A7dWPxNdzlV62eTuL3TGEEJb7dCOzEjAo4NJ
	ATyeNrVAd/nX2FA2S2alZp8=
X-Google-Smtp-Source: ABdhPJwiR1ULYFYFI2hnzDaBAjLN1JLpZUKqimSRf08JNuyQgDxVRK7pfV54DERLMU8oEC4yQZRgKw==
X-Received: by 2002:a05:6214:1ccb:: with SMTP id g11mr11131319qvd.64.1635090046415;
        Sun, 24 Oct 2021 08:40:46 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id x9sm7291731qtw.84.2021.10.24.08.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Oct 2021 08:40:46 -0700 (PDT)
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
	leonard.crestez@nxp.com,
	b20788@freescale.com,
	Mr.Bossman075@gmail.com,
	fugang.duan@nxp.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH 06/13] dt-bindings: imx: Add clock binding for i.MXRT1050
Date: Sun, 24 Oct 2021 11:40:20 -0400
Message-Id: <20211024154027.1479261-7-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
References: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
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
 include/dt-bindings/clock/imxrt1050-clock.h | 72 +++++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 include/dt-bindings/clock/imxrt1050-clock.h

diff --git a/include/dt-bindings/clock/imxrt1050-clock.h b/include/dt-bindings/clock/imxrt1050-clock.h
new file mode 100644
index 000000000000..6e78ac382a0a
--- /dev/null
+++ b/include/dt-bindings/clock/imxrt1050-clock.h
@@ -0,0 +1,72 @@
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
+#define IMXRT1050_CLK_END			70
+
+#endif /* __DT_BINDINGS_CLOCK_IMXRT1050_H */
-- 
2.33.0

