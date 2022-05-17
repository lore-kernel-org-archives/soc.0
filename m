Return-Path: <SRS0=TAfj=VZ=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBDC4C433EF
	for <soc@archiver.kernel.org>; Tue, 17 May 2022 03:28:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A3E6DC34119; Tue, 17 May 2022 03:28:16 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B3F14C34115;
	Tue, 17 May 2022 03:28:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B3F14C34115
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f49.google.com with SMTP id l1so13594446qvh.1;
        Mon, 16 May 2022 20:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=j+Q4XN3lDlb3mXxMp+NqQgx5l8SM/aLOCQMLK1x/m6M=;
        b=ewqvkD2vj/X0E+xs1VnF/6et3X9Oiq1Wu7WdlODik1+AUmKDOS+LFotV4909xHsaV6
         HOP80ServOJjox5SaT4+QAjXpxaLQjxjYIFQh0vZwGMgnqXQsyYWqgP+EZlFUYI3xdAG
         mw4zaRzlBRc18UGL9M/S3RFS9zXbg54qncFiwCP7Y8VOiV/7JTSsfhW7ZPZarYXCQZfW
         cnxNiolTKtYPJvoDxq4TlC766Ty4BP29tLptrCIydvybpL+GxzSshY1uQ3dXWR8NuHE7
         aM5IBN5N9uNqkLfXG6o7bsbK4eRH49p7IE78nulXptaiKPO6KLoGnvOs8G7YGtK/TYXS
         zQVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j+Q4XN3lDlb3mXxMp+NqQgx5l8SM/aLOCQMLK1x/m6M=;
        b=iy2yPEXEbEQH9YnGSGCyGPJ4oDCPbEjwezSNQKnAyb4AOGforcRqMmP/czIQrUGxRI
         j6QexU1ZlUmkpjX6DGiWN83eFskshVh7NlHDFYTHTcKROs5vfEwjFuaVvoexC4DfUc2r
         eIA4arh8rpBAi2a8ah+jyBg98rjoI3lyISauzXHvngKFEyYXQdQjuL2Z59JyXyG9TAjP
         vYtp3w9irVtB8zki6wXYVBcA/S02hqFlM9I/cCW1b9J385lgR/3zSMp2vF4IpWCxOfDD
         Cf7I1sMRWjTPMCIMCqndpP9YSH2UZKvIPvM+g92ct1ZZSBA9pOjpGM8/5T6NvQchOWtd
         pI7A==
X-Gm-Message-State: AOAM533n6pgOthN8onmtE25ATKKMo3MKFHH06RhijWbvzg3qi5223xFs
	ZiJo7Xd2CMRlPAdK4jbhycA=
X-Google-Smtp-Source: ABdhPJyDK5rkL8eJXzhnSZxGgf5pHHsEF2OYx4jxV+AQuglwMRJT9dRzyqsdUIp/VAp9he/i6tvV+w==
X-Received: by 2002:ad4:574f:0:b0:461:df46:af7b with SMTP id q15-20020ad4574f000000b00461df46af7bmr316768qvx.53.1652758093461;
        Mon, 16 May 2022 20:28:13 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id a19-20020a376613000000b006a098381abcsm7079535qkc.114.2022.05.16.20.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 20:28:12 -0700 (PDT)
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
Subject: [PATCH v3 07/15] dt-bindings: clock: imx: Add documentation for i.MXRT1170 clock
Date: Mon, 16 May 2022 23:27:54 -0400
Message-Id: <20220517032802.451743-6-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220517032802.451743-1-Mr.Bossman075@gmail.com>
References: <20220517032802.451743-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DT binding documentation for i.MXRT1170 clock driver.

Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
V1 -> V2:
 - Change title to Clock Controller
 - Rename to add fsl
V2 -> V3:
 - Remove unused include causing error
---
 .../bindings/clock/fsl,imxrt1170-clock.yaml   | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/fsl,imxrt1170-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/fsl,imxrt1170-clock.yaml b/Documentation/devicetree/bindings/clock/fsl,imxrt1170-clock.yaml
new file mode 100644
index 000000000000..57881e22c400
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/fsl,imxrt1170-clock.yaml
@@ -0,0 +1,57 @@
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
+    clks: clock-controller@40cc0000 {
+        compatible = "fsl,imxrt1170-ccm";
+        reg = <0x40cc0000 0x4000>;
+        clocks = <&osc>, <&rcosc16M>, <&osc32k>;
+        clock-names = "osc", "rcosc16M", "osc32k";
+        #clock-cells = <1>;
+    };
-- 
2.36.1

