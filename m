Return-Path: <SRS0=G2PD=KG=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FCAEC54E41
	for <soc@archiver.kernel.org>; Thu, 29 Feb 2024 12:46:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E3B56C433C7; Thu, 29 Feb 2024 12:46:08 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AF4FDC433F1
	for <soc@kernel.org>; Thu, 29 Feb 2024 12:46:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AF4FDC433F1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a3ed9cae56fso381198266b.1
        for <soc@kernel.org>; Thu, 29 Feb 2024 04:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709210766; x=1709815566; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Clp72FczazQSKbLIcT40/U9haor6HXf5C1kMTuaxg/s=;
        b=H8XhnpfZ2jSh71yl9AHg4YGOB+bY8MptONoEexTWHkWzhtGAehBPWPH9algLZxfK/G
         mJIZB8z0XpABThj98sha8vKffl4N4mx7zfpLdi7s9kzLkX4ixv0eU7H3YQlCNd/YCB8L
         qfuEebuY9nrnX96M/Vrk6Mdk2iH+X4U51XMxM4lFZPyQYjcLqpg52ECL7YmdKrwAyXVG
         zQHpfuYTrnTNFFTkgSzTxlGRU7zB4Cas5g0Iwy+5wgEb47+yyBPxw7t49jqxeT14PC6u
         DiXeguyvYeUhyKpllTbNI8mEDZN38bOuFG3tcjJOKYMkJhg5sIquixO41myna1CR1wtz
         h8Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709210766; x=1709815566;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Clp72FczazQSKbLIcT40/U9haor6HXf5C1kMTuaxg/s=;
        b=w7l1XhxADsPTcEWOWjVxi8kBAtsr6pHE3XtsIlay/ETkmiZHe/ELQP6ftsTOxNf037
         GCJlPhyQhO+Rq6/vjs9BPolvj/EG//XQn0F9z4gGp5vx0+4qxx1QjlydCcb8YG7a18WM
         Vi5tVXpkO1g4UEivWw63/GDAkTobYk/4CpDQvLfLBMcswFt6wGpmP50PT5nOLu8WMuOV
         MPUA97fxk5d33dfa/TLkqnFsexDYZeWSnDC7Bbj0ENH6AswyFw/fmmWPrM+kBQa+LR0r
         uKYxFmDlIU/LMIcAS1/dwYPrIE5ZmEOqGIilQzgVRvevMcNrSXKFo8LSQNmyEgE4POGM
         8K0A==
X-Forwarded-Encrypted: i=1; AJvYcCUFYbPuAuxmJDuUmmesD0PF4Md4sUqZvR4l2regbeh4oLFJbwmCC+qZtxX50J6PZY3DHYMMCExuvPu+/U3P2w==
X-Gm-Message-State: AOJu0Yx+zhv1Qi5SoBh4xR5hFqjXmS1Ix2GVkMZROuXk5Sj5Q8pKiCkD
	kwAlPyHuR+62gvfzhHBdlX/e3aPd5syrs/5AeSy6aP6PmZfmB9+//FTUe1OSYOh2mBTmPuJ3s2I
	Z
X-Google-Smtp-Source: AGHT+IEbc5TOsBDYIZbxJZluVIqRpWDGJIcTKTs2jSWq0poKpB4ruewhGMO+AuZvX14rCHkXubUxhg==
X-Received: by 2002:a17:906:71d6:b0:a44:eb5:dd4a with SMTP id i22-20020a17090671d600b00a440eb5dd4amr1240876ejk.25.1709210765889;
        Thu, 29 Feb 2024 04:46:05 -0800 (PST)
Received: from krzk-bin.. ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id cx10-20020a170907168a00b00a3cf9b832eesm655991ejd.40.2024.02.29.04.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 04:46:05 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] memory: drivers for v6.9, part two
Date: Thu, 29 Feb 2024 13:46:00 +0100
Message-Id: <20240229124600.405016-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

On top of previous pull request.

Best regards,
Krzysztof


The following changes since commit 2f542c937c48c2bd5a8ddf180b417fbe7152559f:

  dt-bindings: memory-controllers: narrow regex for unit address to hex numbers (2024-01-25 12:04:09 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-6.9-2

for you to fetch changes up to e46076906722ee6f9e7fd5abad7f909cd11a26af:

  memory: stm32-fmc2-ebi: keep power domain on (2024-02-27 10:18:04 +0100)

----------------------------------------------------------------
Memory controller drivers for v6.9, part two

1. Renesas RPC-IF: add bindings for R-Car V4M.
2. Tegra MC: correct and extend support for Tegra234 memory controller.
3. STM32: add support for Flexible Memory Controller on MP25 SoC.
4. NXP WEIM bindings: convert to DT schema.

----------------------------------------------------------------
Christophe Kerello (5):
      dt-bindings: memory-controller: st,stm32: add MP25 support
      memory: stm32-fmc2-ebi: check regmap_read return value
      memory: stm32-fmc2-ebi: add MP25 support
      memory: stm32-fmc2-ebi: add MP25 RIF support
      memory: stm32-fmc2-ebi: keep power domain on

Geert Uytterhoeven (1):
      dt-bindings: memory: renesas,rpc-if: Document R-Car V4M support

Jon Hunter (3):
      memory: tegra: Correct DLA client names
      memory: tegra: Add BPMP and ICC info for DLA clients
      memory: tegra: Fix indentation

Sebastian Reichel (1):
      dt-bindings: bus: imx-weim: convert to YAML

 Documentation/devicetree/bindings/bus/imx-weim.txt | 117 ----
 .../fsl/fsl,imx-weim-peripherals.yaml              |  31 +
 .../memory-controllers/fsl/fsl,imx-weim.yaml       | 204 ++++++
 .../memory-controllers/mc-peripheral-props.yaml    |   1 +
 .../memory-controllers/renesas,rpc-if.yaml         |   1 +
 .../memory-controllers/st,stm32-fmc2-ebi.yaml      |   7 +-
 drivers/memory/stm32-fmc2-ebi.c                    | 729 +++++++++++++++++++--
 drivers/memory/tegra/tegra234.c                    |  48 +-
 .../bindings/fieldbus/arcx,anybus-controller.txt   |   2 +-
 9 files changed, 963 insertions(+), 177 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/bus/imx-weim.txt
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/fsl/fsl,imx-weim-peripherals.yaml
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/fsl/fsl,imx-weim.yaml
