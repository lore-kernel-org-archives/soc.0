Return-Path: <SRS0=D6Du=J3=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27A87C48BF6
	for <soc@archiver.kernel.org>; Sun, 18 Feb 2024 18:27:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E94C6C43394; Sun, 18 Feb 2024 18:27:03 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E3D75C433C7
	for <soc@kernel.org>; Sun, 18 Feb 2024 18:27:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E3D75C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2d22b8801b9so18308471fa.0
        for <soc@kernel.org>; Sun, 18 Feb 2024 10:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708280821; x=1708885621; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bcQ97OFQNs3R16kTM2aR1AcH40aXNgteh4fPRKCJudg=;
        b=jSOIpAPeHUlWmHJdID6EgVv6wK7XcUzlZ5MGGTPsYLb+1c/VvdZ5ynzPGGvse9XEcA
         33imTQX5P9HopfNb7d3KH61mrFc/VvcGsEbfYQ+7OYzhStpmrh0vIAYXQXslwgkhY8sh
         IXmpYbwBVXWAe6g61mMhDzOdajJ67GdUE2oQnrwSYiLCBGbcia/gjEXxETm9d0zBmRF/
         AUEBCvf2sBQiH333nT914q9vMzGecBgdxUAbf0U+eZIWe63L6uytye3sxPJ+FxiTx4/t
         hvL4IHdXF7IFVUaSWcs7GbF6FtQKR7Txowi8u9Kfk4jB0uuVp0B8auobEtRKcGc9ij6k
         CYvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708280821; x=1708885621;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bcQ97OFQNs3R16kTM2aR1AcH40aXNgteh4fPRKCJudg=;
        b=c4iNUqKsR03enytiz1P0Pl3kx/YpRSc6DV5u7wggw9+cZUDHADtD/f8ECsq7NLHYMx
         fne5Q+iM7ods4eopBQmyCkIJaMnVQ1+R+fmnvnRKHbvB9ILmQTzUw9NSvlq3t5id3PBH
         mHWSKnwLjfiNVhPCn6rV8D5fM/f3VKqhNpxyYva7lAPg1mFNUmdAlJllxCeCmStCFyx5
         QoCCg2kt0+L20kdOprZuTVjrsvEI/gHk5l+Fohxwp0I4ZCJYNBfh4CdYo5cfvP3zBr/i
         bopvYNJ3Es99T0OscBBhr7jp/8oHyWWc/SmgAjotSLiDpQrAQlNCoxE3aUl8SXr9SCj8
         vKqw==
X-Forwarded-Encrypted: i=1; AJvYcCWUo/xfVwq0tsROoAvqe2+igfZXtZElCd19rBBLXkCIimXYMVN+MX1k8x5NLg9G3Pk8WGKiXgHETbl90Xs3Xg==
X-Gm-Message-State: AOJu0Yxkdp+w0mobYuyhfCBgfXp+jHsGTFUtPKYfrIm1m/K6DFSy9tvS
	A0n6nZYKqk+tUw9e8kfFa1xTOVREV7Ma/dZtP5K9OH2MmHs/lqZgAWgDko/noUk=
X-Google-Smtp-Source: AGHT+IE80M1z/F09P03IHlpRGx7t7Lw6zDY6kyyJTY7Jo4EVo8YoAgu0THGO93HaW3bGoE36IXzy7Q==
X-Received: by 2002:a2e:300d:0:b0:2d2:39fa:822c with SMTP id w13-20020a2e300d000000b002d239fa822cmr500915ljw.35.1708280820849;
        Sun, 18 Feb 2024 10:27:00 -0800 (PST)
Received: from krzk-bin.. ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id 23-20020a05600c231700b00410b0ce91b1sm8698796wmo.25.2024.02.18.10.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Feb 2024 10:27:00 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] ARM: dts: various improvements for v6.9
Date: Sun, 18 Feb 2024 19:26:56 +0100
Message-Id: <20240218182656.32103-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git tags/dt-cleanup-6.9

for you to fetch changes up to 8c82b4eef2972200f6171aaa260d7bba2ad29889:

  ARM: dts: sti: minor whitespace cleanup around '=' (2024-01-26 15:30:45 +0100)

----------------------------------------------------------------
Minor improvements in ARM DTS for v6.9

1. Marvell MMP2: Very old issue, for which I sent patch back in 2014.
   Patch was never picked up and now another try to fix the same
   happened, so here it goes: use proper compatible MAX8925.
2. Marvell Dove: add proper unit-addresses.
3. TI DA850: add MMC interrupts.
4. STI: minor white-space fixes.

----------------------------------------------------------------
Alvin Šipraga (1):
      ARM: dts: marvell: dove-cubox: fix si5351 node names

David Lechner (1):
      ARM: dts: da850: add MMD SDIO interrupts

Duje Mihanović (1):
      arm: dts: marvell: Fix maxium->maxim typo in brownstone dts

Krzysztof Kozlowski (1):
      ARM: dts: sti: minor whitespace cleanup around '='

 arch/arm/boot/dts/marvell/dove-cubox.dts      | 4 ++--
 arch/arm/boot/dts/marvell/mmp2-brownstone.dts | 2 +-
 arch/arm/boot/dts/st/stih407-pinctrl.dtsi     | 8 ++++----
 arch/arm/boot/dts/ti/davinci/da850.dtsi       | 4 ++--
 4 files changed, 9 insertions(+), 9 deletions(-)
