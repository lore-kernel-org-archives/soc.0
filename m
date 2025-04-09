Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1480725A2D0
	for <soc@lists.linux.dev>; Wed,  9 Apr 2025 08:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744187722; cv=none; b=LJ2PzxAwmarKjfGnoJlxsY2E4U4LaIYlg0c/u9zMt/uy8yTMJk1D8cC9GDwweZ6xjogmPQ9rOcR/hQ7c7afGbu2HnGOM6vY88kgT8HL6DdS7TPE/mqyZXLalh5xFbmvap9RrKQpRH8ea035BQLDaTIR6ctUM959orhjfbINopUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744187722; c=relaxed/simple;
	bh=jC8F5u77YmXdyJ6CJbVRPG/gEReRuohDwTIVtgdLG/o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Amx7sIQ96Qegb/oAqVaWHlLrpDj0TyFpE7k984pYjWFl0LbHcIc1kXGQFrjf8+I1hmE4IDnBK1bb+AzYlJjYLz5eCxxmDStkXINzxErV6i7PnNd3/fwbk6sTrVF8gEdmfbaqOq5Qsd+hDpXc8tD8jvP2fjvTpZL7ko2Oe5UzDD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=MHDa9pLZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="MHDa9pLZ"
Received: by smtp.kernel.org (Postfix)
	id 8BCBCC4CEE3; Wed,  9 Apr 2025 08:35:20 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0F98DC4CEEB
	for <soc@kernel.org>; Wed,  9 Apr 2025 08:35:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0F98DC4CEEB
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso316455f8f.1
        for <soc@kernel.org>; Wed, 09 Apr 2025 01:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744187716; x=1744792516; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=23h330mvwmMPaZW8Skt8X7vh3SKfShoYxDlivAwr5wM=;
        b=MHDa9pLZGoCGKtSWj8S4A67rLekW16pKGdwrwTi5y6j3VS3klklM9K+igRTXyD3l2H
         x09nwsXiX00+VXF24Csot+ibg+3jM79DIkMi/X0hM0jLszjWYtkp4oTFejy0Iu47h+4+
         FNJldyPHoygW0zXOUfV5OCZ/dzXOB1fP4L67dS5WXeuTlfFh0sG2ouW34wgDE4P2ublT
         1S7+zvzTPv+KchN2erTHWpQow4IKUBbWiuRtfepbfos/uPgXoq/6KP2oJe5E8zS22He4
         K4gaWXBXmCIBghV8k/xw8diLqArxUbfCkP0vsOw/tYKZJeKVr8JDXLPcsLv0HznSUsnw
         wXXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744187716; x=1744792516;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=23h330mvwmMPaZW8Skt8X7vh3SKfShoYxDlivAwr5wM=;
        b=CpOzKUhfpnwBMLScXpxFC5pgy3Tf6GZC43z2KD6P/uKJtg30egVd8O9Khs0z6WV8zA
         +keOT1SRtztNbklxzMuA0tRa0RoUmmcjOOBe726oGCr8Wcef9S8RZE2eOSB5YfdD2Amf
         mGUb9ptpoL4kxxYuBJ9smw2IgxhkLUcZs8kijp95/+SQlQqf8EtV1jhw9JAj0zX6Hkdb
         Q7cthHkQ4yO3X19MhjxPJwoX1mtgiaNpjKmipkXeiV3Y7lrPnBuGporItXMzzKk9OjUS
         NoJEC58VYDSa3CcPuuCUS5sP/gOLurAtkPeRUZ+MLsE6MxgzSiOfsu4l42GJuZ/sIcai
         f84g==
X-Forwarded-Encrypted: i=1; AJvYcCX2OKzZ2n2VFsteaKo4EvYE922LhLxfBJAmuTbkmhgiXOKGjiAFC79iBToEUxeRB1xl7Sk=@kernel.org
X-Gm-Message-State: AOJu0Yzv1+rNPmfOLhAuEBAUgZZmHdA0xOXq5agqRKbwrJBOthF9dHeB
	d/Nr6UcgcgUCace9JohF2ozyUf8NpUn0KcIlZyqgbRDQJlaElxnnyAfJn6paNfM=
X-Gm-Gg: ASbGncuc+rHOiDY9XWmmnUN09yKVjtifgA7SRCn/fQoAa/V+uMsG75oirJ/JBiitnYX
	IZFmhvpqh20shbFr8WGWYpGr1bNSs672eOFOgkexKo19oBCo0KKKEsqQVjLt7l3zxt2ghj3f7PV
	G7hr9XASLJscVf3WKHacF/wynVibioLDAZlLmhcL4lcXFoNIun7mSyVmzYre7LD1/Z/PTwPG0t3
	g/JPsl3/k5ZUqlKvib9OU48eCpds/vd7Nw3Bmt0SpkYGxFCQQVD/C7pfC0o1Biks/DNU78UGfyx
	LAamXrGPlWXfV3Z0N+g3YiieKUVkdaTfA3yV10iE
X-Google-Smtp-Source: AGHT+IEn1yvBB7exNZb7FHApiQ8xOI92TeGlvD29xSjj0MDZHF6MjvnUpIu9t/EpRfwIr/nwRnc2RQ==
X-Received: by 2002:a05:6000:22c7:b0:39c:13fd:e6cd with SMTP id ffacd0b85a97d-39d821127fcmr5430572f8f.29.1744187716262;
        Wed, 09 Apr 2025 01:35:16 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:7880:1c3f:3ac3:7c62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d893611dcsm941303f8f.9.2025.04.09.01.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 01:35:15 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: arm@kernel.org,
	soc@kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Arnd Bergmann <arnd@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] ARM: convert board-file GPIO chips to using new value setters
Date: Wed,  9 Apr 2025 10:35:13 +0200
Message-ID: <20250409083513.21115-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Arnd,

As discussed: please pull the following set of changes that convert the
GPIO drivers under arch/arm/ to using the new line value setters that
allow to indicate failures to callers.

Thanks,
Bartosz

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/arm-gpio-set-conversion-for-v6.16-rc1

for you to fetch changes up to fb52f3226cab41b94f9e6ac92b1108bce324e700:

  ARM: s3c/gpio: use new line value setter callbacks (2025-04-09 10:25:26 +0200)

----------------------------------------------------------------
ARM: convert board-file GPIO chips to using new value setters

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. We're in the process of
converting all GPIO drivers to using the new API. This series converts
all ARM board-file level controllers.

----------------------------------------------------------------
Bartosz Golaszewski (4):
      ARM: orion/gpio: use new line value setter callbacks
      ARM: sa1100/gpio: use new line value setter callbacks
      ARM: scoop/gpio: use new line value setter callbacks
      ARM: s3c/gpio: use new line value setter callbacks

 arch/arm/common/sa1111.c         | 6 ++++--
 arch/arm/common/scoop.c          | 7 +++++--
 arch/arm/mach-s3c/gpio-samsung.c | 8 +++++---
 arch/arm/plat-orion/gpio.c       | 6 ++++--
 4 files changed, 18 insertions(+), 9 deletions(-)
