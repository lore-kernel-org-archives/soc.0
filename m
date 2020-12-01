Return-Path: <SRS0=r2Hb=FF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 782B7C71156
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Dec 2020 13:45:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECF39207FF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Dec 2020 13:45:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s+2dqXSD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="WF6NTtrl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECF39207FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nhwMvDVWB3qHjCVhwhET6/s+bcla/U1+graDZX3VuUE=; b=s+2dqXSDp9HXg2bdLcpr2JVZf
	WY7lmUswdq+M4Zm0yrN3qrudHxFMC3tF9wPMA9hDhiTLAwG0M1wdiTyfVzKb36dpOJkbjvwiSxCA/
	j2GDZIiKszzXXQz+FVE4/MXmR9B4U1711DXHXjGkNXtOQ5IaXm0fFuciEOVAvD8rjnGVNH78Rl7n3
	URjy7ikUMk1RMrK2j99Kf2nii9hXFvanObEB1eB93ngYca2GLFcLHQ5YUnnxo4f2Sp4z77ioOTGW6
	AncPVGWAmN5ZAbmyTUFgznspUcfqKP9PGTtocxP+hGjkwjS6m60S9W52aBFj/JEcKrauncUluTilq
	JNs9ePkZA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kk5wk-00070U-OR; Tue, 01 Dec 2020 13:43:58 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kk5wd-0006xv-N7
 for linux-arm-kernel@lists.infradead.org; Tue, 01 Dec 2020 13:43:52 +0000
Received: by mail-pj1-x1030.google.com with SMTP id hk16so1257674pjb.4
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 01 Dec 2020 05:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hOB84R26CoZQA91b93xytogHngTBkirbQivQiUAvSZ8=;
 b=WF6NTtrljoUI8VDrrXKRQNZMUo3sZpPtwXncI77Eh5b/yLWbwXVVDd2e5GxzmBehWM
 iLJgca6ShKHyZ+hteIe0wcmc4NmhcpaYU4vdpEt3HE20RVTDJDvtId2319wiU4s7OuST
 cywS02e7AegSTmHZMU4BhxjYvObD7HE5zCKOk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hOB84R26CoZQA91b93xytogHngTBkirbQivQiUAvSZ8=;
 b=D0qR1v07nBFZfe5Kv2YdM2+zO8YvHJ5FI4ZpySSOimKTWX2uCoHwWzbsp8jjKPAbMd
 KgNySKbobJpjVcX2YNzUZ89JGLVSLxUujZalZNDVRCq2N4pJeS13YTJcl77LD3oA7LaD
 mme0k8WseCnPhvATeBePpU3H9dYwex3gtwzuBteE3kXJnqQL+ggCqugewPlaB4ncCVks
 nnN4XJbZ6aDBDhDhGlt10BPREGQ6gSJOlq2nBTK34Avmi+nbakj6YdGFZ751Hu2lSQZY
 uh5RCKJYxF2GK3vY+Fi+bnhPjzmJ4oA+tImcIGvo7zeKQ7BuSQF8/dbCshYagJwPMAth
 C5FQ==
X-Gm-Message-State: AOAM533CHPiJ0aK46299nKBi7CXMzDjg+7NFu8U/2qtDTz1xmwepIcqu
 Qr3ia+oQW9Ss9bbop0oaItwzbw==
X-Google-Smtp-Source: ABdhPJwc0NvZ68gepyb5EB381x8XYKBVMFc2+YBBRdd8e2c6Zew+ZunZVzKA2CFEiB5+u1J7MgYlAw==
X-Received: by 2002:a17:90b:4b11:: with SMTP id
 lx17mr2824634pjb.154.1606830229035; 
 Tue, 01 Dec 2020 05:43:49 -0800 (PST)
Received: from shiro.work (p1268123-ipngn200803sizuokaden.shizuoka.ocn.ne.jp.
 [118.13.124.123])
 by smtp.googlemail.com with ESMTPSA id g14sm2839248pji.32.2020.12.01.05.43.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 05:43:48 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To: devicetree@vger.kernel.org, soc@kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 04/10] ARM: mstar: Add infinity2m support
Date: Tue,  1 Dec 2020 22:43:24 +0900
Message-ID: <20201201134330.3037007-5-daniel@0x0f.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201201134330.3037007-1-daniel@0x0f.com>
References: <20201201134330.3037007-1-daniel@0x0f.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_084351_789215_F427586E 
X-CRM114-Status: GOOD (  18.26  )
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
Message-ID: <20201201134324.NGDTR3U5hzXSUPyEMhVsn93sBg2_QOZUdxbdo3sSV7c@z>

The infinity2m series of chips are like the other Mstar/Sigmastar
chips in that they have a Cortex A7 system with DDR memory integrated
in a single package.

The infinity2m chips are intended for recording the incoming streams
from IP cameras. So instead of video encoders they have video decoders,
instead of a camera interface they have display hardware and so on.

Aside from the above points the big difference about these chips is that
they include a second Cortex A7 core.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/arm/boot/dts/mstar-infinity2m.dtsi | 15 +++++++++++++++
 arch/arm/boot/dts/mstar-v7.dtsi         |  2 +-
 arch/arm/mach-mstar/mstarv7.c           |  1 +
 3 files changed, 17 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/mstar-infinity2m.dtsi

diff --git a/arch/arm/boot/dts/mstar-infinity2m.dtsi b/arch/arm/boot/dts/mstar-infinity2m.dtsi
new file mode 100644
index 000000000000..02adb9fe9d3c
--- /dev/null
+++ b/arch/arm/boot/dts/mstar-infinity2m.dtsi
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 thingy.jp.
+ * Author: Daniel Palmer <daniel@thingy.jp>
+ */
+
+#include "mstar-infinity.dtsi"
+
+&cpus {
+	cpu1: cpu@1 {
+		device_type = "cpu";
+		compatible = "arm,cortex-a7";
+		reg = <0x1>;
+	};
+};
diff --git a/arch/arm/boot/dts/mstar-v7.dtsi b/arch/arm/boot/dts/mstar-v7.dtsi
index 07fc46c7b4d4..2862b32c7f63 100644
--- a/arch/arm/boot/dts/mstar-v7.dtsi
+++ b/arch/arm/boot/dts/mstar-v7.dtsi
@@ -13,7 +13,7 @@ / {
 	#size-cells = <1>;
 	interrupt-parent = <&gic>;
 
-	cpus {
+	cpus: cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
diff --git a/arch/arm/mach-mstar/mstarv7.c b/arch/arm/mach-mstar/mstarv7.c
index 81a4cbcab206..1aa748fa006e 100644
--- a/arch/arm/mach-mstar/mstarv7.c
+++ b/arch/arm/mach-mstar/mstarv7.c
@@ -35,6 +35,7 @@ static void __iomem *l3bridge;
 
 static const char * const mstarv7_board_dt_compat[] __initconst = {
 	"mstar,infinity",
+	"mstar,infinity2m",
 	"mstar,infinity3",
 	"mstar,mercury5",
 	NULL,
-- 
2.29.2


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
