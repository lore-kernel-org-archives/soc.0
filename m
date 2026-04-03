Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FAD518DB01
	for <soc@lists.linux.dev>; Fri,  3 Apr 2026 07:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775200002; cv=none; b=EkZA6TlR6XN7TnvBXH7MfE31sVtf4rg3omPSLBtdFN4UD13HJ5cbnIJyHEMcdK0qdUmByD5c2sUcywXDBS9wrtK/shF8b3n8GNNy1pf9RWBtaX8l1d0+iKoQ7MVZUuOxmlToHzWiKgiz6a+7+TfGjpM6m9f64rSz4q5TXU2Keu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775200002; c=relaxed/simple;
	bh=gLiR40ICk/DqpjJXUtAkYxOHXtP5jGNCmAylQ6h2EN8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mzmue6Z+170wzfYwy337JiZFcfKGlW8KfKRho4awErfAaMaCn7Youx9daqIc9RkwABbHmwnru3W40nk47sfz10MNXjV5GcM4zbcLliJF1ai0F2YZn7TzxdYsya0kq3YASOhcFrE3FWVKFbFM3cucSewbX8c4TiR7ohJB2ko/AUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=HDc9qdSA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="HDc9qdSA"
Received: by smtp.kernel.org (Postfix)
	id 88AECC4CEF7; Fri,  3 Apr 2026 07:06:42 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 825FCC2BCB0
	for <soc@kernel.org>; Fri,  3 Apr 2026 07:06:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 825FCC2BCB0
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-486b96760easo18567795e9.2
        for <soc@kernel.org>; Fri, 03 Apr 2026 00:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1775200000; x=1775804800; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7OXn+fDhlDjBfFUiybD6ea00XK+mf3TYPg3/vc00MCU=;
        b=HDc9qdSAe4fZOSbwltay0CMhhbzpRWQ87WfLdyDHD8lhx0D+BDJ9ZiY3zSUjuA9HCT
         QRpFs7RWpLdzxzmCdTm+NxLGJzScNgVL2h7vbXuelefjnN836cSEKZDK12pPg1ILDQJ7
         mrqecP6rwHOZy/9POQJ0BOtoGGIHbXGXggbzVEB1YG3phZwCDK8tb6DPTLh80gKGiWlH
         7m0mNE1QJ04zjqsngCU4ZK2nIocGzOObOsIPo76Tf7b1oERfe5LMyXyvNwLdCpLv165h
         YPb2DwvzOAvVp95rCytOuqAoi5TreWAn2lcht9aOjTJAs1JWkEdgybqI93jEpNZ/Sjze
         FW6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775200000; x=1775804800;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7OXn+fDhlDjBfFUiybD6ea00XK+mf3TYPg3/vc00MCU=;
        b=YLdLuCgvZpY3kX0SjRtneffYBDyIBMtsCPGqAl+2ENEk8NdPwjgw92pJ5rPLO4gMwA
         0hM99Kn3lH/17lgD6TL5KZ9qAwWfEpoL0wOcxsfjm+2fAqfeWtG2dzCNzMwTju5a37vA
         yIZNxCO9r0BrSsOBHrIr93LIJQUU6YAz5oe+I8/QIlX0yHtqC70PNl8rgxjL8ZJ0CW2x
         pXIhOyTmhtwqpSIVEcqJISd8uiEeumx+IpGfqoiTJEmJt5+/XuXDCesHl54qcokVaXU8
         FeE9CuOZYKIUNOdNRnjymAIbnoYkBD7PwybhQHZ21mkeg5UiINc+1YXpRPTKCm62KWD0
         tW2A==
X-Gm-Message-State: AOJu0YyYUGu1GZHF1lKqid8Md6DFbHlzFxOm1Lv1JoUiIwSFTVnSP5Gm
	o857MWZQ9l7ecGhm5ADVnXpaG1JiCEorI2BfPB9BX/Mf1JvRH5JVrHX6nnipqpVenknzRlNEyAM
	hDqkG
X-Gm-Gg: ATEYQzyXJHdtFpKKFDa8QASR9IQJUiuemhEQ/sc7Pmktu/n/RCMWBSavy0mVJ1561lR
	TPPrjnvwkiIdsB0GNNmP6EDV0mWv1xzTLcQjYANSfs1F31Ox5z0CbjaAlIhJ/aUINt+LMlSdHfT
	SqtdA2XHstnLU2gqbc3CdvW1rz9QSMMb62bIJlhytqK7OUGn9PW0sIUYaxzSAQFi0FBf6k0cUrj
	ih2zhdro2Bxow8o95D6OA+2ujX2timK3SCs4HW7Mv0Tn6FpGxpLaothOyMWVgJzmKpstlPXd/56
	qvASgLWaPPgL3sAmNvkGirOckyASoZzfrRaeYEHDXUS0/Cc9i1C1Z/RMi0v0m2FNliNz4QRJpxL
	ffI+Jw6ZzDt9kPeBVeO2ln8flwAR1UDVZInReSXD7x8v9puTa9qblzkVuoUTpgRc2QrGFn3V7I9
	i46tYFc+opB5x4H/Ty0eAITP7/9osMRCBZ8TevcZX0RQ==
X-Received: by 2002:a05:600c:818d:b0:485:9a50:3369 with SMTP id 5b1f17b1804b1-488997e74fbmr27479815e9.29.1775199999487;
        Fri, 03 Apr 2026 00:06:39 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4889b559a15sm16310975e9.2.2026.04.03.00.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 00:06:39 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: soc@kernel.org,
	arm@kernel.org
Cc: conor@kernel.org,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Microchip ARM64 device tree updates for v7.1
Date: Fri,  3 Apr 2026 10:06:37 +0300
Message-ID: <20260403070637.2554408-1-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/microchip-dt64-7.1

for you to fetch changes up to 711cca0f1cfef57018654b969da4041c2bab68d3:

  arm64: dts: microchip: add EV23X71A board (2026-03-20 10:56:22 +0200)

----------------------------------------------------------------
Microchip ARM64 device tree updates for v7.1

This update includes:
- device tree files for the Microchip LAN9691 SoC and its evaluation
  board (Microchip EV23X71A)

----------------------------------------------------------------
Robert Marko (4):
      arm64: dts: microchip: add LAN969x clock header file
      arm64: dts: microchip: add LAN969x support
      dt-bindings: arm: AT91: document EV23X71A board
      arm64: dts: microchip: add EV23X71A board

 .../devicetree/bindings/arm/atmel-at91.yaml        |   6 +
 arch/arm64/boot/dts/microchip/Makefile             |   1 +
 arch/arm64/boot/dts/microchip/clk-lan9691.h        |  24 +
 arch/arm64/boot/dts/microchip/lan9691.dtsi         | 488 +++++++++++++
 arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts | 756 +++++++++++++++++++++
 5 files changed, 1275 insertions(+)
 create mode 100644 arch/arm64/boot/dts/microchip/clk-lan9691.h
 create mode 100644 arch/arm64/boot/dts/microchip/lan9691.dtsi
 create mode 100644 arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
