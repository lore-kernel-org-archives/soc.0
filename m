Return-Path: <SRS0=tSnG=VG=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C5BC43219
	for <soc@archiver.kernel.org>; Thu, 28 Apr 2022 21:48:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F2388C385AF; Thu, 28 Apr 2022 21:48:50 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 40AF5C385AD;
	Thu, 28 Apr 2022 21:48:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 40AF5C385AD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f170.google.com with SMTP id a22so1557375qkl.5;
        Thu, 28 Apr 2022 14:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cyKjVqkv7xpCIRzFdkGLOU+0WChIqQ56OJI9afxDIPM=;
        b=AUh3UA5ZXoQFgxx3Eae9B3/xLpd2GS7ntg8qTW+WbwgaRnKFfh3A9fhZV10Xei2pSX
         gSpanaoY+okzVJJUZNEHQTUl09xX38VmbvQOhm4emdJ5LvYIkI1vH/tADb/3wSGYy7DA
         V4+rjHd6Bm+SjjqZf55lyTG9Ts38TbXSXlDLrMITpqTKqDRdIjgnabHk4yH96Xxl2G0h
         tEpGeFtDzfrL7dvnBarkn1AAVobcsCxHsVSDZ5AP6eRAc9Q97c/anbtrEdiN3FBYf16R
         6K4Nb/SJ3fD4Pn+1MT9pf2d0NeKrowC7cQwG7HKjK8Y4bI1M5UDo9t/EJCLyGWakKUFz
         DuWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cyKjVqkv7xpCIRzFdkGLOU+0WChIqQ56OJI9afxDIPM=;
        b=AJb7Tu/7fuIZrsj11fdyhCkWyVNf0xDVKyUQz78/aDwgkseYPl9tSKUFmszdHAvcsu
         I2gt+IL+75QOs3vXnRMLeapS3dN1O6njBOR9/3qPw4H5wuGQ5yV3n/9bgg7UMmaaUcZW
         WRrLGpPsZ8Eg+U9c7sIAexJrbbHL8i8eZfOyLKTT51tK8x71EK+egS+ne/KeYwSezQR4
         84/93SuaACAN4u2uFaYnaPEOzcOb8jpfGp2U86L7qJdRjHCE+tcpZiztY2MkSsafWVc8
         JFx+cBqInL54Rt07+YzKOP/26Atqt4Q9S6v+WyMLZvo2J8Bv7dBvnFgDgFvhPwd5KE4A
         q8qA==
X-Gm-Message-State: AOAM530dDcu1gaZhONMg/Ehs8Nh5pGay8bO5i5cN+XYxO/uztqvUR/GG
	ySPDW6oPV+/zU8Xmg5Fn0ME=
X-Google-Smtp-Source: ABdhPJy53waABWpYCBALdgcYUjkemu6k1JLDrkCmqWvg/OP+7NQVRYqnHFASLm9UJHG1mC1xp+nRkQ==
X-Received: by 2002:a37:678d:0:b0:69f:8aa7:f3e1 with SMTP id b135-20020a37678d000000b0069f8aa7f3e1mr6727498qkc.74.1651182529258;
        Thu, 28 Apr 2022 14:48:49 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id bl5-20020a05620a1a8500b0069f51e47c5esm546442qkb.110.2022.04.28.14.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Apr 2022 14:48:48 -0700 (PDT)
From: Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To: linux-imx@nxp.com
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	aisheng.dong@nxp.com,
	stefan@agner.ch,
	linus.walleij@linaro.org,
	daniel.lezcano@linaro.org,
	tglx@linutronix.de,
	arnd@arndb.de,
	olof@lixom.net,
	soc@kernel.org,
	linux@armlinux.org.uk,
	abel.vesa@nxp.com,
	dev@lynxeye.de,
	marcel.ziswiler@toradex.com,
	tharvey@gateworks.com,
	leoyang.li@nxp.com,
	sebastian.reichel@collabora.com,
	cniedermaier@dh-electronics.com,
	Mr.Bossman075@gmail.com,
	clin@suse.com,
	giulio.benetti@benettiengineering.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v2 05/15] dt-bindings: serial: fsl-lpuart: add i.MXRT1170 compatible
Date: Thu, 28 Apr 2022 17:48:28 -0400
Message-Id: <20220428214838.1040278-6-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220428214838.1040278-1-Mr.Bossman075@gmail.com>
References: <20220428214838.1040278-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add i.MXRT1170 compatible string to Documentation.

Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
V1 -> V2:
 - New commit to fix dtbs_check
---
 Documentation/devicetree/bindings/serial/fsl-lpuart.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
index a90c971b4f1f..5e306078629d 100644
--- a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
+++ b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
@@ -21,9 +21,13 @@ properties:
           - fsl,ls1028a-lpuart
           - fsl,imx7ulp-lpuart
           - fsl,imx8qm-lpuart
+          - fsl,imxrt1050-lpuart
       - items:
           - const: fsl,imx8qxp-lpuart
           - const: fsl,imx7ulp-lpuart
+      - items:
+          - const: fsl,imxrt1170-lpuart
+          - const: fsl,imxrt1050-lpuart
 
   reg:
     maxItems: 1
-- 
2.35.1

