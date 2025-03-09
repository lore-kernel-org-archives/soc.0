Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DBC202F9A
	for <soc@lists.linux.dev>; Sun,  9 Mar 2025 18:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741546575; cv=none; b=jg7suTs8XSFNL3OGY3vuR4+F2OIO6i4C45T8qJqROnfIKUd4K+8KhGcIb8GBYvLAWrEywJYjth1yd1Tai9hR+OYzB3DKhVfIcBh9c3MNYm8lFttdIPon4DaJq2CI49IJRMkUw1Lw4NLFon5beQckj3bOSnmayHR5nCK2FGP/ziM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741546575; c=relaxed/simple;
	bh=uvZ2+a6S6JpYckvLd3vN4y/XaCLyyGT9gNpQQ8dNmeI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YLURa2LWOzpPy4DXqeESJRTVZ/VmItu6fohFihEcAMbUmFRi3Xw3Dsod/8ttorBgFdGHBd7wxXps3uqbhk9lKNfxGBf3WSg3+rYWop7K9Rg/R48Rnxf5AaPEdY5VdnfU3qui5klJfnGWf9/Id0kxgQhVvhrPlAjh2KfOevEFjiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GgRh08rA; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GgRh08rA"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-39127effa72so260835f8f.2
        for <soc@lists.linux.dev>; Sun, 09 Mar 2025 11:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741546572; x=1742151372; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MrmBWLsc0A2hxy4AAIuONWnJt2T5epZ91diVlTxUCPM=;
        b=GgRh08rAKGpfZUk2rmmiYIfINCbqcLTuezbcWHI5FmpjH9/atT2U35BA+0d1weAgGl
         FAasQKpQO+azsixLoVqgnDBVau4GCq7XrZB80MEq3Lyw2sP7o33A/eVeYD5gsak3k8bo
         6D4QmkMFZ3wx0WGp04tLXs397iUH1rpcJsCTX4/qZY3DgXgkOJpyuwdII3ogt3tj5JVH
         dJZeNCO75nluofzxELqvokBmRR6Z4PxeTyqnpCT29JkKwC8h4NpSN9yBzITQ1d6M6uiN
         E0YEbjR5nr5D7Aao43oLNtWepZKuMvhzxt7UuEpTsiSd2anqeCb/SrwzGXIezawbY41k
         2p2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741546572; x=1742151372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MrmBWLsc0A2hxy4AAIuONWnJt2T5epZ91diVlTxUCPM=;
        b=U+wXLgdWyArtKsCX1bqrF3/EotiAp2mbB0ckTok4t9U3/BfZQChGOxaUKGkige4E1z
         L++etC2PecIFKdLjIQlLs8QqqpkEkQZGmFUDZTajkHTHXz8nkww6D73gz5smaClatcqs
         muha1kcAarwn4E50mzOmry0jFjj73YKFTdNuSUGxz4DPsE3q9pDvm3nUS7I/YrVQVS4m
         FPZTBkw30bDfvljgrnosFx/YFBOZg9+vGlqjXTxQC2kor5nZRXW8JoSNXU97bBTlqE9f
         u1JWFJGtNGiZt6YDNOVPuLdZ2YZM8H5v60x4PlfUapbSULcLuAmKW87NZr1mv2jvwArr
         u9uA==
X-Forwarded-Encrypted: i=1; AJvYcCVCcx6TwpCTH6VF/1MEpic9tPW/7wF6irTiu6keYq0Z7ibNddQNtE9rhssm0Sn1lKUOO28=@lists.linux.dev
X-Gm-Message-State: AOJu0YyzbZ3L7XEcgCeBnOxI4rYSxzZY54YKFzwEDWSDM6JM5tc2oacr
	sw26P+OL5mRtE3hB80TyG8nSLzAve9vSkRXhV7OXcLwVdAGJ9VHUXPoGglgoMOM=
X-Gm-Gg: ASbGncs2o/jc52PjQybPqRbiYJc+FGo+yohhRfRxhvplCKqeEEKuC23TWq7ThKyDwRV
	X00JVEfC9m2ROMuBQ11IFA+4lSR4e2I94iAm3jeOGUqwzF6G/eSV+1ewOAmuRdZH+WsHQti+x12
	sMxT/ctpEjARtgLHaEoilK/eMAgz2JO8SjfLMdbB0CBzUKVsYj4z0Tu9VaaTxPTEo7mstFptPaK
	MmZU1Inrw388Dh6POunnaqDL74LBMguV/YivZy/0mDc1f2tefWx25328JI5zH9YbIljEqGf3Jc7
	7fnFW0Cbt3NpAOvjidGoPcT87L7tjh0x+ijOBnyf9SldxajpcRo2m/37G5k=
X-Google-Smtp-Source: AGHT+IEKpRHbbGfEM98G+jT1dTf4FeQB+l3gBVL1qFl0csub7dukLp0ucTCxODN6l+bL/aW/iBduNQ==
X-Received: by 2002:a05:600c:5122:b0:43b:c0fa:f9e5 with SMTP id 5b1f17b1804b1-43ce6eb5ab2mr15192015e9.4.1741546571601;
        Sun, 09 Mar 2025 11:56:11 -0700 (PDT)
Received: from krzk-bin.. ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43cee22c13fsm44263945e9.40.2025.03.09.11.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 11:56:11 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [GIT PULL 4/4 PATCH] arm64: defconfig: enable ACPM protocol and Exynos mailbox
Date: Sun,  9 Mar 2025 19:55:58 +0100
Message-ID: <20250309185601.10616-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250309185601.10616-1-krzysztof.kozlowski@linaro.org>
References: <20250309185601.10616-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tudor Ambarus <tudor.ambarus@linaro.org>

Enable the Samsung Exynos ACPM protocol and its transport layer, the
Exynos mailbox driver. Samsung Exynos platforms implement ACPM to
provide support for PMIC, clock frequency scaling, clock configuration
and temperature sensors.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Link: https://lore.kernel.org/r/20250207-gs101-acpm-dt-v4-4-230ba8663a2d@linaro.org
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index cb7da4415599..18f96796298c 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -264,6 +264,7 @@ CONFIG_IMX_SCU=y
 CONFIG_QCOM_TZMEM_MODE_SHMBRIDGE=y
 CONFIG_QCOM_QSEECOM=y
 CONFIG_QCOM_QSEECOM_UEFISECAPP=y
+CONFIG_EXYNOS_ACPM_PROTOCOL=m
 CONFIG_GNSS=m
 CONFIG_GNSS_MTK_SERIAL=m
 CONFIG_MTD=y
@@ -1403,6 +1404,7 @@ CONFIG_HWSPINLOCK_QCOM=y
 CONFIG_TEGRA186_TIMER=y
 CONFIG_RENESAS_OSTM=y
 CONFIG_ARM_MHU=y
+CONFIG_EXYNOS_MBOX=m
 CONFIG_IMX_MBOX=y
 CONFIG_OMAP2PLUS_MBOX=m
 CONFIG_PLATFORM_MHU=y
-- 
2.43.0

