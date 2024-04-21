Return-Path: <SRS0=aRMr=L2=tuxon.dev=claudiu.beznea@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61E1BC4345F
	for <soc@archiver.kernel.org>; Sun, 21 Apr 2024 12:48:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 16E81C32781; Sun, 21 Apr 2024 12:48:29 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 238E6C3277B
	for <soc@kernel.org>; Sun, 21 Apr 2024 12:48:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 238E6C3277B
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-41a523e2851so494785e9.3
        for <soc@kernel.org>; Sun, 21 Apr 2024 05:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1713703706; x=1714308506; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aj00FVWaDah5d9Jr6M77x6XkD/WMucR6pIokjzDZdLE=;
        b=JXNGy/nIwXONehgkuyViKWflh5gOPHqp6LBBY+ljfXNbWduhfeaNcF2R+zouETZe1J
         kCEdzZM36wwYXIG1zcBcf3xTeaeQU8hOEWDufLqGuZPjpX2g92LdC1UuNIPOxDaXC4pa
         c+dLd6+qhUgQfQMv1XH48eAQkRFWPGLDH9PehEm4O9YDZdl9geCiVmVJ6smLLyKwGOiz
         Lyk5kIAnBPuy3u4cLXb2OGATM+2iCGbC3EX/NPw0QhqX06HwVOVlsElf0IPA6HknL8+8
         Wt/ldoi/g6UclKiyfs+ocsG3V0oOhyrf3ZzYDGwDmfxeb2e8KEoLwaeMNQqHLDSNVir1
         bMhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713703706; x=1714308506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aj00FVWaDah5d9Jr6M77x6XkD/WMucR6pIokjzDZdLE=;
        b=s8bhjOYEDVFszdxDHjp/yrXro7xG1OmHsgHMKEuBXQBf2gev7M0iEiimzdTGniha7x
         zHdo2A+qReQBMRpstqoEWyyYaVPZYuQ8dAtFG8C1I7qrDVj1JF6c63e2/lybbZB2vhCr
         /vBvs9PYHvpxfP/xSPQPYrmi19F9MEKn0yOuBzP8D9tzHsIXkEuLBSyrCfeZXLFwgSTN
         ybeU2BEEkUSIFjUDpf/afl/t3w+VhOu6LbSpfFr82Zf6N7f53QiVrWhNAqsZ+NHViFGy
         AhxgV2r4Vyquj3UwsVf2foFmgIhzCYhMzuDB/L9vYjP+wciYskl9saPY5qRBvUx4HfmK
         SDrA==
X-Forwarded-Encrypted: i=1; AJvYcCXLlQISdrl3wlWiAtUTGMi+oc8tzcy/pI/+UKMnPRyGQGNoZ0LpwmbujwjOOuL6jVLdPXgTCtZfeSigMahYKQ==
X-Gm-Message-State: AOJu0YyQqVvP661cuhFGLyGSQYEmOepiay6Lv0vp8NS2q6tT+JayuLop
	NkQgW20OlsbIKLEmGDvbn/VojoOpw5pRR9f091AyQLE3YyUex/0n4PNBIuon2Mg=
X-Google-Smtp-Source: AGHT+IGvyQ9pdn1hQ15jw+KXHl3VZInTRGHDbvbedAz99LLxZ1cj7D4j0F7MS8V/mRJjh6xvPFIZjQ==
X-Received: by 2002:a05:600c:4748:b0:41a:4d71:edde with SMTP id w8-20020a05600c474800b0041a4d71eddemr447992wmo.22.1713703706042;
        Sun, 21 Apr 2024 05:48:26 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.53])
        by smtp.gmail.com with ESMTPSA id n18-20020a05600c4f9200b004169836bf9asm17011947wmq.23.2024.04.21.05.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Apr 2024 05:48:25 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
List-Id: <soc.lore.kernel.org>
To: arnd@arndb.de,
	olof@lixom.net,
	arm@kernel.org,
	soc@kernel.org
Cc: nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Microchip AT91 fixes for v6.9
Date: Sun, 21 Apr 2024 15:48:24 +0300
Message-Id: <20240421124824.960096-1-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-fixes-6.9

for you to fetch changes up to 1fe5e0a31e6202025a100fc08cd5902f6abbaaba:

  ARM: dts: microchip: at91-sama7g54_curiosity: Replace regulator-suspend-voltage with the valid property (2024-04-21 14:31:28 +0300)

----------------------------------------------------------------
AT91 fixes for 6.9

It contains:
- fixes for regulator nodes on SAMA7G5 based boards: proper DT property is used
  to setup regulators suspend voltage.

----------------------------------------------------------------
Andrei Simion (2):
      ARM: dts: microchip: at91-sama7g5ek: Replace regulator-suspend-voltage with the valid property
      ARM: dts: microchip: at91-sama7g54_curiosity: Replace regulator-suspend-voltage with the valid property

 arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dts | 8 ++++----
 arch/arm/boot/dts/microchip/at91-sama7g5ek.dts          | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)
