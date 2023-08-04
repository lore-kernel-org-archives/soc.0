Return-Path: <SRS0=wTi4=DV=tuxon.dev=claudiu.beznea@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FDF4C04A6A
	for <soc@archiver.kernel.org>; Fri,  4 Aug 2023 04:41:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0DB69C433C9; Fri,  4 Aug 2023 04:41:40 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2D908C433C8
	for <soc@kernel.org>; Fri,  4 Aug 2023 04:41:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2D908C433C8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-3fe2bc2701bso16185445e9.2
        for <soc@kernel.org>; Thu, 03 Aug 2023 21:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1691124097; x=1691728897;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E4hYv2yhsxNp+OrfKrSmyJ6BSGqWbPOKyYH9SXpDOCc=;
        b=iqsEH2tVT375z9muNnEDW3uRhH27upQ3UMpk7cRCHC+WpmpAE4voD7MgbcPht7y8Gs
         8yqWvlkMuq2C9XbUY7YL/Dm0xUizHxwPWDytC6B1gVO9xZv9JHImwB3g+oT4XBVdEbeI
         bj1Gq2YAGtj5y0/75MnO9QT2r8yj/f6uUiJqnzjGJ7f5JX67c0DIQhPBckcRMEeLiApy
         8h5AGGKggJvTfqseqNJmnb0xnsqwSyMZHEz6mI+22txnOG6/J58HACak0vicCXVZvwX3
         47hnYWuaqLry4ri1z00i4za7ewaMbKw7f9l8E/kULj/VwaAnWceWL4VmAb8fAsXKML2M
         QITQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691124097; x=1691728897;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E4hYv2yhsxNp+OrfKrSmyJ6BSGqWbPOKyYH9SXpDOCc=;
        b=h506e5LjqrZewjbaf24NxV6uEzIJOZ5hVMPeqavGlmIijnyWNXLpvKLKk15dQvMIU0
         OD5ZUFhdP5LpwM/r8hXwc5oDXPFvbXyq+9voi1hoPXYRTfCvRmwqDQLXHwnK1Cu7DnXv
         eRaeIxtD9thMlq3r1lz9nW1C6azmVdnwm8OvL6mogIBPnHJqKwOM2rgQUqVSkRWzBLNc
         NoskFDOsD8XTNleFW6/IwbPBLMoNkiB7J4s3q97zXmJLe7MGTEkKnT0q2MgVxX7AKH63
         NKcGpfAF62NODfVN+wZgqkYuMsCOzARaOZUizW94+xsJhEWUet5Hn0LjaUATYRLgEwna
         kMdQ==
X-Gm-Message-State: AOJu0YyVzoa5c87/RXPZ/upcjQ8XPLGQzRxaTLOuzP1C/ZM7sKbsVL2D
	tCcuSQuCNCRCpNJ1g9cMIfRhww==
X-Google-Smtp-Source: AGHT+IH6uK6ez+WEYAFUNSrlGykTVRpyTbVljz6biax5y3VTCuuDyDb+5Znio0L8iDZI+8zmvK6+5A==
X-Received: by 2002:a1c:f216:0:b0:3fe:2b60:b24e with SMTP id s22-20020a1cf216000000b003fe2b60b24emr548863wmc.29.1691124097079;
        Thu, 03 Aug 2023 21:41:37 -0700 (PDT)
Received: from localhost.localdomain ([82.78.167.79])
        by smtp.gmail.com with ESMTPSA id o6-20020a1c7506000000b003fe3674bb45sm4360793wmc.44.2023.08.03.21.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 21:41:36 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
List-Id: <soc.lore.kernel.org>
To: arnd@arndb.de,
	olof@lixom.net,
	arm@kernel.org,
	soc@kernel.org
Cc: nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	conor.dooley@microchip.com,
	cristian.birsan@microchip.com
Subject: [GIT PULL] Microchip ARM64 DT updates for 6.6
Date: Fri,  4 Aug 2023 07:41:32 +0300
Message-Id: <20230804044132.231508-1-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/microchip-dt64-6.6

for you to fetch changes up to 7dd900ea0e1b9a2000270c9c0f4deab0cfa359b1:

  arm64: dts: microchip: minor whitespace cleanup around '=' (2023-07-29 17:05:24 +0300)

----------------------------------------------------------------
Microchip ARM64 device tree updates for 6.6

It contains:
- one cleanup patch that removes whitespaces around '='

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      arm64: dts: microchip: minor whitespace cleanup around '='

 arch/arm64/boot/dts/microchip/sparx5.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)
