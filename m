Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1BB2288E3
	for <soc@lists.linux.dev>; Tue,  9 Sep 2025 18:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757443566; cv=none; b=hl5Wz1GgeoYKTMvUbGK0kfohdCZwWy92SKGHl8tNCJvkXX/9+ot3dZ+GpfnapTIw7gy9GTNIfafwZqZ4Z6p9gWKdyaWlkYLHImlwZDvrKi0KIUNTniGOYNKdbkYrF9qLv16iw/WadtSppAqBMyeJneWEjKK2dt0Sqk1stHCNtcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757443566; c=relaxed/simple;
	bh=96PWMU27/jrXI2PVjuNvBWIsi+qKgC6GLk3JCeyEiAg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dzNsonZt5e8S8gxKpzVWb379u1xpYbac1PEGF/xj5TR5NDqjN0dUMJC9L8ge3ezI7zNL9ZaAv1+5Pm28PPItWqbwCRKIg71qrO0KgbizAmaq19IiMVLhXKDt3avgMKYvtpGFGbYnvLxWk6wMMp+Y2wYobphbtAtqF3OTXxM/m0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L4F79vVK; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L4F79vVK"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b04962540a0so94700066b.3
        for <soc@lists.linux.dev>; Tue, 09 Sep 2025 11:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757443563; x=1758048363; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sbgtE9csO6Cvgxlo8b8Cy8qgsxjaxLMfDvbV/GRdzeA=;
        b=L4F79vVK/1VZ3omm4at1V6pOdU1USwZCX+qdLbC2MrKcEfI12t2J1RmptHJp1TH/lT
         gyp77FDWwbbC1PYOWO44YKFU/qthYSA0eYOZp5JgurumBrN+Nrr4DPqSBS8q/g/v+vEh
         RLRSFCIGBi7coIveYpT+VWrma+fuffu3DgH2L2dk9sP2cfivGmRllpoX5NAK7C98OFtm
         jik7ofeKm8m+4qa6VmE5+B1ablD8RNXO/2NNHpLYT9Ci7E3VQMcidp3LDI4xV5ysHJ8F
         corYjpuRUsKW/j9JhRTBt5wamRYukvcCir204DOihtr9FlSyDXCQAxGSigl0p1FDqK70
         dyLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757443563; x=1758048363;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sbgtE9csO6Cvgxlo8b8Cy8qgsxjaxLMfDvbV/GRdzeA=;
        b=cC1lvkhXm9MoFOD1xEHj97GNz8z6BDBY1gUpvg1/jRMyQl/kntMcRP1ulcYD7rdoL2
         bkcPvOPtYfixc0BHNq7gVad5obx2cESt87gBLIRzlgM8v4ZvIt7qIdkcTAFPiFLnHeYJ
         sk6RPaOEKtUdxDgzf6eNl1IT2ojWYBSCFTbKv9oX4BBPAPFcheCol0Bd6+PUpQb60oGD
         8hlW4Zst/+RyUwBaQ7cmC+G6BnhjWLRCFcCpYYnXw+azInDoVaohXbuvhN5nFAOG7tGp
         24T5BnnnLAZg0wvcKgThds4mQ93dXUzwCfiURk1o6pUMOrOY5SqKwRjkN0X70+SlgPU9
         J6sA==
X-Forwarded-Encrypted: i=1; AJvYcCW73Z4xUqxgxss7SiO4rjJqVBLskoFdbZFviC1c1nDwaRrA1Y/f0fJdHE4oeS6XJeNMdCw=@lists.linux.dev
X-Gm-Message-State: AOJu0YwSE5CmqWJhamipsR0fhTsjGbGBAbmpA/LTO1ONSnVXBY73lYbZ
	5ufIBRhZdqgqMa1mwxyRA742PR4XSJYXyKYTjIAWZYre8O1vqB88BQMYkOKw/SAe9to=
X-Gm-Gg: ASbGncsxMDqjzR7xGja5lVfkLp83Pc+b+e5vaHRGIAsx3nYue9AFOVSWsNQLYJjyfz8
	aI6RYG4iOL9aOGlsml3ayuWDUddrFkpAUOk/kFbgmkBXsxEF4ao6ZQ7syg5wPhIRsuUc4AjNxfd
	dqjaC7IHy5jPH2WTXGB9CPTkzEqDGR+11KrWkG8Ats9kgAniGnQrx0ERJUoRM53hU3qmO++dF9f
	m5iWSj6Sq7+NigPSCctsWL8MklaFmRpl1WNSubqWcibB1Y5htmQgrW6rF8NkUUms0OBfXxKSimQ
	INFltTq6FVX3prZqHnRwzWGQ3Eyt2ZdLLUk5pxPs0yERSCffvskg810Vjc5LK6/kljdtPahy2p8
	TWRWB8hD0lP5THYoe3eGCmNyhCYVBXTuaXlj5oI/Hv9HOYqQBrJPJNIs=
