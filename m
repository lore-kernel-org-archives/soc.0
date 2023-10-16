Return-Path: <SRS0=fNzu=F6=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FAC8CDB482
	for <soc@archiver.kernel.org>; Mon, 16 Oct 2023 07:40:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 259E5C433B6; Mon, 16 Oct 2023 07:40:19 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 81FE3C433CA
	for <soc@kernel.org>; Mon, 16 Oct 2023 07:40:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 81FE3C433CA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40572aeb673so41135855e9.0
        for <soc@kernel.org>; Mon, 16 Oct 2023 00:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697442016; x=1698046816; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EAtJw5I02+M4NX4Wxm2A7PUjyX02pVvIFRZ++HnPuHM=;
        b=fu03vjI/iBkek1pVEOsW05DQZSfXAvHe/P+sgIVBKpF+iBA/kl8toNzQ00YLk8PZFT
         1Fogannsjnc6uTDUl1LP8/4ox4MDz9WrJesbvSA7K4JM7n7ABbbEGDV5+LbOpY/y+ggW
         xCeDfuuZdWaGo/tt1wJfzfUS5M3133QARxC9TPDdk+4FrJfbFLLaZiw9ZiSbXAPdoptb
         aghINB2Di/qo8ecYeDjQHH/LVOuZIVBZBa9qg3X6MZWe0NaCuczG/e+5FQMYblZi4nVH
         TPrWeHtb7AC799ILIB0o71Kls63oIgPFM530DSv85M6l4VcT0mnbNm5raPWDzZtNI1jp
         yS1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697442016; x=1698046816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EAtJw5I02+M4NX4Wxm2A7PUjyX02pVvIFRZ++HnPuHM=;
        b=HCfRSyNaXhM0DT2Hl9n0KlV+0NvyrBihf5akcD4dRpco9uHjGYAZ2lLNUquI5RmvgB
         qvCUtdqXqTpe64yhCYkaFrB60cAP0pS9fp3xTKCF3QV92bpbpykXzEuggreT5q5NY7E6
         tE7mHlmIQclSQHM2EMe5mPERyH3ZmqzJPYwMNbbA1uFS1J9RSXZA10XbAUs0dWMrZr4A
         2Id0xD9SpaAojDxAvF24MyL/Gt7Ud+JiIW4EK2IDVRpaERtjguY4qVSYP6bARZYf7oJr
         t6Bq1WSUQP/1tH8HaCCvWjHumBz/z8HIuSigQljLml9dDBkYGIz7GyAoM9hezwfoqBZo
         7d4w==
X-Gm-Message-State: AOJu0YzDzrPemQmvGSmyrD+pJd//N9/0yyFfEQKMsyIyEyDgEYt1ywGg
	p/pqrbNYciRD3XUX6fM3KjDI4Q==
X-Google-Smtp-Source: AGHT+IHpFlcoknVg3TkhbIQBqUPuHHzpTaEMITFzmQqb0w6qOmHpi3Gw53k/Qc2Qree41QStkY28KA==
X-Received: by 2002:a7b:c4cb:0:b0:401:cb45:3fb8 with SMTP id g11-20020a7bc4cb000000b00401cb453fb8mr29200023wmk.38.1697442015670;
        Mon, 16 Oct 2023 00:40:15 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.154])
        by smtp.gmail.com with ESMTPSA id g18-20020a05600c4ed200b003fe1fe56202sm6488442wmq.33.2023.10.16.00.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 00:40:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] memory: drivers for v6.7
Date: Mon, 16 Oct 2023 09:40:13 +0200
Message-Id: <20231016074013.28286-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-6.7

for you to fetch changes up to 09de3691daab15ae125cbf32f9f72fc90eada49d:

  memory: Use device_get_match_data() (2023-10-12 15:42:16 +0200)

----------------------------------------------------------------
Memory controller drivers for v6.7

1. Atmel: Use __counted_by annotation.
2. Tegra: Add Tegra234 clients for RCE and VI.
3. Cleanup:
 - Use device_get_match_data() to simplify the code,
 - Make "additionalProperties: true" explicit in Devicetree bindings.

----------------------------------------------------------------
Jon Hunter (1):
      memory: tegra: Add Tegra234 clients for RCE and VI

Kees Cook (1):
      memory: atmel-ebi: Annotate struct atmel_ebi_dev with __counted_by

Rob Herring (2):
      dt-bindings: memory-controllers: Make "additionalProperties: true" explicit
      memory: Use device_get_match_data()

 .../bindings/memory-controllers/ingenic,nemc.yaml  |  1 +
 .../memory-controllers/renesas,rpc-if.yaml         |  2 +
 .../bindings/memory-controllers/ti,gpmc.yaml       |  2 +-
 drivers/memory/atmel-ebi.c                         | 16 +++---
 drivers/memory/brcmstb_memc.c                      |  9 ++--
 drivers/memory/fsl-corenet-cf.c                    | 11 +---
 drivers/memory/tegra/tegra234.c                    | 60 ++++++++++++++++++++++
 7 files changed, 77 insertions(+), 24 deletions(-)
