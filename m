Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D741FECB1
	for <soc@lists.linux.dev>; Fri, 16 May 2025 08:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747383862; cv=none; b=VAmGJyAqUU5V8C8VUaGQ6Zs2gBEMGiz+/0u1ie51vSYR5SR7bdqTRZcwJaYj1+6tVTw9EwldBoynoycvF0hSzlnn3Fp3+4EQJh9jLASbZLjn8Zd/40qkrzUZDBAfjxuRlbsXL8k//r7hsA/Uh1jJO4hVBNpJ0UxWIbcvNqyidIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747383862; c=relaxed/simple;
	bh=YwKjx0fEQ0UuhQ++E/oLz5zeEhVCz3xdDGClQFFBPq4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M3sMVDTMqj8vjoo3vU/9+0Ui1UrSgdaX8VauUM2Z/tL/cihgcfUXj68o3gXnB87jl2Eby4C8J07Di5LBvWmPc86M3LDH65PpADMOEI64agaWibPhE4r/F97tZh9bRFDisSGZQp66nQbLCQM3PTOb2WOtTU8GTB+Ddz5m8XZC9KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yPAKk1c4; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yPAKk1c4"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-442ea0b3b46so2331545e9.0
        for <soc@lists.linux.dev>; Fri, 16 May 2025 01:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747383859; x=1747988659; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EMYA3hP9yM4YaD28axG+SVccD5Rf7aF501EOBYAvQkI=;
        b=yPAKk1c46gUOLEzWjGZalyTf1bw0yNcoTCzCHTEi2a0R0ekZQ94rWeMu2JDgAAg8sb
         i5f2+emSWk4XxX/aHFOh4L718ZTvaS5kelAUcAxDbRtzEQVdDLpVsGoV4KjH3TLClDUE
         EOfNZVPqgWWjknWxVybRSUGK4ONtGxNwUaIBXqe0boXfEVpL9yKe9Ro395ix6/UKc8lt
         snHJYE/qSM/U64AEUL/JETkOt3N7SisoMgOfaJAVYhprs5lIsQQ+JBdhJbs9r5cZ/YnZ
         MG70FBdH+i65CTn2CaALMMIO+XzRwjlm8n0S+rhgvAWwbzDuWTGOQ47p3pnYxrImAtnQ
         +ZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747383859; x=1747988659;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EMYA3hP9yM4YaD28axG+SVccD5Rf7aF501EOBYAvQkI=;
        b=TU1FOM1AYgruisD7wP0ihkQyVIQnsr1/nVSPHrHw91HtyGIMk4IEp5JRuUbN3Xe8EO
         c8xz5pnRR6VObjQata4SQg/c47g4w3TVkwbGaI8dGHjuadyy37LhS/wVvkLrGzgkTGDP
         XRh7RXXIMntHwi463qLU5UpXug1vARRIpSXFtvADpdKS9zkXq6/3GxP7DGlpNkwUsBiJ
         tF56ZNiLDBncYza7b9LO0+TGM2I/7KKgqHI9xdR/WizUMNF2qXl+V3Kb0faicGm0m1MH
         9tQVkxQR/ZLjzKW/WFKw2GSMpVDMFfj0u0DIwBZ3qitA6vUktzLM5RGT99Chhc22UXe2
         RuXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmFtC7wpOqMLx2H6LYK1W6/X8xv3MoCEnhYwv17OB5THLkma7nr0L+HhSjt9HI3QkrHXI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzp/UniP4jw3FQL09XbGzfieSL6KQrSUJp0JWoqqMcbp0srZKT0
	AxZcYurEIZgyCC0srtlSJIQGtLTG/9VyWZ+R+AuWHFUm5TKtu7si/Kw19kkPCtw/JfIu7JHZgII
	EkO8yOsk=
X-Gm-Gg: ASbGncuUyihJi+KRKqEyssYbYQSrHsTqxmXnH5i5ArXr+acBkJydK5Tg9Xvkpm3xpRP
	c/wwI5LA+LSUXCXIov+w2vgIIrThEVhuPW76KhqoLnvsWaOrDINFpvcIMc9To1PIs7Opw3nO6/y
	c+se1St9y995w7gOz9ziLWeLLielaNGA3AOwCYyu0iYK3NqRGF8zk1lT4eByhIqkDAAwUr/XOhp
	zjC/KTVmpNT27CYLerOM8U+PjDJ2Q2GkUMRZCnyz2jY2mvv9htdHKFMgMKn/9MRQ7UNvL4mcG1y
	vG8Yn25ioSpmwEU44/UzPFsy5AH1Z4X7flyseouHk/GL09rBzsBNaWxA/C5s8YkHWfI0b6LYfA/
	15VwmVceghkyqX9UHH1nVjAenTg+W+AnOdbmHSDA=
