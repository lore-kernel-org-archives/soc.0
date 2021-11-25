Return-Path: <SRS0=/X4i=QM=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C85EC433EF
	for <soc@archiver.kernel.org>; Thu, 25 Nov 2021 21:36:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1F9A0C53FBF; Thu, 25 Nov 2021 21:36:56 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6A404C9305A;
	Thu, 25 Nov 2021 21:36:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6A404C9305A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f178.google.com with SMTP id q14so7228913qtx.10;
        Thu, 25 Nov 2021 13:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=shY4K6DMiasewXh6nPnHULhX8SHX+OpI+nOPrrUtKu8=;
        b=lgBwL8Wy8XRkgIORpbgabdSpoqqCsFDlYlzUN0b6eGNB+zPm9eGmQrscJ036fQueZ7
         QNtXkJz6MCAuTpgJpBzDoPHXxZbuTdrolMAAdgZgZkCWNk+lvz2jpi0+pzVspIvTUNGz
         RHpZR+gkWjYhLqbK8aLfywHY5SCLDH8FvtqGi5j/IsQHpkObmRPb5gW9RDpyprts/rrS
         RZiv2byH+XT1aWLlDPfhQF01+S3fbckWoBR46aSdkmxMc5ZzcvB0rZ01TFx9kczctGfU
         rLZkoCkRv0uP8D1ORFkSqt3SiDX+ZSGsglmROtJkZQ3R9LWNj1TfY+kQm/M3inWNFndg
         MVJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=shY4K6DMiasewXh6nPnHULhX8SHX+OpI+nOPrrUtKu8=;
        b=XsL7gIqLEt51/4xF7g4NivcspcwtLRLKomyIztqOk1017+Ikami9ObaaY/UvoyhpG5
         CTTRY+XNshIAcOqIVAPGphdtqJdy7eN67iPKlUhDsW2/hbjvWfTkQ32YRBRUlYOQFKxx
         L2Q1Vh3JNeHXlLrdFrmxgCJ0lE7yQcKWMOXU9GwOJwzsBUCE6uFGTuC4p+04Zo49KmZ1
         rzxjvOO1nCugSkkUhrDyrvyd12ZpHLkcnlAEh9k9aZ3ESi8GPJtplj3Mrna1aueky6n2
         wfgJmA6Te42bynU3LHsI81nXWMCmbv7d7SqoPAdbRo9eeGiYw81s2nd0QraqyHeLtoeM
         1rTw==
X-Gm-Message-State: AOAM532+UydUinPcA6UuWFu7cEmDk1FhSJpxvntTxeXTUhFfnghdF0ul
	qEZvhd2mfF2n6APXBPmXcdNYHLPmj0CJ0A==
X-Google-Smtp-Source: ABdhPJxaqvi0zIXHzlqvtSZaqXxe8ThgQa5y7+xGgMqOyKNQBi3wXRJUUhq5mqDV+95zQOXYTZprJw==
X-Received: by 2002:ac8:588c:: with SMTP id t12mr20658010qta.325.1637874896807;
        Thu, 25 Nov 2021 13:14:56 -0800 (PST)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id j22sm2068175qko.68.2021.11.25.13.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 13:14:56 -0800 (PST)
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
	linux-serial@vger.kernel.org,
	Jesse Taube <mr.bossman075@gmail.com>
Subject: [PATCH v3 06/13] dt-bindings: clock: imx: Add documentation for i.MXRT clock
Date: Thu, 25 Nov 2021 16:14:36 -0500
Message-Id: <20211125211443.1150135-7-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211125211443.1150135-1-Mr.Bossman075@gmail.com>
References: <20211125211443.1150135-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jesse Taube <mr.bossman075@gmail.com>

Add DT binding documentation for i.MXRT clock driver.

Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
V1->V2:
* Replace macros with values
V2->V3:
* Remove anatop
* Use lpuart not gpt
* include imxrt1050-clock.h
* 2 space tabs to 4
* Remove oneOf enum
* Change maxItems to 2
---
 .../bindings/clock/imxrt-clock.yaml           | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/imxrt-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/imxrt-clock.yaml b/Documentation/devicetree/bindings/clock/imxrt-clock.yaml
new file mode 100644
index 000000000000..8af48c59ff99
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/imxrt-clock.yaml
@@ -0,0 +1,67 @@
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
+
+properties:
+  compatible:
+    const: fsl,imxrt1050-ccm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 2
+
+  clocks:
+    minItems: 1
+
+  clock-names:
+    minItems: 1
+
+  '#clock-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imxrt1050-clock.h>
+
+    ccm@400fc000 {
+        compatible = "fsl,imxrt1050-ccm";
+        reg = <0x400fc000 0x4000>;
+        interrupts = <95>, <96>;
+        clocks = <&osc>;
+        clock-names = "osc";
+        #clock-cells = <1>;
+    };
+
+
+    lpuart1: serial@40184000 {
+        compatible = "fsl,imxrt1050-lpuart";
+        reg = <0x40184000 0x4000>;
+        interrupts = <20>;
+        clocks = <&clks IMXRT1050_CLK_LPUART1>;
+        clock-names = "ipg";
+    };
-- 
2.34.0

