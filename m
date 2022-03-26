Return-Path: <SRS0=yj5T=UF=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E946AC433EF
	for <soc@archiver.kernel.org>; Sat, 26 Mar 2022 14:43:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D0CB4C340F3; Sat, 26 Mar 2022 14:43:32 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 27F0BC340EE;
	Sat, 26 Mar 2022 14:43:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 27F0BC340EE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f169.google.com with SMTP id c4so8804245qtx.1;
        Sat, 26 Mar 2022 07:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rmLBkFtOQNYFsQqgaT0OsU4d7HAXSeRK+3UTbj0UQ+g=;
        b=Vk0RY86Uw20Ui/DYS1CJQYujvCA8Y3/bjHpbp//pLk8hGomVqjmTPPMug55BGSY4tq
         3mDFZinOfIiDL7C/volTzcPUoUZovWkUa3rE6vbq3YcMRKu6HLCKYbkNw6ekWKKp8TM9
         DvKOG3hwvEu1IwkdzVDXRCAMp9d4Vx94ojsEpslTR3/EvAc8oPA+mBTSSI79uO+onx70
         89Yo4noFGXgtJJBGb0uoe3fwpfFf+wZI/LaVYX2/z6JlC+WNMaAIIs4SKggrZWnmOoyv
         Xr/BbEdu50QojuJEhShUNYS2OLyxajM3qwq1tSHAIULD2tC7eXVYpqLW7h7jUaLJc5+X
         JpkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rmLBkFtOQNYFsQqgaT0OsU4d7HAXSeRK+3UTbj0UQ+g=;
        b=bFbu11IpqaoWZBKET2BOCkRAnZ5mJGjnkFtTznI2CEr91GziF3SoGEcNoXA30KDio9
         6lomd/pcXmF1By0kWbqiTUJ36ewslrXXC7DaRGW3/OKG1JQeoSBwP6IM2JmJBtc1zJYt
         8GkQ9ENmDQxwXBBVzou4UeDMzocewM3rOPDOsN+9m7DM9vdr/3WnqwsYlP0mNrT8Mi3R
         2GCvmq10ssLqN+85/kuEYBiopZysyglNa1jWIH96xclTvZclmxYuhpODxLRo9Yg5l/XS
         0z0gtif++JKyoD3Tlp4g49hvz9vPHvZYlRdpGz8AgKT8/eLgAG5Qa9czN3Qkl6NHpbd6
         KNYw==
X-Gm-Message-State: AOAM532qSqQEANdvYahT0UsFWo7Fj9CbJl1r2JFpuBCHiGQa1G4o2AMw
	XLjOY0o+jhPOKqkWZk45BeE=
X-Google-Smtp-Source: ABdhPJxTo5Qjtqd7mtZlFM47w+EbLUr32pGi96O0b53IGfCfHhBIsqe8H1D2Xa2xX6I1wwfQiMh2Qw==
X-Received: by 2002:a05:622a:58e:b0:2e1:cdf1:d428 with SMTP id c14-20020a05622a058e00b002e1cdf1d428mr13820115qtb.254.1648305811084;
        Sat, 26 Mar 2022 07:43:31 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id 70-20020a370649000000b0067b4cd8ffbasm4908918qkg.60.2022.03.26.07.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Mar 2022 07:43:29 -0700 (PDT)
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
	linux-gpio@vger.kernel.org
Subject: [PATCH v1 04/12] dt-bindings: clock: imx: Add documentation for i.MXRT1170 clock
Date: Sat, 26 Mar 2022 10:43:05 -0400
Message-Id: <20220326144313.673549-5-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220326144313.673549-1-Mr.Bossman075@gmail.com>
References: <20220326144313.673549-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DT binding documentation for i.MXRT1170 clock driver.

Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
 .../bindings/clock/imxrt1170-clock.yaml       | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/imxrt1170-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/imxrt1170-clock.yaml b/Documentation/devicetree/bindings/clock/imxrt1170-clock.yaml
new file mode 100644
index 000000000000..ca0f9ba8b3da
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/imxrt1170-clock.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/imxrt1170-clock.yaml#
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
+    const: fsl,imxrt1170-ccm
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: 32M ext osc
+      - description: 16M int rcosc
+      - description: 32k osc
+
+  clock-names:
+    items:
+      - const: osc
+      - const: rcosc16M
+      - const: osc32k
+
+  '#clock-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imxrt1170-clock.h>
+
+    clks: clock-controller@40cc0000 {
+        compatible = "fsl,imxrt1170-ccm";
+        reg = <0x40cc0000 0x4000>;
+        clocks = <&osc>, <&rcosc16M>, <&osc32k>;
+        clock-names = "osc", "rcosc16M", "osc32k";
+        #clock-cells = <1>;
+    };
-- 
2.34.1

