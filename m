Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC9C1C07CF
	for <soc@lists.linux.dev>; Sun, 12 Jan 2025 18:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736705335; cv=none; b=XP74r+p80dSwGKdOHpFYAm9jYpMEIKMN6BmDK1zMhwZB0gQTDAiU2tSXQKibHXfP7+MWTm5eAZQroa9/ATvUhjpFGWtIa6kobbFGIV48HzxuLO3Q7Hmv3jmq94UB8S4kaibwrbM3k5YZCAFmMRCEyRuEUWkGmOsETJ9pLLJ+TP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736705335; c=relaxed/simple;
	bh=vKgh4/4ly4YbuP8jjRasn91Qk9F/6j1o9Pie62I04u8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oOCxEyhUyZeKKxywSAroJBtIC/ro15CwCMC7F6F95FsgJi3BO1gsNOu6Kb2Ls2q+6olO4wF2R0bJ9iNDGGYeIqkK7ZedKaBi27PLNdnJ3P8kXTstIy2BeqO0vZ+duBAtyJNg8T4uP7IV4OADqJ+PhfzZ2dQL/k/8HrYiHSz8bQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OLWVxPwf; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OLWVxPwf"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43616c12d72so4780125e9.2
        for <soc@lists.linux.dev>; Sun, 12 Jan 2025 10:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736705330; x=1737310130; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PZ+KKaJmXPxzxDNxe6MA06Q8Nc2be0rN6nRzuoDVTD0=;
        b=OLWVxPwfeZaEtTUVqfnXSIRkKSC1r0E4IGTOFbpVI6tzXT4vztYRy2/NiGVecpGHqO
         gA9wSpU+gftKCUXp0eTd3i6sFm6cPx2mfrKcKP0cl7Q6koatZJdbhyvik6+MfUBoJ42W
         sC5oEXxJd/xB8pmzHrGsPERPgD4q7DA98c/1gB9NS8loFHAgZaj6XKgv6FnpeBFCCXGI
         S4kvPhKI88StHmdo3bJTjhDE8UM0x89ktjv0QsEzFpKHUR4mhFHshO+e/zmlkTWcelYJ
         Tnb1FcFhK+ONDvhTIYtmDRGAuqdJiO1rcf6oaXoEbw+tQnCSIxt8bjdm4y1XX+ir7k7g
         mmNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736705330; x=1737310130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PZ+KKaJmXPxzxDNxe6MA06Q8Nc2be0rN6nRzuoDVTD0=;
        b=jiTwiuohzOGyHgWdb8g3f6GTeNrtq0Oyr26ue0ldJl3FqSGqObVd15OVTq40qs45X+
         GMg44sjSaIpcmL15K/74ghxK8mtNaHVeuunJs6LP+dgJ62G5X6LT5CeG4LwKEfld3Bkl
         ceIcbkITHxDizm3s22Lb07x+GxMY9Nyu1LtecuTsjwZojnDh+ycVOEAuuT4X8a2+sM2i
         utr6u1dfvzVFqTo5Sse0YzIEIp+WQVJpWn7ddNSxjUmWvP8BAcpEypLsMQrG5l7xdBBH
         BR8I3zNdr2CW4oKg+L3wbLEyd22nnLLcbUH8umqV7M8apDExJuc2VyRNU8FVDsmXs4+/
         Ry6w==
X-Forwarded-Encrypted: i=1; AJvYcCW1t22GlReJVt0plC3DWEy4c0pMyJEsq+tqViIUJ75nh8f8jvfOaHdyEaIhQ0iSY0zp+Co=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/nZijJXLyGcrvajzj0S1ha9YB2OIGkWEmuNwMQlhQpni3us2d
	rh6GeL/Uajy9K7mQmie2QllbCeiTOZavRGJW67GY/y9oxbavzu+RsUbmFqGEolA=
X-Gm-Gg: ASbGnct998OZukkXIm29LpOaCaBCJi3XlfSpkwjCsMKT9lBFKvS/FzBfhRssvKszDMI
	BRs4DmwQmJUsGPoA2WjDcWEslOmg34UYDZUFAkf17480ahigagLpgb9HiP56DR5Wgl6u324U0LY
	lNrNYzO+tF+kxqzvonhEPD4Wy+mwfAl7AXUWy2rWFYAM5PCawA9z1sn/TINErm70TNwieMw7V8I
	ohzHs3jjCBaYOdsT0dJouw0LXbpb5VxrZnavwW98kEvhy4G4SpFWxKg1KiZdWyY56b5zJA=
X-Google-Smtp-Source: AGHT+IHu9JNZR3ElrmXphabS7z0OElOospxIN9/DnCZllvZLlZCEZRz4dgWabn67diqwb3Q/GAGKmQ==
X-Received: by 2002:a05:600c:1385:b0:436:1b94:2deb with SMTP id 5b1f17b1804b1-436e26f556fmr67303905e9.5.1736705330605;
        Sun, 12 Jan 2025 10:08:50 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2e89de4sm150842705e9.34.2025.01.12.10.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 10:08:49 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] samsung: drivers: for v6.14, part two
Date: Sun, 12 Jan 2025 19:08:46 +0100
Message-ID: <20250112180846.64154-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Previously I sent just one patch alone. It is not included here.

Best regards,
Krzysztof


The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-6.14

for you to fetch changes up to eca836dfd8386b32f1aae60f8e323218ac6a0b75:

  soc: samsung: exynos-pmu: Fix uninitialized ret in tensor_set_bits_atomic() (2025-01-06 10:54:04 +0100)

----------------------------------------------------------------
Samsung SoC drivers for v6.14

1. Add new bindings for sysreg in Exynos8895.
2. Minor improvements in Exynos USI bindings.
3. Fix for Smatch warning in Exynos PMU syscon driver.

----------------------------------------------------------------
Ivaylo Ivanov (1):
      dt-bindings: soc: samsung: exynos-sysreg: add sysreg compatibles for exynos8895

Krzysztof Kozlowski (2):
      dt-bindings: samsung: exynos-usi: Restrict possible samsung,mode values
      soc: samsung: exynos-pmu: Fix uninitialized ret in tensor_set_bits_atomic()

 Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml     | 1 +
 .../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml    | 8 ++++++++
 drivers/soc/samsung/exynos-pmu.c                                  | 2 +-
 3 files changed, 10 insertions(+), 1 deletion(-)
