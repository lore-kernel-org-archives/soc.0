Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9FC824502A
	for <soc@lists.linux.dev>; Thu, 13 Feb 2025 18:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739470945; cv=none; b=sHOn5Db+E6vlT4tdSkrT4yqUI1fjEv1jEl2k4XiAGABUaHaqNR+FJLahmzcmSKhqXB0Bv6HWfO0f/6dNlZ2Y9oQiNjT+jfcqPGFYGwn6XF+aKfmPbTWiPC5XSNwFVRDeFeKL0tDdu0Pw+aT4jnx2JIuxlN4KTgFeSb2Hm8wTD8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739470945; c=relaxed/simple;
	bh=UH0q9p++CLmMChIJjpemogpfA1CkyG0O0/eA9dZL2as=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gXh9IiIP++1QiIIOTSuBbuktEtYD7eFAEWWAGJff0vzwA4K4Es7SFHzNColnqIiD9Lg2YVmSjolV9t/cB4WfxiVAHZ0GHwbwvoJDm1BiLQXhOIUqiWkZxPmiR6FUhU4qLUObk2YQGACkdq5WUroMVTlEeHOiA7a7i8SIsY1JGRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CUfH2x76; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CUfH2x76"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5de6c708315so1774225a12.0
        for <soc@lists.linux.dev>; Thu, 13 Feb 2025 10:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739470942; x=1740075742; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FQItitSdgkiMJfSaAOy9tZBmfeo5kJAi4kSnHOl34Qg=;
        b=CUfH2x76ANgP8d+/rO0kCJfceGEoUj7GrMCasPUtdMiGQhhEwMK2MbO6GI9rUqNova
         ERJZi5UmdpEcFIrwzYWNSJiHbig0bKZE4LmWeInfsdKuPJll09fNRwCLVzO9DTcHWaKo
         ERiyhzcbl7Gkhu8sO+5alxcGSppxgB5fm+mEg/XQTVeYurP4vRrtDiw3HPGkLaH5/vv7
         23WFBOcDNOnzDQMbP6pQt9wi8qftDwSED646YOdSkyYmAFgcEjDIbWuIAeBtBAneVhvY
         ZGkNzwaKSk1JtjjjRj/dUp/paHc/LJ02GNFJcZACSBAhhzj6kqq7hEFeBSRfXt9VSlOq
         FPMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739470942; x=1740075742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FQItitSdgkiMJfSaAOy9tZBmfeo5kJAi4kSnHOl34Qg=;
        b=r4Bblvo36Jfv2ei1pakUOnIPGTDBT76ZwW9LEw2AgYeg7l+TsM9pO0T3kuPck5PltI
         N2Q++HhYPu1ndB10eYQ16CCAh/nj5/4G8z6n58kuZayd8qu509aN5yrQ1sO2ow5H5UuV
         hHAOXO+2WUVFT0tboQHAt2VgDTHVar5YdwA8bfDsT6WtAkP1W/3kjNEGMUpPjB+84z6M
         Le7yWtV1MrVl7M+TQDn4nWNL3DstbDPuJ7UjCj/Bux22vn5D9Lmd6fFuIzjm6HI74PQ/
         mJuRB1kJYGoNgGkVs7IHTxbbsyHb5A5Purx8YsMeOnJ/6DD7ceBXuaWSBMufMmzkEa5X
         MCnQ==
X-Gm-Message-State: AOJu0YxTFiQgMc4h2ZXtRAOpfMohd4vCUZDHMwI6+A3AV40KX4DsVk+G
	7RgPv8Te4+lUywTSFcK/9KI3EEaVvRGKfpVylIP1/NJguODPfSRhAVIiAgbm
X-Gm-Gg: ASbGncu+scVwEFEkof3mRorJp6B9xExQquHEfyRx/kHUrN5h+QMn69FP/hcLgLucy1F
	OzMi8N4Td+W/iC2Rh49lpKHNTdW8cZ9T39tkqlZWG0RReVl8LoUgd4USYBmVngsinPRIyILK5Bn
	euOk4hvP/K0V9wEC3rQ1JO4y1BWLRA15y7tDct1EzUZLyigOxKy1MRdLz/LQ+XVEBbkm4jRvf3d
	rj9jMPOb9FjQWEawJkz9rhYlMFw0iWHw6PK548RR9YfWwLzJW5Q8djAvfT6oVrKv00LPE2Kzvr6
	RvlPwtPHlif1odn7JEZpJpv5N2oR
X-Google-Smtp-Source: AGHT+IEbd3n8MU55t3euCitcQQKFs6SunYb2MyFZGehEuglKNg6K9SJXp6KGY3aEsdTFbYirMQvuuA==
X-Received: by 2002:a05:6402:5111:b0:5de:dc08:9cc5 with SMTP id 4fb4d7f45d1cf-5dedc08a138mr487236a12.7.1739470940344;
        Thu, 13 Feb 2025 10:22:20 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece270a66sm1559230a12.52.2025.02.13.10.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 10:22:20 -0800 (PST)
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
Subject: [PATCH v4 6/7] arm64: Add SOPHGO SOC family Kconfig support
Date: Thu, 13 Feb 2025 19:22:07 +0100
Message-ID: <20250213182210.2098718-7-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250213182210.2098718-1-alexander.sverdlin@gmail.com>
References: <20250213182210.2098718-1-alexander.sverdlin@gmail.com>
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
v4:
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

