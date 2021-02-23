Return-Path: <SRS0=smCM=HZ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A632C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Feb 2021 06:21:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8F8664DA3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Feb 2021 06:21:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8F8664DA3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JoXfXiEWRhHS2jdNgwNc2kuAqkiesOiPG36OxtT3MPQ=; b=IYEB7o+Z7VnLfPNNaArHwSQFD
	pUntyRm5VnlusvZsKHUdyvHuVAVOve3JZHJON59JQ68TFtJ/2kuyi6vfiQLQkaIa/SWHzlwt1YDpR
	VILRgQXjZmNv0A0LWEFRKbCd2NSAciZZfkRV0zSzcdkMeuPSr05XeYxUmH363m8LSS7NXv7xajyDt
	yS1mBOh16lCZbzigc9HK5uzo+EroSMN+tY63bkNcf94ysNccjO5xp6cNTgv8Xoy81l5/wU2eV8m3R
	1A3oWeoZJWGcqGKE7FuefcH4OgvGCH6qL8D3CERh3LT7hVRtW6FMvVJ6F/NwhDU1o57kbKnd8FksS
	8z4vlrvAQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lER36-0006wR-GS; Tue, 23 Feb 2021 06:19:56 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lER2f-0006nc-2L
 for linux-arm-kernel@lists.infradead.org; Tue, 23 Feb 2021 06:19:32 +0000
Received: by mail-pj1-x1031.google.com with SMTP id o6so1176167pjf.5
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 22 Feb 2021 22:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
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
 b=Byttl3f1I1DzbKGEigQ/Bt05ziqzMHIW9toCdSlx8+ZEAzemgXGU3mAJkH4szfaDo6
 gYFfz8nUQH9iu55AbzT2d1kT4lvag5eQAAinscAu6GtVblR2IE+kNxFlCqW8g8OXP4kT
 nnGvtQUCeMvU+UKQZz5vod/xSSJfaOrkdcTwYNf5maugXdfy3qsnzswZFITRyGUjNpeQ
 QKIxM6ig7G0LoGv2nw+cJ9WkCGIkYM6kGr10hqMeVcCAGE72DAioLAcnh23fm7ag9527
 Oow/psxgzkufFxufqoglDg+6DmWVnu1tfR1RQEbBIQrSykH9eVtj4i5BekOigzvjw4Hr
 oyXw==
X-Gm-Message-State: AOAM531aX24FX5GNNxrwpdRzjAAaafV1NEfIBrxGoM9g3ZaImEkrIFsv
 YVFHXPUmVsct1Wzy/Xbn2aBshw==
X-Google-Smtp-Source: ABdhPJzoIJDh0x+aPCJvQ3KGczLpHsrN+drRAIc5AD4BKUwfO1ZvK1x/0gzZUZpOaaY3vYvOJ8Z3MA==
X-Received: by 2002:a17:90a:1d0a:: with SMTP id
 c10mr28899732pjd.142.1614061167210; 
 Mon, 22 Feb 2021 22:19:27 -0800 (PST)
Received: from shiro.work (p345188-ipngn200408sizuokaden.shizuoka.ocn.ne.jp.
 [124.98.97.188])
 by smtp.googlemail.com with ESMTPSA id n10sm20135169pgk.91.2021.02.22.22.19.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 22:19:26 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, soc@kernel.org,
 sboyd@kernel.org
Subject: [PATCH 6/8] ARM: mstar: Add OPP table for infinity
Date: Tue, 23 Feb 2021 15:18:28 +0900
Message-ID: <20210223061830.1913700-7-daniel@0x0f.com>
X-Mailer: git-send-email 2.30.0.rc2
In-Reply-To: <20210223061830.1913700-1-daniel@0x0f.com>
References: <20210223061830.1913700-1-daniel@0x0f.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210223_011929_242417_2A45A0F2 
X-CRM114-Status: GOOD (  11.54  )
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
Cc: Daniel Palmer <daniel@0x0f.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, w@1wt.eu
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210223061828.ZTOVUJRRFcQYOJRXvHQN-TqhrH3diJXs9fAm1JKWuoo@z>

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


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
