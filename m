Return-Path: <SRS0=r2Hb=FF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A18E8C83014
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Dec 2020 13:45:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EC162080A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Dec 2020 13:45:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kVYz7YpR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="t6q6uhfF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2EC162080A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JZE/hfsRyXG84FP0woMXd4ipmHnCgi1v2uaV+GbpnFM=; b=kVYz7YpRiRXjtxGG9F1DtMwif
	WcPS2iMEN8e6FP1nyBwZIx2Qzt5PR4YwGpwgXlDj17a0bzjI9hUgA5Rdd9B/mHz6UwXDHt61qJUqE
	XO4XR2Z+v2g92VMceWbChKr0g57jh2sdCsJJNN5wyNGxIrxTtHFg1vIFnP3B0bPbzLisuodRgB+64
	U4dpKJnR0hEDhueU5Q8Sws+kujMyF6xaRjfUCT3JWzK1KZ3maMWQp5E1eXqpsw1P4XixcIrZAMlBY
	ep5JVmCLEbvSAQtpcv1B+oHKMvsJaqW+NszBro5kkB92SnTJqFXrQNMbZN0PYtwKyA3zYHHgRe5nq
	pl3TIbahQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kk5wp-00072W-Uu; Tue, 01 Dec 2020 13:44:04 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kk5wi-0006zo-B7
 for linux-arm-kernel@lists.infradead.org; Tue, 01 Dec 2020 13:43:57 +0000
Received: by mail-pl1-x643.google.com with SMTP id t18so1182416plo.0
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 01 Dec 2020 05:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZmXMtKJx+N4tYwcvtUovyBiKEQa6t+IIEkwiQ3K9Kyk=;
 b=t6q6uhfFqDAV+Gpt9MD0/6YR8au50Pju9fWCyH2hnyNEP9wJiJPqna+SH1c5DoAYUX
 s1a+2RKgaD8aqVVp2TFcKKf2+RYPuIlugkr+VezgnCx+YhZ1uLSoBB7vL1bU9e5NRnO2
 1EoptdP+uf1iEIO00tkEZQeXawKJ0PGcHCViQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZmXMtKJx+N4tYwcvtUovyBiKEQa6t+IIEkwiQ3K9Kyk=;
 b=gmq4ZYl5dAGT5IAhRagf0E4bbeTStTkargCKITrHr/hESvzadS8Z+jZaJ9daOzOFcy
 rDaWQhHRLE9Er8hBVIVut+mFV7fp/88NPuvFKhXxMJUyVYp9CAkR5PnTaAezx15Qe6CI
 3kJrZjhvR3DuLKCwrGCMq7YMEfTcpyUeyWlVVK0fpF90BXhZvsxI4NycT0vgaXX/B/Hk
 DC/+NeZv3GvU1hTdYGn0US18wH7KnKURqob1J6CRnGJg6myf6rxXMK/8NmA8frjgrWQ/
 nkh1/TlD7mN1ByEsU9K1LCoPg5C6UZhBWG13aim0ny4m2wJVXlFrJwQPnAaS6Jl8DEg9
 ul9Q==
X-Gm-Message-State: AOAM532LHkZ9JOtgWQOqn/2xJCsNsu4n0wJgcrCL8WDPM53zsIhL6G8f
 utOwNB36Hx4on9N+X0mulBUlPA==
X-Google-Smtp-Source: ABdhPJzL6sz8FhzIj/VnR2T4URGqVwifM9uOLkrsNrYxoV7xuyu2esfcbIqT9WWHFPe7wKzSDADh3w==
X-Received: by 2002:a17:902:7b97:b029:d8:ec6e:5c28 with SMTP id
 w23-20020a1709027b97b02900d8ec6e5c28mr2848453pll.40.1606830234662; 
 Tue, 01 Dec 2020 05:43:54 -0800 (PST)
Received: from shiro.work (p1268123-ipngn200803sizuokaden.shizuoka.ocn.ne.jp.
 [118.13.124.123])
 by smtp.googlemail.com with ESMTPSA id g14sm2839248pji.32.2020.12.01.05.43.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 05:43:54 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To: devicetree@vger.kernel.org, soc@kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 06/10] ARM: mstar: Add chip level dtsi for SSD202D
Date: Tue,  1 Dec 2020 22:43:26 +0900
Message-ID: <20201201134330.3037007-7-daniel@0x0f.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201201134330.3037007-1-daniel@0x0f.com>
References: <20201201134330.3037007-1-daniel@0x0f.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_084356_411249_7B857E8C 
X-CRM114-Status: GOOD (  14.25  )
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
Message-ID: <20201201134326.SUAvJisxvnjdcuwFG0gjEVGmMoCBhAKXOBb0-Pm1Ui4@z>

Add a chip level dtsi for the SigmaStar SSD202D

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/arm/boot/dts/mstar-infinity2m-ssd202d.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 arch/arm/boot/dts/mstar-infinity2m-ssd202d.dtsi

diff --git a/arch/arm/boot/dts/mstar-infinity2m-ssd202d.dtsi b/arch/arm/boot/dts/mstar-infinity2m-ssd202d.dtsi
new file mode 100644
index 000000000000..176e10a29896
--- /dev/null
+++ b/arch/arm/boot/dts/mstar-infinity2m-ssd202d.dtsi
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 thingy.jp.
+ * Author: Daniel Palmer <daniel@thingy.jp>
+ */
+
+#include "mstar-infinity2m-ssd20xd.dtsi"
+
+/ {
+	memory {
+		device_type = "memory";
+		reg = <0x20000000 0x8000000>;
+	};
+};
-- 
2.29.2


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
