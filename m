Return-Path: <SRS0=dVkn=HZ=0x0f.com=daniel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E86BDC433DB
	for <soc@archiver.kernel.org>; Tue, 23 Feb 2021 06:19:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B2EA264E62; Tue, 23 Feb 2021 06:19:30 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A7D664E60
	for <soc@kernel.org>; Tue, 23 Feb 2021 06:19:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A7D664E60
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=daniel@0x0f.com
Received: by mail-pj1-f45.google.com with SMTP id l18so1187746pji.3
        for <soc@kernel.org>; Mon, 22 Feb 2021 22:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=G4thmjduZ43HX5eyCNJENeVZMcyA8AVKFXPpIRfsEmo=;
        b=amHWH1xFUTFu36kpCUT4l9b90U0fBp3Q9fyx8iXV9r/xiRDq9pDWnJnL5GPlqLxbSj
         HR0yuPTyY+r+HwX+t5dEfOPeVRXaEaI3mggCZWThxuvElg0+eLqgqpVKAuTGcld4bc6X
         MHx5hnu+uT3f4oMN6r166FajTuyU6Mtf+FsqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G4thmjduZ43HX5eyCNJENeVZMcyA8AVKFXPpIRfsEmo=;
        b=qUblreH02odxTzljtPLE5ZjbzvrDcZTKOk7lUTB+Ulp/jmz8WMqW3u2Nb48YO4vMOl
         upUoCfAIPoajAGtPAaXZ0GJ6rwBj4Dt2zVfPYMb3EkjOooZogBmgUvnr1B/ffNu7jF31
         nYhMMMKePe8f5WKNeigC1eUbB5aeq3eGaPX6iy+sbDnYgMHVcheJU59N0yR04FV4M44R
         L+YZcSCvpy96lvlhJdHs+sT+7Dy7A4qMwlu2wyiq8D7kbuQR1wwq5aANDY151l1x3elE
         OfZnRcqBBIP/Zu6jmycTCkmT7oC4KPmbWExbTc9gLEgZg8rpk1+L0lVXqITxonuD5ViD
         ZtRw==
X-Gm-Message-State: AOAM533pzRKRBR0Xh7lAae8yrw1UGioNgvbEK05UiFM5tQ/EpwdE++8W
	HoA0X/xylniGn4uG4t5EcFf5TQ==
X-Google-Smtp-Source: ABdhPJzKdWD/HPnom8Qx8jH6AAUN43gD8lpStgM44BbHKJBQkB14izYGXPrhe4CCETIu2OGeezBwGg==
X-Received: by 2002:a17:90a:7e94:: with SMTP id j20mr28131038pjl.218.1614061169617;
        Mon, 22 Feb 2021 22:19:29 -0800 (PST)
Received: from shiro.work (p345188-ipngn200408sizuokaden.shizuoka.ocn.ne.jp. [124.98.97.188])
        by smtp.googlemail.com with ESMTPSA id n10sm20135169pgk.91.2021.02.22.22.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 22:19:29 -0800 (PST)
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
Subject: [PATCH 7/8] ARM: mstar: Add OPP table for infinity3
Date: Tue, 23 Feb 2021 15:18:29 +0900
Message-Id: <20210223061830.1913700-8-daniel@0x0f.com>
X-Mailer: git-send-email 2.30.0.rc2
In-Reply-To: <20210223061830.1913700-1-daniel@0x0f.com>
References: <20210223061830.1913700-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The infinity3 has a slightly higher max frequency
compared to the infinity so extend the OPP table.

Co-authored-by: Willy Tarreau <w@1wt.eu>
Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/arm/boot/dts/mstar-infinity3.dtsi | 58 ++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm/boot/dts/mstar-infinity3.dtsi b/arch/arm/boot/dts/mstar-infinity3.dtsi
index 9857e2a9934d..a56cf29e5d82 100644
--- a/arch/arm/boot/dts/mstar-infinity3.dtsi
+++ b/arch/arm/boot/dts/mstar-infinity3.dtsi
@@ -6,6 +6,64 @@
 
 #include "mstar-infinity.dtsi"
 
+&cpu0_opp_table {
+	opp-1008000000 {
+		opp-hz = /bits/ 64 <1008000000>;
+		opp-microvolt = <1000000>;
+		clock-latency-ns = <300000>;
+	};
+
+	// overclock frequencies below, shown to work fine up to 1.3 GHz
+	opp-108000000 {
+		opp-hz = /bits/ 64 <1080000000>;
+		opp-microvolt = <1000000>;
+		clock-latency-ns = <300000>;
+		turbo-mode;
+	};
+
+	opp-1188000000 {
+		opp-hz = /bits/ 64 <1188000000>;
+		opp-microvolt = <1000000>;
+		clock-latency-ns = <300000>;
+		turbo-mode;
+	};
+
+	opp-1296000000 {
+		opp-hz = /bits/ 64 <1296000000>;
+		opp-microvolt = <1000000>;
+		clock-latency-ns = <300000>;
+		turbo-mode;
+	};
+
+	opp-1350000000 {
+		opp-hz = /bits/ 64 <1350000000>;
+		opp-microvolt = <1000000>;
+		clock-latency-ns = <300000>;
+		turbo-mode;
+	};
+
+	opp-1404000000 {
+		opp-hz = /bits/ 64 <1404000000>;
+		opp-microvolt = <1000000>;
+		clock-latency-ns = <300000>;
+		turbo-mode;
+	};
+
+	opp-1458000000 {
+		opp-hz = /bits/ 64 <1458000000>;
+		opp-microvolt = <1000000>;
+		clock-latency-ns = <300000>;
+		turbo-mode;
+	};
+
+	opp-1512000000 {
+		opp-hz = /bits/ 64 <1512000000>;
+		opp-microvolt = <1000000>;
+		clock-latency-ns = <300000>;
+		turbo-mode;
+	};
+};
+
 &imi {
 	reg = <0xa0000000 0x20000>;
 };
-- 
2.30.0.rc2

