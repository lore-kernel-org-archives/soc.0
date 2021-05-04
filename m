Return-Path: <SRS0=y0KU=J7=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12071C433B4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 May 2021 19:38:10 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F741613C7
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 May 2021 19:38:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F741613C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6CP527Xz/e+0Ebc+WIw3Ebfm3PdOknFtfofPdQfLpbQ=; b=oVtSx2SF2qMq2V/AYHzrprhwG
	VAONYv8nMP6D9yOvQQLPFFYLPLZG4dxIHU7ge7RTvBtcLzLqTrpLrmiJYPPn0xb+c22kgqfDzoYi0
	dfhZ6Z7c0hwb16LPiA9Oqg8x7BmBRwNk1SXy+dSQtRx1N88Nz4TAiTtDfG7DSdd3ruLmEn1ABDl1A
	Yt/heVVlUAkEz6HIPAg8qNM1HIu8A5Y5fGiato80Go35M4vztwrixJGYu4PzM38Myc8wMwYCDmuae
	/QGUAX8UrbD2c/Lejd1NGRur07ZJDYrB9QPD2cSjPd6KPrD3Dmlm+5Qe6OdfOCFqr5SUBs0mO45kp
	u7AKklkAg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1le0q2-00GuIE-NB; Tue, 04 May 2021 19:36:12 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1le0p7-00Gu9c-FY
 for linux-arm-kernel@desiato.infradead.org; Tue, 04 May 2021 19:35:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=OUE6T8d/N4f3Mv0jX1DZW932G/DmWRKc7vhygQ2jwlM=; b=0uSO9/qA3ucs7joS8S6IiHih+T
 uyiiEvcIa069YIE/leXniESoqpYfJ/LiQK+BKI4SUMtQ8OsfLRi3YbPhX6qmw5lucoukRC7Vc3Rrw
 06hJCWJoIlsislMtcl7Dnb7gH8bg+HNaGwWxROuPEUCN2jWcGpUDeRxjslvjoXOPJj/S/WYdPNr5j
 eJgqMBOyg5ugCPDjLPGcP4xcZ7aBBMnn3L/C7uOuqilOdeE/8AUn08+xJ013ub0L57Tjlwu//VRhR
 cduZgKCzApa/39ReKXvqwQhXV06Fs3+L8zbV51gSH0e9+crxv55iQ/UkcBSR5EOZVMuMWhbFya8qG
 r5z4clkg==;
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1le0p4-004DmU-LH
 for linux-arm-kernel@lists.infradead.org; Tue, 04 May 2021 19:35:12 +0000
Received: by mail-wr1-x42f.google.com with SMTP id h4so10600438wrt.12
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 04 May 2021 12:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OUE6T8d/N4f3Mv0jX1DZW932G/DmWRKc7vhygQ2jwlM=;
 b=iY+VQNDWOqV/CG0cFNr9CjtsFJKTTbCm/lkfOwHdVMCGDyal0uZ2C50CTS43njVgTz
 OnOVf/G0AOan8QKQdzXf4eiQbi4MwhQayhKyfYUKV3vzFALPV3HQFcP5zfa0UYE58kgW
 b5RtPat4w1Sb/6LGKFS7o9zYw4SKH0OjDoU8mGUva0X3eh2KOutn3cS2aS2jSZw8gOhw
 Y8gFyh+2JkGDKYGsSoRAbegD6y1CvVaym3vVi+Z3WjBSyuvlfkO2bgQcnMac/Rue+jm0
 S3BZNYVA5+pBIOM5uoredT4nnMp3r7vMIp/VsAnvoH5JUg47Nd5/i3j6fhOQZ63Yeae4
 /7UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OUE6T8d/N4f3Mv0jX1DZW932G/DmWRKc7vhygQ2jwlM=;
 b=e88Wl66pZqcO3T32eOe7NS51e7eCDpWm/oyY76o0X8k/C5EwN4DIAPsNUXAD9GoyLO
 2IBUHtdy83fOhO7xBGhGLcr9MfM13clJ5i8msXfaubOD8TjQaUU3PHI1GUNwLlok7ZKX
 NQFbmNicus3kF1lDP8AoOuNzQ+je7isuL8w/zcPTJfudS9f8kkoTJJx5FqLSFapYn9VT
 bEb+JQmEFo+xIssFWbkPLtks7WA4wNoj2uyhkBbN46uuJ7k7QLrwD23vY2RXyPagxdiL
 YvEfW1RPa+SFYrabscgctjUtmQexTntHniAdO0g74FfxfsZZ5hr9qXX2F8sbSrfPCD2L
 GUnQ==
