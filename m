Return-Path: <SRS0=nR9Q=RH=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D15DC433F5
	for <soc@archiver.kernel.org>; Wed, 22 Dec 2021 01:52:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3760DC36AEB; Wed, 22 Dec 2021 01:52:54 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 961E5C36AF1;
	Wed, 22 Dec 2021 01:52:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 961E5C36AF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f172.google.com with SMTP id m25so579653qtq.13;
        Tue, 21 Dec 2021 17:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lKI+im9qbJm1wftqrnhY+yP4QLsNjLsFVh65bGMKGCE=;
        b=gKm10mL8zoDzKnrrdn/QFeOqUYtZRCioDiCt6bsztszQ1L8plMCslCjPFqSxmr2AVR
         uDW/kjAgoizIyw+1VOyQjjgnPLOgcujwhbz4VO21lNeVvSzE38P2g3QLPnrB9cab1Lkc
         L9T+tSE7m6fcp6YcRsGm3PJf747E3P562BPB8Xr6anGCXN+P3HerDRe5ksk5bo5YKMQc
         q+nt8A0Y3+xGnPXqIUXU8yzAOdjcjAzKK7wd/KPI5nau02cCdHsjkaksdhiBwUPwfFfE
         RE2XY6hI+AWLYKMqGpa8Kiyptpl80xwidQnFPVpgKm0xocm7VqPvFv1fvcWU0zNbW636
         QG/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lKI+im9qbJm1wftqrnhY+yP4QLsNjLsFVh65bGMKGCE=;
        b=eHdrCgKYIzpHUVWhiNCFJszXTOE6aNgfXEDtSObts+uy/rLlaTByWrFcZF0ghepS9D
         eNev3wubroK0uM8EAx/l2iux0PCgACljZa5+SBndxNPVnBmeYyvn1P3YaUFPwgUegX6w
         HEbmoS6imMhpV1Mw3VS1sRLFs4kTyaZpR5HGmVf/BIhaNBIDXECYOh+PPCVincpB0aaD
         LDNjbJ/dnki8flB5dtbNDoI+zzabEIiRWjeQS2T+hhp+u9DChjcW9kc0DRMX7cnexD56
         P/VZW3s7yGt0h7kCsPHzcEPUdoJCwXq2E2kHgj1cbtU+JNt8BUIASeDorFG/Duvy5+Qd
         puPw==
X-Gm-Message-State: AOAM533Ik9VhH1YKRbXD18RiGcF2UO086BXWP9Y4NOuEHcUqP2c40XNW
	ss8e1gs3PNklYNsO3H9b6UM=
X-Google-Smtp-Source: ABdhPJwqPvr/P/+cDZAx9gJuJNEv9SpEKDa08meJhy3WTz73hW0byac4EOkME2m9ArRJaX7ynbP83g==
X-Received: by 2002:a05:622a:1cd:: with SMTP id t13mr736105qtw.487.1640137972623;
        Tue, 21 Dec 2021 17:52:52 -0800 (PST)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id d4sm658161qkn.79.2021.12.21.17.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 17:52:52 -0800 (PST)
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
Subject: [PATCH v6 4/7] dt-bindings: clock: imx: Add documentation for i.MXRT1050 clock
Date: Tue, 21 Dec 2021 20:52:41 -0500
Message-Id: <20211222015244.2464671-5-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211222015244.2464671-1-Mr.Bossman075@gmail.com>
References: <20211222015244.2464671-1-Mr.Bossman075@gmail.com>
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

