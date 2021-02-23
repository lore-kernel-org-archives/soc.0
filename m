Return-Path: <SRS0=dVkn=HZ=0x0f.com=daniel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F177CC433E0
	for <soc@archiver.kernel.org>; Tue, 23 Feb 2021 06:19:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id BEA5764E77; Tue, 23 Feb 2021 06:19:32 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D38864E6C
	for <soc@kernel.org>; Tue, 23 Feb 2021 06:19:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D38864E6C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=daniel@0x0f.com
Received: by mail-pj1-f48.google.com with SMTP id d2so1184982pjs.4
        for <soc@kernel.org>; Mon, 22 Feb 2021 22:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aI5IVkQJA7PDNbBU/+1PZqGp3m7b3MnBtGAvzpqE9DI=;
        b=krfujBl0J3RTa+9MxhJ1pPz8nrwfBTvIuo2aMFitjGAWxGPWV7xeKZzzG+bMU+3iUy
         Mc5Us7xmjCKRjKJsudStwDXQ5GMoRh7bmyzyoFgQlsU0Or3Ww9ad+a7WksQ9IzdZLbay
         MULJZM57YvPqTgUTD2YUj/28tKRa7nzcg8ztI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aI5IVkQJA7PDNbBU/+1PZqGp3m7b3MnBtGAvzpqE9DI=;
        b=ledukhKgcUH4wTro24ReqbG1QG8lj1GnzQ0TNkU3421yKVZD9H+i6FrpT1/VK7c38Q
         xbFQm/qGru+Hwo+txPZ74KF9Qpb/bFAQ7eF4Ke+IEiztuF5s4YEYP3O1W8t/Zt7xDZx+
         v+G5FySUGj9d3dCfqC2iLoOzHgoBDrPg9NT57vLxWpNB7jChs6FDAH/snrpNCX7PQzog
         kv0uZYAfD8nJttiBQ0LhEjooavophHOO30uKxD2CdtIrb5IZQfh9S1X/qRPISeaU6dlo
         ZxPJTO+CZ6P+opbGagYRQSjI/Kop7CQrShvG7T+UenjlhrbbPHPC9wVl28Rki+SIrZAd
         4JAA==
X-Gm-Message-State: AOAM532vVHlZzvajEscxQLQ/KM792bbiwAtdkv0UyjJHy+kTvPfhNXMV
	2uDfuuSWMCqWE/S7sy++obJsaA==
X-Google-Smtp-Source: ABdhPJxKcQ0XdzH66RpqYbTQ6lbBZie3kabhudXrxsFNyvw+rqjI5s3m5LdmnSloa1eUTFccWA5bRQ==
X-Received: by 2002:a17:90a:7e0a:: with SMTP id i10mr26715766pjl.152.1614061171969;
        Mon, 22 Feb 2021 22:19:31 -0800 (PST)
Received: from shiro.work (p345188-ipngn200408sizuokaden.shizuoka.ocn.ne.jp. [124.98.97.188])
        by smtp.googlemail.com with ESMTPSA id n10sm20135169pgk.91.2021.02.22.22.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 22:19:31 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To: devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	soc@kernel.org,
	sboyd@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	w@1wt.eu,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 8/8] ARM: mstar: Add OPP table for mercury5
Date: Tue, 23 Feb 2021 15:18:30 +0900
Message-Id: <20210223061830.1913700-9-daniel@0x0f.com>
X-Mailer: git-send-email 2.30.0.rc2
In-Reply-To: <20210223061830.1913700-1-daniel@0x0f.com>
References: <20210223061830.1913700-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an OPP table for mercury5 so that cpu frequency scaling can
happen.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/arm/boot/dts/mstar-mercury5.dtsi | 36 +++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm/boot/dts/mstar-mercury5.dtsi b/arch/arm/boot/dts/mstar-mercury5.dtsi
index a7d0dd9d6132..80a19bd23c9c 100644
--- a/arch/arm/boot/dts/mstar-mercury5.dtsi
+++ b/arch/arm/boot/dts/mstar-mercury5.dtsi
@@ -6,6 +6,42 @@
 
 #include "mstar-v7.dtsi"
 
+/ {
+	cpu0_opp_table: opp_table0 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-100000000 {
+			opp-hz = /bits/ 64 <100000000>;
+			opp-microvolt = <800000 800000 850000>;
+			clock-latency-ns = <300000>;
+		};
+
+		opp-200000000 {
+			opp-hz = /bits/ 64 <200000000>;
+			opp-microvolt = <850000 850000 880000>;
+			clock-latency-ns = <300000>;
+		};
+
+		opp-400000000 {
+			opp-hz = /bits/ 64 <400000000>;
+			opp-microvolt = <880000 880000 890000>;
+			clock-latency-ns = <300000>;
+		};
+		opp-600000000 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-microvolt = <900000 900000 1000000>;
+			clock-latency-ns = <300000>;
+		};
+
+		opp-800000000 {
+			opp-hz = /bits/ 64 <800000000>;
+			opp-microvolt = <900000 900000 1000000>;
+			clock-latency-ns = <300000>;
+		};
+	};
+};
+
 &imi {
 	reg = <0xa0000000 0x20000>;
 };
-- 
2.30.0.rc2

