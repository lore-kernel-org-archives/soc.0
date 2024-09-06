Return-Path: <SRS0=OjNc=QE=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F1EBCE7B1B
	for <soc@archiver.kernel.org>; Fri,  6 Sep 2024 14:09:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E4BBEC4CEC4; Fri,  6 Sep 2024 14:09:06 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DD1AEC4CEC5
	for <soc@kernel.org>; Fri,  6 Sep 2024 14:09:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DD1AEC4CEC5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2f751a2a29fso1126471fa.0
        for <soc@kernel.org>; Fri, 06 Sep 2024 07:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725631744; x=1726236544; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7z81VoupqldHvJZcn537NLL4ciTBDcA6n/Wx7M861xs=;
        b=lzZk/6BT6Mv/WZ0IR0mPRMInV6i5n4UQbjuoWdoPJnXWEhaSLg8X9L5tXChXmzTaQB
         x/yltPVv1aHhRmuJ6R6daBOsYhZfOa1fIruFEGDdyk+ogOlbvO2fHSE7cyhLdn6CxB5P
         /jNaeXfV7De0bVKeryRsplcAkuEBrABE8aFPmnm4qcrkbR+wteXGP7XT3ygL2W0Q8f/W
         guvHudHnh7Mb/okENJEIQscEk2a5W81nZ88j5KKS596dELSSsnTujfhny3jYYk5JEyNw
         2yid0paJMubPu4+IBRQwe777zqjV9eilJAD+mXithT3plJ8BLqettScdTnPqRRii55jb
         6vig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725631744; x=1726236544;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7z81VoupqldHvJZcn537NLL4ciTBDcA6n/Wx7M861xs=;
        b=OxDPYL/A/I2MyYTLNdviuKVXDFs7koDYNQUk4bdIXAfSTXN7/E9fwaEEdBeUJ8mViS
         TLLqbNdj3gxTLmFdhksEqUbAjNm54QmSS19LbBnP7dvfB08VGYLsk+l6EU8IPwo1tXPY
         lAWLHPYba4rMlQoI8Qq4QQNdO3GZseYjr4j90O/YmGM7UR8nCfbSCyPQU8G96Fb/dZkA
         k8Sh5EcrwKr+YKxAAWTe9XkwVdH0duDVBNz3WhOkUcx1F7rX9isLvA9MVvgI9eisTQRJ
         S7NCah5HtfT8U44S5jxLA36uOQfBmScEcNpIyInh0Mvomk84v+ZjHYHa1R7SOlb+h3tR
         TDrQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2K19TcEWZdJC7HHZKfeOP1TiDcwOR9J4zwjDl5aE43PWt1cNSzuKJFm/CM9sSEiJ9B1I=@kernel.org
X-Gm-Message-State: AOJu0Yw1l0g4B4pjt1RDuL6T36yxIjFfS++tx9GI6Ufl6xMWuFdyiTgZ
	U5SMz63mvbSSulpWdWkD6Q2JJeVvZf4Exg2ueJNXJh0345pQUWtpRB//TB948X0=
X-Google-Smtp-Source: AGHT+IH3iaL4oS2mUwzJ9AE1R1DnGu0Rom4pkohNdiiLxWCsFN7TeNMR1ZB+QFbicEFDqoIRA6zGFA==
X-Received: by 2002:a05:651c:541:b0:2ef:27fa:1fc4 with SMTP id 38308e7fff4ca-2f751ea5828mr11150271fa.1.1725631742884;
        Fri, 06 Sep 2024 07:09:02 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3789160d5e3sm14305f8f.40.2024.09.06.07.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 07:09:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] memory: drivers for v6.12, part two
Date: Fri,  6 Sep 2024 16:08:58 +0200
Message-ID: <20240906140859.71712-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Second pull request, on top of previous one.

Best regards,
Krzysztof


The following changes since commit ff390189b7f2cfa20c644bc58b4462b5e2621838:

  memory: mtk-smi: Use devm_clk_get_enabled() (2024-08-25 11:02:17 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-6.12-2

for you to fetch changes up to 32960b4f25c248f13758b8bbe6cc4260828442a1:

  memory: pl353-smc: simplify with scoped for each OF child loop (2024-08-31 07:44:24 +0200)

----------------------------------------------------------------
Memory controller drivers for v6.12, part two

1. Renesas RPC-IF: adjust default setting for pins to accommodate
   different flash devices, which should fix 4-bit flash writes with
   Renesas AT25QL128A flash.

2. Simplify a bit probe() in PL172 and PL353-SMC.

----------------------------------------------------------------
Biju Das (1):
      memory: renesas-rpc-if: Use Hi-Z state as the default setting for IOVF pins

Krzysztof Kozlowski (2):
      memory: pl172: simplify releasing AMBA regions with devm
      memory: pl353-smc: simplify with scoped for each OF child loop

 drivers/memory/pl172.c          | 28 +++++++++++++---------------
 drivers/memory/pl353-smc.c      |  7 ++-----
 drivers/memory/renesas-rpc-if.c |  2 +-
 3 files changed, 16 insertions(+), 21 deletions(-)
