Return-Path: <SRS0=qwHo=WQ=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C1F5CCA473
	for <soc@archiver.kernel.org>; Thu,  9 Jun 2022 11:40:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 75F4FC3411B; Thu,  9 Jun 2022 11:40:58 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6573EC34114
	for <soc@kernel.org>; Thu,  9 Jun 2022 11:40:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6573EC34114
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id h19so30853964edj.0
        for <soc@kernel.org>; Thu, 09 Jun 2022 04:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QPYY8cZvI30w8ER/fK+cOf14ZzGBA9BCHkD+gscMWkQ=;
        b=ba9tS/9yDx6p3YctOfdOomzEOyFpkCTwCXlVq0NRt81wXewc1jKS5ajKfPid1M4iPA
         f0bRz2+goebpQ9JpwqlNmkBvRJB7jj5PKZnuyKgZCKOrFPO11bJD08rjnJajtTG82Kr1
         9+/a50S9k9hX8nY5V/RPuxknmTRSTMZpDOYnlym30cZ6f6dSOZqcboNVKHqOBYlBKBBS
         wHXzXlwwo5guqKlI0LzZgeKO07x2IxAm4SRz8/nN+vLCm2DZtXuGJ28n+7CPPcqd8DLJ
         tgdS2Dte0d9q9H4HFx1W5q3kIqT6P4l5saj1WjNH+h1a1msGx8F8tnWJehzKsc2tcnv7
         J5YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QPYY8cZvI30w8ER/fK+cOf14ZzGBA9BCHkD+gscMWkQ=;
        b=zRLNudxeJj9+2u5of4cEARBh4A3lqmMhGRYQZVo4YG1ZCYqQx0XHbjxtJZo4EhxUtB
         VDqFSiOPaxkkK2F4I5WNWD3hYPhvkYiHcO2qEXi7YPU2yVn4fhHcoR6K/QQKxXH3GpT/
         ytvYQqhGYPGggJKzUWRJZ0IVCDgwsHgvWf7gaS29zPsBOQoEH96hlzadiDn89ByNnpeM
         dgXt0qf2KPkenTgNJ/VNGR1S670ir6arXXBLgbFs6DWqEfRCYtRm+vIkImIcfESUrTl5
         DdsI9rmd4wCzr54aC3iU9gyOUC62YapuKJMJtmtF6rAq9/ONEySVzkvL++Q3zTG3V7Cr
         EBxQ==
X-Gm-Message-State: AOAM530oJoCw74v6qkJFX7sJuZ6bulBqdVNAa5HaZA/Yy0RJuQF5SfvZ
	w1L7CC/vZl94tT2aZdyzbOCRSQ==
X-Google-Smtp-Source: ABdhPJw68zqypVGGfQ1a4rssxPK/TfiBKSa4tSC0UkP1YZyhup+4T8pJBHl+SQ0ffRoqFi/7DjvqiQ==
X-Received: by 2002:aa7:c54b:0:b0:42d:be18:c261 with SMTP id s11-20020aa7c54b000000b0042dbe18c261mr44708606edr.267.1654774856916;
        Thu, 09 Jun 2022 04:40:56 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id bk2-20020a170906b0c200b006fef557bb7asm10498662ejb.80.2022.06.09.04.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 04:40:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 43/48] ARM: dts: aspeed: correct gpio-keys properties
Date: Thu,  9 Jun 2022 13:40:42 +0200
Message-Id: <20220609114047.380793-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
References: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gpio-keys children do not use unit addresses.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 2 --
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 2 --
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts  | 2 --
 3 files changed, 6 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
index afad8d732cc3..a6a2bc3b855c 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
@@ -189,8 +189,6 @@ vga_memory: region@bf000000 {
 
 	gpio-keys-polled {
 		compatible = "gpio-keys-polled";
-		#address-cells = <1>;
-		#size-cells = <0>;
 		poll-interval = <1000>;
 
 		event-fan0-presence {
diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index fc8222ea2dd0..bf59a9962379 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -179,8 +179,6 @@ pcieslot-power {
 
 	gpio-keys-polled {
 		compatible = "gpio-keys-polled";
-		#address-cells = <1>;
-		#size-cells = <0>;
 		poll-interval = <1000>;
 
 		event-fan0-presence {
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
index 6f6a35fe2caf..3f6010ef2b86 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
@@ -65,8 +65,6 @@ event-ps1-presence {
 
 	gpio-keys-polled {
 		compatible = "gpio-keys-polled";
-		#address-cells = <1>;
-		#size-cells = <0>;
 		poll-interval = <1000>;
 
 		event-fan0-presence {
-- 
2.34.1

