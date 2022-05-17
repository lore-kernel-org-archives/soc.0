Return-Path: <SRS0=TAfj=VZ=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA7DC433EF
	for <soc@archiver.kernel.org>; Tue, 17 May 2022 03:28:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 740CDC385AA; Tue, 17 May 2022 03:28:13 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A444AC385B8;
	Tue, 17 May 2022 03:28:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A444AC385B8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f172.google.com with SMTP id x9so13522724qts.6;
        Mon, 16 May 2022 20:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ckisIL9iAyTE4pUnDPg1R/R7BKAMhIgwT/MHwqfszWs=;
        b=MzWgAuNDpXYgLguXagmIo79bRto3HrYN1kloxBM3Eowj1dLboAoKYIRMCBEHVZdZmQ
         uOWdSwtLuv+XRbyreeyUdcXw7vm9CfoIhAcPM1SMV8XDSoS+5pIa82pesYRYt6HKJCW5
         WsCen+FBRFUO11sm54JzF0bilfRz8GRw/RD/MJ9svL4ARIb0aS946AclLPt1haonq3T6
         ao8a+Oe6Pxiof3Lf/3YqblB0KeE/Q54J0Yom8Mxpam3KRymzhiB00XGr/nwuuJnAOTaU
         mh8WISv8pM+FGSj+MklNuNECnFNbsIoRWZdQNh33e/yZoUJLni1twfxUFp3wWEYS+FVc
         O//w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ckisIL9iAyTE4pUnDPg1R/R7BKAMhIgwT/MHwqfszWs=;
        b=NNbrS3fdtvSD90C/4YwCohMkMqipPTwV4+HU7YboWJmB6b/PNiG9UjJ9Qth+xr+MIE
         XLA+wLVYkyADNwRmpN2XCcoWxJwh/QNblFIZA4n3tIT8moTrnqfHzHM7HZmlaADVXFPk
         zGiKaxQNjSIhQg20ohsNTp4OXUTliM9YlMvfY5qhkTEmsdIteYxjrrLAH+fBQqbwJk9R
         KYB+nvGxT6y1fNDB1V/F+i28li3jbX0bYnz0yD2dymbxDlFDAajGbGxxSIDCqsrdpY2a
         AeBf20LxOoeqQ7915vNl+DaWj8lQQnkSRRRNYHgoOUE+R9QVHYgx9hNNzSUEUYmwL1ef
         OlKw==
X-Gm-Message-State: AOAM530R1bA6OQwIn5Y0ZdZKxeMg2lypCQ7V3G/xhrtwqIaZMWoQTprn
	/tXobalwsejj5U64A8Jiv/Y=
X-Google-Smtp-Source: ABdhPJyfyP6/60RdGr1J93JW2NLj9F6EjD/gcB69+D8iZNQdLXIRMUHr2tUvr8HIeUfU9OCt+/4Sag==
X-Received: by 2002:a05:622a:a:b0:2f3:b91d:a329 with SMTP id x10-20020a05622a000a00b002f3b91da329mr18062278qtw.276.1652758091697;
        Mon, 16 May 2022 20:28:11 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id a19-20020a376613000000b006a098381abcsm7079535qkc.114.2022.05.16.20.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 20:28:11 -0700 (PDT)
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
Subject: [PATCH v3 06/15] dt-bindings: pinctrl: add i.MXRT1170 pinctrl Documentation
Date: Mon, 16 May 2022 23:27:53 -0400
Message-Id: <20220517032802.451743-5-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220517032802.451743-1-Mr.Bossman075@gmail.com>
References: <20220517032802.451743-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add i.MXRT1170 pinctrl binding Documentation

Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
V1 -> V2:
 - Nothing done
V2 -> V3:
 - Nothing done
---
 .../bindings/pinctrl/fsl,imxrt1170.yaml       | 77 +++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imxrt1170.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imxrt1170.yaml b/Documentation/devicetree/bindings/pinctrl/fsl,imxrt1170.yaml
new file mode 100644
index 000000000000..2e880b3e537c
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/fsl,imxrt1170.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/fsl,imxrt1170.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MXRT1170 IOMUX Controller
+
+maintainers:
+  - Giulio Benetti <giulio.benetti@benettiengineering.com>
+  - Jesse Taube <Mr.Bossman075@gmail.com>
+
+description:
+  Please refer to fsl,imx-pinctrl.txt and pinctrl-bindings.txt in this directory
+  for common binding part and usage.
+
+properties:
+  compatible:
+    const: fsl,imxrt1170-iomuxc
+
+  reg:
+    maxItems: 1
+
+# Client device subnode's properties
+patternProperties:
+  'grp$':
+    type: object
+    description:
+      Pinctrl node's client devices use subnodes for desired pin configuration.
+      Client device subnodes use below standard properties.
+
+    properties:
+      fsl,pins:
+        description:
+          each entry consists of 6 integers and represents the mux and config
+          setting for one pin. The first 5 integers <mux_reg conf_reg input_reg
+          mux_val input_val> are specified using a PIN_FUNC_ID macro, which can
+          be found in <arch/arm/boot/dts/imxrt1170-pinfunc.h>. The last
+          integer CONFIG is the pad setting value like pull-up on this pin. Please
+          refer to i.MXRT1170 Reference Manual for detailed CONFIG settings.
+        $ref: /schemas/types.yaml#/definitions/uint32-matrix
+        items:
+          items:
+            - description: |
+                "mux_reg" indicates the offset of mux register.
+            - description: |
+                "conf_reg" indicates the offset of pad configuration register.
+            - description: |
+                "input_reg" indicates the offset of select input register.
+            - description: |
+                "mux_val" indicates the mux value to be applied.
+            - description: |
+                "input_val" indicates the select input value to be applied.
+            - description: |
+                "pad_setting" indicates the pad configuration value to be applied.
+    required:
+      - fsl,pins
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    iomuxc: iomuxc@400e8000 {
+        compatible = "fsl,imxrt1170-iomuxc";
+        reg = <0x400e8000 0x4000>;
+        pinctrl_lpuart1: lpuart1grp {
+            fsl,pins =
+              <0x16C 0x3B0 0x620 0x0 0x0  0xf1>,
+              <0x170 0x3B4 0x61C 0x0 0x0	0xf1>;
+        };
+    };
-- 
2.36.1

