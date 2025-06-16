Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BAF2273D95
	for <soc@lists.linux.dev>; Mon, 16 Jun 2025 09:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750067147; cv=none; b=I0AGrV3r4wnSzskAxK0eR8rfrfTQgvbjCdYrGwOnASvUPVPPdjmMPq7l285Q/2lO6P/OvxnntryrS7J77xFaNKHhgBepPx5X5sHYXXnmTQo2zcwwOBEz1mqTrYee4VkvPqwMkLds8FXrhtq5pl87dCZsLaq7qMgenSDA3mfBc1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750067147; c=relaxed/simple;
	bh=zkQWBO37VN3NVGbjoJhPxoXCrT6Q3CmQrD7g+/aYgks=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gK3FyQquPD+fSoq09KLlQpuAcFpz8fGB2Ek8QxwhoMElyYwOmTLUU9ITyswx/6y7R6oFS1LuHl3A++pVWGPpWy/jnaj7KjdewqnM0Daj/hDeVoKn/bHHro/qEI9y2cgQ95a7NBujUhGFfPqwdJFk61voYHR/XcRz4VejW5sVrDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wX4jEdb1; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wX4jEdb1"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a4eed70f24so314167f8f.0
        for <soc@lists.linux.dev>; Mon, 16 Jun 2025 02:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750067143; x=1750671943; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=stfq1sXWKmsRuu2Jonzta4jrsZNZk4m5C7fvRbIkSl4=;
        b=wX4jEdb157eTSKgtuyQvSIvk5m3FXeWIlsX6w+lh4j7ZB8Bj2dNlly9O4XwZmJBqXH
         1eylGoAvTLIjd0bNtPNj6lxYxOzpTw1ipQPN1jZRcHZkLptCtKdPMuR2S6RNE4n9g3ng
         7CWeaYiz733yhohgP+0t+ohUzYtpxLSJH6rmAsoCknhSB9aGv5+SbTf4RtXyjXBtSVR7
         k0KzRvUWL6IuFS8QcEldsDiMrGeUlqaW60ae4hoZMxN2gLEroBGY+YZjB4zEnNXWPvdq
         YfGK7kSGTdLeRBr5Y5oDzk3O+xDGO1M8HQ8rcwMw7jLYxZ3lbsHtRGcs5js/r0EtCKoz
         mSUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750067143; x=1750671943;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=stfq1sXWKmsRuu2Jonzta4jrsZNZk4m5C7fvRbIkSl4=;
        b=KCks0MS49ZIgLdrJ/PQcuM8/4nwSMR0zx9PoFqVN/a4KlUHOiw4ZcZMkrk+t75+QGz
         QLToa3EWJa4zk2pYlHiTEF7nKM5sDiY+HcA9v/D4bn/6oboP1Z2cG1rlPNLH6Z8borut
         6GAhoSqL47glKO/I8Fjxh2a+dq9BIosjpiqs3PqL+8pHSBF/RvQUPAUfw3426SKyqfGA
         Em0RKYkZoa9TT8TuJHc59mmuMik8UWj4o1SjeIbfiGtGoFfAZUSt+mK36YQno7t9L+49
         cwO0GIdm8FcRyn2GZzEoQOftJl7gDZX/ldxzwGwqmXOxF9+NsheOtr+TdEKKufM7nnto
         XpUA==
X-Forwarded-Encrypted: i=1; AJvYcCU2SpG4f2ex5v1V1jvAOT2eNORUF0ph2WO8JGGqkr+i1l+fI8R4/yn8RymEZF61mqKCrCU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzoq86+rSDItNx5kL8fZo7r7i+SFnB5L2sCmr6+KqXCXJUPKgrp
	d1SszpFzmL+jqOScjntnMH1OXk2DGVznGGw2Kc/gK7XOmJhFSoqtWCbEToILykgnKqc=
X-Gm-Gg: ASbGncsTkBR8Ox6PNuOMzCUrRj1qwLrWnlCYAQL8uxeQxe9V9y5CV0LyBn4ap3G6hPD
	6Cvf7O4zsI4pZx8ZkwciFCkoQ7DR+KeZKEgsh8bxSB8/SyL0m9Vo/P8gzk2EwHwoyyKtCpmnHlp
	4SkVYLZiasDrPW5RZcB3EXnI0azggXcOrEzesygbPHMbr2FYGvDsWbI6bAM/22Q12/0iV60GRAl
	LmnzTOQQqcs+W9d6MCCNsALyJkLUgsNKiEJExSJcJu6SxJZbfjrfM6SbbNLlakx4UvM+PpTnel2
	KTKnA3VlS7g4L5TpCszB5KrBEtQUJCD1RHjmWt8K31TbxBbROpbqgM8SqMkmW2O2DhaAVfZ2nQ=
	=
