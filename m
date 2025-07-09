Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB79323717C
	for <soc@lists.linux.dev>; Wed,  9 Jul 2025 19:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752088534; cv=none; b=l7EoUGKlyVdeH0/T8JeJDVFQ7himlqG+Ybdn6OskBIHdl49b3+HG5rZyBkjk9gW0fBp+QR62USblxtjGcDhHs3NEZVmnynvLZfhmWQuUt8WxrwrBEwgfxFcPrJprtiAJhsqfmV9UqIVtnYQ13BCVgsuU8orkS/B1xa23HzvT/Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752088534; c=relaxed/simple;
	bh=LBLtPnGLFKCmbpB+0VnZBJ/y17TkI+PJVcwVQLb1mgw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ItNh0c3bZBaaig1fueLSwH3buX+Wuh/51C6ysKtTGFgx7JxgB8OQcBObo/5tnPcYxsG4fCi4akkaSfo2jaJm5YWKGSkEhSH5BZFQIWdyXuhOZsErDgvcOyBjpDnvXLMSnziRcAkFI+1NLK3WMh8tcjkvcjH9vxXBoCHpgUvBEgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RWnAu4ki; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RWnAu4ki"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-453442d3a15so325945e9.0
        for <soc@lists.linux.dev>; Wed, 09 Jul 2025 12:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752088531; x=1752693331; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HsSnIgBBZ1kBciUGilPIV4WsdrkG/yK/XMLgkUNs/ME=;
        b=RWnAu4kiDanNrvLHoU1RtPaPr5FTLgkX6nBCgJrgovlw61SHV1NoiksSFuCa/46T8K
         yev4R0CssxqPrjmITcyEBXLAmB4OcyPjdLsbnTdW3FKVpe/4l/EuuI57eAj56xGkKR21
         Grv8NOez03gMTP7Oqcu+oFYkkCVyQElv4VWX4c7ZFgjdrZDfi6INBJ2p5lf+eatawKim
         g5devwhxU3A4AYj1suRn3QQ7x2uJ71gelmVjAB3zUEiBixms1GxY7Et4IbacyhQGiasQ
         7sYZjLtunSATn8ZKwxrNAi788nCMfDWtEXW0W7N8yd26PelvNubTyX8IwXUgbENpwmht
         g9vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752088531; x=1752693331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HsSnIgBBZ1kBciUGilPIV4WsdrkG/yK/XMLgkUNs/ME=;
        b=GXoVQ68yuIJGPSr6nRwy7XGpgAd6vp4V2ryAyNtlb4xkm7199avaCAWKhKR+0qGe9Z
         bv1Xe/2FPpHVNqt+RaCUWhvLCsy6P59nxAR/4eETAo5aWjlxi3kXalT66yLXFdpoWxAN
         IsUouyrILlLVrvuaOz674o1+39HysDvN5U9l3aMBzb1N1T4SzVsp0peF7DABASAL10Cn
         O8htzqaGjd3VUIKIFYZkD0GgO+hi+m7GHg/K40Hv9p1fkKf6ZoudA3ZAS052PGgon088
         mKXs8JdOyx41AfevI6P18NDhjuKu60uRpaQ0fgFk2hCmvgyC/UjDD9l9MMUgwiQ/P3Z9
         ETQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvBUojpzcFBW4tekahWg1KqlaO6ZRI4ABv583tPJQoyNN4ZefVNktNLrPGlZEzSly0YuI=@lists.linux.dev
X-Gm-Message-State: AOJu0YyFHxCmK5SLsiGB8vUU5uK7c+NgJGyqPbfUw3nYSx+8GxYt05fL
	u/7jJH54UowM6pqRCgFrdH6IuELRA95kpu8LXwDdiLNJ4uuPQiebJw/03U4lqS51NTkGKT23zvh
	2CuvW
X-Gm-Gg: ASbGnct24Ci5zoYf/zRdqLs3T3BxgPAhLEBFPJReAHyoOlSLlhUmnUtD1chIcR9byHX
	AgeLqpRKwHEWDQbi29EVD1EX1KSxlbp3b+O/DAbyp+NhjyWLUslSBVnsoMjGJ1Vb/vngK43SZsY
	uXKVr4FfzkKH/DK9VK6LFBj1r/UvtfjM2KrdgyTrsViHfTHecDghqr+mOQCOnVmU0+S3pMHGaQo
	uDIPnBJx8e5zwD3jio9KO0BXIf/GkUfIMEUKmrc2J7vOmrGEE8ryrp5Z2aS0zJeWBT+Bn3L3jxC
	fJr9xddJfVqOn5WUPNQ/aNG2nL5AIfxJUcDE492cvQoSNWCaxL+FF+x3Nb0j1Ub1srHxFINDyBo
	=
