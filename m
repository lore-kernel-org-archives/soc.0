Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B90139D
	for <soc@lists.linux.dev>; Tue,  9 Sep 2025 18:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757440901; cv=none; b=lQ5Mj4TpqEsxCevh3GRwBnnJT7/osONt+QRw0Qks/7U6OaVVEt1L6uI+mdeWOXa53geBqrI1koMPpn4G7H6vVGielw7QLwX8DocZ/4L8YLM7c64El/WQsc1sl1z0vR6WZyiHlfpz7yCaK2oTPU8ZT8hewezVJCYCWrGFqkIWREw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757440901; c=relaxed/simple;
	bh=z7stafhZYkYX4fyP6Uo0x11l37pExFzKqc00XYTP1Tk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZXjcPeMlmKmXmNZjhN/th3RXBs7wsnptPAFkGWT9NUJXvSogmPgALW1fBTLyplNkJrywo/PS/lbOFbnTMI4Eo99rBMLK0wKjiiLzs6GLwqQQFc/aXPt5ifmaVfrc9i4/v6YRmorzMSCY/nRFTA/pgFq2ibOR5e5SJ2NFmGsR4qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gpSwS8zl; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gpSwS8zl"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b0419ea6241so65708366b.3
        for <soc@lists.linux.dev>; Tue, 09 Sep 2025 11:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757440896; x=1758045696; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uV+QfManP/XoG0f0/tsZKH/Yp6Kp4GYm51f/Nlkl9ao=;
        b=gpSwS8zlcqxfhvDJ8rPeX+B55zaAayJhZx1Qf/aTT5mtpBd2uBmCydK8USvkNLHLBQ
         cFhHt36dSp6vYKw90wQEK6mMlVpD9h0PrsRentuCG4PpO8VCZmLLvcPfCEUCmaLVEVP0
         T9+0jiB5j6ySEpMSZ2UN40PQi05wr+OsgnZNyMu71RE/CHKTZu0odeL9cLpEFmNgt+vc
         J792oI8gZZOkqaFkRFn9nSn+hUO50UWzaq6hCUwGAECQa8jF9yBhhbTEnUMpGD5u831o
         jV4hrUwmh2OY8QJ0+i4QA1RNz59yXu6CnzGj/XmEJHBDYqZBZHYDA4k+yBCP2FyVrnAG
         I9uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757440896; x=1758045696;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uV+QfManP/XoG0f0/tsZKH/Yp6Kp4GYm51f/Nlkl9ao=;
        b=Hm6kW8uYNt8V2RVmuaN14yWGmOrW7d1wMukJnXOP2Lk4gY0XsCf5YvksFmGBRUpB12
         tmVf2LKu7zM0PEus/bSdBWIIL+pg4Vdu3f78149lVtxngeHlpT4045c1M/UjnIYnl81Q
         zDZ4qXw6sFgVOCzNgqQyGrVvLMqrEB+I/TtFpMfhIln1Pjx9xOgG+oEZkgHkzzkfkN51
         NTglugZ2PMP7P7w4pqbbL3T2F2zUxvBdxBRAXbh/XJBkXhzqL4q8r3qPmI/BIX3o6X2E
         pOnbzEgrhktyGZvtezZ29wCGmpMMkb3dV4kAtP/VqJlgwXmEP7QoEs4jAvD4upk/iJCH
         nxjg==
X-Forwarded-Encrypted: i=1; AJvYcCVeLSFFGMG63j47V9kZOg6ntFCYhxOgBLRVmQZvOb1pp4BTqVTUjH/uLb/Z5hkzBb5sF8g=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0r/GXPkA2MvwW2/lLqBbvLuOKyWpDC8JoJkWbHoL/JjHNzI5/
	hgbNz9VSOtJfPHE4MZtm5kw5uEqOIsSMbbXnjYRFX9meyF61Sp/1RBqoAYi9VebBQkw=
