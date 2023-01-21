Return-Path: <SRS0=smpC=5S=gmail.com=markuss.broks@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16816C54EAA
	for <soc@archiver.kernel.org>; Sat, 21 Jan 2023 20:17:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EBF6DC433A4; Sat, 21 Jan 2023 20:17:05 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 21066C433EF;
	Sat, 21 Jan 2023 20:17:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 21066C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id y11so10335297edd.6;
        Sat, 21 Jan 2023 12:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vwQ17Lcm2IqVHFAnePP290nHJ1hZODiXeBdsdtLFjw0=;
        b=og6pcBTr7D5pvRAyb42Xz9xPybTt/oSalzP9ZnazP+9M6yvHv4mY8Oay4TZZ30YCAE
         ZF9cJqyHK1Lj4QwHX7GAB9heole1WE3Fm90cyphLTL4M7d+BwSaTwpZL2BfiVpgSVGb6
         Xe/zdIUtouTNVHg9x9mwe4ZAAWvu4N3x/qaWa3q8cMPVwjfEBqVxXqZv3L0BaGiEuI8k
         sNfcmKhPHhJG0BPz35SQjyfxmbm0xVVbxQeyHzFczzxD9PJ3BY1FPH/LjUdSKSwG/Fod
         LytxM5IppXP34nJODQNXHNshM4QNBCmnjCnR31LELLAeDt6fNs/Wj8KLLVEzbEFwC43s
         9Xag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vwQ17Lcm2IqVHFAnePP290nHJ1hZODiXeBdsdtLFjw0=;
        b=XXM0QFeUjwnKYMuN6KO7W+IfcldDWkCFydJiqyXc/pe7FbWflLrGqLCJ2k5an5AgtX
         NdGsGQHGU7kcvMQxWNeXmeIVfgte/j++if4N47ezjQvEfXXLj9TgviFhir1p061RwX5s
         BaeQDD3Zum6V5MUsRum9EqIX1Fb2Sm52KeozBQ0Z5Q+ZrFTsj9PF0oDGYWjsQjuPRYgI
         cZw5WY+WicwnOQQXg+r7bgQWlGOe99dZT/vIbVLeHN/yLmfkdEzAJfLOcuB6iRmZE322
         TwJk+hw+FugbUDaZxsSXFborMl7pWe1qcwbPWvM8xJlyIBkdcCx1Dp75vTR354uB8EZN
         8y0Q==
X-Gm-Message-State: AFqh2kqMwjaG/qhmToSMluaQW61EvEVPhBJHpciAyCP0TYT3O9WHsAKo
	2AzVB5QNwE2EqRMLJYDVzcP4uasFV1HXwg==
X-Google-Smtp-Source: AMrXdXuZy15B5at4aDuBC8tmWa1tu5zz1apWtInK+RxXxiD/ErduWlS9FrOJ57gVeucx/z8H5uzKJA==
X-Received: by 2002:a05:6402:448a:b0:472:46bf:fb3c with SMTP id er10-20020a056402448a00b0047246bffb3cmr31774598edb.35.1674332223207;
        Sat, 21 Jan 2023 12:17:03 -0800 (PST)
Received: from localhost.localdomain ([194.39.226.133])
        by smtp.gmail.com with ESMTPSA id g8-20020aa7d1c8000000b0049e1f167956sm8278427edp.9.2023.01.21.12.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jan 2023 12:17:02 -0800 (PST)
From: Markuss Broks <markuss.broks@gmail.com>
To: linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Markuss Broks <markuss.broks@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH 1/2] arm: dts: exynos5420: Use Exynos5420 compatible for the MIPI video phy
Date: Sat, 21 Jan 2023 22:16:48 +0200
Message-Id: <20230121201650.46560-2-markuss.broks@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230121201650.46560-1-markuss.broks@gmail.com>
References: <20230121201650.46560-1-markuss.broks@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For some reason, the driver adding support for Exynos5420 MIPI phy
back in 2016 wasn't used on Exynos5420, which caused a kernel panic.
Add the proper compatible for it.

Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 arch/arm/boot/dts/exynos5420.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 9f2523a873d9..62263eb91b3c 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -592,7 +592,7 @@ dp_phy: dp-video-phy {
 		};
 
 		mipi_phy: mipi-video-phy {
-			compatible = "samsung,s5pv210-mipi-video-phy";
+			compatible = "samsung,exynos5420-mipi-video-phy";
 			syscon = <&pmu_system_controller>;
 			#phy-cells = <1>;
 		};
-- 
2.39.0

