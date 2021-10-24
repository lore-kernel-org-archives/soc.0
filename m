Return-Path: <SRS0=tGbD=PM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A528C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Oct 2021 15:44:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49ABC60F12
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Oct 2021 15:44:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 49ABC60F12
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MXa16QPOCWApAKOhuXPesiFT65aceUH72OWSmuOWxbo=; b=0suSvkOoTk9WEE
	t5eiRAPEXmNa7Wb94YpM8jm0V8Z/B4XxUZhZPTAMDnliJ+BNs5xJiegB0FDodD3Yoh6o04R/y2xFU
	sYDXJMkNcvI4/HTM8qIgqEDPRrQHYbIXeZqe7wobEEmHd7YbwbFd+kANDn6vquYpacFSDVx1VqjOI
	mqsmQcPiB3Mgsh7eQ7tM9ROecSIkN50+VNrZBnGM+AHBpyjbRGVmq1DO52/5ZOMTpynczEVgiDnHx
	DdKGbyUWkumktlBvXX2mO8qa68t/ZbaF2AFPAXcduHUrQIfZ5R8kiUbJkPhrlyGWcAOEyxgE7ez+L
	8phfh6/mrLQmhHmkwYLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mefdd-00ED8M-5x; Sun, 24 Oct 2021 15:42:21 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mefc6-00ECTs-Je
 for linux-arm-kernel@lists.infradead.org; Sun, 24 Oct 2021 15:40:48 +0000
Received: by mail-qk1-x731.google.com with SMTP id bl14so9627884qkb.4
 for <linux-arm-kernel@lists.infradead.org>;
 Sun, 24 Oct 2021 08:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KLaMi0PjecgqH9q6xdREGuXIuHpv+l05lfMg4lrWRM0=;
 b=U2sUeme9KDMAkiU+LubwbYqgrPTmBpkB3glBm48fRP3JvzUaGRsf16LZQFndRgfQVy
 BCRE5GOdG+Eqr9FVP7gFxa8mRSUtdhOE6VBowIZyKlGrX7qmVP5OtxK/CtItSfeKSxZT
 AKRicU+TXJ4iIaXmODjoA13KK+pHaElZ6csBw01V7NPPzyUotOMuosojuggPMPVP5jG0
 lwIEs74cMs7gtoYj7H9dM3ZrN7siDs99tk3o7X5k4nhIDqSYC4NxFIqg1JHH4LRrQipz
 Uy6ErKUVnxgdvJwrxRmYZVQ0eBd3i75qqpx3ZfQTBbNsJ8V70iSzM36+F0OEt5MElssa
 ftQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KLaMi0PjecgqH9q6xdREGuXIuHpv+l05lfMg4lrWRM0=;
 b=YAHgWXi3HsZbA9y+dyp7wdlGFgFyVX7/vjB4c0tKpuhdXyFKqeLpnkBORWXI1Xn3x6
 Yto1h2fa9qFcbfpqRWV3oLpq0xjP1IzOrW4gy61lsc0NcFvbls6Uv813EFkGGGhb7Hsm
 8rXORzMgnHJXmWDgHiVoXaoR50132JgNMd0vCQ9osVCES+XQWLh93F/Ig/ONhYeTR35o
 p6uc22ZroflTsjX2wvN7yjb9jq1jF81sQ5blhvxnRJjpWkgEYk8GQDIF5LyLeeg6mH5v
 PbJ5TSOI28uNpoFTk4woMhouNqkHiUBIR4Jjw+0l/Zbzs01zRHLNs+PeJHUgSW5vGo23
 jxYg==
X-Gm-Message-State: AOAM532TNrqr3tJYeCw3+7NNquDz6MbYY4rBepxTskxlgOyaxEbi6vG7
 04PqqGC9pLmmrUNKLkFs4zI=
X-Google-Smtp-Source: ABdhPJy9P9jjgymuGD+hjGuutud3QqZ6FQXwfzaibrHuMzBaHwHpi8yxpzE1VeuLxZa7eKj8Aj9T+w==
X-Received: by 2002:a37:9307:: with SMTP id v7mr9447815qkd.371.1635090044481; 
 Sun, 24 Oct 2021 08:40:44 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab
 (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com.
 [146.115.144.188])
 by smtp.gmail.com with ESMTPSA id x9sm7291731qtw.84.2021.10.24.08.40.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Oct 2021 08:40:44 -0700 (PDT)
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
Subject: [PATCH 05/13] dt-bindings: clock: imx: Add documentation for i.MXRT
 clock
Date: Sun, 24 Oct 2021 11:40:19 -0400
Message-ID: <20211024154027.1479261-6-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
References: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211024_084046_675367_7C575F41 
X-CRM114-Status: GOOD (  13.82  )
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
Message-ID: <20211024154019.6xT_npRUyZAqbSq4rUV6G_mZpyOSqrfnPIPqsvNgw48@z>

Add DT binding documentation for i.MXRT clock driver.

Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
 .../bindings/clock/imxrt-clock.yaml           | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/imxrt-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/imxrt-clock.yaml b/Documentation/devicetree/bindings/clock/imxrt-clock.yaml
new file mode 100644
index 000000000000..f432aa81b849
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/imxrt-clock.yaml
@@ -0,0 +1,57 @@
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
+  '#clock-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
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
+      clocks = <&clks IMXRT1050_CLK_OSC>;
+      clock-names = "per";
+    };
-- 
2.33.0


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