X-Google-Smtp-Source: AGHT+IFmhUzV2REZ+armXUuBCrTN/HZvKEo4jmpES0++U9AIxkv7x67178KFZZA0J/Ne420xjaKjFg==
X-Received: by 2002:a05:6000:2087:b0:3a4:e0e1:8dbd with SMTP id ffacd0b85a97d-3a572e7a579mr2511491f8f.11.1750067143332;
        Mon, 16 Jun 2025 02:45:43 -0700 (PDT)
Received: from kuoka.. ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a67361sm10711943f8f.30.2025.06.16.02.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 02:45:42 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	andersson@kernel.org,
	konradybcio@kernel.org
Subject: [GIT PULL fixes] ARM: samsung: soc fixes for v6.16
Date: Mon, 16 Jun 2025 11:45:39 +0200
Message-ID: <20250616094538.33256-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1498; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=zkQWBO37VN3NVGbjoJhPxoXCrT6Q3CmQrD7g+/aYgks=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoT+fCBAboPqnDdMQ1PbbW1abt+tp9PiIs4J8uF
 Zr8YV5NFt+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaE/nwgAKCRDBN2bmhouD
 1+wzD/9FB4y+oWO5csn0+pLRk1mm9Z+42W/TegH2R2wag3jd3cYzP86Vv4/BBQbxHc4hsGxAAZ5
 RJsw5q0sX6vx3hDeyo1uZH1BmKQHEJASDC8WDPDPC3pYHQYhAxRYU617yNlp5UNNk6JJ9rC+25p
 ZXvz6nLdWoj8peI4annyXHOGVlPEZ53Mn/2PBlzdYdLvUgDMX6bUwli5SWfkibYRWq9FzXrZ8FP
 MNZtWXFU21u8GVRwWqONPdwtAkYCBVIuq+Ven2bdI7PCds9Qh04Nd5QIT/Nd+XRAV8IQBZjUd4z
 xsdRNotZyXzhceSmHfMDHx5jFJvSRz9OrXXYvaW1uXHD7bi+b0h+xai9SkzSyHsMzRL0FX2+hB3
 MA/GXCreM+h2UXk0QhYRP4oQTQHrJ/ZF1PxAhrHw7+7H8lgOnevjGTQ0SF1fpVS2Ve9x1XmKcKd
 B8dODZghP92kNu7iATg0RlDsXFilqRJ9fsekxbzPbmqriNAWrQ6Ozc2sHyDPTc1kNJ881pJsHRn
 DTkh3it/D6s8jI9+0Njc6Yl8YEK22YfjkiY5LGPe0+k/i6XgGxbMBQPkgpOD9OZsttb/J0TtHLc
 KwAdUydr1wsCOlqvU3YluXNrJddgEq6JPnGl0er01MlMYa6C+e/F6GjLgjO1EEas12HlvlYxHV4 fpTfFw2FA9IP2GA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Hi,

Fixes for issues introduced in this merge window.

The defconfig change affects Qualcomm SoC, but the originating commit came from
Samsung Soc tree and it was not yet picked up by Bjorn, thus I am sending it.

Best regards,
Krzysztof


The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-fixes-6.16

for you to fetch changes up to 8d2c2fa2209e83d0eb10f7330d8a0bbdc1df32ff:

  firmware: exynos-acpm: fix timeouts on xfers handling (2025-06-10 10:20:16 +0200)

----------------------------------------------------------------
Samsung SoC fixes for v6.16

1. Correct CONFIG option in arm64 defconfig enabling the Qualcomm SoC
   SNPS EUSB2 phy driver, because Kconfig entry was renamed when
   changing the driver to a common one, shared with Samsung SoC, thus
   defconfig lost that driver effectively.

2. Exynos ACPM: Fix timeouts happening with multiple requests.

----------------------------------------------------------------
Casey Connolly (1):
      arm64: defconfig: update renamed PHY_SNPS_EUSB2

Tudor Ambarus (1):
      firmware: exynos-acpm: fix timeouts on xfers handling

 arch/arm64/configs/defconfig           |  2 +-
 drivers/firmware/samsung/exynos-acpm.c | 27 ++++++++++-----------------
 2 files changed, 11 insertions(+), 18 deletions(-)
