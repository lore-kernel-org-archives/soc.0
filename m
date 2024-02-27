Return-Path: <SRS0=8RcH=KE=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 237D9C54798
	for <soc@archiver.kernel.org>; Tue, 27 Feb 2024 08:08:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DE938C433F1; Tue, 27 Feb 2024 08:08:08 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 04AA2C43390
	for <soc@kernel.org>; Tue, 27 Feb 2024 08:08:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 04AA2C43390
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-563f675be29so4139119a12.0
        for <soc@kernel.org>; Tue, 27 Feb 2024 00:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709021286; x=1709626086; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=trQx0OfRMQbxsApd/n3MseZdPGhNtXwXAK07FPTCiBg=;
        b=ZUQuQ8LGvOvvac2cFGVY9JhBFbRz7ZHxkEu3OH5OhurhGTqZhNQtrE8tUtiYjIqO42
         Db7fpXmUWLZ3mLZxNUdVeTUfdbvf1Ns4g7BcvjQun8UsjY1mAfTRBpaqd6RZ9AJa1Mu0
         rTaG/d7kgO5CxlZS3vLV4WI+IXAmZfq3HBLhbRwPMem1U8lX0Ns4Uu43UCPpU6EwoSxi
         3RbgB24hsHWGKmstCLEqHDebXGSbjLLO8gYraudHUakB/1RnDKb8ACMXm8tYmrzB8ILE
         S6EhM2LvbxAzOGpVK0Xk+zpKRxlDFCL44iezEp9XEKbfYoC+HUMOgvs67TEdW51Kf9Tw
         z6Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709021286; x=1709626086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=trQx0OfRMQbxsApd/n3MseZdPGhNtXwXAK07FPTCiBg=;
        b=d1im3zNtLxKmKXH54UXaHrDoKSi+77LMNIPo7KBgwTJtQKfgC4nqiyaSxDIR4l2hAf
         /d2+dVrvcAVuORXcl6Fd86EcnhTTp1TSQNQnMfH+kFciNq2yMJCa2sF0JPqnAPMPs/jT
         JKM5WbSkzEKPVGjCrthTKRpAb3WXg1lRvlx45hIjxX05y5hp/X/5k8dL9K3kAWOLSk5I
         TMrEsPxjilNrG1rhd0fN0cdbc8bBlDs0yz0zlB2jYe7f5LNR6Gtc/Z9ZrXI9/l/fG1kp
         miflHspH57CBF+Gj4wcy8Fqy4laQLxpZY/hIuZVhtiu4bFdRmz5a2mB1/ji0Zt4Bosix
         8pZA==
X-Forwarded-Encrypted: i=1; AJvYcCVvDLTgRqlmFg+J3wa8qI4JyTf3VQgicLl12SWl8XSlGL+YLbPvAzHelzAPhVWsc1mJCk6DChojGY6H/oP98g==
X-Gm-Message-State: AOJu0YzOSBHWDyKxj5o0z60lY4FplTIZbACuRjoOP9RU/5AudlJ6TAip
	JoJMiqw6wiI8f+0uVwZfOqBeCb+XSQZBM6vtzlWazkG0EKTyfXfRZ1qZ6QbIyv4=
X-Google-Smtp-Source: AGHT+IEnn4ZoBLr6QN1qXuyx3mJBtk/c9WxXrNxt6iO7Yiw9JjvAPGEUB00W3B8S2Fmrpo7bhflTVg==
X-Received: by 2002:aa7:cd4c:0:b0:566:4895:c582 with SMTP id v12-20020aa7cd4c000000b005664895c582mr146303edw.15.1709021286457;
        Tue, 27 Feb 2024 00:08:06 -0800 (PST)
Received: from krzk-bin.. ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id b22-20020aa7dc16000000b00564d7d23919sm509662edu.67.2024.02.27.00.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 00:08:06 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH PULL v6.9 2/3] ARM: defconfig: enable STMicroelectronics accelerometer and gyro for Exynos
Date: Tue, 27 Feb 2024 09:07:54 +0100
Message-Id: <20240227080755.34170-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240227080755.34170-1-krzysztof.kozlowski@linaro.org>
References: <20240227080755.34170-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Martin Jücker <martin.juecker@gmail.com>

Enable STMicroelectronics accelerometer and gyro drivers for the Samsung
P4note device family in exynos and multi_v7 defconfigs.

Signed-off-by: Martin Jücker <martin.juecker@gmail.com>
Link: https://lore.kernel.org/r/20231221230258.56272-2-martin.juecker@gmail.com
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/configs/exynos_defconfig   | 3 +++
 arch/arm/configs/multi_v7_defconfig | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index c98d5ff8a1ed..7ad48fdda1da 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -318,8 +318,11 @@ CONFIG_EXTCON_MAX77693=y
 CONFIG_EXTCON_MAX8997=y
 CONFIG_EXYNOS5422_DMC=y
 CONFIG_IIO=y
+CONFIG_IIO_ST_ACCEL_3AXIS=m
+# CONFIG_IIO_ST_ACCEL_SPI_3AXIS is not set
 CONFIG_EXYNOS_ADC=y
 CONFIG_STMPE_ADC=y
+CONFIG_IIO_ST_GYRO_3AXIS=m
 CONFIG_CM36651=y
 CONFIG_AK8975=y
 CONFIG_SENSORS_ISL29018=y
diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index ecb3e286107a..0d885cb61206 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -1150,6 +1150,8 @@ CONFIG_STM32_FMC2_EBI=y
 CONFIG_EXYNOS5422_DMC=m
 CONFIG_IIO=y
 CONFIG_IIO_SW_TRIGGER=y
+CONFIG_IIO_ST_ACCEL_3AXIS=m
+# CONFIG_IIO_ST_ACCEL_SPI_3AXIS is not set
 CONFIG_ASPEED_ADC=m
 CONFIG_AT91_ADC=m
 CONFIG_AT91_SAMA5D2_ADC=m
@@ -1169,6 +1171,7 @@ CONFIG_IIO_CROS_EC_SENSORS_CORE=m
 CONFIG_IIO_CROS_EC_SENSORS=m
 CONFIG_STM32_DAC=m
 CONFIG_MPU3050_I2C=y
+CONFIG_IIO_ST_GYRO_3AXIS=m
 CONFIG_CM36651=m
 CONFIG_IIO_CROS_EC_LIGHT_PROX=m
 CONFIG_SENSORS_ISL29018=y
-- 
2.34.1

