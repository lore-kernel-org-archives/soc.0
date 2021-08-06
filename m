Return-Path: <SRS0=HLeY=M5=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10DC2C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Aug 2021 20:47:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B95986105A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Aug 2021 20:47:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B95986105A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tvyMAp2iZTdr/payNLw8lckY4nIy88037cH6mcKsVjE=; b=F1V1jYxps54I9b
	GYN4svHWF8sGOXON8Hn7bazw8UeQrrvKXLm1EPTwnuPWLMSZptbSvlgj/XMUjv4Ib0E5JL/vTznr2
	Q93TfFkAwkfMT9oU5DpWtHHjxlAZBEpbPL5d8GYQALhDHInhavjuLe1mPZRPCcrzpzrsQd1mBCNkG
	3r1nfMHl+z5MseSZo41/5QMpX2218V3eBcFsPtKbKfbjMt+Wtkc9wsbJJTmLEXF34nh0xRUbd81KI
	WhkEJvhTz0e6FvOUPASZUg648tyyW4nr+x/JMQysUtL1fOwZhhpQAC3NiT33i9Guf8toxEtrj+iiu
	kK/PNOoIcKBr9b05xXmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mC6iM-00DWj6-JB; Fri, 06 Aug 2021 20:45:10 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mC6iI-00DWhz-BC
 for linux-arm-kernel@lists.infradead.org; Fri, 06 Aug 2021 20:45:07 +0000
Received: by mail-wr1-x42d.google.com with SMTP id k4so12622203wrc.0
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 06 Aug 2021 13:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4aoqpuygPFTPpZbPvJjLMKEd6jtzvkdTL12kqRjIbbc=;
 b=JIxB7o2KF77Eczxpr0Nqtu9dF1oEsUUzcp0JF0Vj8WJt8h+Y0q0JPjdJ5K0LduYyOW
 IQJs5IEHpTMgmBuyGcPd8UHX6XtgWv0plCu4zpnc0ysbnf/2j4/vV+xEb/nZmDEB4/MZ
 bwM2El85v2S+bSiKP7DmniWSqkawfRwzazT3hoYKCRX54pqgpWsPP7LPT7cV/+yUjR3D
 Yh+RaEYgVPKLyHnIllws1pwgfsj35TrklOuGuDU89V1U0pSKpk+2RrToItIuqCa8Acqg
 S5EConHaZXhgfF8Nijg/MiSOS+g1Sdrryu8d+l80/VJGuVm+qysjzngwTO5cphhob6Y+
 Wv9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4aoqpuygPFTPpZbPvJjLMKEd6jtzvkdTL12kqRjIbbc=;
 b=Kidvv78yGLpgeGY8wS38YdGwfE3WW2UZrmvr/MKEf6DSAxkuUPkVNUz/YTN9/TU7nT
 t1RSp5NeIJVJYQuoATH4OyJnjiEukXZyvNPpz1P0ldMYgPRFV0oB5LwxkCQy3xbz6QdQ
 GVd1wGoJ2IzHGOjkwdigFBGNFG6PjmL8rfb6EBqna6Zjhz5t50lKSA7IeP/UW6AUbaAe
 4td+dQn4xbtWly8/LCBihT+B/YtRjpruCmWieraB8aDDeI5fyraii3bfpOlz1nQYOo0C
 EkuYy5peJbZtqktw+/syyPpAJwHVdplvn+Q/Iq/il9sCW/Y4mNzIE+++j8ZUnItesdUc
 8IQg==
X-Gm-Message-State: AOAM532WS6X6ayRy2qro11WMSsWNAxfYHUsn+3KL1Qo43hWvjnfWJe6A
 8EeYfJKxqZ0d+qtXgWJMChP1CvuUro8=
X-Google-Smtp-Source: ABdhPJxAObjD6fRA0SogD6Ki/nBvjD1RavORpv9+x4gri+QQeAV9kMShSoEBNrcfnioVz7Fnt6nh1A==
X-Received: by 2002:a5d:6908:: with SMTP id t8mr12723792wru.421.1628282703887; 
 Fri, 06 Aug 2021 13:45:03 -0700 (PDT)
