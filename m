Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5017624E4CC
	for <soc@lists.linux.dev>; Mon, 10 Feb 2025 22:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739225413; cv=none; b=sKwVAwSXzjX1DkMWuqti1GIgiHJ2UqDMs0NFqZcf9fqa+MFW1564eEoybWyLqdAB7IjEwpBHW+z2/wfWS3vn/zRnVuqcfY4cJBS5vFWngvTt7cQeZsOh120R868TFES/mrFHZVAmWZtbxKlDF6ANPB3HjvhHxoSTk4L0wQ5zvNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739225413; c=relaxed/simple;
	bh=s5oA+jHWEEIo9T7A2jUBsuRMhvrDdrSwYuhyM/IUmjg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tsLvE6klA3TmZ6xHtCjkaCuQoDYYVAPd7BEC383m55UPSMtQ7EYkqYj1wXQp031Njgu13DgydHhBDN3c2Ui5SKB+84vDYgvpX0Ie+3d2LHGWaC+SONYjlAykmSb1REYr+6YFCdAiI1WTTijbEAyIhnsRadGhGmKjZk2AjrBankc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nLvfgbQ5; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nLvfgbQ5"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-38dcc6bfbccso1973886f8f.0
        for <soc@lists.linux.dev>; Mon, 10 Feb 2025 14:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739225410; x=1739830210; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rLdsU1KFS3tVYEAjIFsi6WKlfhYjmE4PjmptYahFlqM=;
        b=nLvfgbQ55tgD2Ntxx6tDaBJogTdnM2q4kIPbvqjgzYVlrw/ZWzdit2EyPAOLemK22M
         FPrr9oZjgcy57Hx45Fdy03TU0+T5SJn1yeU+YOmy3+OSBhnNUMaa2iqVJYp/Pi+RTO8r
         6RuxbTR1pxZcPN1veWvdqcFvUc9ayqYPGKKIXxqhqU2aX6StO3Or6ZJRrskvJgpxQkW0
         PphadS5JA0RnepZjoITD5lShnmgn5RWHbYnx4nhXC2blmQwivAFHF5IV1BbpwOcgxXD0
         alqujfsXNHvMf/ZyVuyWg0BXWvRM/QkQ5Ps6jknxPzQa8R1aVNyrzvOey4V2TxnmhIX0
         VNrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739225410; x=1739830210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rLdsU1KFS3tVYEAjIFsi6WKlfhYjmE4PjmptYahFlqM=;
        b=OshWZCE6gIyPEsaowUQYUJGLOcac0rQI8rb2qoF/okMjljNI4X+yNzw3OJijzMF631
         5AcPhvKnMEPgl50qY6Qdmukyth0CsbuNvn4y0Fqum1Xy4mk35U2zV7b9yd8BWIzmDAm1
         6Yz5++s6FyB4Yctpg90m5yobRSNOJekVolAY3j5oXPEiZm+dXwANkBwWap07yFwDzCqg
         X8ViS0t6Iq1cfUHbkl/KLYU4sHgnve9A5jv3H0bn99dM+snsqQ0Lj3TidxJDd9qBlJPj
         4te50iWuz7of0mZSkkos+ZsDMWMEoaJV2lZqqQUOJnOD7FIxMfjauQND9UxEKOOd5ggO
         hpWg==
X-Gm-Message-State: AOJu0YwCW7+vLRMuvDud1pQ39RPZfd7Qlt5suO5rDc/DKQmOxMVc3uFE
	ANw9t14exxTFqqV5UIuYrdK8vxPFmyc4P8A4VCrCK+DAV9/8df1D8QJowrGv
X-Gm-Gg: ASbGncuneCbVr+A6M/5Xl3Ylf7E2mP99CKsaGtUvHRWk5YHj3afK1Tlz89gwH+gvqcV
	LVYHvVxlvaFDrC9XO25ejo5K2Dl8zbKb6jTCDznXf5ggsUbeJswPnp3I8PBvlO9Kw4RrTtmB48g
	UJV1FasRrmgaP1bjtIvliRn3Cp5vP8EOsSty5xOaF7Atz8FVVVeLNVoQhko5f2kWAz+9t6Lzpzu
	gJ+O1dC/7jojg1MCOmTOAFCDmrjXkpW+ir/yaLsuMD2T0UgEL0cVaZ4zmwh1owTnfQsvp3M/67D
	HgAr0lIlFKezF2ZDLaZ8Voo0pxeF
X-Google-Smtp-Source: AGHT+IFfMKN2DVPrE11x3bqwtEzG+jwRwo/EFICUaXgsePAhWGKTTHB2d0A9/IHfN0+E/tAfD1+HjQ==
X-Received: by 2002:a05:6000:188f:b0:385:dc45:ea26 with SMTP id ffacd0b85a97d-38dc8daf01bmr8379732f8f.12.1739225409620;
        Mon, 10 Feb 2025 14:10:09 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbde1dfaesm13443450f8f.90.2025.02.10.14.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 14:10:09 -0800 (PST)
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
Subject: [PATCH v2 7/7] arm64: defconfig: Enable rudimentary Sophgo SG2000 support
Date: Mon, 10 Feb 2025 23:09:47 +0100
Message-ID: <20250210220951.1248533-8-alexander.sverdlin@gmail.com>
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

Enable ARCH_SOPHGO, pinctrl (built-in, required to boot), ADC as module.
This defconfig is able to boot from SD card on Milk-V Duo Module 01
evalboard.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v2:
- moved CLK_SOPHGO_CV1800 from Kconfig.platforms here;

 arch/arm64/configs/defconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index cb7da4415599..865625ccf2c3 100644
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

