Return-Path: <SRS0=ykaY=H7=0x0f.com=daniel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B86AC433DB
	for <soc@archiver.kernel.org>; Mon,  1 Mar 2021 12:36:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 21AB664E75; Mon,  1 Mar 2021 12:36:23 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEFD164EAE
	for <soc@kernel.org>; Mon,  1 Mar 2021 12:36:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CEFD164EAE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=daniel@0x0f.com
Received: by mail-pj1-f50.google.com with SMTP id e9so8408542pjs.2
        for <soc@kernel.org>; Mon, 01 Mar 2021 04:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=536xRWNL7jknD9IRPbTVC2QcHZZ+m5eHrkYF4PRPpVs=;
        b=S8bV2V8DbZz51yB79NHw1Qy5wgklnsXO4bpxwk/7Yo8G5e9J+77QaPbiJbTcvc+dlt
         PMWdcbW2I+A1CUoKWv94xaPmPurGfHghp37tKPxyWJYu2jiT1maVOJXVjuit63g2TnO1
         jcPvcbMs/uP1VXjWXhM7ZU/wuUToOBgqCOeM8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=536xRWNL7jknD9IRPbTVC2QcHZZ+m5eHrkYF4PRPpVs=;
        b=quepq1caP+gLn+UqUZ9eGW5YN9Ouf/tRAk8kgvT/khQIW14Ap9ZO7bC2P1U3XEX1uq
         hctRzhKtjXHTPU+TdW/ZV2vkdR2yWzohiaQCpNZ0/IrA5UK4VZlWTFih2/9T1A79x/eo
         hF8HdLa9xpxxnEoE0YgkycA6JGMFY0BzaibpYZb2Q9DVeoJBKxTnpjxOhsXperffdYkt
         uxGgG6IeMdBBJXXsnM8G+IGTFEVy1Jp36/+p+ivwSxaUHQzPqU6xARrWsFJgnehlAe+B
         R43maYdzBlVhIqp/TUI1al3/vyArsiJbXRazGWkJia6PogRYGLuBvmF/Gq7XqPrMX2aF
         Wqvw==
X-Gm-Message-State: AOAM533hgMHoOyIzltRk6iXV9kuwYPT966T7k6mdnqw1U+EHlvQqFBTB
	e0T0HRwDW0hc3eZxhrMlXcoARGCrLU8o3Q==
X-Google-Smtp-Source: ABdhPJxmG3O7GKhc9qGTw5SpHoWvJ1q6BkDMP4KXQkRz8Z1MS08I62eDj0MAiABHUQcXvEmu/Q8wlQ==
X-Received: by 2002:a17:90a:6c22:: with SMTP id x31mr17844508pjj.213.1614602182273;
        Mon, 01 Mar 2021 04:36:22 -0800 (PST)
Received: from shiro.work (p345188-ipngn200408sizuokaden.shizuoka.ocn.ne.jp. [124.98.97.188])
        by smtp.googlemail.com with ESMTPSA id 8sm18130928pfp.171.2021.03.01.04.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 04:36:22 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arnd@kernel.org,
	olof@lixom.net,
	w@1wt.eu,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 3/3] ARM: mstar: Add mpll to base dtsi
Date: Mon,  1 Mar 2021 21:35:42 +0900
Message-Id: <20210301123542.2800643-4-daniel@0x0f.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210301123542.2800643-1-daniel@0x0f.com>
References: <20210301123542.2800643-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All of the currently known MStar/SigmaStar ARMv7 SoCs have at least
one MPLL and it seems to always be at the same place so add it to
the base dtsi.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/arm/boot/dts/mstar-v7.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/mstar-v7.dtsi b/arch/arm/boot/dts/mstar-v7.dtsi
index 889c3804c251..075d583d6f40 100644
--- a/arch/arm/boot/dts/mstar-v7.dtsi
+++ b/arch/arm/boot/dts/mstar-v7.dtsi
@@ -6,6 +6,7 @@
 
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/mstar-msc313-mpll.h>
 
 / {
 	#address-cells = <1>;
@@ -124,6 +125,13 @@ l3bridge: l3bridge@204400 {
 				reg = <0x204400 0x200>;
 			};
 
+			mpll: mpll@206000 {
+				compatible = "mstar,msc313-mpll";
+				#clock-cells = <1>;
+				reg = <0x206000 0x200>;
+				clocks = <&xtal>;
+			};
+
 			gpio: gpio@207800 {
 				#gpio-cells = <2>;
 				reg = <0x207800 0x200>;
-- 
2.30.1

