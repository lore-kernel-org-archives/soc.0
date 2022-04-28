Return-Path: <SRS0=tSnG=VG=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C75E7C43217
	for <soc@archiver.kernel.org>; Thu, 28 Apr 2022 21:48:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 844DCC385B6; Thu, 28 Apr 2022 21:48:44 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D4CBFC385A9;
	Thu, 28 Apr 2022 21:48:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D4CBFC385A9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f179.google.com with SMTP id t11so4478942qto.11;
        Thu, 28 Apr 2022 14:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KRtH+Wxe02eFiur7ExzdY0+QMUjX+71o2GqJF6SZUAc=;
        b=Els3D1/dqjRgnV6P1/IRv8MixfnbGNrSg11sIlqfezb3oSNVj3hzaUxvTtbEnjM9pz
         zKmE5/sC0pzjao1L/7Gh3w3dG0SdW7Su0/SFaTMk73kZC9nQdnHz2b/pMmcHkh0fOYdK
         9gF5MGztxhK/G1G0jYO44PQuyinv4XhLntGhktl8T4LNfq89W183L5JIyU3iPKDWjksT
         1IN3lrhc410oLiryADmOh1fB3U/Z8o8XTN3CugOqNm50BzHCbBA4lMC01DjV2kb9fBID
         Ms+GJYnuX3pT104r13iPSjOI0cCJ8925M9XO9dhQd0OtCfOg7B9nM4Wh70UPfKzizWBt
         Mt1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KRtH+Wxe02eFiur7ExzdY0+QMUjX+71o2GqJF6SZUAc=;
        b=IwERX7jpXrz07DkdyZDv/681qtaRU6IT6rnNsAjrA1M7+loN18YLVbSfNnoJwsapP3
         M4EgNTgYJt5aT1NYqImI2Zy6Pc78nnxpBIMWvsOHr/FLEOcqBLyIc1CwBQvd/BlTIgfU
         vamQeJJGzWdjgGF8sayqP//moFZFU6LpGCx5Ek1nNb4VXzZYKR2WkC9F+WsrWPAqjm1K
         a+5ISqop2FYWy/lZ47Jyhk63XVNEfckKZ1a+KyHWXg5e1CdcPa2Tmgr61sTpfUKZGywa
         ZlQs+L/rrViBL6tJNQxcRVuH6u3TOWJi4zQsty0QUYaR1i5SCcrWPwFAK3C8hnoZ6nYC
         luyQ==
X-Gm-Message-State: AOAM531ftRcOfR8lSWPPjt+yPDTBSWJX9ueKNXUOIgdAXBPEeRSi35rm
	k1DYwbK/UiQJvCJyI3DwjQQ=
X-Google-Smtp-Source: ABdhPJwJMaTemA09s72gPi0VsUmQm4Ktuf7tJ2veFfZKW2vPO9YjbEgUH5Nh4wJ+fHmVMtXWZN5M1g==
X-Received: by 2002:ac8:5e4e:0:b0:2f3:5df5:5b3f with SMTP id i14-20020ac85e4e000000b002f35df55b3fmr21753402qtx.295.1651182522779;
        Thu, 28 Apr 2022 14:48:42 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id bl5-20020a05620a1a8500b0069f51e47c5esm546442qkb.110.2022.04.28.14.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Apr 2022 14:48:42 -0700 (PDT)
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
Subject: [PATCH v2 01/15] dt-bindings: arm: imx: Add i.MXRT compatible Documentation
Date: Thu, 28 Apr 2022 17:48:24 -0400
Message-Id: <20220428214838.1040278-2-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220428214838.1040278-1-Mr.Bossman075@gmail.com>
References: <20220428214838.1040278-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Recently the imxrt1050 was added but the cpu compatible node wasn't
added. Add both i.MXRT1170 and 1050 compatibles to fsl.yaml.

Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
V1 -> V2:
 - Swap order of soc's
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 0b595b26061f..e71b981b0245 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -834,6 +834,18 @@ properties:
           - const: toradex,colibri-imx8x
           - const: fsl,imx8qxp
 
+      - description: i.MXRT1050 based Boards
+        items:
+          - enum:
+              - fsl,imxrt1050-evk         # i.MXRT1050 EVK Board
+          - const: fsl,imxrt1050
+
+      - description: i.MXRT1170 based Boards
+        items:
+          - enum:
+              - fsl,imxrt1170-evk         # i.MXRT1170 EVK Board
+          - const: fsl,imxrt1170
+
       - description:
           Freescale Vybrid Platform Device Tree Bindings
 
-- 
2.35.1

