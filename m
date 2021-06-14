Return-Path: <SRS0=Lfaw=LI=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBF54C2B9F4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jun 2021 19:35:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 769B361153
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jun 2021 19:35:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 769B361153
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bhfw+HCKq6EmsfPo29n6EOWTnv/bVw/iWQ7F0RlWlHw=; b=am+usZledhhpCM
	bgco4sdQ/HlleG84qteFaQ/WFbq/RPyTEpM0LLwsk5mHXAmuzEUgkl4Krso0SgW34OqZ6uo+gXlRO
	Sgxu4bBxlCj9IkT+TWVIU6T8Jcf9RnHGlvt+OpfCOfzbvBXhx7vgyQ7aq1YRe0IA3Z246snkIanMO
	nk32fXRj9+JU5kQyAeFRiA3W1533DvydDkErukxVFSgMQUEDGuyxzKkmH4Z3AioT4nXFAY89ivT/q
	RDyxUFhgAZz4sdxK+CqLexv+VBn+CM2ADHGUkf6GseG1bodosmoSqeB1WVs4oXmi5DraULedAKTUG
	d/rkfmw/wplkX+WVVNzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lssL0-00Ft1m-A7; Mon, 14 Jun 2021 19:33:34 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lssKi-00FsxJ-71
 for linux-arm-kernel@lists.infradead.org; Mon, 14 Jun 2021 19:33:17 +0000
Received: from mail-ed1-f70.google.com ([209.85.208.70])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lssKg-00009f-TF
 for linux-arm-kernel@lists.infradead.org; Mon, 14 Jun 2021 19:33:14 +0000
Received: by mail-ed1-f70.google.com with SMTP id
 x12-20020a05640226ccb0290393aaa6e811so11019464edd.19
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 14 Jun 2021 12:33:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P0NAZ9mvHQKtho19Kodk6x42SkLdwGG//84ME/Va0gs=;
 b=UxLOh574ldWl4bgfQeaBgY1BjBiQ/idhL4vpLdbWX3qxxHjqlkm4/Sr/MZ+dITrNyn
 p5YUeZrf7HAGkpLM2tRx8kbBafPIvhSVsVbs536Z1VdesPHD/J5IxK6Oy3+/Ond3UwR4
 tTQAFKjYiQNM54fAdPNz/WLW4p2OmSw75uxjddH8hhgjVniBJMVtGvdcE/JYZr426XWf
 QvmQnFRQnXdGdJSMr+eJZt59klLQVqrxL7EeQBBq5rqoXAzdPIg5jmlcoSpQud+Zi9Vg
 +WORqSYpOwjoSeigG6P9K6qomVq8Q0IMLaXKT6xoYWA7fg6WOVbc/BgXwvGd5V0A0Wao
 bfxg==
X-Gm-Message-State: AOAM5301zmZzFoGfuIX/X6tI0eNbxxhHvbkJvjJLVGA7/n8bdlmnwx2b
 1oZjQOmyOO6E0bbO7qHphU+AWFjYT/5Yr3bTHcWOAVyI1xiXe6jXw+eMt5bt95bDQSeq0ie4Bn5
 u+/cxYGcxTnOZNMw0i/KuymNvwz1WY1BcAll4nyi5swMjgMQV+W27
X-Received: by 2002:a17:907:948c:: with SMTP id
 dm12mr16836642ejc.484.1623699194475; 
 Mon, 14 Jun 2021 12:33:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyegN5ZDLDC6CBLPN9tGzm/ZZQeDNEXIQaiFCbsU2xFKTD2cPTtg93ymP/DXtEWH2egOhXeeA==
X-Received: by 2002:a17:907:948c:: with SMTP id
 dm12mr16836631ejc.484.1623699194295; 
 Mon, 14 Jun 2021 12:33:14 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id gw7sm8029291ejb.5.2021.06.14.12.33.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 12:33:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
 arm@kernel.org, soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 1/2][PATCH] arm64: dts: exynos: enable PMIC wakeup from
 suspend on TM2
Date: Mon, 14 Jun 2021 21:33:08 +0200
Message-ID: <20210614193309.20248-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210614193309.20248-1-krzysztof.kozlowski@canonical.com>
References: <20210614193309.20248-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210614_123316_293649_E197B673 
X-CRM114-Status: GOOD (  10.89  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210614193308.hfPw939torQImZxrGYLzSU5SrMX4G-j6GcwAfgrMalo@z>

The RTC on S2MPS13 PMIC can wakeup the system from suspend to RAM.
Add a generic property for this.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Link: https://lore.kernel.org/r/20210420164943.11152-11-krzysztof.kozlowski@canonical.com
---
 arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
index 773d9abe3a44..cbcc01a66aab 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
@@ -391,6 +391,7 @@ pmic@66 {
 		interrupts = <7 IRQ_TYPE_LEVEL_LOW>;
 		reg = <0x66>;
 		samsung,s2mps11-wrstbi-ground;
+		wakeup-source;
 
 		s2mps13_osc: clocks {
 			compatible = "samsung,s2mps13-clk";
-- 
2.27.0


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
