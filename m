Return-Path: <SRS0=O1yF=P2=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCBBCC54736
	for <soc@archiver.kernel.org>; Tue, 27 Aug 2024 12:16:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9A8C7C61042; Tue, 27 Aug 2024 12:16:48 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A08B2C61041
	for <soc@kernel.org>; Tue, 27 Aug 2024 12:16:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A08B2C61041
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4280692835dso7839375e9.1
        for <soc@kernel.org>; Tue, 27 Aug 2024 05:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724761006; x=1725365806; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pWeHlEO/WuzCnmFaEcHTY/lmEdw14txMtMS79yRBfng=;
        b=K9H3jcgtWlMnMhpa2gFzkq8P5+JnojrpxuhZVZzEYI93mk5L4DGlQcVdgUXPIaP0Nk
         ZRXzeKXoTUfohZipStYLd+joegzuafg9g7biba5dopURLYNm4vVdbdCrWn0C03u8j2iq
         Eo5hrS2VAzkAwoUu1/U4VqDWCc76RB6IHJ5s8c1yF7km2JGhTKaeh9uqVwXIYKdqI43M
         ZIiJGv3XB0z43Hg2TRJaxE5bN0CtMg9slONjSWUOJcC41/y3Q7GzQdW97cf69TQa20Qx
         QdllSNTJjcPHUUCTTByeAhxCNPHk5iCwBZ4zOeRX6hpkDl/Fml1lC2nsCG7o1WJaqP/i
         Rmiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724761006; x=1725365806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pWeHlEO/WuzCnmFaEcHTY/lmEdw14txMtMS79yRBfng=;
        b=ZlS7yWB/iyA16/+w4uQ6jENOgVWxii5hw0+VmoS94rA5E0cCoJP5aUcENWpr4RpS4p
         3YxiI/rNGdlEQhJ7za2pvUZLHolBU+02UIdN0LD3f69HVs4EYuCW1EGf3JDnw05aORdd
         cagfF9LgovFVWbWPIXWqOLHds6Ig/4gIctnlEdYTUVF7n8ITpvZBLso/IOH0/79ZbaT9
         nTBcjEknRlEOY57i4wovMFSbArmNCmllctXyfxHEjb5Jijzlgws4NKjncH5SkvDO1zKq
         t97Zr+VN7aBHWB8Wr4TFv/CODcnCvrj4ZEPwNYaWS6jB0stDMvPoaXXHGDPMKHS0gwxV
         ryxg==
X-Forwarded-Encrypted: i=1; AJvYcCXlYSWCxOKQFX61Ue7Oj/KfFRdflb5FwFRJ0Prfs51pInriEBnkrGi86EFrkFqEYubrW88=@kernel.org
X-Gm-Message-State: AOJu0YxzOwVPjgk+F44Tt5k48DGAC5l+yrOFea/dt+bqVw0z/km+o6Ww
	ucMwlR17zudUL1mhMK3tz38fyx5TlC0sGexrQOPxqxaCOiSuhOUcIImFe5eBwzg=
X-Google-Smtp-Source: AGHT+IGs50FU1NZeLXeQdejwqyPEjAYGIdxGh4vlRpAAy2j8iphQ1MPOJ8W0ne050IZOs+MAWd4N9Q==
X-Received: by 2002:a05:6000:154f:b0:371:730c:b0 with SMTP id ffacd0b85a97d-373118b5e0amr5517784f8f.5.1724761005990;
        Tue, 27 Aug 2024 05:16:45 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3730815b7e3sm12998658f8f.53.2024.08.27.05.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 05:16:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 3/3] ARM: samsung: soc/mach for v6.12
Date: Tue, 27 Aug 2024 14:16:35 +0200
Message-ID: <20240827121638.29707-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240827121638.29707-1-krzysztof.kozlowski@linaro.org>
References: <20240827121638.29707-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-soc-6.12

for you to fetch changes up to 3c8966403dae49d3402011441f3c813787a40b4e:

  ARM: s3c: remove unused s3c2410_cpu_suspend() declaration (2024-08-19 21:54:23 +0200)

----------------------------------------------------------------
Samsung mach/soc changes for v6.12

1. Few ARM32 machine code cleanups,
2. Add dedicated maintainer entry for ARM64 Exynos850 DTS and driver
   code.

----------------------------------------------------------------
Gaosheng Cui (3):
      ARM: s3c: Remove unused s3c_init_uart_irqs() declaration
      ARM: s3c: remove unused declarations for s3c6400
      ARM: s3c: remove unused s3c2410_cpu_suspend() declaration

Sam Protsenko (1):
      MAINTAINERS: Add entry for Samsung Exynos850 SoC

Uwe Kleine-König (1):
      ARM: s3c: Drop explicit initialization of struct i2c_device_id::driver_data to 0

 MAINTAINERS                              | 10 ++++++++++
 arch/arm/mach-s3c/irq-uart-s3c64xx.h     |  2 --
 arch/arm/mach-s3c/mach-crag6410-module.c |  2 +-
 arch/arm/mach-s3c/pm.h                   |  2 --
 arch/arm/mach-s3c/s3c64xx.h              | 11 -----------
 5 files changed, 11 insertions(+), 16 deletions(-)
