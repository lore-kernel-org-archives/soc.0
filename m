Return-Path: <SRS0=tGbD=PM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8412DC433F5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Oct 2021 15:42:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53FE960F46
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Oct 2021 15:42:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 53FE960F46
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XddWERTxCoZrLMtuNc4j6YPlpMH2DCv4jpm0Z4X6wUg=; b=HIGAA0rS3M31dH
	H5irXL56ssORy11qTjnl18GDdHW99SzADkBZwrklHQYTcuq5W8NAcbqrG9uKp0QPtd4F1QlX6gx5x
	l3aAblsjq8yjqV3NE4lVACdPRNWwGm7fc/yMCqqm2gFM7fXdUInURFzpyNcwf0iR74C0fp+VmrIjR
	kOCy/yVloaNO730Y1TP2KEau8asxnQjuKB3kdwiGQKLn/+rq0JNhVKAVl2MGzjQMQzQTDVuQDtAn/
	pZB0K1r3j3AAH2LuQkQ/bpSwOM6wyD89PRuPotPflcDJOVqq0YxdmlVMK9zTNaQANLrbcAADwxDJ+
	xziWPSP9xpq5KvozS0aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mefcP-00ECbc-KY; Sun, 24 Oct 2021 15:41:05 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mefbz-00ECQj-8f
 for linux-arm-kernel@lists.infradead.org; Sun, 24 Oct 2021 15:40:40 +0000
Received: by mail-qk1-x736.google.com with SMTP id d15so9475565qkj.10
 for <linux-arm-kernel@lists.infradead.org>;
 Sun, 24 Oct 2021 08:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HZ8vL0g7vf5CLqx1Rw8klwqcAlI5fsNiFDxviXL0Y+M=;
 b=KezdmQSZTtCeVZgg9OZf3oY4wv7MsJcqd1y3rW7y866clqS+YAFXt8LPyz6VijuCDq
 r2TX32vD6U3//hfdh1f0MxqcX7HmASZHOJhNsZPVLThUR/ohPVSai8aTb3jPrEQGWvNv
 t/pILtw8LOMcBI3T9GX2SdoxDLQmqX2nkRUxlz2wwsXgQHOweKR65Bs3GSee3kn252+E
 +vsKstp1njWSuTKPhbaygpcG4aG13HKOiZ8cUSRB9j+wL9oZnI4Zla/VJapeTAdh6q7J
 bjmQ1kb7buaXki9RSh3aS+k/UgwoENKMaFDuPqXO11ojI5NHmtqDcjfpQ4wZwrMmtjl+
 eEyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HZ8vL0g7vf5CLqx1Rw8klwqcAlI5fsNiFDxviXL0Y+M=;
 b=kDWImwf5LRBj/dvwMwYoAIwrD/+iapDrQvFyquY8qS5UiPBOpUXmIx75n8OetKnhsC
 RxTyL6Cwtfocob0ftIqnkuhwaP35r8WggbTjbbpGdDW7gJewo1puKqrjrJ3W3BiaoPaw
 nFLEq4OJfBe3p1O8nJt2olMwhRnq21Ae4jks6RD95ocuzZ48sF0b4OJoglPQhlHDA8iA
 PtPWdmzpgXVKwdV9vRVWysfvN+ULAqkwZ9U/DP+Lt9ScHa2Ess2iMHcDHVrxuBZmVNvw
 S8GtFJ1hxPiUC0JonAJ2k0KRZqUt/R/fp55EcnIi/3Ak+nqiGuFg1RjZ3ON2kiHFvRm5
 qv/Q==
X-Gm-Message-State: AOAM530oZWeYIT0PKYRMaVL2J9gOColu5v6YyzvgQM+gL9Pb1J2T8fuP
 qjvYEFWoeVljVAGte0k3pvIYsliX5dMQYbQu
X-Google-Smtp-Source: ABdhPJzYq58MkBV+/oQ42fToDw6FyMyangrabwoFnHuqK/S++onj7WLZBfgQL4nPSxd2prl8YJPtfA==
X-Received: by 2002:a37:9404:: with SMTP id w4mr9730042qkd.469.1635090038229; 
 Sun, 24 Oct 2021 08:40:38 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab
 (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com.
 [146.115.144.188])
 by smtp.gmail.com with ESMTPSA id x9sm7291731qtw.84.2021.10.24.08.40.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Oct 2021 08:40:37 -0700 (PDT)
From: Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To: linux-imx@nxp.com
List-Id: <soc.lore.kernel.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, ulf.hansson@linaro.org, aisheng.dong@nxp.com,
 stefan@agner.ch, linus.walleij@linaro.org, gregkh@linuxfoundation.org,
 arnd@arndb.de, olof@lixom.net, soc@kernel.org, linux@armlinux.org.uk,
 abel.vesa@nxp.com, adrian.hunter@intel.com, jirislaby@kernel.org,
 giulio.benetti@benettiengineering.com, nobuhiro1.iwamatsu@toshiba.co.jp,
 leonard.crestez@nxp.com, b20788@freescale.com, Mr.Bossman075@gmail.com,
 fugang.duan@nxp.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-serial@vger.kernel.org
Subject: [PATCH 02/13] dt-bindings: pinctrl: add i.MXRT1050 pinctrl binding doc
Date: Sun, 24 Oct 2021 11:40:16 -0400
Message-ID: <20211024154027.1479261-3-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
References: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211024_084039_346930_45821A94 
X-CRM114-Status: GOOD (  15.63  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20211024154016.5-vpWpqW7iXC54WmGyODetWGFTfDzR9_qY1Ct8aHbBw@z>

Add i.MXRT1050 pinctrl binding doc

Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
 .../bindings/pinctrl/fsl,imxrt1050.yaml       | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.yaml b/Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.yaml
new file mode 100644
index 000000000000..2f3e41b40782
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.yaml
@@ -0,0 +1,85 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/fsl,imxrt-pinctrl.yaml#
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
+      compatible = "fsl,imxrt1050-iomuxc";
+      reg = <0x401f8000 0x4000>;
+      fsl,mux_mask = <0x7>;
+      pinctrl-names = "default";
+      imxrt1050-evk {
+        pinctrl_lpuart1: lpuart1grp {
+        fsl,pins = <
+          MXRT1050_IOMUXC_GPIO_AD_B0_12_LPUART1_TXD
+            0xf1
+          MXRT1050_IOMUXC_GPIO_AD_B0_13_LPUART1_RXD
+            0xf1
+          >;
+        };
+      };
+    };
-- 
2.33.0


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
