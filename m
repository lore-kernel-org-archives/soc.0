Return-Path: <SRS0=ykaY=H7=0x0f.com=daniel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50ABCC433E6
	for <soc@archiver.kernel.org>; Mon,  1 Mar 2021 12:36:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2691464E99; Mon,  1 Mar 2021 12:36:21 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5A2964E5C
	for <soc@kernel.org>; Mon,  1 Mar 2021 12:36:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5A2964E5C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=daniel@0x0f.com
Received: by mail-pf1-f172.google.com with SMTP id e3so7418277pfj.6
        for <soc@kernel.org>; Mon, 01 Mar 2021 04:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+k4h3DmLpBdKDskL9GZ/5TFWOILyp4Yu88KprHaLQKE=;
        b=LXsgkHRudMusscZhb8tcXfF/UOSbdaiDWcQYPsD1X4Wq3fGQFyFSTcgYFNAa8NLPNq
         tTbnNz9qHrGUsGM9wVQ39viWKoq/ILyVTBh1LVGv/DhNUk/eOQCioNlhOHSm5JbM0DYN
         eANJzwaDFbvAKU1QILsouWS76VWxkq1hclLwI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+k4h3DmLpBdKDskL9GZ/5TFWOILyp4Yu88KprHaLQKE=;
        b=a2fz9yjdzWpAoQCePgjGEFTE8Kz5+fn3H+eqUy6UqRlhIMuTD3sOEzPqxEW7pPVRF4
         RalUryN6cEXPXueMP8OMJPVUcLBGqInwDTPFosedgMWO977x5Hczf8iRXjh6zxJ8RJty
         lXG476YEVnDVxJHl+KMctWN3WULa+zlXrQowwm1nGvCbe4d6Aq9J6pTGSrrPUl3HN7h2
         Obbs1VcHokDKW12EL9mCXIQpQQHGt3EzZWzJ1V6CWA3aj7LdNCTpUTdTwNM4JUnwFX1X
         RYzTv6SnVWZNVPcdfYAWnMuNrtQooeT6D97LY89fd3btZwhhT3X+0OImzLAyo/ICrKCZ
         nIaQ==
X-Gm-Message-State: AOAM5325vShbSczlff2GbbJmFC0BXtvPpdT+/wcy/b2DRggyoTqqUUBg
	XQsWOYJgZ2Wx4vp9UpV6mslNOmTqcQisTg==
X-Google-Smtp-Source: ABdhPJwTEPhmbXdM73IRV4qErcw1tHV6jN+BJBRpELMoKnNa4BLKg/pydkhpYosYCFC+tEFU67mx0g==
X-Received: by 2002:a63:c1d:: with SMTP id b29mr13749890pgl.9.1614602180117;
        Mon, 01 Mar 2021 04:36:20 -0800 (PST)
Received: from shiro.work (p345188-ipngn200408sizuokaden.shizuoka.ocn.ne.jp. [124.98.97.188])
        by smtp.googlemail.com with ESMTPSA id 8sm18130928pfp.171.2021.03.01.04.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 04:36:19 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arnd@kernel.org,
	olof@lixom.net,
	w@1wt.eu,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 2/3] ARM: mstar: Add the external clocks to the base dsti
Date: Mon,  1 Mar 2021 21:35:41 +0900
Message-Id: <20210301123542.2800643-3-daniel@0x0f.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210301123542.2800643-1-daniel@0x0f.com>
References: <20210301123542.2800643-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All of the currently known MStar/SigmaStar ARMv7 SoCs have an "xtal"
clock input that is usually 24MHz and an "RTC xtal" that is usually 32KHz.

The xtal input has to be connected to something so it's enabled by default.

The MSC313 and MSC313E do not bring the RTC clock input out to the pins
so it's impossible to connect it. The SSC8336 does bring the input
out to the pins but it's not always actually connected to something.

The RTC node needs to always be present because in the future the nodes
for the clock muxes will refer to it even if it's not usable.

The RTC node is disabled by default and should be enabled at the board
level if the RTC input is wired up.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/arm/boot/dts/mstar-v7.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/mstar-v7.dtsi b/arch/arm/boot/dts/mstar-v7.dtsi
index b0a21b0b731f..889c3804c251 100644
--- a/arch/arm/boot/dts/mstar-v7.dtsi
+++ b/arch/arm/boot/dts/mstar-v7.dtsi
@@ -46,6 +46,21 @@ pmu: pmu {
 		interrupt-affinity = <&cpu0>;
 	};
 
+	clocks: clocks {
+		xtal: xtal {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <24000000>;
+		};
+
+		rtc_xtal: rtc_xtal {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <32768>;
+			status = "disabled";
+		};
+	};
+
 	soc: soc {
 		compatible = "simple-bus";
 		#address-cells = <1>;
-- 
2.30.1

