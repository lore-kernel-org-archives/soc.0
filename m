Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA7F204591
	for <soc@lists.linux.dev>; Wed, 12 Feb 2025 22:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739400244; cv=none; b=M9yk+bjXjRFq3ANJ0mspaCPTC5dFMLTEK9MjTns6dDsJAqhuJtSvhJ1jlZzJKuphQX+F5BIilrMH3ZXqgTp/8F0XsKLLGoBv7q5zcwurSBwMGFEFcmg2UljKAaSYejJyve16NkABZFZLbmM2BvKua0IztpclJZjWp5S3KjG94K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739400244; c=relaxed/simple;
	bh=t3iU1UscP0tUm31GY4qui/qjT0vBitVzdrh6XZyTclQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u8WBV9mWcH3ji/JMPGsRQPTwnKsAYfKs8XOZ7Uoq8EfZmmCBU97gJ/Xweg1EzOrous7ZfRAR+n6SQliM/LruI6HI9x4x/LjfS2pvtStW6Hdiuo2ldsPW52AJwmKIDU1Aax/0CREXrCpICWdIu7iwABkzSQfT/i1Pwt+/hlTSjnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=laBrrhGR; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="laBrrhGR"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-aaec111762bso35229166b.2
        for <soc@lists.linux.dev>; Wed, 12 Feb 2025 14:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739400241; x=1740005041; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z/tKyZfoRbPPUzYf6dFYLKfwilr+YnZbdz/u2PhFyVc=;
        b=laBrrhGRaSgnXXVTvOrmPVYBBuXhfgXLWEkiKm6Ku3BAGo1qDVjdkp9cHvKpYpN174
         JIiZmWnAg+awmI6eqJYcVU9gB3+iIn3RzHXeTdf+g6lB+PwoakScEXmdoE0UJDdSBdbf
         rkTfaTKbUh6/U1eC+vosUd8A0vu8lzk7o4GuWG+xzLLd9/hXqVdxKDH2INZyUVGkKGj3
         jZ2GZbU4/BmsMZRfHRJbKQjhGsXfxg8DMKmfjQT7PZOXy6SnCNrinviaZXAoPVmORMxI
         7UtZrZtZi9d7CfL/o0WfGFMaFxVnzeEoHhxgyTBeErBtH45t/fEFwTKZeD/mEC4nIY8Q
         YXJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739400241; x=1740005041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z/tKyZfoRbPPUzYf6dFYLKfwilr+YnZbdz/u2PhFyVc=;
        b=dgnxnW/hLwccBNCMjADFV2SD3EF9wISRwlGUJJeoe0nbRLBn1yauNZVXyKvl6ugks7
         HACbgTB2pKjw6LBk8ZN3xAZ5nLRkayLV20y+8eIzK2FhZuZ1/S8XLJ1Ha+WTwOTEB4HZ
         eubV5joON4kPO43Q9JDN0q9/KmcMSjJG2vUe87RZcWtGFsFebQCOt5apxZG2gorRCEnm
         rmakEY+w/ieyv/XlHsBh05Mw5XN/ZXj4RyLKM7OEV6Kob8MBcHL3+y335DvS3IDb+8UB
         Vpb77SmgzPGEsrFGA8QrUne5dPXq1JOxBmYaAkWcWKfwekXzAfAOPTZqatz2oLQ0jGk9
         VoVA==
X-Gm-Message-State: AOJu0Ywoeql3e+wwCk3jgqMxAkCSrDv+dec62idp+lr9BCynSXg4y+G+
	taZstEvonzQeMAPJbRuGG2/mz47A+wGAoZOoT4XU3sTztKD/CoPtdOjyLcoS
