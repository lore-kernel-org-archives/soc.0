Return-Path: <SRS0=YkL8=N6=gmail.com=dmitry.torokhov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23475C2BD09
	for <soc@archiver.kernel.org>; Fri, 28 Jun 2024 18:09:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EEE08C2BD10; Fri, 28 Jun 2024 18:09:03 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 06DDFC116B1
	for <soc@kernel.org>; Fri, 28 Jun 2024 18:09:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 06DDFC116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7041053c0fdso543182b3a.3
        for <soc@kernel.org>; Fri, 28 Jun 2024 11:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719598142; x=1720202942; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gLbYfpHailMRml8tkooKFu5Un3e2ZVQ3TTsmePLSQUo=;
        b=MEsuOYAlqV/AWTgfnhlIu2MjWp3YoM4AXowjYS3wZqAPQYpolcXgiikf220AZhT8GT
         zcaq7u0oa/gegcWDhJOSxaq0e9vQDB1v3Hwd6lQwlrSs5rZkl23xb+cJIF0KSMY9jeh8
         YWsPpFbg4Lgb1vx0P04WXV0OIfcgfnbqKMoelzn03Hhu5MmirQG6dKi84y0rqXTnvuWS
         CXXvBoaW21mdjAcDwKkg1lfzkSjmGcA0mwgpNpU716AwskAyCc6OknVKaobbTZWs1vyN
         siLMVQjX0IzUV1tUd2wfNjdxjeHdrMZnbP0AwiKBn/nsj0i7e8B/I7V5cEd8Fy+so5Z2
         hAdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719598142; x=1720202942;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gLbYfpHailMRml8tkooKFu5Un3e2ZVQ3TTsmePLSQUo=;
        b=tlgEIrRvVqr8ZIgKr9eStLhaIWTP4vcp4vnbTqYqiKS2NAGd1QHRVrS/oBNx65/7h9
         ILjsEK0ng1tNH4RzFboGNvX3/XGmZahkk/jKhd8N8KpMxDCDnZTqmELt0mUwA6R8PLrQ
         JNf3JeJq3Z/lJUJ6fZN+s3IDOGpHeAk3GQxPMAVf8ywZFOfISWHGQ5q3Bg9y6iYxYovX
         MWHdHh01XMhCV2ZoXM44AK4Mi+r5k7poBl2ooqQjjOf+zTFybowqh6odPuWBaF2fW8CZ
         iN+x+HVsCKmpxs15qDYwHQ86hTfoY/EZ5vLn1AYmENGcwvuDLt0zHywyVHzWEd+g8hqa
         GH7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVipD3C+j77km+fq/vjspn6NvOxypEC8D2EjPumqRQT1BERN+WmkPcNderxr9zQz8l+4CtRQQsDB4GxRs60qA==
X-Gm-Message-State: AOJu0YxqBxX4TtN3a8o5L1Mdp5lnlhTV4Ffvx3pN/8Zf++gA/WyZZrBE
	ndJK9r7fHDCTpJ++/7wSkpt00Ua4UxR/ZgeFDnaZVIJL8s+ZJMLg
X-Google-Smtp-Source: AGHT+IFbkw/YIbsa2PVh7LWrxn8qvAeoCj2gyLAqUcrhU9vdDH2p3fp08Z8dbHZsDhlcNXfAx9MKCA==
X-Received: by 2002:a05:6a20:baa2:b0:1bd:2520:1fa5 with SMTP id adf61e73a8af0-1bd25202067mr9679591637.4.1719598142077;
        Fri, 28 Jun 2024 11:09:02 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:c929:2998:720d:a104])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7080295d1f4sm1982911b3a.91.2024.06.28.11.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 11:09:01 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
List-Id: <soc.lore.kernel.org>
To: Haojian Zhuang <haojian.zhuang@gmail.com>,
	Daniel Mack <daniel@zonque.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 00/10] ARM: pxa: use software nodes/properties for GPIOs
Date: Fri, 28 Jun 2024 11:08:40 -0700
Message-ID: <20240628180852.1738922-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series converts legacy pxa boards (spitz, gumstix) to use software
nodes/properties to describe various GPIOs instead of relying on GPIO
lookup tables. The benefit is that structure and behavior is closer to
DT-described GPIOs.

The very first patch ("ARM: spitz: fix GPIO assignment for backlight")
is actually a fix that IMO should be applied sooner rather than later,
the rest of patches are enhancements. The reason it is sent with the
rest of the series is that later changes contextually depend on it.

The last patch ("ARM: spitz: Use software nodes for the ADS7846
touchscreen") soft-depends on corresponding changes by Linus Walleij to
the ads7846 driver in input tree. It compiles without it, but the device
will not sync with display refreshes. I have created an immutable branch
(branched from v6.9) at:

git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git ib/ads7846-hsync

in case you wish to pull it in.

Regretfully it was only compiled as I do not have access to the relevant
hardware.

Dmitry Torokhov (8):
  ARM: spitz: fix GPIO assignment for backlight
  ARM: pxa: consolidate GPIO chip platform data
  ARM: pxa/gumstix: convert vbus gpio to use software nodes
  ARM: spitz: Simplify instantiating SPI controller
  ARM: spitz: Use software nodes to describe audio GPIOs
  ARM: spitz: Use software nodes to describe LCD GPIOs
  ARM: spitz: Use software nodes to describe MMC GPIOs
  ARM: spitz: Use software nodes to describe LED GPIOs

Linus Walleij (2):
  ARM: spitz: Use software nodes to describe SPI CS lines
  ARM: spitz: Use software nodes for the ADS7846 touchscreen

 arch/arm/mach-pxa/devices.c              |  53 +++--
 arch/arm/mach-pxa/devices.h              |   5 +-
 arch/arm/mach-pxa/gumstix.c              |  24 +-
 arch/arm/mach-pxa/pxa25x.c               |   8 +-
 arch/arm/mach-pxa/pxa27x.c               |   9 +-
 arch/arm/mach-pxa/spitz.c                | 284 ++++++++++++-----------
 include/linux/platform_data/mmc-pxamci.h |   4 +-
 7 files changed, 208 insertions(+), 179 deletions(-)

Thanks.

-- 
2.45.2.803.g4e1b14247a-goog

