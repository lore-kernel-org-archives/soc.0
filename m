Return-Path: <SRS0=tGbD=PM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB396C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Oct 2021 08:48:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84E3560F57
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Oct 2021 08:48:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 84E3560F57
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=z3ntu.xyz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=z3oz+yKQi/Iao+qT8AVb1BBhz7lGIDRxl1QT5WlgiS4=; b=0f2TcDgNZx3HXr
	98t6yTHPHN3b4LpZ+BqZxFp/Bm3TQqnbMLCtlabklfIN59VO0yKqF8x8Ad6cY9WU2FawwjQSvN/24
	WI6NzUwou4xbrFEnyvfpGquqh3h5EzqPYPZnAS9ieu8E9+E7OXc6jj7XQF+wzGMlU+EmM1y57VwAz
	frG6ZmnaQpTNbNGKnXkG8SLljrlZ4mueX1aOm9zeJ+bJQ1uY34iAloGatBWk638neQTQ8IwLWk8Aw
	017eeaTfCyAaraASrPgsppPOfzV/mJYvDjk23JoMhHrGwHrTYd8zRpEId8Y++puO67eb8xbLo+Yqq
	3tjk+p7rOrr6sudecP2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1meZ95-00Dnvh-H6; Sun, 24 Oct 2021 08:46:23 +0000
Received: from mail.z3ntu.xyz ([128.199.32.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1meZ8z-00Dnum-Lw; Sun, 24 Oct 2021 08:46:19 +0000
Received: from localhost.localdomain (ip-213-127-63-241.ip.prioritytelecom.net
 [213.127.63.241])
 by mail.z3ntu.xyz (Postfix) with ESMTPSA id 20B91C6C78;
 Sun, 24 Oct 2021 08:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
 t=1635065172; bh=MNGJb5x5e9bvi6TMYXpldSbHD+QFVn7vCYvD1jNOx5g=;
 h=From:To:Cc:Subject:Date;
 b=ZFpGK+m/ztWbYs29/omZeQw80VQNdOgfuyQJl4AqCJN+wG0CbLP0ULFVtYqLFnlw/
 hXbbJZoyzgL/mbDKEMvAXbYf0HoFizw8QUiJsoLev500RU8V7weB/9wwJ0HtZi1duP
 K1zu+G+WuMg5pFK/lQhWMK0HaiR2cdIhE8w3Jlug=
From: Luca Weiss <luca@z3ntu.xyz>
To: linux-mediatek@lists.infradead.org
List-Id: <soc.lore.kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, Luca Weiss <luca@z3ntu.xyz>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm: dts: mt6589: Add device tree for Fairphone 1
Date: Sun, 24 Oct 2021 10:45:35 +0200
Message-ID: <20211024084535.30959-1-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211024_014617_898804_079FC73A 
X-CRM114-Status: GOOD (  17.01  )
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
Message-ID: <20211024084535.baH6SeaYfJWcYatsrFeG56thKQctNipFXbo7c9GmrBM@z>

Add rudimentary support for the Fairphone 1, based on MT6589 to boot to
UART console.

The recently added SMP support needs to be disabled for this board as
the kernel panics executing /init with it, even though the CPUs seem to
start up fine - maybe a stability issue.

[    0.072010] smp: Bringing up secondary CPUs ...
[    0.131888] CPU1: thread -1, cpu 1, socket 0, mpidr 80000001
[    0.191889] CPU2: thread -1, cpu 2, socket 0, mpidr 80000002
[    0.251890] CPU3: thread -1, cpu 3, socket 0, mpidr 80000003
[    0.251982] smp: Brought up 1 node, 4 CPUs
[    0.254745] SMP: Total of 4 processors activated (7982.28 BogoMIPS).
[    0.255582] CPU: All CPU(s) started in SVC mode.

[    0.472039] Run /init as init process
[    0.473317] Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000004

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 arch/arm/boot/dts/Makefile                 |  1 +
 arch/arm/boot/dts/mt6589-fairphone-fp1.dts | 30 ++++++++++++++++++++++
 arch/arm/boot/dts/mt6589.dtsi              |  2 +-
 3 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/mt6589-fairphone-fp1.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 7e0934180724..24f402db2613 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1437,6 +1437,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += \
 	mt2701-evb.dtb \
 	mt6580-evbp1.dtb \
 	mt6589-aquaris5.dtb \
+	mt6589-fairphone-fp1.dtb \
 	mt6592-evb.dtb \
 	mt7623a-rfb-emmc.dtb \
 	mt7623a-rfb-nand.dtb \
diff --git a/arch/arm/boot/dts/mt6589-fairphone-fp1.dts b/arch/arm/boot/dts/mt6589-fairphone-fp1.dts
new file mode 100644
index 000000000000..c952347981de
--- /dev/null
+++ b/arch/arm/boot/dts/mt6589-fairphone-fp1.dts
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2021, Luca Weiss <luca@z3ntu.xyz>
+ */
+
+/dts-v1/;
+#include "mt6589.dtsi"
+
+/ {
+	model = "Fairphone 1";
+	compatible = "fairphone,fp1", "mediatek,mt6589";
+
+	chosen {
+		stdout-path = &uart3;
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x40000000>;
+	};
+};
+
+&cpus {
+	/* SMP is not stable on this board, makes the kernel panic */
+	/delete-property/ enable-method;
+};
+
+&uart3 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/mt6589.dtsi b/arch/arm/boot/dts/mt6589.dtsi
index 70df00a7bb26..c6babc8ad2ba 100644
--- a/arch/arm/boot/dts/mt6589.dtsi
+++ b/arch/arm/boot/dts/mt6589.dtsi
@@ -14,7 +14,7 @@ / {
 	compatible = "mediatek,mt6589";
 	interrupt-parent = <&sysirq>;
 
-	cpus {
+	cpus: cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		enable-method = "mediatek,mt6589-smp";
-- 
2.33.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
