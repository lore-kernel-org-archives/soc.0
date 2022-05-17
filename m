Return-Path: <SRS0=TAfj=VZ=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D81C433F5
	for <soc@archiver.kernel.org>; Tue, 17 May 2022 03:27:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E3279C385B8; Tue, 17 May 2022 03:27:15 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1D26CC385AA;
	Tue, 17 May 2022 03:27:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1D26CC385AA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f54.google.com with SMTP id p3so13578442qvi.7;
        Mon, 16 May 2022 20:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ei/dh+6UXeL3JNBdiwijmzKnsVw6+/DL3qzf7Tgv6So=;
        b=UWtxOhIlXvvtTRU+ihQ20LF6d7gEDsAqJxmp8xA/xVjp4RgXUfsgxVOCi7JLw3tdcj
         rr5iDetVwan9UwX2GoXo8jPgkmGRwDcGrNaiDjln3yKGT9hdhRBPTmV+RT9KAuKtJYMM
         ZzM+rVR3lYPAubaGYWoi0hGWBDiCGpFSqEXPROuYe+f64MD3Sr3A18S0bTWrnHJy+lzp
         Kz8Wc/VQ2MDeOJCLioFKn4gQOHqXXsZsVo6md2rptm5hbhofUSd6HujJvyTVASiC6qR6
         iig9u+0DUVFJkIhkkwCd8wIp3E/Qc13dziHh8gPOAbjMvTinYi+c/DGOWaK0dO8GgWDf
         O+YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ei/dh+6UXeL3JNBdiwijmzKnsVw6+/DL3qzf7Tgv6So=;
        b=j16yb2Oq2JDyWCj6M2PsFKXtcVt5LcCR5clWxm0QB+cvr8b3hbqtSyDCumxZHJilKk
         UqUs6ebaG9emjm7O+AWJ6KwJeXKjhuc5EpVafYjrekyx19yidZCHHgfPAEnBVPxrJtMM
         8xnQPs4zpiTUeqKLNCtmFYweNwp+f0Vj77xUgfG3ENvK7QUjaYab+VZFwkUh8uH2ZxHh
         NykEU/qiU0Vt4W6ZyUnh0r0Vy1MKHrdcZ0PIvB0RtexmF2h3vbhfDTUubwP3XR9MnXZO
         yURRI21w2FqFkGGUfNAJKVE/bQuVPLOHGnWEGnb9AhbFx/Xr0E85wHwBzGYGW3ASNtQR
         GLkw==
X-Gm-Message-State: AOAM531Rg8Do1m8fr+AiEEhhr0Hyz2Mx5fQp6oIWGpRTXygdL1ugJkP/
	NYV317LaloHQn4S9eJLVZuE=
X-Google-Smtp-Source: ABdhPJzVqs/D9zM84cuKx7JvNpHVTjiGE7nlr0s/oDsnXmDJ2NnuIGzTA6BDGTaSBm3F9wMbqut21Q==
X-Received: by 2002:ad4:5aed:0:b0:461:caa6:81f8 with SMTP id c13-20020ad45aed000000b00461caa681f8mr8097770qvh.49.1652758034053;
        Mon, 16 May 2022 20:27:14 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id u129-20020a372e87000000b0069fc13ce1f6sm6893635qkh.39.2022.05.16.20.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 20:27:13 -0700 (PDT)
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
Subject: [PATCH v3 01/15] dt-bindings: arm: imx: Add i.MXRT compatible Documentation
Date: Mon, 16 May 2022 23:26:56 -0400
Message-Id: <20220517032710.451537-2-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220517032710.451537-1-Mr.Bossman075@gmail.com>
References: <20220517032710.451537-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Recently the imxrt1050 was added but the cpu compatible node wasn't
added. Add both i.MXRT1170 and 1050 compatibles to fsl.yaml.

Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
Acked-by: Rob Herring <robh@kernel.org>
---
V1 -> V2:
 - Swap order of soc's
V2 -> V3:
 - Nothing done
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index ef524378d449..875f136010ae 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1020,6 +1020,18 @@ properties:
               - fsl,imx8ulp-evk           # i.MX8ULP EVK Board
           - const: fsl,imx8ulp
 
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
2.36.1

