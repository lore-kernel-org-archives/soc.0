Return-Path: <SRS0=V3zi=PV=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55E00C433FE
	for <soc@archiver.kernel.org>; Tue,  2 Nov 2021 22:57:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 371E06054E; Tue,  2 Nov 2021 22:57:13 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F213A60C4A;
	Tue,  2 Nov 2021 22:57:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F213A60C4A
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f50.google.com with SMTP id gh1so600478qvb.8;
        Tue, 02 Nov 2021 15:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ntlpWtm8EgDO0Wkv+UfSBg+xWTj50Z2iH5hgbvU4PL8=;
        b=jbdhvZqP/khetaBd25GPUIC8KKp6G8CIWqbF+kAae1Mm6ndkl30HGld0B5FKKstfJF
         NmKmq/hd7ogyivGJVgEp9gJQamLNnJlJK/UzT9/lvegLHfMqdu4PZNdPLxbYsO1aC5Tv
         +zY2pgm+7US8cOhMEmIMFflQH9zws/icWPXWL/I0C8L+kdB7F82s0u1Gf4JLQoovW+Ji
         MSCG7FkNf5567qr8K1/wbCNZr6hDz6qjDZ/g8r7kFPw2qAX8Fzx/Zc5dbcDTOKR8ZHg1
         GzSf63Oc5kmKXW5aOAvDY3dZRyxULF9odmrthySEmkpgLkYDiimHBzkHHC5/qvTUV35f
         TVug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ntlpWtm8EgDO0Wkv+UfSBg+xWTj50Z2iH5hgbvU4PL8=;
        b=xyHAjWN85MGgv/JgOcwhRwIegW6MSuX4/GVKyhpSYZvWBbwfrjTCehAclzLWiewlvS
         k08QtSm57ztk00S8AX4DvqDdPEGB0rbc/+cFg71cEWJY/U0jX58AOEuEtX0q69z5Af4e
         Mvz8ZMbUa4UgJIcHycNJ0RQtD0/y8FnqnH252HFrkF+XakW92Tt102q0GlYxNA0y/lQk
         pjwOj2Z6N+JAP2iYif7E8l/GH5VCh+l/zpp/C184+79Cb09N5BGjbCPh3oCitCGMHTHq
         /b0Q0R6bZjgerL3+OLkxRLnOOxFd9hv6TT5fekkJnnuvIn20dyIS6AgpfEse+BkRQ84f
         W7Lw==
X-Gm-Message-State: AOAM5314IFtNWB5F/4f5YTbZs+QINbf+NzhZL6YUaTM33SF2GXHGG4fT
	XrSbT1Cm+E12adR5cT2x5Hjeq4dvEP8xugkk
X-Google-Smtp-Source: ABdhPJydtr9n2nXsMTCBsPhs3XyUPUffhsLXvdp9cZeuTXGS6Tvae9yYxXbqmET6ZPBBrD9P+fb/zQ==
X-Received: by 2002:a05:6214:8c8:: with SMTP id da8mr3102336qvb.23.1635893832137;
        Tue, 02 Nov 2021 15:57:12 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id v19sm351222qtk.6.2021.11.02.15.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 15:57:11 -0700 (PDT)
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
Subject: [PATCH v2 05/13] dt-bindings: clock: imx: Add documentation for i.MXRT clock
Date: Tue,  2 Nov 2021 18:56:53 -0400
Message-Id: <20211102225701.98944-6-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211102225701.98944-1-Mr.Bossman075@gmail.com>
References: <20211102225701.98944-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jesse Taube <mr.bossman075@gmail.com>

Add DT binding documentation for i.MXRT clock driver.

Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
V1->V2:
* Replace macros with values
---
 .../bindings/clock/imxrt-clock.yaml           | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/imxrt-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/imxrt-clock.yaml b/Documentation/devicetree/bindings/clock/imxrt-clock.yaml
new file mode 100644
index 000000000000..4e92f79cf707
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/imxrt-clock.yaml
@@ -0,0 +1,70 @@
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
+    anatop: anatop@400d8000 {
+      compatible = "fsl,imxrt-anatop";
+      reg = <0x400d8000 0x4000>;
+    };
+
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
+      clocks = <&clks 3>;
+      clock-names = "per";
+    };
-- 
2.33.1

