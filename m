Return-Path: <SRS0=WPFH=QV=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E008EC28CA7
	for <soc@archiver.kernel.org>; Sat,  4 Dec 2021 06:10:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BE495C341E1; Sat,  4 Dec 2021 06:10:55 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3991FC341C0;
	Sat,  4 Dec 2021 06:10:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3991FC341C0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f169.google.com with SMTP id p19so5613518qtw.12;
        Fri, 03 Dec 2021 22:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uIXLxIuMwC34QjAguBG050yUt+MXx4od/4nSlb5Y1Es=;
        b=IUV0fnXjH+J/b5a+Gm9BG+QE1RsI2H/6QL0hIuEi2jtA2xd5WWoecNNngIpLvETvmc
         CBUk66TmUvKtoc1chh6r2noNvyB8NfQ6+pBtoTreIYMeiQCbm53OCsUM/ypOg4Enm7ZK
         B/ECKZIOUbUh61cZJYXxUeUd1zZ3PdL/zkxy8DuDOeDc3gASXABP15np6Bd+RQHxoKNQ
         St7pNWRBYF0Qp69MSsh+DMFtku6T2G67WEKF6L7jCEuF5X/5kA1g6tU1B5vQTNiocbpB
         yC7bENjrd3L8FxLx9QC2zvhoFU/uyYdK/30T/B0nN4s7E3A9PAet3A83rg+H9dsNm3Ys
         yh8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uIXLxIuMwC34QjAguBG050yUt+MXx4od/4nSlb5Y1Es=;
        b=jqS+Su4cXivBrySYp2c5/8ZSNLajJkYzVyZOBqtwC4+TAzwNEuHzWjM6jeyW48NHuJ
         7j381vapxYPhwxW7PW6NkBSUBcvU3mGsxLpehLWF5elEUqQCL2Nnea6dEB3bvhc5u5pb
         SHJ0lu0Wz2Otuj75eQPaHS87Ioxw/oiTnZMEBQ9o+/DIjVnmV5JB+gIih0vQ+ivtHz+7
         PcQ02oD8URlhqvh/igkaoteH8zpW1bkhIjTufwkuRtInuIdwQjVe1hgIBRgTB6g1ctFt
         WVSabNQ1G5FggRB0Uk6QVp5J5j/oFLbnzfX4ASLEe+/pNMHKts465aAkM+7M0A+VtWOM
         k4Hw==
X-Gm-Message-State: AOAM532INfMON/J9fXEjhQwLIr+hhLiAp45JqIb8iUhXkCmysh9nmXCk
	BT3qI3Le8YLfLqEoXCZL1E0=
X-Google-Smtp-Source: ABdhPJwD2SVpXtEskCG7P11vgva5D+ze3xEsZ+kEWMqsTfo+qt0ZE4/shIWKS3wjRzAOBM5fmMTmAQ==
X-Received: by 2002:a05:622a:4cf:: with SMTP id q15mr26073106qtx.543.1638598254286;
        Fri, 03 Dec 2021 22:10:54 -0800 (PST)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id l1sm3500913qkp.125.2021.12.03.22.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 22:10:54 -0800 (PST)
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
	Jesse Taube <mr.bossman075@gmail.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v4 06/13] dt-bindings: clock: imx: Add documentation for i.MXRT clock
Date: Sat,  4 Dec 2021 01:10:35 -0500
Message-Id: <20211204061042.1248028-7-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211204061042.1248028-1-Mr.Bossman075@gmail.com>
References: <20211204061042.1248028-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jesse Taube <mr.bossman075@gmail.com>

Add DT binding documentation for i.MXRT clock driver.

Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
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

