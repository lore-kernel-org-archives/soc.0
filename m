Return-Path: <SRS0=R97b=LI=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9FADC2B9F4
	for <soc@archiver.kernel.org>; Mon, 14 Jun 2021 19:33:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 94031611BE; Mon, 14 Jun 2021 19:33:16 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3692761246
	for <soc@kernel.org>; Mon, 14 Jun 2021 19:33:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3692761246
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=krzysztof.kozlowski@canonical.com
Received: from mail-ed1-f69.google.com ([209.85.208.69])
	by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lssKg-00009d-OH
	for soc@kernel.org; Mon, 14 Jun 2021 19:33:14 +0000
Received: by mail-ed1-f69.google.com with SMTP id u26-20020a05640207dab02903935beb5c71so15020219edy.3
        for <soc@kernel.org>; Mon, 14 Jun 2021 12:33:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P0NAZ9mvHQKtho19Kodk6x42SkLdwGG//84ME/Va0gs=;
        b=AF+zIYkw/Ewb22wpJQvFK3Vjamj6A7vR/1U/3OOar8Un5LgknsFWNgbtOXkhwvG/wu
         NNV/ngssoRolE6X4MI10cTqCVEuQj5cpzvWomE2cW0LkiaLMvxhVIJt+8cw2kmwJ+4ps
         yeRKmmoAYSVZv/dUDEYq/F+dZ5ygkokoYCf/N7FsVhKLZkNr1juos7qOoyKT1Tuow/KS
         kAX5lPCM58OtIwCvynloyLryZtpASiMlz2/+AmvQA9JPK91dkJI/IXbuqJm7O4DXrbq8
         e/XAH3R9cehnbfiw4BCNRZiWRAGQmGDditv/SWzPFGLS4mBBHAuvVhiAwR2oULAgsMDg
         9TCA==
X-Gm-Message-State: AOAM531IjzSpB30laqO3jLWxd47wf0Mqh/s32X4PS8sn8sSILccxOLZI
	46SkpHosrlA6YQ16OG+ygx6q/bjIZ9BpV0qotFl4n1R10Awo4Plpvjvf73JgDW8+CDYOgTExRlB
	FP0Lopqfw3Im88VlRNfT5MUw=
X-Received: by 2002:a17:907:948c:: with SMTP id dm12mr16836647ejc.484.1623699194475;
        Mon, 14 Jun 2021 12:33:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyegN5ZDLDC6CBLPN9tGzm/ZZQeDNEXIQaiFCbsU2xFKTD2cPTtg93ymP/DXtEWH2egOhXeeA==
X-Received: by 2002:a17:907:948c:: with SMTP id dm12mr16836631ejc.484.1623699194295;
        Mon, 14 Jun 2021 12:33:14 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id gw7sm8029291ejb.5.2021.06.14.12.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 12:33:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 1/2][PATCH] arm64: dts: exynos: enable PMIC wakeup from suspend on TM2
Date: Mon, 14 Jun 2021 21:33:08 +0200
Message-Id: <20210614193309.20248-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210614193309.20248-1-krzysztof.kozlowski@canonical.com>
References: <20210614193309.20248-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

