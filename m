Return-Path: <SRS0=m72a=UF=gmail.com=singh.kuldeep87k@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E38B8C433F5
	for <soc@archiver.kernel.org>; Sat, 26 Mar 2022 04:23:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CBF7CC340F0; Sat, 26 Mar 2022 04:23:42 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 321BDC340EE;
	Sat, 26 Mar 2022 04:23:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 321BDC340EE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id z128so7993663pgz.2;
        Fri, 25 Mar 2022 21:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tCBIirOoy5iS39x42QQNsgyY9hPVbW/ZEOeOJnVZ7v8=;
        b=QFvSXLdhCIUgHlJ9CNoBWgTctPTXj+vQlBGdg+9egYM+RsBS3cR0JpeqLpFlNiSF8q
         Jd315vBb8BuJQfNX30bOfiLz8V1P++IfjSt33kutn9VvYSEkOc7w2vySwl7ZplxOiHcA
         I5xZbBS4YhrnFTog61QHn6lSdAhEreGOx4lpbvzCoOEgGZR422mNDE24N0XqTV+P96od
         r1fE4av/5hTsMD6CFA6WDxZY0VwddE495H5ZLNk4UB6ndHTGjnfX9iQ7Om0N+4VJaXmt
         YawZL/9c+oSMdCaXkRyZn1UhY7LXJ0wcIwP3NxxIChoqMQ40DiOnudIGpabe1eZHOIca
         q14w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tCBIirOoy5iS39x42QQNsgyY9hPVbW/ZEOeOJnVZ7v8=;
        b=VLOlsjekkIaQvx2b+gr0zO1kTNPGPM8wxLOtTl/7CS+9+ZCpIH+DoCFv12rPUBo3eG
         4pnuL6Bfo1Orv+UMIjamMqtPMXjmW7dclqFLBtEGuJcrtad3AHPVggw3dr5nIznL13BV
         7q/PBwtfGp6mcORQyVryD0CsREjfgk1+0CNvNxGmEFzxegAnZ1GE3YZAkmxwFUUYLapn
         DMoQ2AsKtnYy9xY6IW1b2Ob4BcyouT2Tv5crWjZQhszZyXZVurIS1TitdkmGQIi9MP14
         dYqVgdquXTVbPdsRkjvk2rkm48AzgP2aHq6/AtCjyPDOBI2vARVo3fTh3uO2X+r8d+Ba
         9yYg==
X-Gm-Message-State: AOAM532WXGsWODqzQpDL6a7Ol84Db5KYbEZiAUgweC6TrP5VH2HrgXya
	JJIbhDOdLZzmdIRjekxkonfKM1nvg60=
X-Google-Smtp-Source: ABdhPJy0ZYgrO1Ufw88z6oXuVsGtavi/8aXUm5ged1ojhDNufuTsxxFq8trQv2tmfz5Z9FK8hoc3Nw==
X-Received: by 2002:a05:6a00:140f:b0:4e0:6995:9c48 with SMTP id l15-20020a056a00140f00b004e069959c48mr13242222pfu.59.1648268621662;
        Fri, 25 Mar 2022 21:23:41 -0700 (PDT)
Received: from localhost.localdomain ([122.161.51.18])
        by smtp.gmail.com with ESMTPSA id gd10-20020a17090b0fca00b001c75d6a4b18sm7457544pjb.14.2022.03.25.21.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Mar 2022 21:23:41 -0700 (PDT)
From: Kuldeep Singh <singh.kuldeep87k@gmail.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH 1/4] ARM: dts: spear13xx: Update SPI dma properties
Date: Sat, 26 Mar 2022 09:53:09 +0530
Message-Id: <20220326042313.97862-2-singh.kuldeep87k@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220326042313.97862-1-singh.kuldeep87k@gmail.com>
References: <20220326042313.97862-1-singh.kuldeep87k@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reorder dmas and dma-names property for spi controller node to make it
compliant with bindings.

Fixes: 6e8887f60f60 ("ARM: SPEAr13xx: Pass generic DW DMAC platform data from DT")
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Kuldeep Singh <singh.kuldeep87k@gmail.com>
---
 arch/arm/boot/dts/spear13xx.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/spear13xx.dtsi b/arch/arm/boot/dts/spear13xx.dtsi
index c87b881b2c8b..913553367687 100644
--- a/arch/arm/boot/dts/spear13xx.dtsi
+++ b/arch/arm/boot/dts/spear13xx.dtsi
@@ -284,9 +284,9 @@ spi0: spi@e0100000 {
 				#size-cells = <0>;
 				interrupts = <0 31 0x4>;
 				status = "disabled";
-				dmas = <&dwdma0 4 0 0>,
-					<&dwdma0 5 0 0>;
-				dma-names = "tx", "rx";
+				dmas = <&dwdma0 5 0 0>,
+					<&dwdma0 4 0 0>;
+				dma-names = "rx", "tx";
 			};
 
 			rtc@e0580000 {
-- 
2.25.1

