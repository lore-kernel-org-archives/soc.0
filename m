Return-Path: <SRS0=0UJg=HZ=tuxon.dev=claudiu.beznea@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90185C4167B
	for <soc@archiver.kernel.org>; Thu, 14 Dec 2023 17:48:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 69370C433C9; Thu, 14 Dec 2023 17:48:36 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1ED53C433C8
	for <soc@kernel.org>; Thu, 14 Dec 2023 17:48:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1ED53C433C8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-551ee7d5214so1765267a12.0
        for <soc@kernel.org>; Thu, 14 Dec 2023 09:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1702576113; x=1703180913; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=obMzQAQnQDx0Ea1RmxDERThwVKvstPgbBXbyEyiFaDI=;
        b=OqvlL9XeSuiARY40mPeasUJLZboKw6UltGLOoi8a2AVk/RNlUd0U9PC8PV23OMll7c
         q8I3DSnVoWFfx2+tgQWyIV1WfBNFO3MFRUmrIPw509+zMqy+bJ/DSt1K2v5574+n+yC7
         +blRhNguTID2z9NYdAhJLN77BUsouKLgiXZrn2l/VvDhQaYr1CxWSHCH0z1tw2qmgsG3
         ugzLUQGlgNxnn3pkslJH3qK0FqW1PL1Xqjy8Hf6JRbL5TA42sPiuWS8q5kxOhpaUFrVH
         RE0aQseRQGlX2h+j74ab38AR8/VIjtxhzTDhgbJ1iso2l2QwCDsG1wpyVRhWE2jJsXIj
         aQpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702576113; x=1703180913;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=obMzQAQnQDx0Ea1RmxDERThwVKvstPgbBXbyEyiFaDI=;
        b=lolV+Utm1bQIhZTVC53aKJOKLmuQIpkdCxMD2hEYGhEEB40xoWR2EV+QoYei7+207n
         XJxEkwD/OpVh+GsjNMBHPfFyZeKfRoD6Rpsnvxm9vlcal2NO1mJKydVJrr/AbwEej5Lm
         9M97eyZYCWjbcdzF7rn7B3H8gKXLJIMitmXrtrtMCgUkJRyLLpYku7zEL+hH6bUcODi5
         pu8drxJzaG0lUkHe5rTiBsMrg4p6qEuPGtboHvo7dLn+z8Vc+HhxtCjpX6QGbfU0+TnL
         cXIgOwvlxLzkOJKkk4d4l15F2sZOxE2kp7JBqX9PBtd62a7duGyLMgqGTnUu+1yZfK3T
         3OhA==
X-Gm-Message-State: AOJu0YyB4PVK/KGT/SGkWuYlDJCeyXRRgx9AW2aOdgjEgW7StJcN+kb2
	RLLvqVtm2833FJO189dnlLJ/PQ==
X-Google-Smtp-Source: AGHT+IGaV/DiTdlguJLWC5JiFdh+Lp4IxCeXpPOY3wDIAe1UiLMBg5EJvyi0VCBOuER5MpfnpGT+eA==
X-Received: by 2002:a17:906:6a27:b0:a1f:6551:6405 with SMTP id qw39-20020a1709066a2700b00a1f65516405mr12209159ejc.37.1702576113039;
        Thu, 14 Dec 2023 09:48:33 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.103])
        by smtp.gmail.com with ESMTPSA id cu1-20020a170906ba8100b00a1f65433d08sm9677696ejd.172.2023.12.14.09.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 09:48:32 -0800 (PST)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
List-Id: <soc.lore.kernel.org>
To: arnd@arndb.de,
	olof@lixom.net,
	arm@kernel.org,
	soc@kernel.org
Cc: nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Microchip AT91 SoC updates for v6.8
Date: Thu, 14 Dec 2023 19:48:30 +0200
Message-Id: <20231214174830.3045180-1-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-soc-6.8

for you to fetch changes up to aa1cfba75b77ca93ab9a0b03c2c9124a16d96479:

  ARM: at91: pm: set soc_pm.data.mode in at91_pm_secure_init() (2023-11-19 11:32:44 +0200)

----------------------------------------------------------------
Microchip AT91 SoC updates for v6.8

It contains:
- one patch for secure mode to set the target power management mode in
  initialization process as at91_pm_begin() is not called on suspend
  path while in secure mode; this is necessary for different drivers to
  know which suspend mode the system is going to switch to and act
  accordingly

----------------------------------------------------------------
Thomas Perrot (1):
      ARM: at91: pm: set soc_pm.data.mode in at91_pm_secure_init()

 arch/arm/mach-at91/pm.c | 3 +++
 1 file changed, 3 insertions(+)
