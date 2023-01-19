Return-Path: <SRS0=rvNc=5Q=ew.tq-group.com=alexander.stein@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 088BFC6379F
	for <soc@archiver.kernel.org>; Thu, 19 Jan 2023 14:42:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E45F4C433F0; Thu, 19 Jan 2023 14:42:57 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 84634C433F2;
	Thu, 19 Jan 2023 14:42:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 84634C433F2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674139376; x=1705675376;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TLChsiQKUwXxBVjYX7YtnK1mxpQTic48Ryib6VjfEV4=;
  b=GCdxsZLT5gDB1J1Z06VwtIPNLlVMccCPPAHFVPLoGucxRejbkawPj4O7
   PT/e+vZCYLX8n958Oe7EtTmSmRT84nw/ECMHiUdm6el0sFta3B84FaVvB
   d3uaBOXtxUb+VymqGCmBcKOHp6rdmM8m0lvESIyzVdF8nfF1I62p+eNvb
   69OHRm3U0UM9PsWtnv+og2d1it4MJ2+nNYiIdjqRp7ocm1IWocdblcE1u
   ahR7QHyW6kanObYkka8rAE9I34+/1zwMTo/Nak8PWtGYCbP6gFyjrjMAR
   HGFc30M8y6RDCnMG3QiTCLVFxqiSJjgXRI9Pb7sk8yZFwXmSRTPnoQ6XK
   w==;
X-IronPort-AV: E=Sophos;i="5.97,229,1669071600"; 
   d="scan'208";a="28537308"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 19 Jan 2023 15:42:44 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 19 Jan 2023 15:42:44 +0100
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Thu, 19 Jan 2023 15:42:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674139364; x=1705675364;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TLChsiQKUwXxBVjYX7YtnK1mxpQTic48Ryib6VjfEV4=;
  b=cIYkIRIVpBnzhrni6+QvI+Ofek6dNBMJbH2k2pOqZwkAza64bCpw5/7D
   aIZXUuVsysluxZIlqiqMew/zBSN+GQIqgfF/g2/jY9as83oC6GVlZi9aD
   3Mpwcwu57Z3D0v3sxo1Nflb0ODkBWbKvtzqQY5UyYUpffd58Cn/ved1DX
   R803htofZfbxoW+VMNm0kUGPIYrNOpsQhfasSilzBDtw7Lf6bpsfcQbbC
   UAVtvFI5hYxVlmw0zCqTgWtWdgQ9oF8O4QUtayp1In0ICFZSbK/B+/1K7
   HKdzXUQ3OlSfFa3CSTc2Md44AQ9MvdxQRCbN4mqy+0Us3lwVZrgJLHmvt
   w==;
X-IronPort-AV: E=Sophos;i="5.97,229,1669071600"; 
   d="scan'208";a="28537307"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 19 Jan 2023 15:42:44 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id DBAE7280073;
	Thu, 19 Jan 2023 15:42:43 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Shawn Guo <shawnguo@kernel.org>,
	Li Yang <leoyang.li@nxp.com>,
	Russell King <linux@armlinux.org.uk>,
	Marek Vasut <marex@denx.de>,
	Marcel Ziswiler <marcel.ziswiler@toradex.com>
List-Id: <soc.lore.kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/9] ARM: dts: ls1021a: add TQMLS1021A/MBLS102xA LVDS TM070JVHG33 overlay
Date: Thu, 19 Jan 2023 15:42:31 +0100
Message-Id: <20230119144236.3541751-5-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230119144236.3541751-1-alexander.stein@ew.tq-group.com>
References: <20230119144236.3541751-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree overlay for LVDS display usage.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/Makefile                    |  5 ++
 ...tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtso | 56 +++++++++++++++++++
 2 files changed, 61 insertions(+)
 create mode 100644 arch/arm/boot/dts/ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtso

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 44b5ed44b13d6..e6943dc73a3fd 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -805,6 +805,11 @@ dtb-$(CONFIG_SOC_LS1021A) += \
 	ls1021a-tqmls1021a-mbls1021a.dtb \
 	ls1021a-tsn.dtb \
 	ls1021a-twr.dtb
+
+ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33-dtbs := ls1021a-tqmls1021a-mbls1021a.dtb ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtbo
+
+dtb-$(CONFIG_SOC_LS1021A) += ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtb
+
 dtb-$(CONFIG_SOC_VF610) += \
 	vf500-colibri-eval-v3.dtb \
 	vf610-bk4.dtb \
diff --git a/arch/arm/boot/dts/ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtso b/arch/arm/boot/dts/ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtso
new file mode 100644
index 0000000000000..252ef982dd862
--- /dev/null
+++ b/arch/arm/boot/dts/ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtso
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR X11)
+/*
+ * Copyright 2018-2023 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Alexander Stein
+
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&backlight_dcu {
+	status = "okay";
+};
+
+&dcu {
+	status = "okay";
+
+	port {
+
+		dcu_out: endpoint {
+			remote-endpoint = <&lvds_encoder_in>;
+		};
+	};
+};
+
+&display {
+	compatible = "tianma,tm070jvhg33";
+	status = "okay";
+
+	port {
+		panel_in: endpoint {
+			remote-endpoint = <&lvds_encoder_out>;
+		};
+	};
+};
+
+&lvds_encoder {
+	status = "okay";
+
+	ports {
+		port@0 {
+			lvds_encoder_in: endpoint {
+				remote-endpoint = <&dcu_out>;
+			};
+		};
+
+		port@1 {
+			lvds_encoder_out: endpoint {
+				remote-endpoint = <&panel_in>;
+			};
+		};
+	};
+};
-- 
2.34.1

