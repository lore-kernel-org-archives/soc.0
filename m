Return-Path: <SRS0=dVkn=HZ=0x0f.com=daniel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52D60C433E0
	for <soc@archiver.kernel.org>; Tue, 23 Feb 2021 06:19:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1F3DF64E7C; Tue, 23 Feb 2021 06:19:21 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0B8A61606
	for <soc@kernel.org>; Tue, 23 Feb 2021 06:19:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0B8A61606
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=daniel@0x0f.com
Received: by mail-pl1-f175.google.com with SMTP id d16so350639plg.0
        for <soc@kernel.org>; Mon, 22 Feb 2021 22:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WvzkCjZyptzDnW1uepsiXb6ybrsE6A8U5lzjXZF4NH4=;
        b=DeXXljYGddSCbpsw5yQZDdWWq/dbOTy0CmpXadmiPDNqrp0kPHRgRzwK11zwiGd6AO
         BY+r+BrMSNGMhKk+KRhiTLh2ke5g/iRd1c0XY2bJIWXOC/JSLO4AUt9qWVD5qNlZIcOE
         vlc8lAkWXzdwQkm1q3G4APE7sDzXfl4MycAic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WvzkCjZyptzDnW1uepsiXb6ybrsE6A8U5lzjXZF4NH4=;
        b=mjIYPvJX5jJUUrVrsTMmAE7Tdrk+bMuQ4mjnaj9iVqKSrrNkvaZiGbXGDXBjPSmMp3
         XiCYrARo0BAxT57Zspg2E3FEtsKeLEHd5FhMU4MhXqOcO1LA6Izr5+F0qM5//guvjmXc
         CRQxMdwAr+Zt/+OKti3fCVCM3rVNuWWoSaK/udFkyP1xI/bBJbjhK21JP4+1e4DZIwK0
         +5d+z6ku5HjbGVz33zZfmreFd2atqYVgxp4oVZ/zYpNae/Vix6ahJlNCnzlzb8zXUZxc
         nX+ZEdN5MIwt9RVzE++pWJgYPce6HwiJra+b6+eCyYjatt/yrJgBYYp7LtTd4lH278z/
         +alA==
X-Gm-Message-State: AOAM533W1OT6q8eESdaH+DMJcEzFCfEhjXWeGmMHX/fxFTkwT9HWhXV2
	GluVVOUeq2oUXU8BGL/MRvr9Pw==
X-Google-Smtp-Source: ABdhPJzUFcIDoQ53XoBGFCZHB+j9nJd4ObgYI5HbP5VqqkuvxkGhU56VmEE/a/ZFZLF7fjsQVyhI2Q==
X-Received: by 2002:a17:90a:ea88:: with SMTP id h8mr27156943pjz.154.1614061160369;
        Mon, 22 Feb 2021 22:19:20 -0800 (PST)
Received: from shiro.work (p345188-ipngn200408sizuokaden.shizuoka.ocn.ne.jp. [124.98.97.188])
        by smtp.googlemail.com with ESMTPSA id n10sm20135169pgk.91.2021.02.22.22.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 22:19:20 -0800 (PST)
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
Subject: [PATCH 3/8] ARM: mstar: Add cpupll to base dtsi
Date: Tue, 23 Feb 2021 15:18:25 +0900
Message-Id: <20210223061830.1913700-4-daniel@0x0f.com>
X-Mailer: git-send-email 2.30.0.rc2
In-Reply-To: <20210223061830.1913700-1-daniel@0x0f.com>
References: <20210223061830.1913700-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All MStar/SigmaStar ARMv7 SoCs have the CPU PLL at the same
place so add it to the base dtsi.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/arm/boot/dts/mstar-v7.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/mstar-v7.dtsi b/arch/arm/boot/dts/mstar-v7.dtsi
index 075d583d6f40..d323c1a3f3c2 100644
--- a/arch/arm/boot/dts/mstar-v7.dtsi
+++ b/arch/arm/boot/dts/mstar-v7.dtsi
@@ -132,6 +132,13 @@ mpll: mpll@206000 {
 				clocks = <&xtal>;
 			};
 
+			cpupll: cpupll@206400 {
+				compatible = "mstar,msc313-cpupll";
+				reg = <0x206400 0x200>;
+				#clock-cells = <0>;
+				clocks = <&mpll MSTAR_MSC313_MPLL_DIV2>;
+			};
+
 			gpio: gpio@207800 {
 				#gpio-cells = <2>;
 				reg = <0x207800 0x200>;
-- 
2.30.0.rc2

