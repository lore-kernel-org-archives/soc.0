Return-Path: <SRS0=YOEr=PV=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E61BC433F5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Nov 2021 22:59:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70B4A60C4A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Nov 2021 22:59:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 70B4A60C4A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sfRC8FjK3HcE4jAliyF9oLZ54ydsKaTcrdEN5kP9MgY=; b=soFbV3yQYK/9/T
	y0aP6E8Ds4aPiXBVfkFynnMn66gGNMWawe+j66x7vXLshyGbwx33f/Xbif7LbBMoYoUyq7zkQHcCx
	ikalhHeyjg5nNqKkpj0ITng+gqxakUgwZFgL20NjerFWUozbVuI5ijPoBBTXHZSXzu8nKFFR5bRS2
	3ZB0Ne2GQc2d+o0/FiF+ysMnViFagM9cblU6BYFZ67LKjJvLyravCFr2FmW15smEbLLbN+P+NvfyT
	iJpNkDDyd4PwQd+Iv0HtoTgEW6gi7tMtWeRPFDBy5YEmTxzbO2LIxV3mtnKqoT5zvjznwJs1KhKRO
	n1qFX4P4DDv+52ZiHn3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mi2ik-003EuG-2m; Tue, 02 Nov 2021 22:57:34 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mi2iL-003Ein-Ig
 for linux-arm-kernel@lists.infradead.org; Tue, 02 Nov 2021 22:57:11 +0000
Received: by mail-qv1-xf33.google.com with SMTP id b17so594975qvl.9
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 02 Nov 2021 15:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1lbIDqyGLdbXsMTaJFigQLBXeHoAC+c2dOleBvZzrOk=;
 b=LdLZa8kCuWAzCIm3jAya3scpUj2pOI5HGoRJvDR6+H3Rh8bkMawqOoCW2cieCeBmIr
 uwQUJXqmugNdQEqqvLrca/NOTYGKrWsbMCx+kGMudy92516tPRy6FlEcLoqyk434q1pe
 tfi4DrJioBJi3pzLJ0K0mBtzpbR/t7AMS6iWhoXk8CTml0x9D8gNF4AkHwcOlxYB/kZu
 yWK2RXAi7qr7XJ0jDlI7Mr4rEr24VNd644kZ5tfz0Q+rIj/atFx1rlc0tBPqji6sjGma
 YzYJ50GvdKF9fUu+DCJK6I77tGuYbvZ9XdniHPqfUHC3yQAhVT4FRTYgW6woRVYc/Fku
 csjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1lbIDqyGLdbXsMTaJFigQLBXeHoAC+c2dOleBvZzrOk=;
 b=yt74L7HznQh+u/rS7BHAa4WHV8IOtexdatrDrQkLisvl0b0+/sWe3EmqjmDiuZCTiz
 MgW5Fj8dZGaZJ4noZEPDmuhMbxbl7p8d5oslvNPVQ9nduYD+jU6rqkjSH4E1rEfWJzdc
 rrkL5z2/HZcQTqIwa5YWL8GnZz4QfZrs9RpBQLVdk1y1q0vWcVEeth9Qc5nuTZ+lkt9F
 yyN50RwiCaP6zpc0azciHsx+WpB0oCxnzlTEubay/2dlU2dHokH+Dvd471uomaojb825
 IsOWq1ma9DS4lQlBvck4alebYtOMZVRKeULaMUtv8kNW2e1RS5yuoMMT2G/cdmCWJv/9
 81pA==
X-Gm-Message-State: AOAM531YCTj7+aAEbvfKhNTVsmqobP9XP5N+TeAViTCmiK+gia3tl7zD
 XbSyTptPVgwveJFEvIk5cmo=
X-Google-Smtp-Source: ABdhPJw9h1fxmIGxSbw++N+ahnTzWcZlnmga1RLIhVC83mPu1wJ7SIp5MuEKxT09GJLgJoTzpi8Ivw==
X-Received: by 2002:a05:622a:612:: with SMTP id
 z18mr17396283qta.411.1635893827282; 
 Tue, 02 Nov 2021 15:57:07 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab
 (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com.
 [146.115.144.188])
 by smtp.gmail.com with ESMTPSA id v19sm351222qtk.6.2021.11.02.15.57.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 15:57:06 -0700 (PDT)
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
 Mr.Bossman075@gmail.com, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
 Jesse Taube <mr.bossman075@gmail.com>
Subject: [PATCH v2 02/13] dt-bindings: pinctrl: add i.MXRT1050 pinctrl binding
 doc
Date: Tue,  2 Nov 2021 18:56:50 -0400
Message-ID: <20211102225701.98944-3-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211102225701.98944-1-Mr.Bossman075@gmail.com>
References: <20211102225701.98944-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_155709_657787_6406F97C 
X-CRM114-Status: GOOD (  16.12  )
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
Message-ID: <20211102225650.W-E4aJHZ1W_uPMPmxnefRXwQ_r9d1sWitf2OB-fzhIw@z>

From: Jesse Taube <mr.bossman075@gmail.com>

Add i.MXRT1050 pinctrl binding doc

Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
V1->V2:
* Replace macros with values
* Add tab for last pinctrl value
---
 .../bindings/pinctrl/fsl,imxrt1050.yaml       | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.yaml b/Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.yaml
new file mode 100644
index 000000000000..07e1afb15e54
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.yaml
@@ -0,0 +1,83 @@
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
+          0x0EC 0x2DC 0x000 0x2 0x0	0xf1
+          0x0F0 0x2E0 0x000 0x2 0x0	0xf1
+          >;
+        };
+      };
+    };
-- 
2.33.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
