Return-Path: <SRS0=qwHo=WQ=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F335ACCA47B
	for <soc@archiver.kernel.org>; Thu,  9 Jun 2022 11:40:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DBC63C341C7; Thu,  9 Jun 2022 11:40:39 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C4374C34114
	for <soc@kernel.org>; Thu,  9 Jun 2022 11:40:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C4374C34114
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id fd25so30838626edb.3
        for <soc@kernel.org>; Thu, 09 Jun 2022 04:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CXB5XzjU8LfwcLqwKO65LrYsijml7F+eyLiUznyo7HA=;
        b=YONyQm9OPL92w7ANCTIJJeD1A564n8Z/1Smd0v6dgfKJPFGxRDLYjiKDADO1PxCCna
         Q4QXUi70jYQGsAZVvcNsK/D990hxIjJTZ8s6+dyNOcdNzHo3WGnLNzWNnGD3sV7CLsn1
         H0JwnnGDPe7IHgx5pFvD1FYPasSi5GejvhOO4h55GGPELkO2Z5RP3v4ruhz8hqz9B5wN
         6cJV4FsVIZ/d+8AI3rjlyZ8a+3zhvdY/nsxFUlb7ZpBxgOglq2lwyzXD4YXRYgs8tS2h
         e/hDos3tX7KACP92eA1TVjDZLmV0+71XpJt/kMXQtKVOn2IbLJ5v36K7AJ1dmqczYdbl
         TrcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CXB5XzjU8LfwcLqwKO65LrYsijml7F+eyLiUznyo7HA=;
        b=kfPV78wIiyc0hexw0xw2VbjpNWI4FQlZh0Df+WSOG1/wxlaQnnASJlmqlHD1IioB5K
         AEseUzO2867z8oNgdEvB90172jOHRAvpMMfLmn1BAt9xGYb8Q+F/3hXdDAgCZK+2YjrF
         IC77RX+FtHhUCbUYn0U1F89XB+5pxuPllt/YrCePD9ViHDhYElyMg5ozKIGcHXYRTUZ4
         WOPkiHO5jqglMxyuTgiB77UWKj9bW6GPBXBNre3bHg+lQF2HOATzQLpTD6OL7yH+rYWs
         i9ZO4+JxVKacEsg2HwwlE3TF59AuA/8BdFXEQSUN27WLmz4SC3G2RzrlVwZAUAWY6mdi
         b2NA==
X-Gm-Message-State: AOAM533A1EjhhMe+x8GEyrLZiWTrO8v0Bp28idewvbNsilcWTOWNmMx6
	QqBqjzo1Bdnvuzg81EVcph60kQ==
X-Google-Smtp-Source: ABdhPJxUclF4ULlGFjz01jV+wOJBGG61wx/rlp8x0HAu8Yv6J08fW8jDciyDz5F/25kGVs9vASxfMw==
X-Received: by 2002:a05:6402:1f8c:b0:42d:c3a9:5beb with SMTP id c12-20020a0564021f8c00b0042dc3a95bebmr44617549edc.160.1654774838347;
        Thu, 09 Jun 2022 04:40:38 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id 10-20020a170906058a00b007101f6f0720sm7760844ejn.120.2022.06.09.04.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 04:40:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	soc@kernel.org,
	Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 34/48] ARM: dts: rockchip: rk3288-tinker: correct gpio-keys properties
Date: Thu,  9 Jun 2022 13:40:21 +0200
Message-Id: <20220609114026.380682-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
References: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gpio-keys children do not use unit addresses.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/rk3288-tinker.dtsi | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/rk3288-tinker.dtsi b/arch/arm/boot/dts/rk3288-tinker.dtsi
index 9c1e38c54eae..09618bb7d872 100644
--- a/arch/arm/boot/dts/rk3288-tinker.dtsi
+++ b/arch/arm/boot/dts/rk3288-tinker.dtsi
@@ -26,14 +26,12 @@ ext_gmac: external-gmac-clock {
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		#address-cells = <1>;
-		#size-cells = <0>;
 		autorepeat;
 
 		pinctrl-names = "default";
 		pinctrl-0 = <&pwrbtn>;
 
-		button@0 {
+		button {
 			gpios = <&gpio0 RK_PA5 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_POWER>;
 			label = "GPIO Key Power";
-- 
2.34.1

