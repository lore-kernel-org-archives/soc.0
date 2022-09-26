Return-Path: <SRS0=MT2l=Z5=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FC9AC32771
	for <soc@archiver.kernel.org>; Mon, 26 Sep 2022 10:44:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4057EC433C1; Mon, 26 Sep 2022 10:44:09 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 59C3CC433D7
	for <soc@kernel.org>; Mon, 26 Sep 2022 10:44:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 59C3CC433D7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id bu25so8262087lfb.3
        for <soc@kernel.org>; Mon, 26 Sep 2022 03:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=rNWG4JRe++162NhDsfBIYQjTSKMyRVIRJUKX50ptAGY=;
        b=apxdxC/SZwYOVZdXn24zNBfDFMi7EsEuSmVWj/G5E7GAKkNZyQyX/ID4c6HnZkHbEo
         gVMD4bQFbeOrQzgMFGXt6eu5MdTVjYOiSSK3WpdMOafWWegTCyoqHnLWdZoGsGIyhy3k
         iLFE1mtY8NVMrsD6yL0AKE0H8fz4x5egsl7ImWlfltr1xExX2ugkok9daCAdEp1QVZCx
         RxOIL3VKv3EttfaNcX9i+6zAP8GaBP2BX9PjdQz+mZcSyK9cbMbVeRUgFOGLGd5rD+ei
         YEcX0uNahfhoa/VxgdTxGNAt//86dEk0bX3m5temSnsyOz5wgR7zNsnGVteXqUuJ1no+
         V0Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=rNWG4JRe++162NhDsfBIYQjTSKMyRVIRJUKX50ptAGY=;
        b=OqbB9gLn7AG2tlVPgVODKg/CyYX/s3x0nrZOSWbnoSGBHegd0a8EZJGd8NQ7iC8ooH
         c2Fris6U5wAT2KQlpOyFZHeb2DBuT9dQpnpN/SoFhl+Ig1PLxDwXtTstyjy7eXWgT+ZR
         EC4SOYwLplqxGb+dxiZ57aLjah2xqDScvZFknB9NJ6i44APgbj7R0iZ8tLv4Gcgcje/z
         ChKrnPxAoa6KGQkFBSo8fEr7KfZ9d5/HBjj2MQ1qpkDwZStrcUgcI4OvpZ/mzm3sr+N0
         H1TWDQq3B2UUaeWXdzaQqO4lrRfqQHfBmG2ZKIPGj4mPXhOfo6uPZUk1sIntkSyF3opK
         rBaw==
X-Gm-Message-State: ACrzQf3mVVpY/gMmVHCnjyOnXgK2T5AsfV9ZTT8+ZjMoWjQ0mXvyGVmJ
	MhapkhmiN9Cp4dOAoiB7N9DYp2oIqUvkZw==
X-Google-Smtp-Source: AMsMyM7CTPcD1Iie9wuX6WkBzCWvvWDCPmmDKnQ42CjusRkxdgW8d+lPCLtPFyFHH5xQbvrQRr7TgQ==
X-Received: by 2002:a19:4f01:0:b0:49c:94fc:1848 with SMTP id d1-20020a194f01000000b0049c94fc1848mr8103685lfb.415.1664189046445;
        Mon, 26 Sep 2022 03:44:06 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id y1-20020a05651c020100b0026c423959desm2313408ljn.25.2022.09.26.03.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 03:44:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Russell King <linux@armlinux.org.uk>,
	Kukjin Kim <kgene.kim@samsung.com>,
	Tomasz Figa <t.figa@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH PULL 1/2] ARM: dts: exynos: correct s5k6a3 reset polarity on Midas family
Date: Mon, 26 Sep 2022 12:43:53 +0200
Message-Id: <20220926104354.118578-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220926104354.118578-1-krzysztof.kozlowski@linaro.org>
References: <20220926104354.118578-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dmitry Torokhov <dmitry.torokhov@gmail.com>

According to s5k6a3 driver code, the reset line for the chip appears to
be active low. This also matches the typical polarity of reset lines in
general. Let's fix it up as having correct polarity in DTS is important
when the driver will be switched over to gpiod API.

Fixes: b4fec64758ab ("ARM: dts: Add camera device nodes for Exynos4412 TRATS2 board")
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Link: https://lore.kernel.org/r/20220913164104.203957-1-dmitry.torokhov@gmail.com
---
 arch/arm/boot/dts/exynos4412-midas.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos4412-midas.dtsi b/arch/arm/boot/dts/exynos4412-midas.dtsi
index b967397a46c5..8e1c19a8ad06 100644
--- a/arch/arm/boot/dts/exynos4412-midas.dtsi
+++ b/arch/arm/boot/dts/exynos4412-midas.dtsi
@@ -586,7 +586,7 @@ image-sensor@10 {
 		clocks = <&camera 1>;
 		clock-names = "extclk";
 		samsung,camclk-out = <1>;
-		gpios = <&gpm1 6 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpm1 6 GPIO_ACTIVE_LOW>;
 
 		port {
 			is_s5k6a3_ep: endpoint {
-- 
2.34.1

