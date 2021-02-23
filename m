Return-Path: <SRS0=dVkn=HZ=0x0f.com=daniel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3946AC433E6
	for <soc@archiver.kernel.org>; Tue, 23 Feb 2021 06:19:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 05B4364E7C; Tue, 23 Feb 2021 06:19:28 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A012261606
	for <soc@kernel.org>; Tue, 23 Feb 2021 06:19:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A012261606
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=daniel@0x0f.com
Received: by mail-pj1-f47.google.com with SMTP id d2so1184877pjs.4
        for <soc@kernel.org>; Mon, 22 Feb 2021 22:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SE8LvB13EoijNekrwFmw4zAb9BZgnUUKtus/CbxCO44=;
        b=Vzqnw822lH2lfVZnHFzXqgEjRR+CAv1klD1WlOha88yUivgU/HRzplnKxIRyISmh0c
         JbvmMk3JdaI2X1TDHww+2/w7j/gkEVZkZOQZS69erTcEV6JBiWyzuSXvc9JMPyGMs9Kw
         +Dn0H3PI6Wgd7h/fts19GzE8gCfBUHadG09JQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SE8LvB13EoijNekrwFmw4zAb9BZgnUUKtus/CbxCO44=;
        b=oc2E+kcyHMeofW7B04XdyiiOz1NPaxbfFC0svbnGrTuW7l1wZ23N7VY7pxL9Fq3fM4
         RXshrtR3Uuzkfu99hsq8FJ8x4Aw4Hs927trXcjepKpbyqPJiDy4FBuTVZdRMEtr26uwE
         kDEbUG5JN9ztpfbPPBdEhWd+LgMmWnwlvSgeZhuO8+eEuhgHatwJezu9+z6/ZNwCibUL
         fuWzmoIms4hYYteQdj93JKYfE0h9Ama5483g/8zfxTtC41JsACHXG1oMoYBtdWgbtvNk
         bQjlzlTlkA4Rk37P8Z5yc1jB/muWRmZMr8vvEcWvJN8UXmQUndUWKAesg0E5TvJHmwxd
         s0eg==
X-Gm-Message-State: AOAM5303/vTgqIbl6NJUMxLblgT4XiUakGdkuIQXi7b9nnMEsvFgeQDD
	ouysRuNuIkTvx3tzkfjZWycmsw==
X-Google-Smtp-Source: ABdhPJzoIJDh0x+aPCJvQ3KGczLpHsrN+drRAIc5AD4BKUwfO1ZvK1x/0gzZUZpOaaY3vYvOJ8Z3MA==
X-Received: by 2002:a17:90a:1d0a:: with SMTP id c10mr28899732pjd.142.1614061167210;
        Mon, 22 Feb 2021 22:19:27 -0800 (PST)
Received: from shiro.work (p345188-ipngn200408sizuokaden.shizuoka.ocn.ne.jp. [124.98.97.188])
        by smtp.googlemail.com with ESMTPSA id n10sm20135169pgk.91.2021.02.22.22.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 22:19:26 -0800 (PST)
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
Subject: [PATCH 6/8] ARM: mstar: Add OPP table for infinity
Date: Tue, 23 Feb 2021 15:18:28 +0900
Message-Id: <20210223061830.1913700-7-daniel@0x0f.com>
X-Mailer: git-send-email 2.30.0.rc2
In-Reply-To: <20210223061830.1913700-1-daniel@0x0f.com>
References: <20210223061830.1913700-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an OPP table for the inifinity chips so
that cpu frequency scaling can happen.

Co-authored-by: Willy Tarreau <w@1wt.eu>
Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/arm/boot/dts/mstar-infinity.dtsi | 34 +++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm/boot/dts/mstar-infinity.dtsi b/arch/arm/boot/dts/mstar-infinity.dtsi
index 0bee517797f4..441a917b88ba 100644
--- a/arch/arm/boot/dts/mstar-infinity.dtsi
+++ b/arch/arm/boot/dts/mstar-infinity.dtsi
@@ -8,6 +8,40 @@
 
 #include <dt-bindings/gpio/msc313-gpio.h>
 
+/ {
+	cpu0_opp_table: opp_table0 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-240000000 {
+			opp-hz = /bits/ 64 <240000000>;
+			opp-microvolt = <1000000>;
+			clock-latency-ns = <300000>;
+		};
+
+		opp-400000000 {
+			opp-hz = /bits/ 64 <400000000>;
+			opp-microvolt = <1000000>;
+			clock-latency-ns = <300000>;
+		};
+		opp-600000000 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-microvolt = <1000000>;
+			clock-latency-ns = <300000>;
+		};
+
+		opp-800000000 {
+			opp-hz = /bits/ 64 <800000000>;
+			opp-microvolt = <1000000>;
+			clock-latency-ns = <300000>;
+		};
+	};
+};
+
+&cpu0 {
+	operating-points-v2 = <&cpu0_opp_table>;
+};
+
 &imi {
 	reg = <0xa0000000 0x16000>;
 };
-- 
2.30.0.rc2

