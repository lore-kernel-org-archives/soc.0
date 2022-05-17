Return-Path: <SRS0=TAfj=VZ=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 235A4C433EF
	for <soc@archiver.kernel.org>; Tue, 17 May 2022 03:28:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0CB45C34116; Tue, 17 May 2022 03:28:11 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 581DDC385B8;
	Tue, 17 May 2022 03:28:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 581DDC385B8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f180.google.com with SMTP id g3so12257782qtb.7;
        Mon, 16 May 2022 20:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BHjrg3q7IuLMPxNlV7eKLyKxXshoC3lJb+FmpZ+1H1U=;
        b=Q3rn8TdtlPSL3S5ahcv4y75S96cAvnvFIKB5bEIun052L1yZFBfs97bC/VC5GgufYZ
         O/gYzJBjLN/BGZohN5QlU8I/HESIqLXUo4qi8kPtV3Ar571hoHj91kX/RBlt+rfZMRR4
         2ORaRHCYJ7x7poizPlycNQ0JbHL9U9sdhzj/ng0QScbPt6Ye9h48V0u1n+Y3i164+g3e
         GEV7qafRInSOf2WmprSrCpRzRj7WwF6ruo9IDSwHos/Q/oGmFPrI3hjNurXP1XYM/XI/
         kVs51cJdSGxZP7a9wTgCmDyq5UwDXPyadRzx5cIy2yq/mx4k2cxyhMdMGIqAnWsO1oOv
         XKTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BHjrg3q7IuLMPxNlV7eKLyKxXshoC3lJb+FmpZ+1H1U=;
        b=RRkEx7pnP3M5aStMOqQSiG/Eum7dWj+qnUxcrVlwU9+Y+Qftr3F3KIv93edQ9IjvoU
         bD9RRgKHAjlaguC2IBixdgflLZI9uOIUOBYqiHSEMoueh18jsREK1BMLc6G5ysfI6Y6+
         jTXzeqzYZyQRlWHDJHZlEhTvrTiKRIZAKfThkPDr8rpEr8t9wK6ge56+iwQw4fYx+Ril
         VioD7W4JJ37/mBm0uu9GBYkis8CKKoYJhh89/G55Ro89u6wZ6BSdKmV5y6xFZIIccTTf
         cQ94aCXLyyeWitUExgh+miNeInQu9A+V53AQY33FQ28W2js1QgSRk+NdaX+sSubzJRIv
         0wyQ==
X-Gm-Message-State: AOAM530tk5lXU4qS/1ogFzu8rNO+JVPryVNqRNAMEWjhLOA2e/JnLwki
	HjqSfRHhnNn+4cwMAcXJ5og=
X-Google-Smtp-Source: ABdhPJzvUfbBzlEineKFbQ/653J8dRyajRuGOGPejuR0OmpMPEq7c5A3aRDJGFXYahUEawkdn0N/og==
X-Received: by 2002:ac8:5c85:0:b0:2f3:db73:3298 with SMTP id r5-20020ac85c85000000b002f3db733298mr17927028qta.514.1652758090015;
        Mon, 16 May 2022 20:28:10 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id a19-20020a376613000000b006a098381abcsm7079535qkc.114.2022.05.16.20.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 20:28:09 -0700 (PDT)
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
	linux-gpio@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v3 05/15] dt-bindings: serial: fsl-lpuart: add i.MXRT1170 compatible
Date: Mon, 16 May 2022 23:27:52 -0400
Message-Id: <20220517032802.451743-4-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220517032802.451743-1-Mr.Bossman075@gmail.com>
References: <20220517032802.451743-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add i.MXRT1170 compatible string to Documentation.

Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
Acked-by: Rob Herring <robh@kernel.org>
---
V1 -> V2:
 - New commit to fix dtbs_check
V2 -> V3:
 - Nothing done
---
 Documentation/devicetree/bindings/serial/fsl-lpuart.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
index 30eaa62e1aed..d988d93eb5e6 100644
--- a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
+++ b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
@@ -21,6 +21,7 @@ properties:
           - fsl,ls1028a-lpuart
           - fsl,imx7ulp-lpuart
           - fsl,imx8qxp-lpuart
+          - fsl,imx8qm-lpuart
           - fsl,imxrt1050-lpuart
       - items:
           - enum:
@@ -32,6 +33,9 @@ properties:
               - fsl,imx8qm-lpuart
               - fsl,imx8dxl-lpuart
           - const: fsl,imx8qxp-lpuart
+      - items:
+          - const: fsl,imxrt1170-lpuart
+          - const: fsl,imxrt1050-lpuart
 
   reg:
     maxItems: 1
-- 
2.36.1