Received: from cluster5 ([80.76.206.81])
 by smtp.gmail.com with ESMTPSA id u23sm12844445wmc.24.2021.08.06.13.45.03
 (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
 Fri, 06 Aug 2021 13:45:03 -0700 (PDT)
From: Matthew Hagan <mnhagan88@gmail.com>
To: 
List-Id: <soc.lore.kernel.org>
Cc: Vladimir Oltean <olteanv@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Matthew Hagan <mnhagan88@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Krzysztof Kozlowski <krzk@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 1/5] ARM: dts: NSP: Add common bindings for MX64/MX65
Date: Fri,  6 Aug 2021 21:44:32 +0100
Message-ID: <20210806204446.2981299-2-mnhagan88@gmail.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210806204446.2981299-1-mnhagan88@gmail.com>
References: <20210806204446.2981299-1-mnhagan88@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210806_134506_442696_35E31100 
X-CRM114-Status: GOOD (  14.96  )
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
Message-ID: <20210806204432.GfZMKUNabtUOInVA2HuCiiaycdAffwiiQv0HrYQS7kk@z>

These bindings are required for all Meraki MX64/MX65 devices. These
common bindings include memory (2GB), PWM LEDs, AMAC, I2C (AT24), NAND
partitions, EHCI, OHCI and pinctrl.

Signed-off-by: Matthew Hagan <mnhagan88@gmail.com>
---
 .../dts/bcm958625-meraki-mx6x-common.dtsi     | 129 ++++++++++++++++++
 1 file changed, 129 insertions(+)
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-mx6x-common.dtsi

diff --git a/arch/arm/boot/dts/bcm958625-meraki-mx6x-common.dtsi b/arch/arm/boot/dts/bcm958625-meraki-mx6x-common.dtsi
new file mode 100644
index 000000000000..bcdd38954f1d
--- /dev/null
+++ b/arch/arm/boot/dts/bcm958625-meraki-mx6x-common.dtsi
@@ -0,0 +1,129 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Common Bindings for Cisco Meraki MX64 (Kingpin) and MX65 (Alamo) devices.
+ *
+ * Copyright (C) 2020-2021 Matthew Hagan <mnhagan88@gmail.com>
+ */
+
+#include "bcm-nsp.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+
+/ {
+	pwm-leds {
+		compatible = "pwm-leds";
+
+		led-1 {
+			function = LED_FUNCTION_INDICATOR;
+			color = <LED_COLOR_ID_RED>;
+			pwms = <&pwm 1 50000>;
+			max-brightness = <255>;
+		};
+
+		led-2 {
+			function = LED_FUNCTION_INDICATOR;
+			color = <LED_COLOR_ID_GREEN>;
+			pwms = <&pwm 2 50000>;
+			max-brightness = <255>;
+		};
+
+		led-3 {
+			function = LED_FUNCTION_INDICATOR;
+			color = <LED_COLOR_ID_BLUE>;
+			pwms = <&pwm 3 50000>;
+			max-brightness = <255>;
+		};
+	};
+};
+
+&amac2 {
+	status = "okay";
+};
+
+&ehci0 {
+	status = "okay";
+};
+
+&i2c0 {
+	status = "okay";
+
+	at24@50 {
+		compatible = "atmel,24c64";
+		reg = <0x50>;
+		pagesize = <32>;
+		read-only;
+	};
+};
+
+&nand_controller {
+	nand@0 {
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
+			label = "nvram";
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
+&ohci0 {
+	status = "okay";
+};
+
+&pinctrl {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pwm_leds>;
+
+	pwm_leds: pwm_leds {
+		function = "pwm";
+		groups = "pwm1_grp", "pwm2_grp", "pwm3_grp";
+	};
+};
+
+&pwm {
+	status = "okay";
+	#pwm-cells = <2>;
+};
+
+&uart0 {
+	clock-frequency = <62500000>;
+	status = "okay";
+};
-- 
2.26.3


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