X-Gm-Gg: ASbGncu31XEHAw7BJURoUKJ59y863qYKg+XjVBDNKsEzOX9knH7bFHrdt+x5VNqfn0h
	rFueEtkCHaIHPoSzyOGnU9IFywCfEcxM5D3Trow8yS8hPBxblhDTvgk48zH1t5SEYRqdBAOWPtC
	IVT2saVhE/VGPiJ9fjHS1GwLAIiMGXWmLk7xBr55qDQOYOFuO5+NeaCWLL7DF/a7AytvqBw98XH
	ffU9zd5kQAaIeKQFdG9uILcSL9agtl5mjJ0tzrI4sD66Ylo0XCu7tdqfQ1Sv5UocYnnL7v/+ABO
	oxfT6+/I6j19EPHEI+gjocJjYRpSxL6rM8DfnVLKh9MjqK4YWqGH89n1mUGiPZw/mGO6oeExAkK
	vmfZoYNx1gxhv9sTAMqCwLJjxci+C1+9WnkZ35ElH+kphpWgpHk6GZ8g=
X-Google-Smtp-Source: AGHT+IEiH+nmvrwhayI3HbM5/x4e5TkLk/RKC28fCLjYZn/wZHTfmtWJ39TPSN3Baj56Zpj1yrngbg==
X-Received: by 2002:a17:906:6a18:b0:b04:57e7:b1c4 with SMTP id a640c23a62f3a-b04b1007b33mr621356666b.0.1757440896219;
        Tue, 09 Sep 2025 11:01:36 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b078334e899sm26294666b.64.2025.09.09.11.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 11:01:35 -0700 (PDT)
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
Subject: [GIT PULL 1/2] arm/arm64: defconfig for v6.18
Date: Tue,  9 Sep 2025 20:01:26 +0200
Message-ID: <20250909180127.99783-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1031; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=z7stafhZYkYX4fyP6Uo0x11l37pExFzKqc00XYTP1Tk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBowGt3dWN1F2E/oAo07Sev7IogTOAGCAVnRfrAE
 tAIRR/xEx2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaMBrdwAKCRDBN2bmhouD
 16K3D/wM2NurN0pcMDt1sn4GtZ+UY0RjSV1g6m5jXzx7W9wpkCf6AgOqOkCgrlial1N3Cg6nyut
 n0f93rWXhYCkJEdySaS6Fb/Kd19ssb/EyJa8UwpNCtvOYhq9OcXpuHrKV/FA9RqOY8gKnCpl7iS
 CHrUCwBEWsM7HDURd305LXyUvW4D0NqopERgqnFT99F45YzfjZgc5cAJ3Ikt5hsjTgCm7NwKKvd
 +AkY0qUV91zPPtxF4HQ+vriYWjIFcj9sktWO8ADOVdUo2lamNS8l5sle/mV1Q/dsctKBwlbgjW+
 l+KOKgj8ad0+UeSY3meSiKUE5PQSsjqKwySarxXvq+cIpeO5VeWNqf3d4zuBG+mj+U5NymVc8GE
 U70TByD1BklEtmLmlS/zgr7kB7YhJtl2voV2h4cIetMcfa3MjtRODCU9O4CBD7uoEkyL9+hgcg/
 J8D0+7TszHaBOu7/7Y0eD9+ucpMj2bkJ9Et4voZdNpvPUvtTWv+Z/4JVH9myOAEP5e55nVxRP/8
 lX6CUAVAdx9ERGwXrnlo6rwNfpyQGAzYEOCVw4JjwnePwiPQCd1mWONsHs5Qn5Ne9dBQ5IXA3TQ
 xtk9kQ5D1jHD0XtdHhGlBtInRQuuF67uQq187t6HO+fqTHUQnfaYVUbBvUMxNUbDUgvkvWowRqt dROa47FJgYCk9sg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-defconfig-6.18

for you to fetch changes up to eca86a61aedaa40310135c8799b28187afbc677e:

  arm64: defconfig: Enable Axis ARTPEC SoC (2025-09-04 15:44:49 +0200)

----------------------------------------------------------------
Samsung SoC defconfig changes for v6.18

1. Cleanup MTD_NAND_S3C2410, being removed from the kernel via separate
   tree.
2. Enable Axis ARTPEC SoC in arm64 defconfig - new Samsung subarch.

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      ARM: s3c6400_defconfig: Drop MTD_NAND_S3C2410

SungMin Park (1):
      arm64: defconfig: Enable Axis ARTPEC SoC

 arch/arm/configs/s3c6400_defconfig | 1 -
 arch/arm64/configs/defconfig       | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)