X-Gm-Gg: ASbGncuOtnY3bKXKuawd37JJxIsVUXkZjYa/SM2S5ycNZJa0aOVRAgm3AycY403Bjdr
	9z2sSUNIBfJAvu+ZDDLdQ7jrYZ5xR/iHnsq287nOyIcDiapbGdVa03qDyNi1x8rE6HuBLZ7V8X9
	G1cpyGXnY2Pu2LS2OMt7N3coSA0j0dx3rObGeOMQ2K4rJWulOYghOjnBvlk+ORShnQagC+Giia9
	KFqw6qC7Jn29z0WcCL2hnbgGI9wztDq2mZ++TdF1fNL0Bq5XCE+7kzfgjiBvkyeSXAEcDtKeN+c
	9iS/EgdNcMA/nWxHjQBzYG6URjfM
X-Google-Smtp-Source: AGHT+IGThbpbD+zHTmLwYydd2pJD015cbXimI1bgUbm6s5Na8hc25Axs+PyeizggSaAryF9ylHicfA==
X-Received: by 2002:a17:907:2d12:b0:ab7:a39:db4 with SMTP id a640c23a62f3a-ab7f34ac985mr448671666b.57.1739400241454;
        Wed, 12 Feb 2025 14:44:01 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1b4e02sm119914a12.3.2025.02.12.14.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 14:44:00 -0800 (PST)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: soc@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	linux-riscv@lists.infradead.org,
	Haylen Chu <heylenay@outlook.com>,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v3 7/7] arm64: defconfig: Enable rudimentary Sophgo SG2000 support
Date: Wed, 12 Feb 2025 23:43:39 +0100
Message-ID: <20250212224347.1767819-8-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250212224347.1767819-1-alexander.sverdlin@gmail.com>
References: <20250212224347.1767819-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable ARCH_SOPHGO, pinctrl (built-in, required to boot), ADC as module.
This defconfig is able to boot from SD card on Milk-V Duo Module 01
evalboard.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v3:
v2:
- moved CLK_SOPHGO_CV1800 from Kconfig.platforms here;

 arch/arm64/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 1f25423de383..5680b8fb6b12 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -66,6 +66,7 @@ CONFIG_ARCH_RENESAS=y
 CONFIG_ARCH_ROCKCHIP=y
 CONFIG_ARCH_SEATTLE=y
 CONFIG_ARCH_INTEL_SOCFPGA=y
+CONFIG_ARCH_SOPHGO=y
 CONFIG_ARCH_STM32=y
 CONFIG_ARCH_SYNQUACER=y
 CONFIG_ARCH_TEGRA=y
@@ -650,6 +651,7 @@ CONFIG_PINCTRL_SM8450_LPASS_LPI=m
 CONFIG_PINCTRL_SC8280XP_LPASS_LPI=m
 CONFIG_PINCTRL_SM8550_LPASS_LPI=m
 CONFIG_PINCTRL_SM8650_LPASS_LPI=m
+CONFIG_PINCTRL_SOPHGO_SG2000=y
 CONFIG_GPIO_ALTERA=m
 CONFIG_GPIO_DAVINCI=y
 CONFIG_GPIO_DWAPB=y
@@ -1398,6 +1400,7 @@ CONFIG_QCOM_HFPLL=y
 CONFIG_CLK_GFM_LPASS_SM8250=m
 CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
 CONFIG_CLK_RENESAS_VBATTB=m
+CONFIG_CLK_SOPHGO_CV1800=y
 CONFIG_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_QCOM=y
 CONFIG_TEGRA186_TIMER=y
@@ -1517,6 +1520,7 @@ CONFIG_QCOM_SPMI_VADC=m
 CONFIG_QCOM_SPMI_ADC5=m
 CONFIG_ROCKCHIP_SARADC=m
 CONFIG_RZG2L_ADC=m
+CONFIG_SOPHGO_CV1800B_ADC=m
 CONFIG_TI_ADS1015=m
 CONFIG_TI_AM335X_ADC=m
 CONFIG_IIO_CROS_EC_SENSORS_CORE=m
-- 
2.48.1

