Return-Path: <SRS0=r2Hb=FF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC676C64E7B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Dec 2020 13:45:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 354E920770
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Dec 2020 13:45:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lUw6Vge4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="f/2IpXak"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 354E920770
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UgEtie4aHL48mw9nXAp4bZCCvSgwptHQZJnvan9ZVtg=; b=lUw6Vge4kksPm6r6z9jaJp5p6
	sL4DZdcuW6Tn7AAv1ZVoIju5aTH+a5TczPTS1jRwhN5XXK+yONhE4H1p3iuo6JR/K4LbIdaO88ntJ
	VyDTp5VetS8rccJcC0W8fl3q1PVSE0UUEHQ8xtdyfKKdd//Aqlz4T2GKXPaH62csojZ4m3MTgRrsA
	AzmWROsnyjUwVpc8/Huh+eii6I+RdG3IhQnRMrGmg9DnTvjLujFJisTyPBbKg/IjeFASGjFFYHd1P
	4mtqeYOnb3E/0omoTVlcub5LbYhUYgF9iZwGzwrueDW68Fxq8xohFpNzWUQZiLqB6M2MpgpveoJ87
	J8Ngy6Q3w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kk5ws-00073B-Kd; Tue, 01 Dec 2020 13:44:06 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kk5wl-00070Q-St
 for linux-arm-kernel@lists.infradead.org; Tue, 01 Dec 2020 13:44:00 +0000
Received: by mail-pl1-x644.google.com with SMTP id x4so1147137pln.8
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 01 Dec 2020 05:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nZs3cd4haoA+TDqA6POpYN8YC7m6XfHT6GH0HjPmBjM=;
 b=f/2IpXakdLzHmPBxF37xXRsHxu3TP7ceBiybQPbSxCHdq/+YZHfI4Pf00ORWxGOiqp
 Is9Kyvb3TV2BBX7H43WL0S+TeanOTIv6tlKJtOR5EwwfO50rjF5lUlwYAhLknKSxgH4s
 4GQSPSEFK6eYi+B9KWj3sJm3GwqQA7eMt3/5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nZs3cd4haoA+TDqA6POpYN8YC7m6XfHT6GH0HjPmBjM=;
 b=T6Ci7ez1rWpqipmGOC74gHHHYgCOgnDCg3UMSJRSKLJ3/epN2IpZwV3irEzPiNo2Dk
 ZvI4wR8uvioR2IbZOSk5j1nIMZklGLY/eNuO7//rB1OxWrar7xWKe2QyWZSozEawTy9E
 Zm2CDFSqyBsvKwgs1TjCya9CTOUO2S6R4iPdXxXkctg0CPs2Rs2GE/NPK9nP4b+i6IOU
 8X+UZUqJVUxV/YuxEZsWtRSx1flIUS1pDzDh54JidJDGFmGuiVR9D6OPxrFvpRcv+4LS
 HNO2Q/x6yEZJy5rTyJsbXmhH/3zavjiyZYaPLMT3+o8cbeZIEbYE5drlqQ8SrXvJoyPX
 vp2g==
X-Gm-Message-State: AOAM533ALSCaefJWvPe3fnOLuA25NitNnjFi2WF+dkOpFYQpmk9S1ONU
 MvtfRxPm2IkJj93pBT22Kz/zkw==
X-Google-Smtp-Source: ABdhPJzlpZrs7tYCs+bVPPekgHDRENk2SgSkvvOa2zESTJWo07869xM/hna2VCsk8cT9VcgBPLJ3cw==
X-Received: by 2002:a17:90a:a487:: with SMTP id
 z7mr2838802pjp.102.1606830237578; 
 Tue, 01 Dec 2020 05:43:57 -0800 (PST)
Received: from shiro.work (p1268123-ipngn200803sizuokaden.shizuoka.ocn.ne.jp.
 [118.13.124.123])
 by smtp.googlemail.com with ESMTPSA id g14sm2839248pji.32.2020.12.01.05.43.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 05:43:56 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To: devicetree@vger.kernel.org, soc@kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 07/10] ARM: mstar: Add dts for Honestar ssd201htv2
Date: Tue,  1 Dec 2020 22:43:27 +0900
Message-ID: <20201201134330.3037007-8-daniel@0x0f.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201201134330.3037007-1-daniel@0x0f.com>
References: <20201201134330.3037007-1-daniel@0x0f.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_084400_032146_BD5E1E22 
X-CRM114-Status: GOOD (  16.68  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: robh@kernel.org, arnd@arndb.de, daniel@0x0f.com,
 linux-kernel@vger.kernel.org, olof@lixom.net, w@1wt.eu
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201201134327.3f5WBNiIViVEmL0IHnz_1143OLPzBgVPQuktDbdCVl0@z>

Add a dts for the Honestar ssd201htv2 devkit.
This is for the board populated with a SSD202D.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/arm/boot/dts/Makefile                    |  1 +
 .../mstar-infinity2m-ssd202d-ssd201htv2.dts   | 25 +++++++++++++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 arch/arm/boot/dts/mstar-infinity2m-ssd202d-ssd201htv2.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index ce66ffd5a1bb..ccbf44b6f32a 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1372,6 +1372,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += \
 dtb-$(CONFIG_ARCH_MILBEAUT) += milbeaut-m10v-evb.dtb
 dtb-$(CONFIG_ARCH_MSTARV7) += \
 	mstar-infinity-msc313-breadbee_crust.dtb \
+	mstar-infinity2m-ssd202d-ssd201htv2.dtb \
 	mstar-infinity3-msc313e-breadbee.dtb \
 	mstar-mercury5-ssc8336n-midrived08.dtb
 dtb-$(CONFIG_ARCH_ZX) += zx296702-ad1.dtb
diff --git a/arch/arm/boot/dts/mstar-infinity2m-ssd202d-ssd201htv2.dts b/arch/arm/boot/dts/mstar-infinity2m-ssd202d-ssd201htv2.dts
new file mode 100644
index 000000000000..5d81641414a2
--- /dev/null
+++ b/arch/arm/boot/dts/mstar-infinity2m-ssd202d-ssd201htv2.dts
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 thingy.jp.
+ * Author: Daniel Palmer <daniel@thingy.jp>
+ */
+
+/dts-v1/;
+#include "mstar-infinity2m-ssd202d.dtsi"
+
+/ {
+	model = "SSD201_HT_V2";
+	compatible = "honestar,ssd201htv2", "mstar,infinity2m";
+
+	aliases {
+		serial0 = &pm_uart;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&pm_uart {
+	status = "okay";
+};
-- 
2.29.2


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
