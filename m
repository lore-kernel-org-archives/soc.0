Return-Path: <SRS0=XNjI=ZS=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E96B1ECAAD8
	for <soc@archiver.kernel.org>; Thu, 15 Sep 2022 02:30:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A81DAC433C1; Thu, 15 Sep 2022 02:30:51 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C617FC433D6;
	Thu, 15 Sep 2022 02:30:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C617FC433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f180.google.com with SMTP id g23so8073162qtu.2;
        Wed, 14 Sep 2022 19:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=hs0QNKt4XFGfznKSteDSkphEzddGVAURfmBskwwHZYY=;
        b=BCe9d64b83E8yhHS181UJUssM/8JCQ1WaZt1JGXMUZN1Mwza61DVIRFTRJAcBYBgQj
         SUfNsL6BocWZgElc+Lm1kcMjHmIKxS8zaOu/oDSECYnEL5kj/RrynAY43YmFYuY5V9dH
         SeOizjaaEs7sSjGCKw5LbnKy98HgYwBtOaOLA24dnacXKl5Dq0hMfXvDPqhSN1pifhPM
         DneYQXWZ/2QSZ+OsIFZA8akM2N1I0svwLA5UCzYC62IHsNqaY6+Mq5HoChBMzcT6mtH/
         6+F7JDECfqd+X7sYSoLYuwO9kDGO/XOpNDiPhozSekmQ6DsqG9rwYj9BKWgyLACF5TMr
         I0oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=hs0QNKt4XFGfznKSteDSkphEzddGVAURfmBskwwHZYY=;
        b=FkwNEUfylGSUnAqz9TlxzbwgMmTsGqmHmmk2MYWToPXsXzDUUF84xFzE6Y8xqD3Fen
         7JjlUoWwIO/YNuM3zMkASZmjCOPc4M3mfK82LsNS4gx7Bu4Tj9vu5jepvHCrFan8eyKz
         Q8j3UaOc6fhFIrZ+YXF7mr/2E8SCl1r/zDHOwMUDL0jy/BEaxkX+9n5vty7BdaOLNfaf
         vbPl33+K3nR6pHJ2OHIVZYAk6WK8rFTn8nySoKskaaBmTDoUUeUGpjXpo5H0PCqeQ/KK
         NFsWZYwmYNYnhXgpZ1o1EpGjOOF9yAL1LubrFd7cbikOU5U+a6Lb986/hD8sgyWAG45w
         nygw==
X-Gm-Message-State: ACgBeo2a3wKnt9FndIZ4C1aeuetquXH/+Kzq/cUtbR7bAa8jQ00eVIgv
	n4Bz2naMVnkVxCjt8yzuzkhHqa9DAbY=
X-Google-Smtp-Source: AA6agR4012f6Mg6i3VYfJu7IuNz5a8ESAhaY8oyFPf4pHgQVVGaTC1B2PNr7Q/WLpvdonyC6a2Qhqg==
X-Received: by 2002:a05:622a:86:b0:342:f620:dc7a with SMTP id o6-20020a05622a008600b00342f620dc7amr35949718qtw.594.1663209048990;
        Wed, 14 Sep 2022 19:30:48 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id u16-20020a05620a0c5000b006bbe7ded98csm3062982qki.112.2022.09.14.19.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 19:30:48 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: William Zhang <william.zhang@broadcom.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 1/5] Broadcom defconfig-arm64 changes for 6.1
Date: Wed, 14 Sep 2022 19:30:40 -0700
Message-Id: <20220915023044.2350782-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.1/defconfig-arm64

for you to fetch changes up to d30b361310f808fbb5837edd598cb5aaa3fca737:

  arm64: defconfig: remove BCM4908 (2022-08-15 09:57:58 -0700)

----------------------------------------------------------------
This pull request contains Broadcom ARM64 defconfig changes for 6.1,
please pull the following:

- William completes the removal of ARCH_BCM4908 by removing that Kconfig
entry from the defconfig since it is being deleted after having been
transitional through 6.0

----------------------------------------------------------------
William Zhang (1):
      arm64: defconfig: remove BCM4908

 arch/arm64/configs/defconfig | 1 -
 1 file changed, 1 deletion(-)
