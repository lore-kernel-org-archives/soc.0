Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF2C1487F4
	for <soc@lists.linux.dev>; Tue,  7 Jan 2025 08:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736237673; cv=none; b=ui5x1nRQCp9ASll/uA3Da22mVLhTDjkjXToMYXKvWFdrPyrF1CscQKmWbpgaNvMtmLizaM7rDfVzCfEzizbnF1f71jZcGMuQf0k52cZXpbayiucJaQWqFZw3Qe+OejuNfRyzoJCG1MYVArbM4az9uXWTn+pJU8moU3ugjx1VuhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736237673; c=relaxed/simple;
	bh=KktJzQ6WM0bwb9RrjyealUn/+MOUARIAjWb+VQrrW2w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A5dedMQi4HaUNTLPfwrh4bnc7f2UbgANlkBj8voaMU6JrRsiF/BAgOs8l1WPkXvrufTIrwspWTR4W7IUXansZygJPLI6m/weJsCQwQ89z7y3p22eK8xQp6rTt//7yH97kGH5ZfPDHiHoy7fiCFY3zU/h7d5Q7sr+hmAEGrH4u2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ljosmxC6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ljosmxC6"
Received: by smtp.kernel.org (Postfix)
	id A8603C4CEE4; Tue,  7 Jan 2025 08:14:32 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CFB1EC4CEE0
	for <soc@kernel.org>; Tue,  7 Jan 2025 08:14:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CFB1EC4CEE0
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-386329da1d9so7036242f8f.1
        for <soc@kernel.org>; Tue, 07 Jan 2025 00:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1736237669; x=1736842469; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p+eEl3nkq/agt0SmzNMgL2PSlQlRVr5odYS+3eeCDxs=;
        b=ljosmxC6rMI1c9cjtReSJmhIgVTaXuGVXm1u3Yj/PphpMtOxydn9t9p2QZDtGCHyRk
         wLnjS1ADtgI06p7AJtdbUH5JmUQ8zLnfimqpvtX8qisDCMF88PrfGyuMn01xmIuLGFZb
         qB6H0HcLwASnhxcUURcFSZdvNHiH/+aYH9u5iV+4v/7tlpqBcyAqPPQaaIiPpgmqtVZG
         eW3q15Hnjpael8H9MLoiJW8MWyAngNochsEIyubdrWOlp0ty3OMgi5DM5J0VYKAkWMVB
         XY77rLe9FbUCnEXNkzIlOmRB/JQnwM7KVHmkVRC+STC0ReGU+Ne/iOsU5doolliqVpJj
         UHOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736237669; x=1736842469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p+eEl3nkq/agt0SmzNMgL2PSlQlRVr5odYS+3eeCDxs=;
        b=iTpGXLU4QhC2SdP4Jw3aCrrcm78A30xAR6HOl5gFa46saiAS6q4bva7rHYY6MNnckz
         GyeQKbyQzOv1CTddncu86bGddbyrxBwZXlvgql0thhPg7CRionbScZOoplHikZqEp1SV
         6dJICvebS1/nTQsHU9GzL45eVRNg4rROE/NHdMhjxYiTcBYAbMTlsQR/4EPQ/F/H/8k/
         fhK22qRTW0etl5hzS/AZftXamycCMFEvwHrq4L6qDF2AS2rbsghkE6uZpr8uKZkotcoM
         r+XIuGXfkSBzOh1g2Alp40nhJf73CjVtRaG/Eqsxkldnv+dF1fzbouTrQlhODhXZa9sd
         BmdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmr/GZQ4qBRSlys40YNlzD0lNuCdIzNZ9UD/PaBNeanLhGhTw9nqv4dlRcqe6nVq24xQ0=@kernel.org
X-Gm-Message-State: AOJu0YyoBzNJzLm2F4gkyElTtDAbYC/opG55D9ytP9lzBLVYwR6wIvMR
	KsRvN+XkoaSAmTkF95KEgzROX4h9VaBVcf5GSKPiThH1OV04HHxqPcRcG1AZlzs=