X-Google-Smtp-Source: AGHT+IGKToQImfBiAVkuAUoU+7wSjsQ/54y3m2rmtsbkq3t65m/SkGnjmXSlnYIdMc3OVZVxVfOLNg==
X-Received: by 2002:a05:600c:1991:b0:439:9a40:aa1a with SMTP id 5b1f17b1804b1-442fd675d79mr8193005e9.6.1747383859026;
        Fri, 16 May 2025 01:24:19 -0700 (PDT)
Received: from kuoka.c.hoisthospitality.com (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f39ef400sm93411555e9.33.2025.05.16.01.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 01:24:18 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] memory: drivers for v6.16, part two
Date: Fri, 16 May 2025 10:24:15 +0200
Message-ID: <20250516082415.7871-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1468; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=YwKjx0fEQ0UuhQ++E/oLz5zeEhVCz3xdDGClQFFBPq4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoJvYvRK2E98+gpKrkbPvu1UMNGJxkSJ7aBGB0X
 HDrDM5EEgSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaCb2LwAKCRDBN2bmhouD
 1+i2D/9drp29FyK0+15NezDZLAPtkNoejrB9ufc9VlWOXwcQbp+3JsrgMDh0zV33cJRDiVmpOsA
 lRGEDBgxRa3QTDQzIqSYRWt8FDMqSsTlLLInyGSvI+El301TUf8LRpJFOURHMEt3AMhYXUBeLNn
 IKMnoog4YfMdI8zoabS0/wDs2qpZz1apY16TlLyt17ShdsxJXs4xQqNYsM5kzSPu+910oS9f4kT
 PooTBogiZBY0jHt/8wnZL1xFRnJPWGxvPL/ABVaYs0Hm9dE6mfGUJsGBjpIhLVGzBzkp2exgfpe
 JeW6cvl23jCT+npgpUQh161JUtN8bx39UYUr8ZREvF98igmzbQnvp/v540Zb4mJlheZEbb17Sqa
 iaoMTbSPOE2OO2IDOjnO61655sygMcv+TkoIqPve+hkMsv6RWYQRdbRJkyxBt92uZSddhd9367M
 YAEUjaxyXl60SAFhObkCPXDkj0VeG1LZSJ7+uFKbwmZtU26AitsKajMCqGodVxVxSx8GpJRZfNj
 Fb3K07RWsHwww61pqZeM/GKtsOXN5Q/K76DB8zdZ0BEiPAv2itrapXRyxjbXChERnyHeg58JKi7
 QC01u3CV32bkt+9+hPvs6nKDDa0Ih9ia0sNOAL8UPhDRS6HgBILdBPOXj3Maae2AoeGj3qvgHcN VA0kMwq29gBcsRw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Hi,

Second pull request with fixes for introduced driver in previous pull. On top
of the previous pull request.

Best regards,
Krzysztof


The following changes since commit 02eaee70babd860d76dc23f9165f4496d0ffe77f:

  MAINTAINERS: add entry for STM32 OCTO MEMORY MANAGER driver (2025-05-07 11:27:03 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-6.16-2

for you to fetch changes up to 388d0cc33cc6fc876e053644d6af694b9d5c639f:

  memory: stm32_omm: Fix error handling in stm32_omm_disable_child() (2025-05-14 09:54:22 +0200)

----------------------------------------------------------------
Memory controller drivers for v6.16, part two

Few fixes for STM32 Octo Memory Manager driver introduced for the same
cycle in few commits before.  These fixes were reported only after wider
coverage by bots through linux-next exposure.

----------------------------------------------------------------
Colin Ian King (1):
      memory: stm32: Fix spelling mistake "resset" -> "reset"

Dan Carpenter (2):
      memory: stm32_omm: Fix error handling in stm32_omm_configure()
      memory: stm32_omm: Fix NULL vs IS_ERR() check in probe()

Patrice Chotard (1):
      memory: stm32_omm: Fix error handling in stm32_omm_disable_child()

 drivers/memory/stm32_omm.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)
