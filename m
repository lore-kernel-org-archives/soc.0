Return-Path: <SRS0=MX/P=5R=ew.tq-group.com=alexander.stein@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B115C54EB6
	for <soc@archiver.kernel.org>; Fri, 20 Jan 2023 13:35:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 83BDEC433D2; Fri, 20 Jan 2023 13:35:14 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ECDF3C433EF;
	Fri, 20 Jan 2023 13:35:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org ECDF3C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674221713; x=1705757713;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6lUwIFtQeWgMcDuLcfHeHzcSNR9oLnzazQUJVZ0zNcU=;
  b=P7I2v+M+ho01mjY9wtGt7zkeQaMPhngx4ddQ0D2z4Z9WhV1E9om8O491
   LReuNxjReoXijdAZNVHgmIlvhUiQpCgVK0QcJMQyR976jMZi3DzThNmM0
   4vPA32NUo8GZQVGCDGeWNfGNSmyta0LR/hafq7L7crM9dhftocyu7SqGq
   vA77RMabtHUWUscyb9r3Xc7ludFjUa3tY2/9L0FEv7/17WNCldsbgpWhw
   Lv7qlKfyy/vIsEGsgi4G9coJZSce/rhtsbV9LnW6eQF8ogGY7IEM0Q1ph
   xE9lyMzLvAFtDmdIW08yFCs869PiT4vbhLLyC/148bGvzDRqywMobP9RS
   A==;
X-IronPort-AV: E=Sophos;i="5.97,232,1669071600"; 
   d="scan'208";a="28561582"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 20 Jan 2023 14:35:05 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 20 Jan 2023 14:35:05 +0100
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Fri, 20 Jan 2023 14:35:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674221705; x=1705757705;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6lUwIFtQeWgMcDuLcfHeHzcSNR9oLnzazQUJVZ0zNcU=;
  b=XKrETyMHqxjFkEL8Ec0OcOzsTD7CpLhxD2mDSNEri70JZioVgNwAR2S7
   epS0WklJwszSrLwIu9f6tSfP+JSE5O8lOZhHpxhYAyHv9yGGk3ELT24jR
   whhUwp6jUmJX2C5N2w1sXldvRas2Q49Njjt2pCAyS2TKIAZH5IbrFvVvV
   NXB70r3w1EnwGA6mg4JLhoHF6n8MBnk3meLRiiUUW/wehvvnBaG1xBJnc
   /DO2TSRKDjsdw3x0Y75xc2ONPD1bXZB7D8F8BEMWEPpYICBizmyM+PVGd
   DRPxgI84SNWBBYbWlr20KBkOxXKibnX22EP/StPgisUezBfqXjDwBNxfV
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,232,1669071600"; 
   d="scan'208";a="28561581"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 20 Jan 2023 14:35:04 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 65FF1280078;
	Fri, 20 Jan 2023 14:35:04 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Shawn Guo <shawnguo@kernel.org>,
	Li Yang <leoyang.li@nxp.com>,
	Russell King <linux@armlinux.org.uk>,
	Marek Vasut <marex@denx.de>,
	Marcel Ziswiler <marcel.ziswiler@toradex.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>
List-Id: <soc.lore.kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kbuild@vger.kernel.org
Subject: [PATCH v2 05/10] ARM: dts: ls1021a: add TQMLS1021A/MBLS102xA HDMI overlay
Date: Fri, 20 Jan 2023 14:34:50 +0100
Message-Id: <20230120133455.3962413-6-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230120133455.3962413-1-alexander.stein@ew.tq-group.com>
References: <20230120133455.3962413-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree overlay for HDMI usage.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* None

 arch/arm/boot/dts/Makefile                    |  2 ++
 .../ls1021a-tqmls1021a-mbls1021a-hdmi.dtso    | 36 +++++++++++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 arch/arm/boot/dts/ls1021a-tqmls1021a-mbls1021a-hdmi.dtso

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index e6943dc73a3fd..d5105e8179431 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -806,8 +806,10 @@ dtb-$(CONFIG_SOC_LS1021A) += \
 	ls1021a-tsn.dtb \
 	ls1021a-twr.dtb
 
+ls1021a-tqmls1021a-mbls1021a-hdmi-dtbs := ls1021a-tqmls1021a-mbls1021a.dtb ls1021a-tqmls1021a-mbls1021a-hdmi.dtbo
 ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33-dtbs := ls1021a-tqmls1021a-mbls1021a.dtb ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtbo
 
+dtb-$(CONFIG_SOC_LS1021A) += ls1021a-tqmls1021a-mbls1021a-hdmi.dtb
 dtb-$(CONFIG_SOC_LS1021A) += ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtb
 
 dtb-$(CONFIG_SOC_VF610) += \
diff --git a/arch/arm/boot/dts/ls1021a-tqmls1021a-mbls1021a-hdmi.dtso b/arch/arm/boot/dts/ls1021a-tqmls1021a-mbls1021a-hdmi.dtso
new file mode 100644
index 0000000000000..f5ca22643c08e
--- /dev/null
+++ b/arch/arm/boot/dts/ls1021a-tqmls1021a-mbls1021a-hdmi.dtso
@@ -0,0 +1,36 @@
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
+&dcu {
+	status = "okay";
+
+	port {
+		dcu_out: endpoint {
+			remote-endpoint = <&sii9022a_in>;
+		};
+	};
+};
+
+&hdmi_out {
+	status = "okay";
+};
+
+&sii9022a {
+	status = "okay";
+
+	ports {
+		port@0 {
+			sii9022a_in: endpoint {
+				remote-endpoint = <&dcu_out>;
+			};
+		};
+	};
+};
-- 
2.34.1

