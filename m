Return-Path: <SRS0=tSnG=VG=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 502B9C433EF
	for <soc@archiver.kernel.org>; Thu, 28 Apr 2022 21:48:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 37B14C385AE; Thu, 28 Apr 2022 21:48:54 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 85FCEC385A9;
	Thu, 28 Apr 2022 21:48:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 85FCEC385A9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f46.google.com with SMTP id a5so4187284qvx.1;
        Thu, 28 Apr 2022 14:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Gn7ITOapzCSzC+UQtM9UH81e8sishwGd1JBZzz5dmQ0=;
        b=QI2TXltuvtMXE9cecftYJaV4Si7Yl+BLHTKNw9x6DaB8Nf1eSsA2VrBHCpiFU0fSyb
         3BBW5az7wDYeIIfVcnvEl/bPeMQu9V2/qdMMjAfJfzAM9P7/EYQAPPKPOyINz0cBztVL
         m3++hDriXgeyuWH2M+KpqSUOaMFQiff3K5DGY8LMaRygbz/o3ZeqITM9k2b/9olhyuQn
         F+UDp6PMpcLJiL0P7pLpQJ7qkpCba/l0pbeMngAWMDiCJ/SKngFgRWfmKWiUukg3Igrt
         SUXxixSCqbClWXUFIeGO+wHGhTXavhOoe0l7NoMSqX1gIXn+C3MgxV5EzlwUOQoFebCo
         LDlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Gn7ITOapzCSzC+UQtM9UH81e8sishwGd1JBZzz5dmQ0=;
        b=gMYHt6nEPKHoN4KyJajcgC/7pm5CRhcWkGRk6bM5wnRJXnQyFf0HYmPuXxzZNm3NKS
         dVmUAHEuoECDdE7YJEF50qUSVKcHk+SebjhBmMpbtRa6sPpM8wSPmRj1ZUx30ugu8vQk
         zwz1cdjWvWyYw4rr40P5YwhF1QAEJqe6uYbuBlNFd9oct1wojhxP6LfYj2kfBQhI5FOZ
         pEDQKIyhu1eiLXFUtH+ahP/KZGXDy+hrAbmp59QkExwBJyxRoDjzwdqktlZy5/SN/Gkx
         Yvj0EvweT4RmrRJnuXaHCVK/BiFxtm18uK5qifF0iGf5ltmA6ZW/ZgWkYE9ldUQyUolm
         /SjA==
X-Gm-Message-State: AOAM533iAck54McLa5ZboIh5MGCQdSM7wJBhUOt2FmUSE8/R9aQu29lS
	79EIg5EbZETi7m0/V7097mc=
X-Google-Smtp-Source: ABdhPJwEdti+wpPjI/D1brW1LYLvBuG5CvGZfc48iyfzoDbNOlsVLdU+j5YjI9EqNPBdH8VTpxonEw==
X-Received: by 2002:ad4:4eea:0:b0:446:62c2:4e88 with SMTP id dv10-20020ad44eea000000b0044662c24e88mr26448288qvb.116.1651182532499;
        Thu, 28 Apr 2022 14:48:52 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id bl5-20020a05620a1a8500b0069f51e47c5esm546442qkb.110.2022.04.28.14.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Apr 2022 14:48:52 -0700 (PDT)
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
Subject: [PATCH v2 07/15] dt-bindings: clock: imx: Add documentation for i.MXRT1170 clock
Date: Thu, 28 Apr 2022 17:48:30 -0400
Message-Id: <20220428214838.1040278-8-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220428214838.1040278-1-Mr.Bossman075@gmail.com>
References: <20220428214838.1040278-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DT binding documentation for i.MXRT1170 clock driver.

Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
V1 -> V2:
 - Change title to Clock Controller
 - Rename to add fsl
---
 .../bindings/clock/fsl,imxrt1170-clock.yaml   | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/fsl,imxrt1170-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/fsl,imxrt1170-clock.yaml b/Documentation/devicetree/bindings/clock/fsl,imxrt1170-clock.yaml
new file mode 100644
index 000000000000..a092ac0f7a50
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/fsl,imxrt1170-clock.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/imxrt1170-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MXRT1170 Clock Controller
+
+maintainers:
+  - Giulio Benetti <giulio.benetti@benettiengineering.com>
+  - Jesse Taube <Mr.Bossman075@gmail.com>
+
+description: |
+  The clock consumer should specify the desired clock by having the clock
+  ID in its "clocks" phandle cell. See include/dt-bindings/clock/imxrt*-clock.h
+  for the full list of i.MXRT clock IDs.
+
+properties:
+  compatible:
+    const: fsl,imxrt1170-ccm
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: 32M ext osc
+      - description: 16M int rcosc
+      - description: 32k osc
+
+  clock-names:
+    items:
+      - const: osc
+      - const: rcosc16M
+      - const: osc32k
+
+  '#clock-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imxrt1170-clock.h>
+
+    clks: clock-controller@40cc0000 {
+        compatible = "fsl,imxrt1170-ccm";
+        reg = <0x40cc0000 0x4000>;
+        clocks = <&osc>, <&rcosc16M>, <&osc32k>;
+        clock-names = "osc", "rcosc16M", "osc32k";
+        #clock-cells = <1>;
+    };
-- 
2.35.1

