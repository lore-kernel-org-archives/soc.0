Return-Path: <SRS0=xXpd=OZ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6088FC433F5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Oct 2021 20:31:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3477860F44
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Oct 2021 20:31:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3477860F44
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=z3ntu.xyz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e9gaBWinv+OcZAJReVN9G2dvK6k+6kTLOLtNtoJ+dtc=; b=Z4jGljwm/GrSCp
	ohiahjUz+0FZ+7foj/EtCVeVGLpl4F3fR+mBq3QOhXg3+WoGxvRAP9WRtRE9O5VShgBPMBSbzK+Vs
	w4Q+BUpg4uhrrJcu+ZIrXk04s+sZSHoYAQsre6SxEEuCjotoqkBsP3SWlj9fR2wTb4WnR69BH/ic9
	bLUfeCoqnlkDFOgW7ezdsF90xi+pLOj+zzziHKMLbYAe3QTwOuI9nI1IBlaBcR1JRdBZ4k2jKNoOv
	tEaxdTiTvpIWhyTGdkums+5LSvwHp43hajNXwWByYgXTQ936LVH7SLlD1qukxpLl8ZfqxwLGyGYzt
	lwnzuP911PAXmCnQ7Gfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXr4E-00BpUF-VC; Tue, 05 Oct 2021 20:29:39 +0000
Received: from mail.z3ntu.xyz ([128.199.32.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXr3y-00BpO6-Vf; Tue, 05 Oct 2021 20:29:24 +0000
Received: from localhost.localdomain (ip-213-127-63-121.ip.prioritytelecom.net
 [213.127.63.121])
 by mail.z3ntu.xyz (Postfix) with ESMTPSA id 86371C9169;
 Tue,  5 Oct 2021 20:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
 t=1633465759; bh=caiZgo8/843g5GxiEcUJXyvFHNkUlh+M/VUHezDs/U0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=sK8ycAW1lzqo8789qgSWNTfbDXo0yMpkDtlxfrLloMHJi0CasZYUw7jDIXqr1i8G+
 oFxb4zncyeWOD7O+l+JoFzNJGhYXmsxY1gFIjOV+CwTE5bnmnT+x9QMSkKB619qAPN
 1aBzkZm8E7VDQ55u07pF8blp6JZl4poROxKFarps=
From: Luca Weiss <luca@z3ntu.xyz>
To: linux-mediatek@lists.infradead.org
List-Id: <soc.lore.kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, Arnd Bergmann <arnd@arndb.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Fabien Parent <fparent@baylibre.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Luca Weiss <luca@z3ntu.xyz>, Matthias Brugger <matthias.bgg@gmail.com>,
 Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>,
 Sean Wang <sean.wang@mediatek.com>, Seiya Wang <seiya.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, soc@kernel.org
Subject: [PATCH 2/2] arm: dts: mt6589: Add device tree for Fairphone 1
Date: Tue,  5 Oct 2021 22:28:31 +0200
Message-ID: <20211005202833.96526-2-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211005202833.96526-1-luca@z3ntu.xyz>
References: <20211005202833.96526-1-luca@z3ntu.xyz>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211005_132923_188502_5003C7DD 
X-CRM114-Status: GOOD (  17.42  )
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
Message-ID: <20211005202831.DBLSwKnDS4sS6dhRmRu1LJBi-dR1B82tKAV37Jvp2Aw@z>

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
 2 files changed, 31 insertions(+)
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
index 000000000000..32c14ecf2244
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
+	cpus {
+		/* SMP is not stable on this board, makes the kernel panic */
+		/delete-property/ enable-method;
+	};
+
+	memory {
+		device_type = "memory";
+		reg = <0x80000000 0x40000000>;
+	};
+};
+
+&uart3 {
+	status = "okay";
+};
-- 
2.33.0


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
