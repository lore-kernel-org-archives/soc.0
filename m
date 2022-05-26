Return-Path: <SRS0=d1J0=WC=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAA0BC433EF
	for <soc@archiver.kernel.org>; Thu, 26 May 2022 20:42:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B12BEC3411C; Thu, 26 May 2022 20:42:27 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EDE4CC36AE3
	for <soc@kernel.org>; Thu, 26 May 2022 20:42:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EDE4CC36AE3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id u20so3160013edd.6
        for <soc@kernel.org>; Thu, 26 May 2022 13:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6PoGfKqwaOSA8hY2KbOckVLUzTs3Q4Jc3iaXuQGoRpA=;
        b=s7sEBaSU1vzd54sOOs0rZZNg9jOLdNNbwjwpFo7NPaSSc3/EKIKfGfGqUmjfhdBIZu
         tB3MOE4n0cSRKiu3kMyc9QWQPlCIxLXlFngGQ99MiTppR/kW6DZ2r6vPXjZxisDjDaYy
         k13/DLeamBpnmEzAc+1qsZ1L6InFRZoR/BKSyKI7UfsHpX3PqVH6BgrO/pw4iEh3fnfA
         aDN7/ymbV30iKKJ5/2YpkRPQks9rvdQYpsQEtIyoocUVncRWur4ETpIxqQ7iRrdx9vvs
         r0DbsSw+JAaC5BiER/ilnIVQPfvqwa4W+hnWDhdh1zk68xbe2pzmpU0TmUMNdL8vN6EL
         84Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6PoGfKqwaOSA8hY2KbOckVLUzTs3Q4Jc3iaXuQGoRpA=;
        b=TU8tna1ILuO/6Aw86DeKSmP7IH/VuWC1Im9+OL90DWeC/aDn2Xc5eB8fGR3N7yVNvH
         D7H9fSv5BL4bE+HseX/qvT1NSl5hyzOPvgtRHTP2777I+VKCp49hFTuiy0gCfxRxvGln
         BrxvQpIMymeTkD1WkfbjJyPxO6zG9NNw4IMwqZFWc0uNJMKsqnd5ns8hLezI0OWnpHWA
         CdmIZWwrLEx8h0SZsS65adtCJwxIKFn65qgTMX5wqKIzx9Ly41oePEUrkU25CWKDWYsv
         UOKox6i58qQD37sLErpZBh67dNbVumRFeTf2bAd3cLjQ1nKNWUxEyrLam+NOISQGOFGo
         DNjw==
X-Gm-Message-State: AOAM530pIDQtkKQMHghQle+GFCOuatjoezSot8HdOS92bwU0sEiUKluS
	F/NJNQM323Ua6jac3CcLVBuohA==
X-Google-Smtp-Source: ABdhPJx7r6j+aBTRisTlPBtzTk+q8WC0quei+dan1fVS+/Wp2DlSJGxhdl7sKtt7zczYJvjIFb1ifA==
X-Received: by 2002:a05:6402:90d:b0:428:c1ad:1e74 with SMTP id g13-20020a056402090d00b00428c1ad1e74mr41662182edz.345.1653597745304;
        Thu, 26 May 2022 13:42:25 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id r17-20020a50d691000000b0042617ba6389sm1239732edi.19.2022.05.26.13.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 13:42:24 -0700 (PDT)
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
Subject: [PATCH 2/3] ARM: dts: rockchip: adjust whitespace around '='
Date: Thu, 26 May 2022 22:42:17 +0200
Message-Id: <20220526204218.832029-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220526204218.832029-1-krzysztof.kozlowski@linaro.org>
References: <20220526204218.832029-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix whitespace coding style: use single space instead of tabs or
multiple spaces around '=' sign in property assignment.  No functional
changes (same DTB).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Output compared with dtx_diff and fdtdump.
---
 .../arm/boot/dts/rk3288-veyron-broadcom-bluetooth.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/rk3288-veyron-broadcom-bluetooth.dtsi b/arch/arm/boot/dts/rk3288-veyron-broadcom-bluetooth.dtsi
index a10d25ac8f7b..f9dde0eef527 100644
--- a/arch/arm/boot/dts/rk3288-veyron-broadcom-bluetooth.dtsi
+++ b/arch/arm/boot/dts/rk3288-veyron-broadcom-bluetooth.dtsi
@@ -13,10 +13,10 @@ bluetooth {
 			    <&bt_dev_wake>;
 
 		compatible = "brcm,bcm43540-bt";
-		host-wakeup-gpios	= <&gpio4 RK_PD7 GPIO_ACTIVE_HIGH>;
-		shutdown-gpios		= <&gpio4 RK_PD5 GPIO_ACTIVE_HIGH>;
-		device-wakeup-gpios	= <&gpio4 RK_PD2 GPIO_ACTIVE_HIGH>;
-		max-speed		= <3000000>;
-		brcm,bt-pcm-int-params	= [01 02 00 01 01];
+		host-wakeup-gpios = <&gpio4 RK_PD7 GPIO_ACTIVE_HIGH>;
+		shutdown-gpios = <&gpio4 RK_PD5 GPIO_ACTIVE_HIGH>;
+		device-wakeup-gpios = <&gpio4 RK_PD2 GPIO_ACTIVE_HIGH>;
+		max-speed = <3000000>;
+		brcm,bt-pcm-int-params = [01 02 00 01 01];
 	};
 };
-- 
2.34.1

