Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A51C1E231A
	for <soc@lists.linux.dev>; Sun,  9 Feb 2025 22:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739138828; cv=none; b=oy9t06JQiFqP7Qwzw3p7Kk7BTaPIn5O+uQj+5PFrc25VWIMY3IV5zbVsnVdn8gP0U0wpS0FYELpsYhmxpejSoCCj1J15nBXCqXch/RTTTYB+M5LmkQM9TnbqOD6ik1XtUZkIZoP2AAa8DjY4hpsBFMOd16rl3McSqBF62cul4gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739138828; c=relaxed/simple;
	bh=dP4LebqZklispLvjUvgAWESs1NJ5SkFJAjoh8bYHYBE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BFMTeDni2iZ3TOYYUdvsGlau1Oz0RW/rF7smfLrBOqgFtL5wcVNXuA2sqRH5VcOD+OVKA8iUI7KrIGm53T8lzDpP1m8O1ftjtsi4uDh0YW5XTNB2T1wPdkz6Pk2xTxj0d4aQeATxQlxFX3ECeAoh131S/kquEgn73anuig9bTKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M95e4Guu; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M95e4Guu"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-38dc962f1b9so1372028f8f.3
        for <soc@lists.linux.dev>; Sun, 09 Feb 2025 14:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739138825; x=1739743625; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s/QujbX2jGtUstFw82z9T0XkizV05xsjZBVL0CmnqVE=;
        b=M95e4GuukgbFnDGFF3JTqpFLOhrg3JPq/Lyt/ZXiCTJNsxyxEGMonZUo84JC7eyeeg
         6oh0SepB3NMSkFvB56oW/LBabIUBQ+kw8aDd6jWbEm0dPDC8QOx1EBsmg+XDAaMiYgnD
         IsnEXeFGs1HjbYPeixnaIdSZ4pxD9PxoPSvz8Y6Q2SoIG8k7GYWSzcMZyoyipb2QjGTo
         /ayta/EP9Z9z8/nGBDYAE8Z2OvypBJB9fxcnBE2Y7p0L7j68Y6ROxOo/k2G1IwnISS9K
         RcrNwTdFG2NTyeko8LT+ZpHrO4WD81shOzkrO6zvwymtMHaF7ntmdZ30ODmjizdZEIgn
         zn9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739138825; x=1739743625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s/QujbX2jGtUstFw82z9T0XkizV05xsjZBVL0CmnqVE=;
        b=BM49UEwAg/eLMEXGAfxDQkuhz4nVLmNsRaa/SsGbfSP3uqw2jqn6zNpcthYb3SF9ts
         XJWSeowGE+HrK95Tz9inDwGxbqdstLUO4iRigbOVX+bHajRr3j70On3V6oKwhB2/LkHg
         k5gBl2tQ5n1p0Jn8ogsnXnH5I1Rb+umTCaF6WCZsGWRdEA7hsbL+9MYIA53L7+ieZFWm
         oYI7fHaQh68A4uFHkSRHFZcV0x88ciSn+5dJrKF8V4QEMRWHomrozV9AyowpCl/12AF+
         SF84FfhUgdKll+8jWw+yig5d4UZt7Xg7GXxgIFVX0T17R9h9jhRv2+Feyw+KcSp48Ez8
         hM4g==
X-Gm-Message-State: AOJu0YzTvndMGDc9RXlruN1rIYeNFzedCFO8inbQPVEpbmru5s9nifbf
	eAfu/OjwQjlzBtuRqdsD9NRgd04wgBtT1d0MYpZX0eGOhAKjWeCY1wTj8EME
X-Gm-Gg: ASbGncs4CuO2OqVFcdcX1wzEAh7GWkGqKnlys9ZK1XZWlpwjcIS9Mr9KVh3k2tnaVKS
	iW4KtYbkbetqtgVaIFt2V8UNfSYDaRaUgse/6aZsza9DJvPu0IwHlkpWTBF6NJXdWw2aNmi0Pij
	630IUXzeBjwRzZPdFkFeADTXJscO6MZIPUOu38RocSpan9nWx5g4qYkBadC6SXrAPddnGookj3Y
	zMCBltoR3nBVp5kyV7n4kAUI4YGkcAwPkBlZhzpvyGIWXjpqvfoihTqHPdKwYl575C677RbuU5R
	4ost8z6yowXS2f4squ2OQbQcoh+e
X-Google-Smtp-Source: AGHT+IFq/PkLrPFgckQmHNT1SzVXy9xhnmDdJPNYh1bI941awzELI8KT7wJXkxRv+KpnhizJv71gQw==
X-Received: by 2002:a5d:47a5:0:b0:38d:b0fe:8c99 with SMTP id ffacd0b85a97d-38dc935f0aamr8727252f8f.48.1739138825228;
        Sun, 09 Feb 2025 14:07:05 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbf2ed900sm10386544f8f.53.2025.02.09.14.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 14:07:04 -0800 (PST)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: soc@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
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
Subject: [PATCH 01/10] arm64: Add SOPHGO SOC family Kconfig support
Date: Sun,  9 Feb 2025 23:06:26 +0100
Message-ID: <20250209220646.1090868-2-alexander.sverdlin@gmail.com>
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

First user will be Aarch64 core within SG2000 SoC.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 arch/arm64/Kconfig.platforms | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 02f9248f7c84..f45f3f05edf8 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -307,6 +307,18 @@ config ARCH_INTEL_SOCFPGA
 	  Stratix 10 (ex. Altera), Stratix10 Software Virtual Platform,
 	  Agilex and eASIC N5X.
 
+config ARCH_SOPHGO
+	bool "Sophgo SoCs"
+	select CLK_SOPHGO_CV1800
+	select MFD_SYSCON
+	select RESET_CONTROLLER
+	help
+	  This enables support for Sophgo SoC platform hardware, such as
+	  SG2000.
+
+	  Enable this option if you are going to boot your dual-ARCH SoC in
+	  ARM64 mode.
+
 config ARCH_STM32
 	bool "STMicroelectronics STM32 SoC Family"
 	select GPIOLIB
-- 
2.48.1

