Return-Path: <SRS0=jRGM=PM=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5864C433EF
	for <soc@archiver.kernel.org>; Sun, 24 Oct 2021 15:40:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8C1DD6103D; Sun, 24 Oct 2021 15:40:45 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 543AB60EBC;
	Sun, 24 Oct 2021 15:40:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 543AB60EBC
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f179.google.com with SMTP id h65so9791178qke.0;
        Sun, 24 Oct 2021 08:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KLaMi0PjecgqH9q6xdREGuXIuHpv+l05lfMg4lrWRM0=;
        b=U2sUeme9KDMAkiU+LubwbYqgrPTmBpkB3glBm48fRP3JvzUaGRsf16LZQFndRgfQVy
         BCRE5GOdG+Eqr9FVP7gFxa8mRSUtdhOE6VBowIZyKlGrX7qmVP5OtxK/CtItSfeKSxZT
         AKRicU+TXJ4iIaXmODjoA13KK+pHaElZ6csBw01V7NPPzyUotOMuosojuggPMPVP5jG0
         lwIEs74cMs7gtoYj7H9dM3ZrN7siDs99tk3o7X5k4nhIDqSYC4NxFIqg1JHH4LRrQipz
         Uy6ErKUVnxgdvJwrxRmYZVQ0eBd3i75qqpx3ZfQTBbNsJ8V70iSzM36+F0OEt5MElssa
         ftQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KLaMi0PjecgqH9q6xdREGuXIuHpv+l05lfMg4lrWRM0=;
        b=D12CMpUcPgMylCoDpuwBqO57OP446XdXpIg5dtZwR7Aey5ved6ad3pAGMAcwHYEX37
         FjCp/AbDI4wGJ/+OZ8myiXv+fHjtthEcO/ElYZ280R5g4/Im3Koa2v3x+N+fQKyJi87b
         3PFjmCRRXi/F3gM27U63K4tlMGRaWbArNjVro5aWWscV2Sv5Ylx4MrXKdQjjTliSp/CD
         P5If4TdBQkwcUVVzNhqmoVdwu8H4wDU+PpoL8RUVd5D1r5KBVMoKS/aRcOUVEU5LG3mp
         9SH6MabP3lD7DJuw4WccsQbdjJJAVjFq377nv8VgKFC8D/6bh1KnhBHudXv3TZGGdmYj
         5b6g==
X-Gm-Message-State: AOAM532PQBHPCzWx1KmAFpVOYSUWj1SkbtjbqMwGVv43qngAd2I2Y2xq
	b47N1LUs3TMakgx2cUm3wCE=
X-Google-Smtp-Source: ABdhPJy9P9jjgymuGD+hjGuutud3QqZ6FQXwfzaibrHuMzBaHwHpi8yxpzE1VeuLxZa7eKj8Aj9T+w==
X-Received: by 2002:a37:9307:: with SMTP id v7mr9447815qkd.371.1635090044481;
        Sun, 24 Oct 2021 08:40:44 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id x9sm7291731qtw.84.2021.10.24.08.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Oct 2021 08:40:44 -0700 (PDT)
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
Subject: [PATCH 05/13] dt-bindings: clock: imx: Add documentation for i.MXRT clock
Date: Sun, 24 Oct 2021 11:40:19 -0400
Message-Id: <20211024154027.1479261-6-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
References: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DT binding documentation for i.MXRT clock driver.

Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
 .../bindings/clock/imxrt-clock.yaml           | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/imxrt-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/imxrt-clock.yaml b/Documentation/devicetree/bindings/clock/imxrt-clock.yaml
new file mode 100644
index 000000000000..f432aa81b849
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/imxrt-clock.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/imxrt-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Clock bindings for Freescale i.MXRT
+
+maintainers:
+  - Giulio Benetti <giulio.benetti@benettiengineering.com>
+  - Jesse Taube <Mr.Bossman075@gmail.com>
+
+description: |
+  The clock consumer should specify the desired clock by having the clock
+  ID in its "clocks" phandle cell. See include/dt-bindings/clock/imxrt*-clock.h
+  for the full list of i.MXRT clock IDs.
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - fsl,imxrt1050-ccm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    ccm@400fc000 {
+      compatible = "fsl,imxrt1050-ccm";
+      reg = <0x400fc000 0x4000>;
+      interrupts = <95>,<96>;
+      clocks = <&osc>;
+      clock-names = "osc";
+      #clock-cells = <1>;
+    };
+
+    gpt: timer@401ec000 {
+      compatible = "fsl,imx53-gpt", "fsl,imx31-gpt";
+      reg = <0x401ec000 0x4000>;
+      interrupts = <100>;
+      clocks = <&clks IMXRT1050_CLK_OSC>;
+      clock-names = "per";
+    };
-- 
2.33.0

