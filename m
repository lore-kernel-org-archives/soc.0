Return-Path: <SRS0=GM+A=OC=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AB4BC3064D
	for <soc@archiver.kernel.org>; Tue,  2 Jul 2024 07:02:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 461E7C32781; Tue,  2 Jul 2024 07:02:19 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7901EC116B1
	for <soc@kernel.org>; Tue,  2 Jul 2024 07:02:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7901EC116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-57d106e69a2so1648267a12.0
        for <soc@kernel.org>; Tue, 02 Jul 2024 00:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719903736; x=1720508536; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=moeg6p2Cr0TRpJk6nyYDG3v7JZXYvVo7+RJpJIy+brg=;
        b=MES7ftcrtmFok2sSZDIZpmEzzoziS0eRSkdsUcucg4DyLcahk5NZltT8RSgGAC+QYj
         D/Pxg5n7d4qGmjPrPKMe7keF72YPzWTAGbOLBi1PyQC1yTimDNkthJOiXEZqouiszJcP
         QtNF2l/QLcO+5KIFK2tLL8A96b3kCoghQhXrsAvFX+AYRKk4m6Eq/a1dxr9VUXf10FlL
         mO29HJ7hVMPwbsz0N7UNnKWNFMjzqr6dnsjs1pLZRRXTzmv9TjGayaxCllK/GAhkV+Mz
         tnt8h3cHf0tPMMqPuewn0140q0ZVUjA17/9WEQ8jh9wLENZpT59cdZQdWolRp3ubHJ+k
         kpkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719903736; x=1720508536;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=moeg6p2Cr0TRpJk6nyYDG3v7JZXYvVo7+RJpJIy+brg=;
        b=szRlXw6tXcGfyAaz3qY3AJe+jfhxp3ByLr1b7zxnkOVRypv7Js+4dHYo/NSUxWNU8z
         opyl8M3KcPGhinkfaBLLzpwxGS8JkDXLxEAtQJgmRwyK1QCGYAeFSsmbGzr3nsik35Kp
         5K4gBT0Gx69MXd8NpEB6O05T+XYxXdM2QB3p1ud3g2oe/HpE5LGzztYwZjaShJ2D78Uq
         6k5CAlUi9obJRvWbJVXAAhoiG7MsRBqm5s8+0SkKWoHrCzNN8zywkjOmxkTz/dP9uPFk
         9plsjp8ytxHFAc08Azgu+Wy3yVNk4iIRdGXbkEfyYykqGTILBgO2TaFqe3Q/4fV5Fnyd
         S97Q==
X-Forwarded-Encrypted: i=1; AJvYcCW73/qhQwQAhVQQ4Ktf8UsIgiLtk71x4Yg8ErsB47vhOW6NhYYNyL3GYUFmdwgNjxauYM46unbfNw8bGKEn/w==
X-Gm-Message-State: AOJu0YyWjqWTmt89Ss+tdB1+7gHmlVtnkYqs9c2RYDsa2uDA8mLtt84F
	5p/6ubLx3SgcC2x0cfQcQtnkV9ibi8HGEMVvGMBlFmLKOt7JkySxzaxRe8zXSLI=
X-Google-Smtp-Source: AGHT+IEKONPWZ+8D/q/t2TBdiXcUYTaSAFslH9nunnkv5ol2qrFre9FlsF2WrkD/IGowWt1RbI/Xng==
X-Received: by 2002:a05:6402:1d22:b0:57d:40e3:2a71 with SMTP id 4fb4d7f45d1cf-5865bb399c9mr8071259a12.6.1719903735813;
        Tue, 02 Jul 2024 00:02:15 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58b4a97b1f3sm560000a12.18.2024.07.02.00.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 00:02:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] memory: drivers for v6.11
Date: Tue,  2 Jul 2024 09:02:12 +0200
Message-ID: <20240702070212.8291-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

If by any chance you can also pick up:
https://lore.kernel.org/all/20240530-fsl-ifc-config-v3-2-1fd2c3d233dd@geanix.com/
https://lore.kernel.org/all/20240530-fsl-ifc-config-v3-3-1fd2c3d233dd@geanix.com/
? I was planning to take them with this pull, but eventually forgot...

Best regards,
Krzysztof


The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-6.11

for you to fetch changes up to 815cc7715ab183701de42b570a28b4e3d877ef6c:

  dt-bindings: memory: fsl: replace maintainer (2024-06-17 08:07:35 +0200)

----------------------------------------------------------------
Memory controller drivers for v6.11

Make the Freescale IFC driver selectable because it is used now by two
drivers: Freescale NAND and generic NOR flash.  The patches adjusting
defconfig are waiting on the mailing lists to be picked up.

----------------------------------------------------------------
Esben Haabendal (1):
      memory: fsl_ifc: Make FSL_IFC config visible and selectable

Michael Walle (1):
      dt-bindings: memory: fsl: replace maintainer

 Documentation/devicetree/bindings/memory-controllers/fsl/fsl,ifc.yaml | 2 +-
 drivers/memory/Kconfig                                                | 2 +-
 drivers/mtd/nand/raw/Kconfig                                          | 3 +--
 3 files changed, 3 insertions(+), 4 deletions(-)
