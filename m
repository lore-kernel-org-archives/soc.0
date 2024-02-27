Return-Path: <SRS0=8RcH=KE=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6BC2C54798
	for <soc@archiver.kernel.org>; Tue, 27 Feb 2024 08:08:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CD149C43390; Tue, 27 Feb 2024 08:08:11 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BEF18C4166B
	for <soc@kernel.org>; Tue, 27 Feb 2024 08:08:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BEF18C4166B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5643ae47cd3so5119694a12.3
        for <soc@kernel.org>; Tue, 27 Feb 2024 00:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709021289; x=1709626089; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iiVrva5DwInjSui+Br+HHATpx+xvm6PVi1TQNYfveV8=;
        b=L5qA5S8uq7cuOHp2JWJCXEL7WMC6rbyOXtllHBlHsS9tESgXAjqn++LrLFecIKq5Wm
         MfOI0LY/gjM/jricU1BLuWKk8R700BuA5NGXlsjcfVjjuPm8L8wRhPdk096f+j+rzYL6
         iq5SgO/tkeokHAqr2PFV24qwNIRN24+n0qAn6H4QfelFaG57BSQy75lxb8SFhNLVY/wV
         8ifclJ24Uu+f95QBvF+PScC21HTwiMu+RuhvO3a7+4mmXl0qh/npRKDF37pHzuGQCqp6
         o//ms7TuoGo5pAIUffQ2P5b+FeAyoHIJLwdJlCSr8DXQ4Fdi6gBzsKHRq+rwXdLz2Ujm
         Nnsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709021289; x=1709626089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iiVrva5DwInjSui+Br+HHATpx+xvm6PVi1TQNYfveV8=;
        b=Kxe5Iu/TRKxpBcFgj82i/dRsonrl26eU+cfYwnMHRxwn2SG7t/uCqVQKMK3x2LSoWz
         OEMMp9/SAyldpBeJ4qeAGrveMWoa13pAOjibHtDvNqiCDoCQj9aBamkggt3lmv4nGurW
         rhqu1mCXgo9pBBdZSBBdjqdRP0lm8JhtErH/179+5Sw7IitQRO8kZkyOt3TWduFL1TDt
         gfPOaqp511XP/Ea2PlAxGvhpfftIyqKgqHbOsHuUu03DYLcdI6ydllKo0b6Wy8V07m+q
         M3kv902aoftt+3UsTHvcpsyQH+zLBxZtzNDVTxUUtRwsNdN1aMnVs3MMx1TAI3mnjxQa
         oWyA==
X-Forwarded-Encrypted: i=1; AJvYcCWGHvYuENfbNIX0+Vl6BFSMijYKtGY+YzFXfdt9bdd2CfPdAfmxTL8rrW6F//02OYykyRHdJPDhYZ9CB8yIjg==
X-Gm-Message-State: AOJu0YxRMozjfQY18MOk+yBprTyjCqk2OSqcuFcczUg6PkyR64ldl+06
	4tWSb0XXhfDbIvNQ0BaBwQVr6p+/0rMj75m+0n5dKnSMb4BQw85yRHmj+vQHekg=
X-Google-Smtp-Source: AGHT+IEWM6Nm8SPJY4tlU/DHnXZcjC6HFHDjix8q780UPHj1OCYUYpjhUE82VyM26QICREgDnkRfTQ==
X-Received: by 2002:aa7:d349:0:b0:565:c34f:df4e with SMTP id m9-20020aa7d349000000b00565c34fdf4emr4938085edr.29.1709021289206;
        Tue, 27 Feb 2024 00:08:09 -0800 (PST)
Received: from krzk-bin.. ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id b22-20020aa7dc16000000b00564d7d23919sm509662edu.67.2024.02.27.00.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 00:08:08 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Artur Weber <aweber.kernel@gmail.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Henrik Grimler <henrik@grimler.se>
Subject: [PATCH PULL v6.9 3/3] ARM: dts: samsung: exynos4412: decrease memory to account for unusable region
Date: Tue, 27 Feb 2024 09:07:55 +0100
Message-Id: <20240227080755.34170-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240227080755.34170-1-krzysztof.kozlowski@linaro.org>
References: <20240227080755.34170-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Artur Weber <aweber.kernel@gmail.com>

The last 4 MiB of RAM on those devices is likely used by trustzone
firmware, and is unusable under Linux. Change the device tree memory
node accordingly.

The proprietary bootloader (S-BOOT) passes these memory ranges through
ATAG_MEM; this change allows us to have the correct memory ranges
without relying on ATAG_MEM.

Tested-by: Henrik Grimler <henrik@grimler.se> # i9300, i9305
Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
Link: https://lore.kernel.org/r/20240217-exynos4-memsize-fix-v1-1-7858e9c5f844@gmail.com
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/samsung/exynos4412-i9300.dts   | 2 +-
 arch/arm/boot/dts/samsung/exynos4412-i9305.dts   | 2 +-
 arch/arm/boot/dts/samsung/exynos4412-n710x.dts   | 2 +-
 arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4412-i9300.dts b/arch/arm/boot/dts/samsung/exynos4412-i9300.dts
index 61aca5798f38..b79d456e976d 100644
--- a/arch/arm/boot/dts/samsung/exynos4412-i9300.dts
+++ b/arch/arm/boot/dts/samsung/exynos4412-i9300.dts
@@ -18,7 +18,7 @@ / {
 
 	memory@40000000 {
 		device_type = "memory";
-		reg = <0x40000000 0x40000000>;
+		reg = <0x40000000 0x3fc00000>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/samsung/exynos4412-i9305.dts b/arch/arm/boot/dts/samsung/exynos4412-i9305.dts
index 77083f1a8273..1048ef5d9bc3 100644
--- a/arch/arm/boot/dts/samsung/exynos4412-i9305.dts
+++ b/arch/arm/boot/dts/samsung/exynos4412-i9305.dts
@@ -11,7 +11,7 @@ / {
 
 	memory@40000000 {
 		device_type = "memory";
-		reg = <0x40000000 0x80000000>;
+		reg = <0x40000000 0x7fc00000>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/samsung/exynos4412-n710x.dts b/arch/arm/boot/dts/samsung/exynos4412-n710x.dts
index 0a151437fc73..eee1000dea92 100644
--- a/arch/arm/boot/dts/samsung/exynos4412-n710x.dts
+++ b/arch/arm/boot/dts/samsung/exynos4412-n710x.dts
@@ -9,7 +9,7 @@ / {
 
 	memory@40000000 {
 		device_type = "memory";
-		reg = <0x40000000 0x80000000>;
+		reg = <0x40000000 0x7fc00000>;
 	};
 
 	/* bootargs are passed in by bootloader */
diff --git a/arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi b/arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi
index 39a3d1cbe4c3..28a605802733 100644
--- a/arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi
@@ -23,7 +23,7 @@ / {
 
 	memory@40000000 {
 		device_type = "memory";
-		reg = <0x40000000 0x80000000>;
+		reg = <0x40000000 0x7fc00000>;
 	};
 
 	aliases {
-- 
2.34.1

