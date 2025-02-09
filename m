Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A087241C86
	for <soc@lists.linux.dev>; Sun,  9 Feb 2025 22:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739138837; cv=none; b=JperzxA/Kj4gAaxS1Q2JmgW7SFj0+//zNRqVgv5eJ2QiYSQ+8ftBKksmwZDjpEBO7SLuIpLvHfflolcmodBPittTuISV6IOFQ8Vgv0AyJUTIvV5KjHmhc/usjkJIn/CFjDqhfgxjrUR9wiBTqPf7hkGT4L6Y46I2v4sgNZBHCkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739138837; c=relaxed/simple;
	bh=9Xh9dTXIZN4qkxdr3jdY8BhL0DYoPtba6at3E2bJePc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KSCH/isAmOmB/o68FWHx9tNGtdNRfeUAbvFjoznIaFqTkk+kFbY5b/snCP0P0zVCzYuswvDRwTROp+twBz3pw2DPxdTksW4NimP8HPXz16oehNJEZVUXKNE9eXgrsCGemrNMeaQcsmgiL4wSZZLJ3IPjoK0pf84xJkXdLs3Y9/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DTthBh+x; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DTthBh+x"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43937cf2131so5904885e9.2
        for <soc@lists.linux.dev>; Sun, 09 Feb 2025 14:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739138834; x=1739743634; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FSD/9wBjujVG0Uf1/rsF26GO0rnc/+iTaIpHwa0fJV8=;
        b=DTthBh+x2H8O+eCWvaK5CwPlokdbkABLyqO+Iw+DF7dJ4nijL4RZy8XBogOXFBpXB+
         ujraDCQAasy89FJM+OUTWNqfETjPSvtv/qRAbZ4v4ImkGMvPe+ysTK5bY9y4FoZ4YSIa
         vArD2BXyhaCgC7EglC+gngMPNaXYU6z10bcXn+KcbRiR+2/L8j25x5Uc6sBKcaLklQ5u
         AZE/FrNAzPwKdVfcmizOFjZB6QV4H37Zvb2dOQegzQ14iVEuafjTTC2xbZ/jeWFcqpEI
         YZEMFl4nynHzhum1z2HqLm2GlmOYF3CgiyFVzAY2bWpYkncDAux0eRfAkdc8tIeuo33Y
         drow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739138834; x=1739743634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FSD/9wBjujVG0Uf1/rsF26GO0rnc/+iTaIpHwa0fJV8=;
        b=RolGPKiVufHPykvUUfMufZHRe+/nytHEn+3IvahLqZBJT7InyuKB6zFq0WO2oRqZsB
         KOTNi4oiWvKaIgaSZnQs0eOayuGNFp1pOG2H0CkvtQQi7WwCXdBwtyRiGmQ85FKfIi+q
         1BA/Nvox1WO5QS3us5O30DO7/OLofpQ2iiMR4WG4I8xQ9/oZ3xqj65wwtp1M3d6AFib5
         iEV92ax0iKvvyoAUVnFGXceGJjqE/I9QtewesnOrG4tBVttSUTKtWMjkgiTka5TFJKy/
         gRJGO6i8VXQplaDWQumzYnqDjItKuVvX6yJL3ASp9iO9neK46MLZ4k8sq7QHahNdfbUc
         pHqA==
X-Gm-Message-State: AOJu0Yx5fL/j2kgVgP9IBMlZuik7rAasrZR0NBSV2IEN2EFhuCCZLlv4
	p+R5nqssgmL4cHGWe3DdfL0Oktv025cClpghcVYLdbjRgEoIoUK0uPRXUENl
X-Gm-Gg: ASbGncvDQXSYApI7qdcx6ZvWFVlVVB+lCdMCtZenH0WQ2lAHBtvdiU2vzGHJgcF0DM+
	akggrwXLEW2Cd+teZWUv8at8RiqrcG63T/WT+yptyt4uTpk/WmeliZlWC7oAkaQOsXFFpNQK9bL
	tvJmR7SJG20Ch4XscWNAETnn1K1bIXYaFNhm4PD8cCbHBs7OkGRNu32L23NE7vaLCY5kEmAHQqz
	qKbh//vDe9lQ8bnGs9Uem1XWCLHXFztFqe0e5/ZZySqoysOWMFXMhbcvL7q+reyEpfOFov4OP91
	PsdNnbk+Aiqo0KqBjcY3ca7cplqU
X-Google-Smtp-Source: AGHT+IEemx6QBODy8RjpsuHiiuRss/UBX12yPNG3tLMU0rDbQWy2PzuGa/GWF5u1qU2RXyctSTvcSg==
X-Received: by 2002:a05:6000:402c:b0:38d:d9b3:5926 with SMTP id ffacd0b85a97d-38dd9b359f3mr1828331f8f.5.1739138834402;
        Sun, 09 Feb 2025 14:07:14 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbf2ed900sm10386544f8f.53.2025.02.09.14.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 14:07:13 -0800 (PST)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: soc@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	linux-riscv@lists.infradead.org,
	Haylen Chu <heylenay@outlook.com>,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH 10/10] arm64: defconfig: Enable rudimentary Sophgo SG2000 support
Date: Sun,  9 Feb 2025 23:06:35 +0100
Message-ID: <20250209220646.1090868-11-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
References: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable ARCH_SOPHGO, pinctrl (built-in, required to boot), ADC as module.
This defconfig is able to boot from SD card on Milk-V Duo Module 01 EVB.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index cb7da4415599..56e2c833f745 100644
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
@@ -1517,6 +1519,7 @@ CONFIG_QCOM_SPMI_VADC=m
 CONFIG_QCOM_SPMI_ADC5=m
 CONFIG_ROCKCHIP_SARADC=m
 CONFIG_RZG2L_ADC=m
+CONFIG_SOPHGO_CV1800B_ADC=m
 CONFIG_TI_ADS1015=m
 CONFIG_TI_AM335X_ADC=m
 CONFIG_IIO_CROS_EC_SENSORS_CORE=m
-- 
2.48.1

