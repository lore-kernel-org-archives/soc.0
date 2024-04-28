Return-Path: <SRS0=8hDI=MB=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 785B9C10F1A
	for <soc@archiver.kernel.org>; Sun, 28 Apr 2024 16:33:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 502BBC4AF17; Sun, 28 Apr 2024 16:33:25 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5A921C116B1
	for <soc@kernel.org>; Sun, 28 Apr 2024 16:33:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5A921C116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5171a529224so4581336e87.0
        for <soc@kernel.org>; Sun, 28 Apr 2024 09:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714322002; x=1714926802; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DIvwFd+6dBRNz3tx998sp/xJQSPWwbglBJ/Us19tEPs=;
        b=I0BSnJCXqwUNjRdGLZ0Zi8BliHo1EtF3GRGKNq8ySChklYlHHMk10D7XIEFg0pGvDc
         kVfCTEWJF75YTZZ1jcPsh+og3m+ECi/MU/EtqYQlc1r8qtGyvkRxzqXLSPGgBt1UDky9
         TF3NR+cFATZqe+m2i06D3mInYsx1xyhgoPYmhhYYgYVHjj2bH9m1LvAcFaAoE7faCO19
         cuEAqztNqpZxd24bbvvD7Po7X6DwuUIIHOSs0nuX3tKNXM15UHCiAX9kddVkLHwJ+qnv
         huKmvWlkG2x6cQJddfQh3QOFSU6wkGws/MG+Rg9H5RcOGm4zDuMbPHMwPAdD8lXSEEUm
         RNQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714322002; x=1714926802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DIvwFd+6dBRNz3tx998sp/xJQSPWwbglBJ/Us19tEPs=;
        b=YfcgmyONALXCibDfTkrhLvmKFMKjmDtr7OIaOG011jxj9wDN6cAu5dWJOr41RjJVha
         dDuowFCPweoX5Wq74OxX0W8jrD/6+mF8foS28wbBrbOLW2PGXabTaMRglqCKIaYqAXC9
         jbBYmBXfXpdoOOD+XndVXjLQ/wyGhs0YJYwVW/ZninI75YuGpewac8WTVPw2wv0CrC31
         tMZ+44rrPrDsPSvnCXQdiduJJn8DtXrkTqIBt+hZl8T4LSs7+n2W9SXYnrAykt7mtJHx
         kysBfBVzGR1ylfi6xzxIHDdzHYU0CFAjP8W2NkzGMXVc0VysJe+X7B7ZRJQYlaCLSl55
         UOyg==
X-Forwarded-Encrypted: i=1; AJvYcCXKqMcZ6myrN7MCCn7r1e1KTXd9ToCBcCae3g/0dBotBNGkhEbLphtGBcqtBNxrHWXyHRTtzQXpiEVexDpSNQ==
X-Gm-Message-State: AOJu0YzvTFMTS/xTi37vrJ9uXhpZNKTJxxxdpxxN9zcyIlwETBc9fXnA
	08Z4sdeL5KfeNxsdDCkE03zLBlasmQh6hWkK0biHT71614PBJax2ruKEIhhDvzI=
X-Google-Smtp-Source: AGHT+IGj/4CvRzNe03RJhSdckWN1v7eKR6DFdwXQ54NmI3ZsptGolRM+QbPy2Y04B05+jtOGJKazTw==
X-Received: by 2002:ac2:5b8d:0:b0:51d:3c79:547 with SMTP id o13-20020ac25b8d000000b0051d3c790547mr2031285lfn.27.1714322002207;
        Sun, 28 Apr 2024 09:33:22 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id lb2-20020a170906adc200b00a58f4b3661asm1173623ejb.0.2024.04.28.09.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Apr 2024 09:33:21 -0700 (PDT)
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
Subject: [GIT PULL 2/2] ARM: dts: cleanup for v6.10
Date: Sun, 28 Apr 2024 18:33:14 +0200
Message-ID: <20240428163316.28955-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240428163316.28955-1-krzysztof.kozlowski@linaro.org>
References: <20240428163316.28955-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git tags/dt-cleanup-6.10

for you to fetch changes up to 5e0705a74f8075dbefcb0ad18d6bbf909c72ebf3:

  ARM: dts: aspeed: Add vendor prefixes to lm25066 compat strings (2024-04-24 09:25:22 +0200)

----------------------------------------------------------------
Minor improvements in ARM DTS for v6.10

1. TI: add missing white-spaces for code readability.
2. Aspeed: add vendor prefix to compatibles, to properly describe
   hardware, even though Linux drivers match by device name.

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      ARM: dts: ti: omap: minor whitespace cleanup

Zev Weiss (1):
      ARM: dts: aspeed: Add vendor prefixes to lm25066 compat strings

 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-romed8hm3.dts | 4 ++--
 arch/arm/boot/dts/aspeed/aspeed-bmc-delta-ahe50dc.dts    | 2 +-
 arch/arm/boot/dts/ti/omap/am33xx.dtsi                    | 8 ++++----
 arch/arm/boot/dts/ti/omap/am4372.dtsi                    | 2 +-
 4 files changed, 8 insertions(+), 8 deletions(-)
