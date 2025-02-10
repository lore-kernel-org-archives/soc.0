Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FBB24E4D3
	for <soc@lists.linux.dev>; Mon, 10 Feb 2025 22:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739225412; cv=none; b=NHCvk47SuHxUQNFQbwFs5dmMYGtWlgN2XxAaqAU612sviRuWAQAWOyLa4r8dsNoo+bJcL7lKd+sIhT7hyEnQJe7mxI4uJ+VpR4KSbYNlK9Rb/+PIL/tOaxWh5WVwTcj6qX6domOmT0eS1QLG+5vNY4oUdQWFmvbqguZZJSoSYt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739225412; c=relaxed/simple;
	bh=JNHqD0fMNmMPprvxql49r2KwWNh7gapfKVmU6R6Yc2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SHagvG5lR7o2PjYdaP40IxcOAG/922GcoZRNknqHQjtF66liS31tbxTu6qni92cXNJIH4+pGVPWTj7iuirjwd3TeOw8CM5Ult8h/WCutHeyxWX1QluwiW8XwLmZx0O2IqzjuTxAGzlZqNvctT4KG+h4BStt7QbE67C09iaDf63k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LEJcnB/X; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LEJcnB/X"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-436ce2ab251so33734915e9.1
        for <soc@lists.linux.dev>; Mon, 10 Feb 2025 14:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739225409; x=1739830209; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ID749a2RfFyJrhYgrJoQoMzS5iiIuNRZKRb6PE7JVA=;
        b=LEJcnB/XkAcZ4ETMCTCAMjDMo8WzbOCl1TfYgeWIAyyOYf5PpI24m/yfjWxj8pC8+A
         NxBhFPUXhaQDAM2jtd8X5vs0wQmozQi5UCyCP9L1okPwaJ0we7Qi+Na4jBlqFoGXIFgd
         2fqlaNi4GMt9xz11T8A7IX8liq31dWmk1Tqc+ytgnmqwcKop5nwb0X/D1yG+TnSDCXbj
         WHeBMWiwPhv2JHykWVcmtZ1jXK7Ag4QYhvadnTnRSuoayNawZsVAcE6oAgEUDi8Hsyzd
         KRxW3R6vidR1X1mYKW2P8nw15Kghb8+DGiBzs6bKWCWK1ABbZ3bjoOgnvEP2QrDZlVf3
         5khA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739225409; x=1739830209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ID749a2RfFyJrhYgrJoQoMzS5iiIuNRZKRb6PE7JVA=;
        b=LLO3FymXBfEJdLSBfke+HaG9SLEjMsJabyFocx7CJV6z/nJ4lFMnVQOSxYzsDwtvTI
         jSb+JvljL4d2tpkde+8v1EFO1tcH4jDH7h3ebvCWsExLOBr2VLPW1a12IhAoCix5Z3Tx
         DcU/pLc3bLH1cbSMBZy1XfiRV4DE6x8Grv7UIgKcfh6Yr14aryEAU1gHccyoI+oDxnaw
         DI/u5pvsRkJaPvXRYm4Nn6NQjsnGXIN8Rdhcq7zIKkFZyfx0F5ardw9s9ZhfEAtmIGEJ
         0hxb4u8ysamN9Yg82fHm73WyMqtL/HVQa4BUpof4mK7Rsk9YD2UngB2U0C0Xhsoh+qhw
         iePQ==
X-Gm-Message-State: AOJu0YxrVqAj+TwEj0Wlu7s3+1gE6c60lcE/ZRRVQ6Cbef+kxli/nXkd
	VPenVXSR0Fkhwzjf3CNVvCQDmVBZU+J25Mmoy/elBqp53OA87F1zUz8P4m7z
X-Gm-Gg: ASbGncthVgYZb37Csny0KTBgYfim3tsnVNz0xHoQL1rCW2V7Qm3hlsCHaQk99sKH2dX
	dmTdPXwek1msOyXQTnL8aBqphMR/O1+l9HPfZca4V4uVi+8v9tIm118B3PnReZSwiteui4Gd2oR
	a6MO1D0dMq8R/Czb+re9LPwB0HTtIlH5NOWJdDMZemWEjnRVVuYrfWkgd6MrdAJxhBqxNwJW2eu
	ojRdBh6L6oHChkHwkz7vympIvXwiwWyeWrU1ZA7LFlB+MVpAmeyy3g2TeFgulwFSrnSd+BUBzhV
	9h6u4YHT6lswObW1lEZOOzB+loIK
X-Google-Smtp-Source: AGHT+IHu+GvSuWdsjZukE/oaPSgKedfyRuF2nNPz3gTsQwY2pdQTpQmVy4TokzU8j7/5Hvjhdxrx6A==
X-Received: by 2002:a05:600c:895:b0:439:331b:e34d with SMTP id 5b1f17b1804b1-439331be5aemr96052165e9.5.1739225408672;
        Mon, 10 Feb 2025 14:10:08 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbde1dfaesm13443450f8f.90.2025.02.10.14.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 14:10:08 -0800 (PST)
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
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Lee Jones <lee@kernel.org>
Subject: [PATCH v2 6/7] arm64: Add SOPHGO SOC family Kconfig support
Date: Mon, 10 Feb 2025 23:09:46 +0100
Message-ID: <20250210220951.1248533-7-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250210220951.1248533-1-alexander.sverdlin@gmail.com>
References: <20250210220951.1248533-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

First user will be Aarch64 core within SG2000 SoC.

Cc: Chen Wang <unicorn_wang@outlook.com>
Cc: Inochi Amaoto <inochiama@outlook.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v2:
- shortened the help message (mirrored from RiscV ARCH now);
- select ARCH_HAS_RESET_CONTROLLER instead of RESET_CONTROLLER;
- moved CLK_SOPHGO_CV1800 selection into defconfig;

 arch/arm64/Kconfig.platforms | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 02f9248f7c84..21b6a2bfb45a 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -307,6 +307,12 @@ config ARCH_INTEL_SOCFPGA
 	  Stratix 10 (ex. Altera), Stratix10 Software Virtual Platform,
 	  Agilex and eASIC N5X.
 
+config ARCH_SOPHGO
+	bool "Sophgo SoCs"
+	select ARCH_HAS_RESET_CONTROLLER
+	help
+	  This enables support for Sophgo SoC platform hardware.
+
 config ARCH_STM32
 	bool "STMicroelectronics STM32 SoC Family"
 	select GPIOLIB
-- 
2.48.1

