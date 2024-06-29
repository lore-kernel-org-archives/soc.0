Return-Path: <SRS0=F7Uv=N7=tuxon.dev=claudiu.beznea@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD79AC27C4F
	for <soc@archiver.kernel.org>; Sat, 29 Jun 2024 17:40:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 90C2EC32789; Sat, 29 Jun 2024 17:40:56 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3BD51C32786
	for <soc@kernel.org>; Sat, 29 Jun 2024 17:40:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3BD51C32786
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42565697036so16284385e9.1
        for <soc@kernel.org>; Sat, 29 Jun 2024 10:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1719682853; x=1720287653; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3LQQuzMc3HletULMtqnAUiZ8/tXn5WUrHKGuvR/wySE=;
        b=OJCv6+FaX10J+dIk7nuSHjFxKBe4bJ7mv6CkyacE/kPuHCHuzRrdCy7EPHHbOfOzyQ
         NvbFqj46NYKRmvxx387fLo9EOy4HSW+mW6Ni7SVLXewrjAujzgDSBpSZEp1i6+tjS/Gf
         IDZzrSYJKuER0oRTCLbzu/95mtFz2OuneStoSaY4hdHzlqs31hetGcMW+xa8l15fxJDF
         4xFMzVj2P4KI6N8BWRIhrJ9nsLsi4lsExb2dm3u8Iap+wQHUbv3pG2GWEiT3lDbpDu2a
         zLtBAq5WdrCZL1RCP6rRv7jQnTZUClyh25qkLdIc4rwiHqd4jVqCYPDPM9eTuenCOw7R
         iOFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719682853; x=1720287653;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3LQQuzMc3HletULMtqnAUiZ8/tXn5WUrHKGuvR/wySE=;
        b=VpkOosqvrRUdN/ijWi97XfWCtbXDDqHanNaGS2rsgdZGKiJyFf4n4XTMvlB26N01LE
         dGnHHi3hEUZ85OZLEjLVacH8PKSoaX2DkNxQzcy+ubprIV2nUK2aRf1y0NyCm4CJv6L3
         AaIXYknYazv1OwUSqLeNuBIHNnhknBx4y03z6oYG6k3G77jaS7IsUNBykPxdA+Qh5Fu9
         NkJUzOfnomAfWMWH9vBFiNmqo3OUFm7ijgFGcwMaJkIdu0lexZ9PuSCYgh0nv7/RCWc6
         PMe36whYe82W3Ed1Z4MC14ZFivDM3QwsNB6SuCUfVtVr6/mM+Bx5X+dXvSSd/TGDar99
         7e5A==
X-Forwarded-Encrypted: i=1; AJvYcCUUSRmiDkqJhUyNZ2vuxf9PQ4pOeJsDbOCCPLJP4mHEhZEYdISbtYRWaatDZ4TwWshbLZlwlBuM9+cXa6/usg==
X-Gm-Message-State: AOJu0YzVJkwRPNLm/G06QYvYizFBYyaWvL1yMawdbwx3krRBRmKgl9hC
	kVCqizjNiN1LVuT/X0jCZbaYjjoSggnlYwYY4YTu1pjegVd6jEHcRWCXYC65CD4=
X-Google-Smtp-Source: AGHT+IEZNQBDd7nBvPli7J5Dv5FOQL8KaUYJHROfuDp6rN1vIOpZe6Vz/KImfzFXQKuygvVVDlzz5w==
X-Received: by 2002:a5d:63d1:0:b0:362:4679:b5a with SMTP id ffacd0b85a97d-36760a7832cmr4164945f8f.16.1719682853421;
        Sat, 29 Jun 2024 10:40:53 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256b0c16bfsm85481365e9.39.2024.06.29.10.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jun 2024 10:40:53 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
List-Id: <soc.lore.kernel.org>
To: arnd@arndb.de,
	olof@lixom.net,
	arm@kernel.org,
	soc@kernel.org
Cc: conor@kernel.org,
	nicolas.ferre@microchip.com,
	linux-arm-kernel@lists.infradead.org,
	claudiu.beznea@tuxon.dev
Subject: [GIT PULL] Microchip ARM64 DT updates for v6.11
Date: Sat, 29 Jun 2024 20:40:51 +0300
Message-Id: <20240629174051.665027-1-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/microchip-dt64-6.11

for you to fetch changes up to 3a94fa4cb86e96103657ba3550ee68b424269613:

  arm64: dts: microchip: sparx5_pcb135: move non-MMIO nodes out of axi (2024-06-04 18:53:22 +0100)

----------------------------------------------------------------
Microchip ARM64 device tree updates for v6.11

It contains:
- cleanups for simple-bus nodes to comply with dtbs_check

----------------------------------------------------------------
Krzysztof Kozlowski (2):
      arm64: dts: microchip: sparx5_pcb134: move non-MMIO nodes out of axi
      arm64: dts: microchip: sparx5_pcb135: move non-MMIO nodes out of axi

 .../boot/dts/microchip/sparx5_pcb134_board.dtsi    | 372 +++++++++++----------
 .../boot/dts/microchip/sparx5_pcb135_board.dtsi    |  95 +++---
 2 files changed, 241 insertions(+), 226 deletions(-)
