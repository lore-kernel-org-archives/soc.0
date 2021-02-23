Return-Path: <SRS0=smCM=HZ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3991FC4332D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Feb 2021 06:21:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E160464E2E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Feb 2021 06:21:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E160464E2E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8ez0DEYvkv3E9K4UHf4txWxZ8agA4+iHoB4xkZ/CrsI=; b=IgNrQV64vLhzSSM9Hlep9yNM+
	ggX1cSiS11HQnVJMLOR+bacyC+6nKduOmFCiL/4Ikz+b6Lw03qgRaSmEomKNNrwd8ikG5dWymvbhc
	toVOMtG75e2l42DcBfiRQXlQ6shbQrvfINqBm8KbTSCmaWiBGDaPgBj3CKlxa+l3rLHPJ+W1m2dPs
	Z/Zdl1Yw6cROItnRCYPzTcKUPd0G1Mga8W41831MeSG0q2IesJ/QlBJAC3DLCqPwKzV4YNx1Hy+GN
	TrTrOqGtjcqkVuk0Vz5hB6cTr4ZNkLz+OrkZeHaPfXDspWQakqw2uD3/O7/o33jlK6x2yjUUs7Ofm
	2+WhRWrlw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lER2u-0006t1-O8; Tue, 23 Feb 2021 06:19:44 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lER2a-0006lx-OK
 for linux-arm-kernel@lists.infradead.org; Tue, 23 Feb 2021 06:19:25 +0000
Received: by mail-pf1-x429.google.com with SMTP id j12so8134011pfj.12
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 22 Feb 2021 22:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F8U0f9JNY8hRMi39WPkD4ASf4aAhKNDuZAqXYiDMPnc=;
 b=OdafbEs6apuScIxtpkC5hbqj2hdH2BgCZ/p6xtr5NI/8lYsH/8jqbSc51l3+G+oxdm
 /HTWGZWDK2BndoVcYAnXd0cjugjc+PqdTeqTCSYl4njHNY1e7RWaWUsyGsoI42armolR
 q0pkImbhFou/3iRgFAQDzcMf3nJvz1jrtqflU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F8U0f9JNY8hRMi39WPkD4ASf4aAhKNDuZAqXYiDMPnc=;
 b=bje0Rqu06QERARgKs24/JbNk21ByVpP8ZgpayDktXZi7bMb0s2jcQd7X9lqfzrDHsi
 ButOl9mfr2a+xYKvDOFlSL1Z29VZnjUpIkyXU/tSxNQ8XzTr4pdJZwp+cbBmSO143g3s
 CBC3Ol6oGEBZQpaoa1gbnU34rtmOl/BjaMTdlBdFopLdqeVf+ncU+8fwe1GvxwWc7u+y
 p8dveIxX/cXheUvg3NuIdj/ivreh+COXyb3Xhg7+96gZt8ilthNI+GWnX4esv/z7LE5x
 tzm6O9cmreCQuVJxIjAS6kI1Ybr7Om2/fIPilyZimH7K+6GvqQXOPb5QsIT8EkWGJPFG
 j54w==
X-Gm-Message-State: AOAM533d3OHRmBxQ+EsrzF6zCel5oAfLFipiNDUHGRI/IcacLd+KpmA+
 Ip83X5nFX0XNF7zPFRFae3vtXQ==
X-Google-Smtp-Source: ABdhPJxc6Ul/6qH9CfSEt6s256nfdmu2EHwQomQ8gqEAsR960hE9xL7M7oKKwskSClxqWd9Szf2f+A==
X-Received: by 2002:a62:dd01:0:b029:1ed:6b67:1377 with SMTP id
 w1-20020a62dd010000b02901ed6b671377mr938433pff.48.1614061162681; 
 Mon, 22 Feb 2021 22:19:22 -0800 (PST)
Received: from shiro.work (p345188-ipngn200408sizuokaden.shizuoka.ocn.ne.jp.
 [124.98.97.188])
 by smtp.googlemail.com with ESMTPSA id n10sm20135169pgk.91.2021.02.22.22.19.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 22:19:22 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, soc@kernel.org,
 sboyd@kernel.org
Subject: [PATCH 4/8] ARM: mstar: Link cpupll to cpu
Date: Tue, 23 Feb 2021 15:18:26 +0900
Message-ID: <20210223061830.1913700-5-daniel@0x0f.com>
X-Mailer: git-send-email 2.30.0.rc2
In-Reply-To: <20210223061830.1913700-1-daniel@0x0f.com>
References: <20210223061830.1913700-1-daniel@0x0f.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210223_011924_857938_9FF2C80C 
X-CRM114-Status: GOOD (  12.15  )
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
Message-ID: <20210223061826.paHbueFUghdhsqGbIpK0A5tHnIi87y6XkT5oP-R1N_E@z>

The CPU clock is sourced from the CPU PLL.
Link cpupll to the cpu so that frequency scaling can happen.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/arm/boot/dts/mstar-v7.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/mstar-v7.dtsi b/arch/arm/boot/dts/mstar-v7.dtsi
index d323c1a3f3c2..4d9991294f7c 100644
--- a/arch/arm/boot/dts/mstar-v7.dtsi
+++ b/arch/arm/boot/dts/mstar-v7.dtsi
@@ -21,6 +21,8 @@ cpu0: cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a7";
 			reg = <0x0>;
+			clocks = <&cpupll>;
+			clock-names = "cpuclk";
 		};
 	};
 
-- 
2.30.0.rc2


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
