Return-Path: <SRS0=gFkl=LE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FF7FC48BD1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jun 2021 23:32:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4335261182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jun 2021 23:32:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4335261182
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sWNvZuwXqi19NCpGoNRk2LnfCLF1gn8Ai5ve9ovFL6s=; b=yfEnWgdmH2gKD4
	hFmj24SU2Ag7WC3Quur94wx/3MOhgH9iG5jIeKUJn+xCsPlvdmWS66Ui0+aLloub8YORYXYAuWnAs
	qnm29CXHTeqi8L+7y2fzrJFIpZJv3MP/XfTg/BN2NPqtvnllwboFE398jQ5MBBxLTW3epK+yMAWG9
	II09FBlpbXjvBYUV0snfrYZk358wXGhyNSmx6G3vy1fQ0lGkB8ZUWLAA6L2OBIuhS7+66awny6T0G
	pvL7fKu/K6qJLWeM4Sx0Ne+X4v3CIMq04IZhkZZcpEIZrcNHPInO8U5Bdwnj5pbpaAkeAmM/7wBlu
	/Y5ahK83kwkPDRqQJBPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrU7c-002tYg-Gt; Thu, 10 Jun 2021 23:30:02 +0000
Received: from mail-wm1-f42.google.com ([209.85.128.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrU7R-002tUk-LJ
 for linux-arm-kernel@lists.infradead.org; Thu, 10 Jun 2021 23:29:51 +0000
Received: by mail-wm1-f42.google.com with SMTP id f17so7088151wmf.2
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 10 Jun 2021 16:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SyK9z77KPeuihLjFv6CL15mYQ8zBPJwgwgxafmnnN4I=;
 b=GtV8tYpbysk23WR8WYdoLRG0IuES2TyMPeFoyWMZhkihp+JDhGcRInM9PnfPDcdpVQ
 aIpYR9KtjmTYavCP1G0mYCwQNOSnXgzC+CpyPzkMDY/mkOOSLZuwBUYrOQAvxs1du7JU
 VZqlBMNqfE4e72fBODuNlyri4cFqkOD0fiFOPUd/Sm5ophgBP04JPCTO06Rk5II0i3Tg
 Fhc08Q8mjfUU/syBEhN9UU8EnWZ3Ygzy8NRyJQPUhvDobOfUiHpquFAyYV/I4sJpAclT
 9SyPjRtK83/oV0pkJ9jcL2cXFpSEKokcGsBtYZTgnVNP8m5C1IdQQQyEF3d7mZJ2z1qT
 auEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SyK9z77KPeuihLjFv6CL15mYQ8zBPJwgwgxafmnnN4I=;
 b=aGMcu9+aytvBFEKg/k01Kt/NCmaNBOnGEG5aaTCg2rrt+RyZ+ouUtP/zebPZwtp2vj
 YOd9qkor8vUPf7ftvRSOfIwq5VfEs/U/vNevVQYcECdpJQX8dMKzsSk+gJkeL1Ztg39r
 P30HVNRS83xKrBIfoV/9G8pL38WzCMLSX8g7fMNR5oPtEtcd18N6iL15B2VlgXOImX8b
 vanYqol4w5vQbV02dxpqxPh9XhDF/HfdYt35bEz2DN33JX8aeG7KF+ylri0yyH3FEDJQ
 mXWs8uGeXuZId6wzaA1coTCHpff8Idib/payisg5TCNZIQDSK5Qtt9CHe7+5qeNXvbYO
 5cKA==
X-Gm-Message-State: AOAM532UM5ORhTAHSoN8mWWFk2A1G2LzJSd9RL2R4m5ttxyZIZOM22pA
 PEjxds/PNwKs1Og2wfQixImvkber4nc=
X-Google-Smtp-Source: ABdhPJxReN3yGxJyKbpYbQ91cIEM+68PrNx6S/fpAPT7jFhtMq+7YBxVgjndmP7se65wYIpXEAAaBQ==
X-Received: by 2002:a05:600c:4f94:: with SMTP id
 n20mr17396630wmq.121.1623367727547; 
 Thu, 10 Jun 2021 16:28:47 -0700 (PDT)
Received: from cluster5 ([80.76.206.81])
 by smtp.gmail.com with ESMTPSA id g186sm4324045wme.6.2021.06.10.16.28.46
 (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
 Thu, 10 Jun 2021 16:28:47 -0700 (PDT)
From: Matthew Hagan <mnhagan88@gmail.com>
To: 
List-Id: <soc.lore.kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Matthew Hagan <mnhagan88@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Sam Ravnborg <sam@ravnborg.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Viresh Kumar <viresh.kumar@linaro.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 3/5] ARM: dts: NSP: Add common bindings for MX64/MX65
Date: Fri, 11 Jun 2021 00:27:15 +0100
Message-ID: <20210610232727.1383117-4-mnhagan88@gmail.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210610232727.1383117-1-mnhagan88@gmail.com>
References: <20210610232727.1383117-1-mnhagan88@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_162949_740221_4F83AB51 
X-CRM114-Status: GOOD (  15.24  )
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
Message-ID: <20210610232715.BmO6oIotig9iw5_dthnQ-TGHRS9Cjf-ZZ9HkfLpiNSc@z>

These bindings are required for all Meraki MX64/MX65 devices.

Signed-off-by: Matthew Hagan <mnhagan88@gmail.com>
---
 .../dts/bcm958625-meraki-mx6x-common.dtsi     | 148 ++++++++++++++++++
 1 file changed, 148 insertions(+)
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-mx6x-common.dtsi

diff --git a/arch/arm/boot/dts/bcm958625-meraki-mx6x-common.dtsi b/arch/arm/boot/dts/bcm958625-meraki-mx6x-common.dtsi
new file mode 100644
index 000000000000..47a30dedf7b3
--- /dev/null
+++ b/arch/arm/boot/dts/bcm958625-meraki-mx6x-common.dtsi
@@ -0,0 +1,148 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Common Bindings for Cisco Meraki MX64 (Kingpin) and MX65 (Alamo) devices.
+ *
+ * Copyright (C) 2021 Matthew Hagan <mnhagan88@gmail.com>
+ */
+
+#include "bcm-nsp.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory {
+		device_type = "memory";
+		reg = <0x60000000 0x80000000>;
+	};
+
+	pwm-leds {
+		compatible = "pwm-leds";
+
+		red {
+			label = "red:led";
+			pwms = <&pwm 1 50000>;
+		};
+
+		green {
+			label = "green:led";
+			pwms = <&pwm 2 50000>;
+		};
+
+		blue {
+			label = "blue:led";
+			pwms = <&pwm 3 50000>;
+		};
+	};
+};
+
+&L2 {
+	arm,io-coherent;
+	prefetch-data = <1>;
+	prefetch-instr = <1>;
+};
+
+&uart0 {
+	clock-frequency = <62500000>;
+	status = "okay";
+};
+
+&i2c0 {
+	status = "okay";
+	at24@50 {
+		compatible = "atmel,24c64";
+		pagesize = <32>;
+		reg = <0x50>;
+	};
+};
+
+&amac2 {
+	status = "okay";
+};
+
+&nand {
+	nandcs@0 {
+		compatible = "brcm,nandcs";
+		reg = <0>;
+		nand-on-flash-bbt;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		nand-ecc-strength = <24>;
+		nand-ecc-step-size = <1024>;
+
+		brcm,nand-oob-sector-size = <27>;
+
+		partition@0 {
+			label = "u-boot";
+			reg = <0x0 0x80000>;
+			read-only;
+		};
+
+		partition@80000 {
+			label = "shmoo";
+			reg = <0x80000 0x80000>;
+			read-only;
+		};
+
+		partition@100000 {
+			label = "bootkernel1";
+			reg = <0x100000 0x300000>;
+		};
+
+		partition@400000 {
+			label = "senao_nvram";
+			reg = <0x400000 0x100000>;
+		};
+
+		partition@500000 {
+			label = "bootkernel2";
+			reg = <0x500000 0x300000>;
+		};
+
+		partition@800000 {
+			label = "ubi";
+			reg = <0x800000 0x3f700000>;
+		};
+	};
+};
+
+&qspi {
+	status = "disabled";
+};
+
+&ehci0 {
+	status = "okay";
+};
+
+&ohci0 {
+	status = "okay";
+};
+
+&pwm {
+	status = "okay";
+	#pwm-cells = <2>;
+	chan0 {
+		channel = <1>;
+		active_low = <1>;
+		};
+	chan1 {
+		channel = <2>;
+		active_low = <1>;
+	};
+	chan2 {
+		channel = <3>;
+		active_low = <1>;
+	};
+};
+
+&ccbtimer1 {
+	status = "disabled";
+};
+
+&sata_phy {
+	status = "disabled";
+};
-- 
2.26.3


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
