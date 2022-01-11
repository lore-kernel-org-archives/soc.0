Return-Path: <SRS0=X96t=R3=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10333C433EF
	for <soc@archiver.kernel.org>; Tue, 11 Jan 2022 21:26:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E8227C36AE9; Tue, 11 Jan 2022 21:26:16 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1DB3CC36AE3;
	Tue, 11 Jan 2022 21:26:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1DB3CC36AE3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f173.google.com with SMTP id y10so788538qtw.1;
        Tue, 11 Jan 2022 13:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rr6jELGvG2LF019fePgIA2z2VD3l6GZzUoZbl9xOC9k=;
        b=iCUGw1wbx5IeLepIJG/oq6CGXCHBv+lmkrXHLOiCSWPNaeJQ1QNMcCdjf40ScN5OUL
         Ji52GH4tIiJ4HIamzR/ZfsglLzaqs/+Glie/KyeUoCMsyk/uGGo0BeFGDCg4PP5Vd9Ar
         KJjX8bqeoG8HuyEAV2vxXyfd/L1rEJFOdBNlKlIBgudxvuLYmCNXJRCSTwBU/57M6RgP
         PsEQyHpdt9DiGEAqU9j/R8KoxvkhT9W4WnCfNCQ3Rmh5MOeUHA6YfKIqe19jCl+WqLcL
         vqbHPCpIFM2wik7w19HGPgM9AhVixjg/snL2qGUi3bgGgpH3zH7kJa9/NSZrRzxrBXqQ
         01/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rr6jELGvG2LF019fePgIA2z2VD3l6GZzUoZbl9xOC9k=;
        b=XzcVKCVdjfu1q8TaFw2Mq96hFRP38QuIETWCQDN5McKoYVT5L94pzSPzurLBnue95J
         4+XXZUCq203JWTuAz+9u/xyegQ+QO3Pi2I8wnPGauOSljLY/8+m5/wCHVF7Yt52eB88u
         I/TQAoO734qBENn+XlDeW2lIPCRZSTm5qjm8qBXHYepqCW/+w2XmO1jH6R+OzUWjlvlR
         SJeWdxA74taRny8Lk7kUkp9KNLzHDYR9c5hFt1BFACssZ/SBA8yC7twhbZnvcaAhMpB/
         ker2eCeedvsPFWT24MXJWFIg09YJ4UO0H4SQZJbv7NDMDShT7e9WHSWYcfQwvCVcoWNn
         KUoA==
X-Gm-Message-State: AOAM533WpB+VxAQJDZmvirqWuYGy8SupFMGrMx2cZXTKCyMn2HIJ2kp6
	eJGQIQfysnsRiV9JyGAW0Gk=
X-Google-Smtp-Source: ABdhPJzMj0pkWt2mG5wEzlhEQH+agI7sjkoUccPyZvLkNYargZ32CtuysIOdkkrYjXxQ6FyhgxTgkA==
X-Received: by 2002:ac8:5ec1:: with SMTP id s1mr5349844qtx.584.1641936375059;
        Tue, 11 Jan 2022 13:26:15 -0800 (PST)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id l15sm7761990qkp.16.2022.01.11.13.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 13:26:14 -0800 (PST)
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
Subject: [PATCH v7 4/7] dt-bindings: clock: imx: Add documentation for i.MXRT1050 clock
Date: Tue, 11 Jan 2022 16:26:03 -0500
Message-Id: <20220111212606.2072669-5-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220111212606.2072669-1-Mr.Bossman075@gmail.com>
References: <20220111212606.2072669-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jesse Taube <mr.bossman075@gmail.com>

Add DT binding documentation for i.MXRT1050 clock driver.

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
V3->V4:
* Nothing done
V4->V5:
* Remove extra newline
* Rename ccm to clock-controller
* Change minItems to const
* Change minItems to description
* Rename file to add 1050
* Change commit description to just 1050
V5->V6:
* Add maxItems for clocks description
V6->V7:
* Nothing done
V7->V8:
* Nothing done
---
 .../bindings/clock/imxrt1050-clock.yaml       | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/imxrt1050-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/imxrt1050-clock.yaml b/Documentation/devicetree/bindings/clock/imxrt1050-clock.yaml
new file mode 100644
index 000000000000..35fd08c143f4
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/imxrt1050-clock.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/imxrt1050-clock.yaml#
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
+    description: 24m osc
+    maxItems: 1
+
+  clock-names:
+    const: osc
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
+    clks: clock-controller@400fc000 {
+        compatible = "fsl,imxrt1050-ccm";
+        reg = <0x400fc000 0x4000>;
+        interrupts = <95>, <96>;
+        clocks = <&osc>;
+        clock-names = "osc";
+        #clock-cells = <1>;
+    };
+
+    lpuart1: serial@40184000 {
+        compatible = "fsl,imxrt1050-lpuart";
+        reg = <0x40184000 0x4000>;
+        interrupts = <20>;
+        clocks = <&clks IMXRT1050_CLK_LPUART1>;
+        clock-names = "ipg";
+    };
-- 
2.34.1

