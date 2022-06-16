Return-Path: <SRS0=sX7s=WX=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC238CCA479
	for <soc@archiver.kernel.org>; Thu, 16 Jun 2022 00:54:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 94153C3411A; Thu, 16 Jun 2022 00:54:38 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E2855C3411E
	for <soc@kernel.org>; Thu, 16 Jun 2022 00:54:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E2855C3411E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f51.google.com with SMTP id g16-20020a17090a7d1000b001ea9f820449so346167pjl.5
        for <soc@kernel.org>; Wed, 15 Jun 2022 17:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CXB5XzjU8LfwcLqwKO65LrYsijml7F+eyLiUznyo7HA=;
        b=VGry34Lsq0AAS5nS8T6G1tLJmFhnHD7ECJLqZEOUaJy7QdnDMbPqUOUZY6b0P6If+x
         3Uol647tBlTWP6/ZisPA7IHqknVh+L9peADwDRasaWhMrymZ41xMQwCp6s3Y4WwGB5pG
         Ds/a0MWQIUGMskAyAgZW3yACJAm/N0IzCY2sK5fuOPhKxxqhXCucmeW2oGgcCCuy8BxZ
         z+xri6fR8xTTHBaWhZj6XAfXbG8wl4u/ET6YjeKflaW24AurN7ZA/63448M5zw62FM3j
         +mRfFSzgTFX2ghXYud3l1uu4BGvm2tF6mzs61wuv5+waU2zF0CTi0+D8HNccvczicN5y
         e/qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CXB5XzjU8LfwcLqwKO65LrYsijml7F+eyLiUznyo7HA=;
        b=GwKS4Bot++MlV7co2eljacDzkgsR3O458zKez2rsIIIe+9gmgCb6V9ApgdK/fZd6aX
         /9FEL6GlAYpBnMs9qlmuwEFux11yZH0Xo3iMpvQIjL3/cbQtSvpE12tEcvBgQEQZ73/6
         AoX07woV+fa8lsEf1s7QqQmiBMGJ0LIbu8CBy4Xs6te3C9ZEzEa+CrNnUOlkT4Y7z6U+
         iGXmtEt7XYQUFAwZ7z2JDO93b8UGEWtCf0qE51ZfrCy7FLDyDIK7f+09X0m8bmtINB0D
         RR+ZvW1d1XhYu+p/LliTta9qDP7avzQpY2n+pv9t++38r48dJzFMeBvwWb9WDIn+hAjG
         gSIQ==
X-Gm-Message-State: AJIora+7XkLKp45A838DoDCBmyvA+hYa8CM+AdJT6uzqwB0v0jJTZl7G
	HE1hd7ZUdriPPx7AGXm9VwLgE1AGgusuJQ==
X-Google-Smtp-Source: AGRyM1tTJuVv6wY6oC6Dqloj1ueiXM7oVUn01PuF4hqwTjmcDmQnxyteBUfMI5SU0Y3/qkOFQiy+jw==
X-Received: by 2002:a17:902:f54c:b0:163:f64a:612c with SMTP id h12-20020a170902f54c00b00163f64a612cmr2228151plf.22.1655340876407;
        Wed, 15 Jun 2022 17:54:36 -0700 (PDT)
Received: from krzk-bin.. ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id p4-20020a170902780400b0016760c06b76sm233660pll.194.2022.06.15.17.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 17:54:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 28/40] ARM: dts: rockchip: rk3288-tinker: correct gpio-keys properties
Date: Wed, 15 Jun 2022 17:53:21 -0700
Message-Id: <20220616005333.18491-28-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
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

