Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EAB280A58
	for <soc@lists.linux.dev>; Sat, 24 Jan 2026 09:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769247904; cv=none; b=lJwiArrdR6IGSuLcomPnNrJGcxuCJjiraU4mTji4sGmivW9Km4YTWbRSw3e6OeVnxYJZO9xn7rgfnAC/X6/tFQ9YnWjxqESdZSDm9AARP9jMOV83v6CGIbMFS253BUYXtMVfy/FuSJlJ9GXCvlaaAQIwKq1zdviE3+J/2h+7tyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769247904; c=relaxed/simple;
	bh=AfHYlioWbAnBPdo5I8exemsPlMBxt+8PwsLPbw+T52U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ut5fkzflDEt7Yej6w2i0Y2e3Ko96+qGNKcfmBNeEpkZKWdmX32C7B40Y7TqfZnmir/FQc8vnCshyiK5hK8gKjQA3m+ePU6+9DJN+VXpeBKAdRevWl05tk4l8zrWuG4wR4k6eEV5YUjAKzLzk6CPktlgZH/DnclA3eZ54PyW1PJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=QP+2nwOv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="QP+2nwOv"
Received: by smtp.kernel.org (Postfix)
	id 4B6A2C19423; Sat, 24 Jan 2026 09:45:04 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 20B6FC19422
	for <soc@kernel.org>; Sat, 24 Jan 2026 09:45:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 20B6FC19422
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4801c1ad878so30699885e9.1
        for <soc@kernel.org>; Sat, 24 Jan 2026 01:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769247900; x=1769852700; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ni6euuty8UhEzPgdrD9/AxHBt1gb0GvikCOCV2OCSQg=;
        b=QP+2nwOvIAWtg/GFe9yzEcYY6h+nDhlSU+K/YJ5jbhdnyO3wAMAeU8iHcqNVFDEbo0
         rViR1qu+SoRt9DPsAnPgQjIHk49GVT4P5Tne+uvN2Pf4Y9vzty2464cwM3cR1rTCcWET
         qMoQkjBGEKJb3/7fO9wnt7njMlN2Ljhlv/uCxNHAXRKxLvrQQC8r9acfRq3Y6MFpuUCX
         usyCfnqCB4qWXRQY3aFYozAizLMcVMCOGUM3Go/cdh7aL63QHDMHIa9XDr+5GckpQrlQ
         J6CJAyjTWebEVgBPGQVGAQe3GURGVvpyl0JKb7amASTNQFK3djIv+kM8REw+upSOTtPC
         CUIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769247900; x=1769852700;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ni6euuty8UhEzPgdrD9/AxHBt1gb0GvikCOCV2OCSQg=;
        b=klD+eia9+uqeF/yv1GsGVHjiGbD9pagTwbjLUB6OlhE997NShCVAgk+JVtFj6PAKSg
         KW/3mfK+nPYQHUozwGLq5NVLhtYQXyUfQBnzQ5fRd8IB0+ATD11XiEgxsCaCwPEFWaw+
         vLtAQnTiy3UHATwSWASkKyaYSpigm9Vb27LjyyagOcSfXasduQcmaVkNrR25PXAE235D
         9uHO4dwJqhA9mthtj+EktqG/8mx6Nj0725J4NSuZDbiR1ZnLMxPLCK8NVz8Q3sWyKIVV
         Daop1Wa7AVS0xX1IOWXxjfNX0tEjgHQ9FWX0/k6WmHboEMPYN/B48K8DpA3IcFw5MbXY
         tj0A==
X-Gm-Message-State: AOJu0YzR2qA6nIq3NffiXsR9q4EZxA0x7KsunlchzC17h0md+F0NjdvO
	5f5390dp0BrlCBl4Mq+6dbMKRGXEGdrr8/7qE/yWrtFC5jO/mrO9bSRPu/cE+KZZkkXK5/VddK/
	3tYGY
X-Gm-Gg: AZuq6aIS7edbj9gEg+KIzQUJFWecLrwg8HAPVloBEvJu3RaAg+3S3B0KC+ao6zmbinR
	9/L1nRlZlM3nho8oD6oIPSLkl01ewJzVTa7H2IlRoFOT65Gt0MV6C5PJX/GOfzqNw1qRYtN+wxF
	WAZEB4ClzO9GLc+ybdwkyVw/FIfSR3yDqtinZiOqzxv+V8o6FrhnPsqFjbmKV/+MSaaTxDvYpWE
	T4OLEYpQdiczrgvA8nM5ywm9Rociepn6/AYiVzqYiS11ejupTLyZVBslZeSMj8yrToSoNhDGgf+
	5x2f8GoL4mUgtjXWpbVpLAznQII0J5VH4jYmRBVfuSX2jF34EJy76zi7pWG5TWHhAaP/qm4weHe
	QPl8wuEoGxh/TCFiy+xIUw4fBSOqA/6PGLYyJpwFnt5TCt4uLHR6zaT9O3/B7GjOUMOV40h86mp
	uF8G+7X4FO1qOx7omXFXyq0lAfRllK
X-Received: by 2002:a05:600c:450d:b0:477:8b77:155e with SMTP id 5b1f17b1804b1-4804c959a14mr99138375e9.15.1769247899809;
        Sat, 24 Jan 2026 01:44:59 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c24bf8sm13123243f8f.11.2026.01.24.01.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jan 2026 01:44:59 -0800 (PST)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: soc@kernel.org,
	arm@kernel.org
Cc: claudiu.beznea@tuxon.dev,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Microchip AT91 device tree updates for v6.20
Date: Sat, 24 Jan 2026 11:44:58 +0200
Message-ID: <20260124094458.2106570-1-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-dt-6.20

for you to fetch changes up to e9ed88a4ce42bf42cd8b95a5b05298cf225b8b52:

  ARM: dts: microchip: Drop usb_a9g20-dab-mmx.dtsi (2026-01-23 08:58:25 +0200)

----------------------------------------------------------------
Microchip AT91 device tree updates for v6.20

This update includes:
- update the SAMA7D65 flexcom nodes to add the missing i2c, spi, and usart
  child nodes; the flexcom child nodes were also updated with DMA
  properties
- add basic support for the PCB8385 board, based on LAN966X SoC
- drop usb_a9g20-dab-mmx.dtsi as it is not used anywhere in the tree

----------------------------------------------------------------
Horatiu Vultur (2):
      dt-bindings: arm: at91: add lan966 pcb8385 board
      ARM: dts: Add support for pcb8385

Nicolas Ferre (3):
      ARM: dts: microchip: sama7d65: add dma properties to usart6
      ARM: dts: microchip: sama7d65: add fifo-size to usart
      ARM: dts: microchip: sama7d65: add missing flexcom nodes

Rob Herring (Arm) (1):
      ARM: dts: microchip: Drop usb_a9g20-dab-mmx.dtsi

 .../devicetree/bindings/arm/atmel-at91.yaml        |   6 +-
 arch/arm/boot/dts/microchip/Makefile               |   3 +-
 arch/arm/boot/dts/microchip/lan966x-pcb8385.dts    | 131 ++++++++++
 arch/arm/boot/dts/microchip/sama7d65.dtsi          | 279 +++++++++++++++++++++
 arch/arm/boot/dts/microchip/usb_a9g20-dab-mmx.dtsi |  93 -------
 5 files changed, 416 insertions(+), 96 deletions(-)
 create mode 100644 arch/arm/boot/dts/microchip/lan966x-pcb8385.dts
 delete mode 100644 arch/arm/boot/dts/microchip/usb_a9g20-dab-mmx.dtsi
