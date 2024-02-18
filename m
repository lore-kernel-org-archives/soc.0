Return-Path: <SRS0=D6Du=J3=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A49C48BF6
	for <soc@archiver.kernel.org>; Sun, 18 Feb 2024 18:30:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F07E0C43394; Sun, 18 Feb 2024 18:30:52 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 186F5C433C7
	for <soc@kernel.org>; Sun, 18 Feb 2024 18:30:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 186F5C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-33d216ff367so1225496f8f.3
        for <soc@kernel.org>; Sun, 18 Feb 2024 10:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708281050; x=1708885850; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V7FCgCwlRfN6Rmb7d2KV2HK+f4QpGUL2vs+0cArZ3fk=;
        b=T1Appiw/LjpDlBbqpT9PSyrR/9uTYAcODH4yt4XIhhN7yXHOGnWEgijofjcMOW1Lj0
         YKiF1X9hzJjS3bAuQOaXNHeqibbOOfR6Fd6B+k/CiLIwhCEQiJUeiLQx4bbPkY1E+Cxn
         f3Coa3/Gw7tkNiTR9urBH71czuAakwpOfpa5LoCXaikeMw2PNqqYNL4T1igRL+n8OTvH
         DsVNGG7DEHVG13pg7akxcyHSFlZCaBkPt1sJdL6CLSlkvT+QWF+QkV5nbzUGXkPi2+m3
         D3IGEbq7pCZLiISVDp3ocy3GIawSpYniRxxqBVzbld0QCOHCI5I+LeX5uiezjLixR0Zo
         kNNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708281050; x=1708885850;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V7FCgCwlRfN6Rmb7d2KV2HK+f4QpGUL2vs+0cArZ3fk=;
        b=ZDtmcQzhIvGDNhIVeAeHqDMqIv/+Tnn6GtLgISduMLGzpYu9iKy+gk5w/AkG5pAysM
         vLOXgY3saaEaJgpHG6txk17Vityh/zgzciJuF3dbE6A+v0ciw0oaPNQTMzL4lhod7/Pl
         PsH/ahj0gxWTuvUmRJu+mi1xvK9eMe8D7LOAQ+Cga33tQh7EjUveWVTg4lwEyxqyD13v
         3y/AcXe9Ld6iznuHyoD6xSaYkTrp+NrbL3DTxbnaGks8aePYEBs7+TyVRAybxl55VrGZ
         9LedB9QSEtiPaqov63u6zXzrBl42Gx5n4+MG5RjNS0YAahhupE5fEkzohB2gsucoabns
         09Sw==
X-Forwarded-Encrypted: i=1; AJvYcCUKebVCeYHIEzQaSyO35v9qDa1chNj/zY2DZpdEkgddAlb2GnQeZyzWiohQQAhziyo2jyAegK+eQZQmrhMrMA==
X-Gm-Message-State: AOJu0YwRvCjumPAQ3Zz1EvbkUgIlTu826FcxWpPl4Z8ZNf2r+o0Y2AAw
	GEnf96JezuQ3b1z10rNu+FIk1hNg4fRLwP2TLbprcaalZDUf/4tZwEaTRRaGA7s=
X-Google-Smtp-Source: AGHT+IE2yxBKnqBhnzWTpjKIap5XJovO94zJgJH4oFVjKVM6qkHqdtJLguzXgSdCvSg2WcSKN7H2wA==
X-Received: by 2002:adf:f187:0:b0:33d:82a:14af with SMTP id h7-20020adff187000000b0033d082a14afmr6003543wro.64.1708281050256;
        Sun, 18 Feb 2024 10:30:50 -0800 (PST)
Received: from krzk-bin.. ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id l5-20020a05600c4f0500b0041253692606sm7111845wmq.17.2024.02.18.10.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Feb 2024 10:30:49 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] memory: drivers for v6.9
Date: Sun, 18 Feb 2024 19:30:46 +0100
Message-Id: <20240218183046.32721-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-6.9

for you to fetch changes up to 2f542c937c48c2bd5a8ddf180b417fbe7152559f:

  dt-bindings: memory-controllers: narrow regex for unit address to hex numbers (2024-01-25 12:04:09 +0100)

----------------------------------------------------------------
Memory controller drivers for v6.9

1. TI EMIF: Simplify handling CONFIG_DEBUG_FS, CONFIG_OF and
   platform_driver_probe().
2. Narrow regex in Nvidia Tegra20 EMC binding.

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      dt-bindings: memory-controllers: narrow regex for unit address to hex numbers

Uwe Kleine-König (3):
      memory: emif: Simplify code handling CONFIG_DEBUG_FS
      memory: emif: Simplify code handling CONFIG_OF
      memory: emif: Drop usage of platform_driver_probe()

 .../memory-controllers/nvidia,tegra20-emc.yaml     |  2 +-
 drivers/memory/emif.c                              | 65 ++++++++--------------
 2 files changed, 25 insertions(+), 42 deletions(-)
