Return-Path: <SRS0=LZ/0=FO=linaro.org=manivannan.sadhasivam@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF53AC4167B
	for <soc@archiver.kernel.org>; Thu, 10 Dec 2020 09:41:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9116423B31; Thu, 10 Dec 2020 09:41:22 +0000 (UTC)
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65434235F7
	for <soc@kernel.org>; Thu, 10 Dec 2020 09:41:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65434235F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=manivannan.sadhasivam@linaro.org
Received: by mail-pg1-f195.google.com with SMTP id n1so987540pge.8
        for <soc@kernel.org>; Thu, 10 Dec 2020 01:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JskjQWgfypeIKGWugK6DSL0/UV0J4tau2NvfoPVqu3U=;
        b=q5fsQlVBZMnUMd0KXKLISBawepzq4H3GJXROCStuwBHbp2w+AZcdpn3sMjkIa1WCoR
         fIiKAvEOxOLL69xaPlsswyd8OHRmGIh/Si/YszNWhc8JlhWN181nufkzKpTSM31SuHUp
         sXntDGCLxKVIqIYGQupjBAUUazIqXFlAEKxLzHBGeF8B3dk9HuOmxCGgWcVSgGBlCSL9
         no1h55rMRO51F/lEyMs6G1S2dPsGdjGZfibdirZO4Lc7m/r51nrBLAyvHKYCgyMP7eQh
         ELWg+Ugvl76s1cn+Fp5VBSvpmiqF+4xfgIjAVtAmhzRads2mxHJzzz9OU969wGl+YaGJ
         NXKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JskjQWgfypeIKGWugK6DSL0/UV0J4tau2NvfoPVqu3U=;
        b=Zvry9xdBnjWUFsOunVCFzxDcuuE+duH2nwd+GdZfjwXrqkcJOD4Ne4UoCCPYx2BU8A
         QyaAniXQt9AdgeUnPTc9xoEc8x2HTOUJKyI1xwAS7DSlPOORN/w014fJ2hUDl81uCjTp
         7H86HNoY+o7yh/q2XTJxeZ+c/ArBfUdUsogboav82C6Nl1OcvBpKlxP5aAxcr3N0ZFmF
         HxPAogwCYe4v5eYn811Kw58qmwXJWAHMe2YDx6OKsNGYzzXSnOJyKgVrNSx7RNcZWfNC
         waCFv0dqGR70wR2O0YFfdPH52NwZqPR6J8xOxz3Rt8pqoLLJP0wx+J6r4Jo8DJi0kz5G
         /Lxg==
X-Gm-Message-State: AOAM5323uXs8T+a7/K+jVxj2cwXKzxCQro9twy72IzTZ2rfZb2ZZ4eKH
	YxHkH7kKANZpqJK/8Pwsnd6QOLbPSgRt
X-Google-Smtp-Source: ABdhPJzkJzLgnam7UXnQaYh5n7LF0aISWk3YiRx8Yfe/fP4hCprg6QKPCdA7LwpUAu+xUp5SU0o4Vw==
X-Received: by 2002:a17:90b:f16:: with SMTP id br22mr4405089pjb.221.1607593281273;
        Thu, 10 Dec 2020 01:41:21 -0800 (PST)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id i11sm5573957pfo.129.2020.12.10.01.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 01:41:20 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH] arm64: dts: bitmain: Use generic "ngpios" rather than "snps,nr-gpios"
Date: Thu, 10 Dec 2020 15:10:56 +0530
Message-Id: <20201210094056.54553-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>

This is to remove similar errors as below:

OF: /.../gpio-port@0: could not find phandle

Commit 7569486d79ae ("gpio: dwapb: Add ngpios DT-property support")
explained the reason of above errors well and added the generic
"ngpios" property, let's use it.

Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---

Arnd, Olof: I just have this single patch for Bitmain platform this cycle.
So sending it directly.

 arch/arm64/boot/dts/bitmain/bm1880.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/bitmain/bm1880.dtsi b/arch/arm64/boot/dts/bitmain/bm1880.dtsi
index fa6e6905f588..53a9b76057aa 100644
--- a/arch/arm64/boot/dts/bitmain/bm1880.dtsi
+++ b/arch/arm64/boot/dts/bitmain/bm1880.dtsi
@@ -127,7 +127,7 @@ porta: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
 				gpio-controller;
 				#gpio-cells = <2>;
-				snps,nr-gpios = <32>;
+				ngpios = <32>;
 				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
@@ -145,7 +145,7 @@ portb: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
 				gpio-controller;
 				#gpio-cells = <2>;
-				snps,nr-gpios = <32>;
+				ngpios = <32>;
 				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
@@ -163,7 +163,7 @@ portc: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
 				gpio-controller;
 				#gpio-cells = <2>;
-				snps,nr-gpios = <8>;
+				ngpios = <8>;
 				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
-- 
2.25.1