X-Gm-Gg: ASbGncvO470m4bmr9Y53oIG5AHz838IDpDxrTB4H8JRNAqoCdJJswzjwqHdK1VKIqhn
	PunXQdLJVyHnGMci9ALj/xJflebQtfo8EpCKnF5m6BG/n2v8fuaLUMZMmb6kbEcysIVE2jaz/Ve
	d2nthreDjtBE6i1AaKp4wCRSt+XLWmE4NBNb54FjuY+nHVjOCyJ5M95ZiuR4gaN3qh/yuPhc57s
	ePQLGDLRV34qVCK5nRTvKRnbhC/rIbpg3w+Z2w81Pg4S7H5M0Ailku60qfdWtF62xOaJVe8npsc
X-Google-Smtp-Source: AGHT+IEoRaWgSkB/1em1s2I2OX80coPWVVkfFGHT1Swcy1r3bQ/xULPY3bTt9+lWQF5mNDPUaUH3bw==
X-Received: by 2002:a5d:6da1:0:b0:386:4a0c:fe17 with SMTP id ffacd0b85a97d-38a2220039fmr49983719f8f.27.1736237669030;
        Tue, 07 Jan 2025 00:14:29 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.102])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a75a47943sm3541314f8f.87.2025.01.07.00.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 00:14:28 -0800 (PST)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: arnd@arndb.de,
	olof@lixom.net,
	arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	claudiu.beznea@tuxon.dev,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com
Subject: [GIT PULL] Microchip AT91 DT updates for v6.14
Date: Tue,  7 Jan 2025 10:14:23 +0200
Message-ID: <20250107081424.758980-2-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250107081424.758980-1-claudiu.beznea@tuxon.dev>
References: <20250107081424.758980-1-claudiu.beznea@tuxon.dev>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-dt-6.14

for you to fetch changes up to f72aada7bee42c4b43a272ef58bc4c9e1caa53d4:

  ARM: dts: microchip: sam9x7: Add address/size to spi-controller nodes (2025-01-02 12:33:57 +0200)

----------------------------------------------------------------
Microchip AT91 device tree updates for v6.14

This update includes:
- power monitor support for the SAM9X75 Curiosity board (using the PAC1934
  device)
- fix the VDDSDMMC rail to 3.3V to avoid breaking USB (for SAMA5D27 WLSOM1
  EK and SAMA5D29 Curiosity boards)
- partial support for the SAMA7D65 SoC
- cleanups

----------------------------------------------------------------
Cristian Birsan (2):
      ARM: dts: microchip: sama5d29_curiosity: Add no-1-8-v property to sdmmc0 node
      ARM: dts: microchip: sama5d27_wlsom1_ek: Add no-1-8-v property to sdmmc0 node

Dharma Balasubiramani (1):
      dt-bindings: atmel-sysreg: add sama7d65 RAM and PIT

Mihai Sain (4):
      ARM: dts: microchip: sam9x7: Move i2c address/size to dtsi
      ARM: dts: microchip: sam9x75_curiosity: Add power monitor support
      ARM: dts: microchip: sam9x60: Add address/size to spi-controller nodes
      ARM: dts: microchip: sam9x7: Add address/size to spi-controller nodes

Romain Sioen (1):
      dt-bindings: ARM: at91: Document Microchip SAMA7D65 Curiosity

Ryan Wanner (1):
      ARM: dts: at91: Add sama7d65 pinmux

 .../devicetree/bindings/arm/atmel-at91.yaml        |   7 +
 .../devicetree/bindings/arm/atmel-sysregs.txt      |  14 +-
 .../boot/dts/microchip/at91-sam9x75_curiosity.dts  |  54 +-
 .../boot/dts/microchip/at91-sama5d27_wlsom1_ek.dts |   1 +
 .../boot/dts/microchip/at91-sama5d29_curiosity.dts |   1 +
 arch/arm/boot/dts/microchip/sam9x60.dtsi           |  12 +
 arch/arm/boot/dts/microchip/sam9x7.dtsi            |  38 +
 arch/arm/boot/dts/microchip/sama7d65-pinfunc.h     | 947 +++++++++++++++++++++
 8 files changed, 1066 insertions(+), 8 deletions(-)
 create mode 100644 arch/arm/boot/dts/microchip/sama7d65-pinfunc.h
