Return-Path: <SRS0=yj5T=UF=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C094FC433EF
	for <soc@archiver.kernel.org>; Sat, 26 Mar 2022 14:43:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 78A5AC340F3; Sat, 26 Mar 2022 14:43:24 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CD353C2BBE4;
	Sat, 26 Mar 2022 14:43:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CD353C2BBE4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f177.google.com with SMTP id d65so4612982qke.5;
        Sat, 26 Mar 2022 07:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=J0KAey3gf6lpGrAz4+ac6WU8V1jpceu2CiVcs68nOBw=;
        b=HcdtvBZNmP6nfzLVfAV1D53h21YifChAoEDz6WaEVX4c0+PHgHjFRVt0vVq0x2PV2l
         d7WXjqSNApMUfKDvn53m0rj9Wp/fpQeqCHJ/+7gdbo5u3JXkAcTHw6QFf1DKmcmh6onz
         cmJLNyACvLZe+oc0sEPbNeodAqOo2eDSGb95gmnW7PZCHxPYRZuV5nfj2VJJy0C6Omgs
         a3r6P9yGGdAbebvv97yO4x41ouLPVa/rXRTbe9t2UH9dc8m/toY+svKofp8bJpuROBNn
         JQ3ek3dcBmv1+cScpeWNov9AId/nVBBjBxuP4DanYSb80ngHbtcN+u70zDQm01+WC/wz
         sdMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=J0KAey3gf6lpGrAz4+ac6WU8V1jpceu2CiVcs68nOBw=;
        b=TZugN3y3xvzVjpJLuHNbQaNjNHp9fTflvOfuvXdhPZAu77d6krfrOahht/gSUrf7yd
         kcKSdtTfmusHsjHAbvoCzJvVfiahK5O4IvAPoRLNNTZUip8hbfQ3H6WQK+9j1AwvzZQN
         zZO3DqCOx8zqzYx29Tg2Vc+Kopj1IS7JZG7riVy8qJsIQl+oaMZmQ+4n8VncgHGI6QZR
         A8xx6X285dHODkJwK7SGnMjLVqXZXHdLCelom1ASBPd6twaI6n5cK4MVT1G4LzVJpRuG
         +X8Hsyde4iz8mFAWBf3pNKE9IKbsmWLnF/tNkkZdS5K8mPd+uEE9+pXs3nc3hN1eQF8+
         J2yw==
X-Gm-Message-State: AOAM533GygrttTp4sX3Vsx4GSsirmGAx3e5pQbQ/bxoQ1Ky3EVEHHRfi
	4LrjPto1PnQ5AWPJVaZdy0I=
X-Google-Smtp-Source: ABdhPJzNAY3XSSTbA4ySLo/1l34XLNiCrW+cDOn+J/1CnKliqJB1YwYCuBOOxF9wnfdEhZgns0U+Og==
X-Received: by 2002:a05:620a:1aa2:b0:67d:1637:7a9e with SMTP id bl34-20020a05620a1aa200b0067d16377a9emr10383879qkb.680.1648305802594;
        Sat, 26 Mar 2022 07:43:22 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id 70-20020a370649000000b0067b4cd8ffbasm4908918qkg.60.2022.03.26.07.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Mar 2022 07:43:21 -0700 (PDT)
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
Subject: [PATCH v1 01/12] dt-bindings: arm: imx: Add i.MXRT compatible Documentation
Date: Sat, 26 Mar 2022 10:43:02 -0400
Message-Id: <20220326144313.673549-2-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220326144313.673549-1-Mr.Bossman075@gmail.com>
References: <20220326144313.673549-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Recently the imxrt1050 was added but the cpu compatible node wasn't
added. Add both i.MXRT1170 and 1050 compatible to fsl.yaml

Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 0b595b26061f..59575053ff03 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -834,6 +834,18 @@ properties:
           - const: toradex,colibri-imx8x
           - const: fsl,imx8qxp
 
+      - description: i.MXRT1170 based Boards
+        items:
+          - enum:
+              - fsl,imxrt1170-evk         # i.MXRT1170 EVK Board
+          - const: fsl,imxrt1170
+
+      - description: i.MXRT1050 based Boards
+        items:
+          - enum:
+              - fsl,imxrt1050-evk         # i.MXRT1050 EVK Board
+          - const: fsl,imxrt1050
+
       - description:
           Freescale Vybrid Platform Device Tree Bindings
 
-- 
2.34.1

