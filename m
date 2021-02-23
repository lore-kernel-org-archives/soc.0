Return-Path: <SRS0=dVkn=HZ=0x0f.com=daniel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C89AC433DB
	for <soc@archiver.kernel.org>; Tue, 23 Feb 2021 06:19:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id CBCAD64E62; Tue, 23 Feb 2021 06:19:25 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75A4664E60
	for <soc@kernel.org>; Tue, 23 Feb 2021 06:19:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75A4664E60
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=daniel@0x0f.com
Received: by mail-pj1-f47.google.com with SMTP id s23so1193402pji.1
        for <soc@kernel.org>; Mon, 22 Feb 2021 22:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=d++YVA3eBO844Kl/OHoWYa8zWRWfXAymLgjqBL6Knr4=;
        b=vFAGl7k5isfUzWSj59UQ9XxA40uYRhdmVvNDxnrUzWu6FHtJTNyw0cqTm178md8yLh
         TsWHwYiOjHskw6l2yzhaeG+ZbGYvZa0EpXQq0EZx/4rJrMx5tPfnkcNq0l0o3/z67+mb
         8xVP02vET2/tQ9CnwLCfKQhhhAa5OMwo9v0pg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d++YVA3eBO844Kl/OHoWYa8zWRWfXAymLgjqBL6Knr4=;
        b=oYiSe90EXhj5g4hITR/xO9EphgeWwM3oeLzEfo4+EmNH0Ej3SCVBWQRANQIVn+aEQR
         D7r1O4dReQNwtCTcKV3hMykP1rDXPqELTDaTzP2R/P3/obYMb51f+VEl4PbAUtcBlat5
         aRIMh+g0HvYTnWyVuJceuueyqrEy+wTLmA3exXvRuIaaHOuLnbpuRVhHR3RsmLwxpa4t
         lDcc1/XETLAy8pHVvchYxL0VlODdTT8wuWs55/OTcTmX6AKpNCHBXyNas6Nv2z0qeOpG
         O7P+SxuXmSFTkPSs8P+ioklUB92sMQe7x+6GNzbTU47qiRDjJK+/wgv8BnxgYrY5IMKt
         oVFA==
X-Gm-Message-State: AOAM532fLxG158pOwcdbZUYJssWlLzK14CszOLoxhXNzvnMeetcAl30o
	xAmSp2qcxT+wKKpTKzNK5YyIWQ==
X-Google-Smtp-Source: ABdhPJwBsHIBaGuLGftBLh9hMsJ/IeKYQPrHF8GpHwdEz++2TYtHeK9N5CQJHYgT51bxWKcaM54eIg==
X-Received: by 2002:a17:90a:1b4b:: with SMTP id q69mr25034810pjq.108.1614061164948;
        Mon, 22 Feb 2021 22:19:24 -0800 (PST)
Received: from shiro.work (p345188-ipngn200408sizuokaden.shizuoka.ocn.ne.jp. [124.98.97.188])
        by smtp.googlemail.com with ESMTPSA id n10sm20135169pgk.91.2021.02.22.22.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 22:19:24 -0800 (PST)
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
Subject: [PATCH 5/8] ARM: mstar: Link cpupll to second core
Date: Tue, 23 Feb 2021 15:18:27 +0900
Message-Id: <20210223061830.1913700-6-daniel@0x0f.com>
X-Mailer: git-send-email 2.30.0.rc2
In-Reply-To: <20210223061830.1913700-1-daniel@0x0f.com>
References: <20210223061830.1913700-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The second core also sources it's clock from the CPU PLL.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/arm/boot/dts/mstar-infinity2m.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/mstar-infinity2m.dtsi b/arch/arm/boot/dts/mstar-infinity2m.dtsi
index 6d4d1d224e96..dc339cd29778 100644
--- a/arch/arm/boot/dts/mstar-infinity2m.dtsi
+++ b/arch/arm/boot/dts/mstar-infinity2m.dtsi
@@ -11,6 +11,8 @@ cpu1: cpu@1 {
 		device_type = "cpu";
 		compatible = "arm,cortex-a7";
 		reg = <0x1>;
+		clocks = <&cpupll>;
+		clock-names = "cpuclk";
 	};
 };
 
-- 
2.30.0.rc2

