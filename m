Return-Path: <SRS0=/X4i=QM=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD546C433F5
	for <soc@archiver.kernel.org>; Thu, 25 Nov 2021 21:40:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B267CC9305D; Thu, 25 Nov 2021 21:40:49 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0C799C9305A;
	Thu, 25 Nov 2021 21:40:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0C799C9305A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f180.google.com with SMTP id b67so12939648qkg.6;
        Thu, 25 Nov 2021 13:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mWlDE9wPN5DJ1yGQE4Tgk+m6TLyjhj2NB8c5F++tYPw=;
        b=YZTFvs7LTHYPL6rcFc+BTkIR3jloR5ewoukXlkcVc/fR/aDhITNYRj1UNhzzEUBRdw
         vO2/SMlYNG/9L7iEloT3JLMZ4wsSrls029KtKgGEt3x6vso9WqACsM+XR+h9HNznwkhJ
         qf0r83NQx6l2/xPrfdXbRVRE4kW+S3WA784811vDZklc7rUbYSgB2qxoPE16rcO0mZ/R
         zQBfZOSrx0HrxuOwrxFVBhXESEbkKj8d4GkMsQ74gpb9VgFxvtr4toLL0iPL/YmFfshq
         IxGIowUjXnVQQ6EsqD6ouB5KKZMR1p6wlBwOqmUZRTjWRPtzUA3jHheADspSsuGMA0Fv
         sbSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mWlDE9wPN5DJ1yGQE4Tgk+m6TLyjhj2NB8c5F++tYPw=;
        b=H8qziSHDKSsr4F03EDiK0361HdeBD0le255tRCtywOqbop5hJlhDQJiL6+n80a29+k
         PtdOIid7VvG/qgC01pr0Uwxt++av6z/A49kzxvLe80+h9PpB9siq/1DI8dKgXE8dG1d4
         sdJO07DjU+Fcxm+u2vsbjpeen/MszKC7LYdcXdxWEckB5lSMxKB+g2cAV7crwvUNThEE
         5cM4EhSAzsN+lJ/wrZNXp24BVh3j8R7oXfIcGDCM5JnWrosotYeofTarQ/f8NFszxCFI
         LHnDn+Mj1cMONrNte1glkxUZB7YKqjJAMBkOBOLJmTrZ4CZP98LYTx9glOVwVjRW/B0f
         mccA==
X-Gm-Message-State: AOAM5325uos3qxnERyA0AhFITV8TXrx/GF9YlUdNOVxd5aD3Pg/osccs
	44RsyikcRuyMPakJxFVD6hL4JzdC1esOag==
X-Google-Smtp-Source: ABdhPJxsERgerN73f2lBXqrIay0q2SfiEQHG5N7slGfb7mqoA0oI9us+PKc4oChZfqLoVy9rR6HrdA==
X-Received: by 2002:a05:620a:1350:: with SMTP id c16mr18629492qkl.229.1637874889415;
        Thu, 25 Nov 2021 13:14:49 -0800 (PST)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id j22sm2068175qko.68.2021.11.25.13.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 13:14:49 -0800 (PST)
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
Subject: [PATCH v3 02/13] dt-bindings: pinctrl: add i.MXRT1050 pinctrl binding doc
Date: Thu, 25 Nov 2021 16:14:32 -0500
Message-Id: <20211125211443.1150135-3-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211125211443.1150135-1-Mr.Bossman075@gmail.com>
References: <20211125211443.1150135-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jesse Taube <mr.bossman075@gmail.com>

Add i.MXRT1050 pinctrl binding doc

Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
V1->V2:
* Replace macros with values
* Add tab for last pinctrl value
V2->V3:
* Remove imxrt1050-evk container
* Remove unnecessary handles
* 2 space tabs to 4
---
 .../bindings/pinctrl/fsl,imxrt1050.yaml       | 79 +++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.yaml b/Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.yaml
new file mode 100644
index 000000000000..1278f7293560
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/fsl,imxrt1050.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale IMXRT1050 IOMUX Controller
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
+    const: fsl,imxrt1050-iomuxc
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
+          be found in <include/dt-bindings/pinctrl/pins-imxrt1050.h>. The last
+          integer CONFIG is the pad setting value like pull-up on this pin. Please
+          refer to i.MXRT1050 Reference Manual for detailed CONFIG settings.
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
+
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
+    iomuxc: iomuxc@401f8000 {
+        compatible = "fsl,imxrt1050-iomuxc";
+        reg = <0x401f8000 0x4000>;
+
+        pinctrl_lpuart1: lpuart1grp {
+            fsl,pins =
+              <0x0EC 0x2DC 0x000 0x2 0x0	0xf1>,
+              <0x0F0 0x2E0 0x000 0x2 0x0	0xf1>;
+        };
+    };
-- 
2.34.0