X-Google-Smtp-Source: AGHT+IEw+2/Fscn7De5ZvL2RlCEWtJ9eIRsrKn6Ngh3wy00p2fYxejGpstLQTHOXdLIlShkvStCcLQ==
X-Received: by 2002:a05:6000:26c1:b0:3a5:8ae3:bd6 with SMTP id ffacd0b85a97d-3b5e4576314mr1192466f8f.16.1752088531010;
        Wed, 09 Jul 2025 12:15:31 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47285dc08sm17159588f8f.98.2025.07.09.12.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 12:15:30 -0700 (PDT)
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
Subject: [GIT PULL 2/3] ARM: dts: samsung: dts for v6.17
Date: Wed,  9 Jul 2025 21:15:21 +0200
Message-ID: <20250709191523.171359-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250709191523.171359-4-krzysztof.kozlowski@linaro.org>
References: <20250709191523.171359-4-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1574; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=LBLtPnGLFKCmbpB+0VnZBJ/y17TkI+PJVcwVQLb1mgw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBobr/MuYhtk8c9lMPkEtPvmo+CAlmyNqzC5XKsG
 etty9ihw6aJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaG6/zAAKCRDBN2bmhouD
 17IgEACQ//MMqhTUvXRVCfVpbI4nZNkn1RvBEh7W9Sj1SBLGztID8SkulO7Cf0l02iB3pzOO/Dn
 m2bWGs228g0m0mL2VsXk3hE08J8j2weor9nT77c3WmOGpv2H56SURP3bIuJNIrvWrs0GJ9gumjB
 3dR5PFESdOkbgNj6WIdVikTPhHBXpGfvoMXRZq+qLGUamca+1JdzOrgsEUYjGoVmMdPBji3Kor2
 tRYccxsqUZyw2HF28CeOMDHIU1F0voTj6U6K8Qeg92D8zN6E0UZxxFN8hxqtNicMKqiO7nZlMKA
 nfsDALvXuTDAu0M7BBbXFlQEYhuhGuvLjMJJAk+9yjgMhz0JDplURFo6JzTHCHzJYS737Ze4zH1
 f7K7MYgqco30pBfz8lKugotvynygJ1JAW21MPmTNnrnRszILRaw7FHBbfxYlOjU/CCm1P3pAwV7
 /Ex1M+V+Bp/x3SYrEdc/I2XjyEd57raDmhqgSpKFB+efOEUS/alwpewpOJJQ48zcq+ywRXyUUa7
 X6VS61wmqOXtSKLXm6UPnTpHNBd4NwiOdYyKcwZA6KGGfA0HMpfomV9Bs8LPYEEMtezmxWPl0e8
 VBQBR0Vyq2FohU4tVyr+goz9DGutUd8JIYXTSIe6JvKhTiUlIn90Bd1eAQc7/Tco6MD4CNYSRsE EFqv2w+iKTAuMwg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-6.17

for you to fetch changes up to a24cd2f207efa73d7ce8089ce4848aea99f48f6e:

  ARM: dts: s5pv210: Align i2c-gpio node names with dtschema (2025-06-25 16:11:48 +0200)

----------------------------------------------------------------
Samsung DTS ARM changes for v6.17

Just few cleanups based on dtbs_check.

----------------------------------------------------------------
Krzysztof Kozlowski (2):
      ARM: dts: exynos: Align i2c-gpio node names with dtschema
      ARM: dts: s5pv210: Align i2c-gpio node names with dtschema

 arch/arm/boot/dts/samsung/exynos3250-monk.dts       |  2 +-
 arch/arm/boot/dts/samsung/exynos3250-rinato.dts     |  2 +-
 arch/arm/boot/dts/samsung/exynos4210-i9100.dts      |  6 +++---
 arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi      | 10 +++++-----
 arch/arm/boot/dts/samsung/exynos4412-galaxy-s3.dtsi |  4 ++--
 arch/arm/boot/dts/samsung/exynos4412-midas.dtsi     |  8 ++++----
 arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi    |  8 ++++----
 arch/arm/boot/dts/samsung/s5pv210-aquila.dts        |  2 +-
 arch/arm/boot/dts/samsung/s5pv210-aries.dtsi        | 16 ++++++++--------
 arch/arm/boot/dts/samsung/s5pv210-galaxys.dts       |  2 +-
 arch/arm/boot/dts/samsung/s5pv210-goni.dts          |  2 +-
 11 files changed, 31 insertions(+), 31 deletions(-)
