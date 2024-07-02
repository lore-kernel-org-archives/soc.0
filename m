Return-Path: <SRS0=GM+A=OC=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F08CBC3064D
	for <soc@archiver.kernel.org>; Tue,  2 Jul 2024 06:35:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D0B78C4AF0A; Tue,  2 Jul 2024 06:35:28 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D6637C32781
	for <soc@kernel.org>; Tue,  2 Jul 2024 06:35:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D6637C32781
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-36743abace4so3092513f8f.1
        for <soc@kernel.org>; Mon, 01 Jul 2024 23:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719902126; x=1720506926; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YuYZGZ40f/s8XcHh1CN5VPY9ouyMrtb4uHYgJzugWIk=;
        b=XbRsOvL85hoACpPHFocQBrdIPECGGMYk8FX/2AIsDozJ+x5772JfcfQQZYclyaMHNo
         qlOSS5vCyg4YuDeh2ofycL7e+5va8TY3E4KWxTLX5SaoBM51KhD7ECPddhDueIkkYRc8
         xMBkbqpyyTYKLdDBXaeYJallH8/eNYaBx8A9oKitqOk3QqJTWH6lmWz1Z0IJeE5ySXcn
         Tn8Z8OofUiMCkThgJ2KR49OR7AFVZoBXFKIvZYj5nhGBnj36gYqH/ryFQwoxU7VGoT59
         EtA0s75Ee6RKDswPTDTZmsNR6BNLQJAh79pAuv37ypKDPpVfcQ9rXIMw5+ZvGtUFmyke
         4kgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719902126; x=1720506926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YuYZGZ40f/s8XcHh1CN5VPY9ouyMrtb4uHYgJzugWIk=;
        b=U/E1DreSe8Dr2FS5FfdcMnR4ksZrJeaTXxqvI5k4XY0u0W26IACm0C6i5CDfxlGKb0
         gr0rFrgfMBDEsSe+vikYWcnrjc2U8LWWNxKlM42CzxFNphwfOBz6g5ltR17CNIagjBW0
         J1Vu49ZSlJMLC/nbxm69UqOm9m5NjBIA9nL8TcBJd2t0euhknFjD7iTyDTTVTZ4k47wq
         hP/h033dwfh39PFs9paBtm8Elu56oicfsrFDevLq6A3DP0sONrK/nMGPFmk/WC5qGNef
         2TSHqb3zvNLad55WoyEF3Luo4EKjAvrZgQ3eJdIv9T3jSxv4mkqy+MDYiPJDGCc5xX9p
         uXLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkiuGg1Fr3kLicYjlQrRAd0tA/lQGbv5rk/XCqFD1oC21rzlN1mK3NsoJMTOHHHD3q6f2osIXId3msBDAbDA==
X-Gm-Message-State: AOJu0YyI4OXOZdNih44/eb+0ApICbXomaLiJW6IlD2LyRKwp8a7DnRJ+
	66BLHR2T0Kg2hObBCUZnLZSj265nC6RK5TLTlcVauVnNVWynZkBEcvmLBu+Qbc4=
X-Google-Smtp-Source: AGHT+IFI7VpeBKngghf1BDh4qiD7nSZGmJvuVWoA0SVM8DHGI+moLOYhWPfN9qlnXfGnLd0yCMjbbA==
X-Received: by 2002:a05:6000:1846:b0:365:aec0:e191 with SMTP id ffacd0b85a97d-36760a7c1demr12168539f8f.21.1719902126151;
        Mon, 01 Jul 2024 23:35:26 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a1030dfsm12150875f8f.100.2024.07.01.23.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 23:35:25 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [GIT PULL 2/2 PATCH - drivers] soc: samsung: exynos-pmu: add support for PMU_ALIVE non atomic registers
Date: Tue,  2 Jul 2024 08:35:09 +0200
Message-ID: <20240702063514.6215-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240702063514.6215-1-krzysztof.kozlowski@linaro.org>
References: <20240702063514.6215-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peter Griffin <peter.griffin@linaro.org>

Not all registers in PMU_ALIVE block support atomic set/clear operations.
GS101_SYSIP_DAT0 and GS101_SYSTEM_CONFIGURATION registers are two regs
where attempting atomic access fails.

As documentation on exactly which registers support atomic operations is
not forthcoming. We default to atomic access, unless the register is
explicitly added to the tensor_is_atomic() function. Update the comment
to reflect this as well.

Reviewed-by: Will McVicker <willmcvicker@google.com>
Tested-by: Will McVicker <willmcvicker@google.com>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Link: https://lore.kernel.org/r/20240628223506.1237523-4-peter.griffin@linaro.org
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soc/samsung/exynos-pmu.c            | 22 ++++++++++++++++++---
 include/linux/soc/samsung/exynos-regs-pmu.h |  4 ++++
 2 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index fd8b6ac06656..a0123070a816 100644
--- a/drivers/soc/samsung/exynos-pmu.c
+++ b/drivers/soc/samsung/exynos-pmu.c
@@ -129,14 +129,30 @@ static int tensor_set_bits_atomic(void *ctx, unsigned int offset, u32 val,
 	return ret;
 }
 
-static int tensor_sec_update_bits(void *ctx, unsigned int reg,
-				  unsigned int mask, unsigned int val)
+static bool tensor_is_atomic(unsigned int reg)
 {
 	/*
 	 * Use atomic operations for PMU_ALIVE registers (offset 0~0x3FFF)
-	 * as the target registers can be accessed by multiple masters.
+	 * as the target registers can be accessed by multiple masters. SFRs
+	 * that don't support atomic are added to the switch statement below.
 	 */
 	if (reg > PMUALIVE_MASK)
+		return false;
+
+	switch (reg) {
+	case GS101_SYSIP_DAT0:
+	case GS101_SYSTEM_CONFIGURATION:
+		return false;
+	default:
+		return true;
+	}
+}
+
+static int tensor_sec_update_bits(void *ctx, unsigned int reg,
+				  unsigned int mask, unsigned int val)
+{
+
+	if (!tensor_is_atomic(reg))
 		return tensor_sec_reg_rmw(ctx, reg, mask, val);
 
 	return tensor_set_bits_atomic(ctx, reg, val, mask);
diff --git a/include/linux/soc/samsung/exynos-regs-pmu.h b/include/linux/soc/samsung/exynos-regs-pmu.h
index aa840ed043e1..f411c176536d 100644
--- a/include/linux/soc/samsung/exynos-regs-pmu.h
+++ b/include/linux/soc/samsung/exynos-regs-pmu.h
@@ -657,4 +657,8 @@
 #define EXYNOS5433_PAD_RETENTION_UFS_OPTION			(0x3268)
 #define EXYNOS5433_PAD_RETENTION_FSYSGENIO_OPTION		(0x32A8)
 
+/* For Tensor GS101 */
+#define GS101_SYSIP_DAT0					(0x810)
+#define GS101_SYSTEM_CONFIGURATION				(0x3A00)
+
 #endif /* __LINUX_SOC_EXYNOS_REGS_PMU_H */
-- 
2.43.0

