Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165E920459C
	for <soc@lists.linux.dev>; Wed, 12 Feb 2025 22:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739400243; cv=none; b=aBXVEr6wPkT3MDv9WFgoXYnEGZqbwBlcmRSS3nWYSpcdFBTXCKAv8dZwPKEnng2NRx9GTHsMqyMU4xyLYQCvIYSwjBISPCgxAyHwUx1JrPcZAS0yhTrUydzLfxr2KiXt5lxs3QePhmFwqmC7adHzrpPfawEUKQYSjbgSefe2IXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739400243; c=relaxed/simple;
	bh=Md/jHdwGpVyKqlVllq46oqtlAXkB1XzZIwDyMsp21/0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DG80yPJqS2Y8aXNybKF9TSIr092HUcvp9ChHlg/tlcXQ3mu05ECG7UEV7uYl6+m5u20B70xqV5qq4csyLVH9SDkdhvzCnLdUukDrhSFHC0TXGWj4WhYHIxzg7Pajn9D4uaKBbfYS9+obBHnV9n+TgFOzRkqRhEb8wPJ/SwtT1oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aBDxdpwb; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aBDxdpwb"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5de727f7f05so334589a12.1
        for <soc@lists.linux.dev>; Wed, 12 Feb 2025 14:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739400240; x=1740005040; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4BT4zDjeG3hciOnfOqkiOnLRCnHCBLSV+hAz1Hb5QVE=;
        b=aBDxdpwbQDCPmXWZ4dGiD6yPfG2WzmJ0S+gP0Nt3IsSmGQpKfpqJMZOoZCHJ4r8QKc
         uIEeqLkFjuP3lSsWB1G0bfRDfxh19dJ3rKEjlE/nEaFsvl6b7+lGVr5Bq+wSuIvsMFMy
         6J9GC3yqeN6xcJXPU82mJAm1EMvSEfD7hdZxN+qKqPG7tNjKQON8SSM3qYfHSz3rwkvb
         KLAWRaJMmcu2Bkc2ATrvM9BfSG0WdJjzBWCb0YiqKXDJWszlJHDT8Gef4zvQJr2VlJax
         wGwrp+w4qO3xwl5Orrjk65jGvU8daVWuWTxl0a07y9za1J9OkrG4WUsKcCvmbFybCMhM
         s+GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739400240; x=1740005040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4BT4zDjeG3hciOnfOqkiOnLRCnHCBLSV+hAz1Hb5QVE=;
        b=f6eUGGvvenboVWtcRbKGlalYr79DPmVsgXZMX+k1yxuqsu33nABQHK27Pyf1D3z91f
         2xQY9wioRV8Eb6oLN4GbDdAq8AojV0rQrj5vHB76QsA3pZKMvJOtUn7c3H4M9ihCCDt6
         D0xAZgMliu78qLKZOmndN/HI/hn2jf8PSIuL8LVyCR/anSfR99YcadsFyfdkp58/kO1s
         pIfGDoUogeftDE4uOe6FprTq1YGS5XiJfY23pLw4upiTBiZLgehhfqCoMk6AYyVXZMDF
         Pg6M5tcAMdQmNlDF9qFm7p1QJ3ZU69rDo64Zd4E/53fW5ZHtxk7zxoPi1wxYJwwskds0
         SxjQ==
X-Gm-Message-State: AOJu0YwoeGFfdmH7ITT5/ju00/SxQiZzonYg8ZCJkVTOVNLpysVzhYP8
	Pf/Rq1K7WnlRz0DNEkCo7fP2eEPDEviTnQysza1iL5OtPPxK3O7MLJUHaAgo
X-Gm-Gg: ASbGncuYP6MaELeZ9abFSjzrWpuWEZ137uz3PQfg7vjGIMdkOO31bw/7OtvmAKj/e5j
	0ILXf2sboQiDCuDSrekJBi4E1WnEXrCM2jwIFZNyJmH7n2CT/VKxABQGdX4nUFVTztJxHCSAzln
	nrG0I3rSKT5CMWIqPqCNirQNRVSnvOcAYYeTHl2BeGAr6uDjCBlihuTJWMQwDqtCLpqWgawwNWT
	g9uJXxSvuOmYqMxEcyyMJ02fKnVl8/FM6rGCSqa9fJ5zLl8ukIi6o0AJQfAwi3Y/QqGTnZ7LBgQ
	4xkaYgzfLIbPvhiG/Yhy1yBm2CbH
X-Google-Smtp-Source: AGHT+IH33VO0YZ1W7loC/G7CSLpb1z8VSxkc1c4pnZ62mQEDWwxNujuDsCoL33SSN4RE8aBnDnfjHQ==
X-Received: by 2002:a05:6402:2106:b0:5dc:90e7:d30 with SMTP id 4fb4d7f45d1cf-5deade10d5fmr4743023a12.30.1739400240350;
        Wed, 12 Feb 2025 14:44:00 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1b4e02sm119914a12.3.2025.02.12.14.43.59
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
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Lee Jones <lee@kernel.org>
Subject: [PATCH v3 6/7] arm64: Add SOPHGO SOC family Kconfig support
Date: Wed, 12 Feb 2025 23:43:38 +0100
Message-ID: <20250212224347.1767819-7-alexander.sverdlin@gmail.com>
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

First user will be Aarch64 core within SG2000 SoC.

Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v3:
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