X-Gm-Message-State: AOAM531pRsDWuSOZHbNGU0wrvOlBqdcpvkKeVjRYE0XY9UVSa7+phJfp
 vFYa90DWi8ZGA+2CfQ0uQqlekg==
X-Google-Smtp-Source: ABdhPJyTc2cvByzqBL/z0VWYE9grFLrwGOUQgAq6tWjFmTXdEdBZNW+9YhAcr6eeRxF8kc5ORG5rEQ==
X-Received: by 2002:a5d:5741:: with SMTP id q1mr33553742wrw.212.1620156908233; 
 Tue, 04 May 2021 12:35:08 -0700 (PDT)
Received: from localhost.localdomain
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id x8sm17072136wru.70.2021.05.04.12.35.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 12:35:07 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: arnd@arndb.de, kaloz@openwrt.org, khalasa@piap.pl, linusw@kernel.org,
 linux@armlinux.org.uk, olof@lixom.net, robh+dt@kernel.org, soc@kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 5/5] ARM: dts: add intel-ixp42x-welltech-epbx100
Date: Tue,  4 May 2021 19:34:57 +0000
Message-ID: <20210504193457.4008384-6-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210504193457.4008384-1-clabbe@baylibre.com>
References: <20210504193457.4008384-1-clabbe@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210504_123510_754519_5F451ADD 
X-CRM114-Status: GOOD (  16.27  )
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
Message-ID: <20210504193457.bhlW4420zPBU03JbLdyZm6Gk7ptAGdSogvDmD2PVHEU@z>

This patch adds devicetree for intel-ixp42x-welltech-epbx100.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 arch/arm/boot/dts/Makefile                    |  1 +
 .../dts/intel-ixp42x-welltech-epbx100.dts     | 76 +++++++++++++++++++
 2 files changed, 77 insertions(+)
 create mode 100644 arch/arm/boot/dts/intel-ixp42x-welltech-epbx100.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 1580313eb372..7d0c94b9108d 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -242,6 +242,7 @@ dtb-$(CONFIG_ARCH_INTEGRATOR) += \
 	integratorcp.dtb
 dtb-$(CONFIG_ARCH_IXP4XX) += \
 	intel-ixp42x-linksys-nslu2.dtb \
+	intel-ixp42x-welltech-epbx100.dtb \
 	intel-ixp43x-gateworks-gw2358.dtb
 dtb-$(CONFIG_ARCH_KEYSTONE) += \
 	keystone-k2hk-evm.dtb \
diff --git a/arch/arm/boot/dts/intel-ixp42x-welltech-epbx100.dts b/arch/arm/boot/dts/intel-ixp42x-welltech-epbx100.dts
new file mode 100644
index 000000000000..84158503be2a
--- /dev/null
+++ b/arch/arm/boot/dts/intel-ixp42x-welltech-epbx100.dts
@@ -0,0 +1,76 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2021 Corentin Labbe <clabbe@baylibre.com>
+ */
+
+/dts-v1/;
+
+#include "intel-ixp42x.dtsi"
+
+/ {
+	model = "Welltech EPBX100";
+	compatible = "welltech,epbx100", "intel,ixp42x";
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	memory@0 {
+		/* 64 MB SDRAM */
+		device_type = "memory";
+		reg = <0x00000000 0x4000000>;
+	};
+
+	chosen {
+		bootargs = "console=ttyS0,115200n8 root=/dev/ram0 initrd=0x00800000,9M";
+		stdout-path = "uart0:115200n8";
+	};
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	flash@50000000 {
+		compatible = "intel,ixp4xx-flash", "cfi-flash";
+		bank-width = <2>;
+		/*
+		 * 16 MB of Flash
+		 */
+		reg = <0x50000000 0x1000000>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "RedBoot";
+				reg = <0x00000000 0x00080000>;
+				read-only;
+			};
+			partition@80000 {
+				label = "zImage";
+				reg = <0x00080000 0x00100000>;
+				read-only;
+			};
+			partition@180000 {
+				label = "ramdisk";
+				reg = <0x00180000 0x00300000>;
+				read-only;
+			};
+			partition@480000 {
+				label = "User";
+				reg = <0x00480000 0x00b60000>;
+				read-only;
+			};
+			partition@fe0000 {
+				label = "FIS directory";
+				reg = <0x00fe0000 0x001f000>;
+				read-only;
+			};
+			partition@fff000 {
+				label = "RedBoot config";
+				reg = <0x00fff000 0x0001000>;
+				read-only;
+			};
+		};
+	};
+};
-- 
2.26.3


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
