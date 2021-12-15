Return-Path: <SRS0=KNgb=RA=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67E1EC43217
	for <soc@archiver.kernel.org>; Wed, 15 Dec 2021 22:05:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4F76FC36AE2; Wed, 15 Dec 2021 22:05:50 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7D223C36AE4;
	Wed, 15 Dec 2021 22:05:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7D223C36AE4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f50.google.com with SMTP id i13so21633097qvm.1;
        Wed, 15 Dec 2021 14:05:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YKLnn1piTmjuFpvCctXoR3qG0POusuFbfw0ULlMi8Zk=;
        b=SKORBTHiACk67BHgoaStl1hZV/YpqjLQKe8yZw2at4MGu5SUuc+grDTDl0l7t6OXt6
         V8e8HPpfu4SyIQ3sreRn3YEjkyWc59PFNlRAvl6hHWUgTCHkhbFwUKSGuuWjZCb3MagA
         HU/RYt/yVViVMO1cYrM9f6KVFeh79UqagTUc5iB6v+ap9FtB5qsLDXl6o3K7h8AtjpM+
         NclXyyVgCz/rsartAFr0iGwrcQWBZy0ugDR5js+tMZyTEmuBxTZnfeAlFcfawytU8fHh
         R+7Egt5qgBVc5cR1bOayOb5HinY7uQaP7MG/I2sIxy55nI/UR2W/XOyrFD5UlBj/3EqC
         B4Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YKLnn1piTmjuFpvCctXoR3qG0POusuFbfw0ULlMi8Zk=;
        b=0ZvQ6n3ACHskvOvz+r6JyEZ75yGE/R/oRv/92koHqI94KAIEc75xMX8tYSz6zqqJix
         w72wj6Ilyhp9s5gE0kCL5/DHGAqYU7V4dTKa3U7nyQj2q1L5uZC6F6XG/UVCPIG4eLlR
         wkre1XpcYtgrLFdJJLm/EmhBDcZxABcsgB4aVPa34amQzYwGZhxZRWHSdji+yADA4hU3
         nzd3Ks8b+zEDw6YTFeoK+L+unO+GHshTQrNdmz7NrqtYH9n1HJu880tQl4IZ5uJdGPGW
         yCGOFR5ArdmGL6eWFcOgrTVBT91BAv5OzCZyONv4bFmT2VsDe+UuG1qvqHFv65V0Eg83
         cAdw==
X-Gm-Message-State: AOAM531/jtF4/FXyeygt4rlJQpni4lEhVMKwpp6j63t0M0EoKzqVCFGb
	NApSPtCPq41OVtFQABjM4gY=
X-Google-Smtp-Source: ABdhPJzGFiGwKMG3U/uaEIJYKD99IjOP/Oy+eaDNCvt44EG1YKHkt2qo6JQdgQ+4S4RUcbs4r9qlEg==
X-Received: by 2002:a05:6214:528f:: with SMTP id kj15mr4269275qvb.101.1639605948504;
        Wed, 15 Dec 2021 14:05:48 -0800 (PST)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id s20sm2471592qtc.75.2021.12.15.14.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 14:05:48 -0800 (PST)
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
Subject: [PATCH v5 4/9] dt-bindings: clock: imx: Add documentation for i.MXRT1050 clock
Date: Wed, 15 Dec 2021 17:05:33 -0500
Message-Id: <20211215220538.4180616-5-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211215220538.4180616-1-Mr.Bossman075@gmail.com>
References: <20211215220538.4180616-1-Mr.Bossman075@gmail.com>
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
---
 .../bindings/clock/imxrt1050-clock.yaml       | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/imxrt1050-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/imxrt1050-clock.yaml b/Documentation/devicetree/bindings/clock/imxrt1050-clock.yaml
new file mode 100644
index 000000000000..8caf0572733b
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/imxrt1050-clock.yaml
@@ -0,0 +1,66 @@
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