X-Google-Smtp-Source: AGHT+IF9qmGIbHHgyLkF+cuxfT/tBA4kZKk5q6FFmJEiexmBUNMRyqAXcs52z+BMBR9gWhKpKR+C/Q==
X-Received: by 2002:a17:907:60cc:b0:afe:ee31:4b93 with SMTP id a640c23a62f3a-b04b10a4accmr652443266b.0.1757443562945;
        Tue, 09 Sep 2025 11:46:02 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0783046d34sm35399566b.6.2025.09.09.11.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 11:46:02 -0700 (PDT)
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
Subject: [GIT PULL] ARM: dts: samsung: dts for v6.18
Date: Tue,  9 Sep 2025 20:45:58 +0200
Message-ID: <20250909184559.105777-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1462; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=96PWMU27/jrXI2PVjuNvBWIsi+qKgC6GLk3JCeyEiAg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBowHXnwqcshQhMcnuW6z945CPT+bxhcKDTjVPRJ
 pSWTYWfHrmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaMB15wAKCRDBN2bmhouD
 1zUdD/wN+EBFSwGSxuGwG1tuhq5rNoCYRiolY1hHazJfxBx0abVi8Ilgrp0VoAWG5kZW8Jq+wTc
 QTTQoqHCyv4RKvO0jKM5gNCEWFMw1fhyO8k393+Ct+aGDCpbP1IbZZtfx3t3Zzs4D1gCXDH6T40
 jVWun62rnKoj3YKcyvic0Whd7ABzCRfNuXmDvgCLdEW9rqPUBNty/kpShQZTc3Md3Oqm5z1guUI
 OeVkU4ZKuX0IQBoZZQ8ODIVf1SiRtMyr289ULGsTBe713UsZfTBwxL4XVlVaZ7qA5PUSVJtioCV
 CL74u9paL/IB/6h8/KCxN5r0pIaKHU/NLrOEqpgg7NycD5m595Uwaw5FuB6F5fphQ8WaDLVuSC/
 7e58lPDbPHOKQ6fpTTlGGPJegDmTDrp4pnRmKCTzwnO2EjayT7tKpjvrlBg+OqnZOM0qfi0vsP8
 sHaza3Vm1GXFIQmaMkedoebzzjDUmVBG9WyxtnJEMbbuxZesUK35A00qjAvo1pBWm3+3mrHMDc9
 6XlBUm67Sk18/hrFeDi+Of/AMke7AWftXc4n+ZBRgYEcYj5gc4UdLzL3TyXT9PS7v3hiRhRf4+c
 dKLibr+/ix3V32BBRNSWoDGZ4AoUaLQPboAZxi1xy8y8FsWOW0nOTxOCcKm6JaORP4XrrTruBCv VxkqT4s/l9dTxDQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-6.18

for you to fetch changes up to d19b1773362adfe8c0d5ccc4faf6aea0249976a6:

  ARM: dts: samsung: smdk5250: add sromc node (2025-09-08 09:35:51 +0200)

----------------------------------------------------------------
Samsung DTS ARM changes for v6.18

1. Drop S3C2416 SoC from bindings, because it was removed from kernel
   in 2023.

2. Add Ethernet attached via SROM controller (memory bus) on SMDK5250.
   This wasn't tested, but code should work just like it is working on
   Exynos5410-based boards.

----------------------------------------------------------------
Henrik Grimler (3):
      ARM: dts: samsung: exynos5410: use multiple tuples for sromc ranges
      ARM: dts: samsung: exynos5250: describe sromc bank memory map
      ARM: dts: samsung: smdk5250: add sromc node

Krzysztof Kozlowski (1):
      dt-bindings: arm: samsung: Drop S3C2416

 .../bindings/arm/samsung/samsung-boards.yaml       |  6 ----
 arch/arm/boot/dts/samsung/exynos5250-smdk5250.dts  | 37 ++++++++++++++++++++++
 arch/arm/boot/dts/samsung/exynos5250.dtsi          |  9 ++++++
 arch/arm/boot/dts/samsung/exynos5410.dtsi          |  8 ++---
 4 files changed, 50 insertions(+), 10 deletions(-)
