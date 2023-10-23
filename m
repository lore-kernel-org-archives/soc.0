Return-Path: <SRS0=Vtau=GF=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 757D8C004C0
	for <soc@archiver.kernel.org>; Mon, 23 Oct 2023 16:54:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 33221C433CB; Mon, 23 Oct 2023 16:54:19 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 47F58C433C8
	for <soc@kernel.org>; Mon, 23 Oct 2023 16:54:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 47F58C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-32dd70c5401so2461895f8f.0
        for <soc@kernel.org>; Mon, 23 Oct 2023 09:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698080056; x=1698684856; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LzNpmNp+fktKwDMwK/gxOQWv1rtKi9BTRrCYzOlHcaE=;
        b=sZEGns7jBARF5d5z+oyxFdjORnMrokFX+3DWt8ATrcZVC0jEqNFfjVBPjvC556oyYQ
         /M66tXurGj5yJCzgLgYB0UHxeGvmAHYCSgQOrrTxm2q6jLBiI0D6o6z1iDzVckSa3udA
         iRLJVcx9WXJZ22sG1rBCQkPt+0lHZ3DWxQAW9xtI7U7t+b+7AYMh1i4qHWSHBkPLv/z9
         cQjmxWQ+0m6pHZlL478n4ibffwdAQwn20ZDadNIqae+cKkJu5CMf1en1mdowdy3TQui0
         qkOOw+y9MsZwtyrOV9gt8XT3hUs4I2tW4EvG1b91AeGBAPq0KLsIKZnXkU1ojHO/yoqV
         Wi1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698080056; x=1698684856;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LzNpmNp+fktKwDMwK/gxOQWv1rtKi9BTRrCYzOlHcaE=;
        b=l08waij9WvvRUCwuB0t7AvUQY7V/xlQXRUZkjwxtQKbrdm3pKJs+MWmrd9WgryTpxd
         4rITKgL6vxuccHPK6FM6TlcIGOsRovn5uY/H9yJJ/lBrjYEUotnvlvCvCH2NAnC+Eg1b
         y6MyPH5IpDMv5gJtMscqHAFIRmrXa1RcvnUKvNqHcYdDNTGFcYql54sA57wBOOz1lhfo
         +hWNJ/EB9uI/nqnyPyGc+RcadyJ1Ie76nzYt1hMwcZZ+ee38nPCjs6fM9l0/WnmmEmOk
         97ALb8g4/OOD3VB04pfQnWWRD32jJDelqS+B+gOERVri/UEQvJ02r35z4+uD1wXaXZnx
         EgBw==
X-Gm-Message-State: AOJu0Yz4apMmy5TQe8fuAo7/DbzP5dc4+4bdUlkBHPQD4WMmOn4u3l3G
	+m0nnr5dxEM5wF+yvwVokf5cog==
X-Google-Smtp-Source: AGHT+IES5Wh57HTX5V9DwQtvZnwriBUWvgP62B1LNyPFJZdJp0f2V2qI1D3EsrezWHIvfB2Wc7zBQA==
X-Received: by 2002:adf:db48:0:b0:32d:9d80:4038 with SMTP id f8-20020adfdb48000000b0032d9d804038mr7071732wrj.49.1698080056571;
        Mon, 23 Oct 2023 09:54:16 -0700 (PDT)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id z7-20020a5d4c87000000b0031980294e9fsm8097709wrs.116.2023.10.23.09.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 09:54:16 -0700 (PDT)
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
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] arm64: dts: samsung: second pull for v6.7
Date: Mon, 23 Oct 2023 18:54:12 +0200
Message-Id: <20231023165412.529762-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Just one more patch on top of previous pull request.

Best regards,
Krzysztof


The following changes since commit f28dde395937e000585ac87c0d1c18885661161d:

  arm64: dts: exynos: remove unused TMU alias (2023-09-14 10:03:47 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-6.7-2

for you to fetch changes up to 23e4a49943624dd83199989c852565a3ff760fa7:

  arm64: dts: exynos: Add reserved memory for pstore on E850-96 (2023-10-12 22:01:49 +0200)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v6.7, part two

Add ramoops reserved memory region to E850-96 board for debugging
purposes.

----------------------------------------------------------------
Sam Protsenko (1):
      arm64: dts: exynos: Add reserved memory for pstore on E850-96

 arch/arm64/boot/dts/exynos/exynos850-e850-96.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
