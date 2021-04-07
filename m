Return-Path: <SRS0=Yh/P=JE=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47D3FC433ED
	for <soc@archiver.kernel.org>; Wed,  7 Apr 2021 16:13:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1701161353; Wed,  7 Apr 2021 16:13:39 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8646761260
	for <soc@kernel.org>; Wed,  7 Apr 2021 16:13:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8646761260
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=krzysztof.kozlowski@canonical.com
Received: from mail-wm1-f72.google.com ([209.85.128.72])
	by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.86_2)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lUAoC-0001qh-Ug
	for soc@kernel.org; Wed, 07 Apr 2021 16:13:37 +0000
Received: by mail-wm1-f72.google.com with SMTP id y15so577625wmq.9
        for <soc@kernel.org>; Wed, 07 Apr 2021 09:13:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GCaQ4X0i1Zh2bf+++rMGXv8cMwAxvbSBKfO/usQt79g=;
        b=RXTPt1Z6YeTVVG70oWsiS93Ogcvbx5e4W1KAJhcFhX0AetfHJvbnjxOTBPRN0RQNRL
         OONqWTRC7Gbc0voQoWaiekowVnWveWtjYBfAu4WI8Njs2lHXsZEoZ8vSfGHM0lKyMV/I
         W0HBnxmjSmq5k4VXYSHX67I7P+M2qX5HlLTX2oxGXhm5DVkjW8BqZdXYWywn22OJFg2L
         LbZ6AC8bNFpz5L2DrpTQMwNNJZdHBa1cQ7PxWPQUYT5ZGo7Ud5mZlwTwaseMp7gql4iu
         vxhNWUvFl3iygPFCoXuPbgCfHKES+T3dxyxQGxDn/riiL2Znc89Af04DecvCP5kk9nGj
         z/AA==
X-Gm-Message-State: AOAM533I/nJoKIVQpWxFZHsmR9cV52TeUzuN87pL/tFx/oHaGI1hqcnK
	IkDp7SvHbva1qgz7Mt0+U5yAPgH7ndCD4bCEzjdxhJW6bl4tA2/MBrBca9nkQhf9CbbF5THMUOl
	Jy0uoZeRrMtJgbI8Pw1abC5s=
X-Received: by 2002:adf:ef0a:: with SMTP id e10mr5160003wro.129.1617812016726;
        Wed, 07 Apr 2021 09:13:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzStNBdG4/Um9qP4P2r3AXJim8xMhu/B9k05GyAyYX9QtekqyznyOJpI4nqeSYbJB3JRwfhsA==
X-Received: by 2002:adf:ef0a:: with SMTP id e10mr5159987wro.129.1617812016501;
        Wed, 07 Apr 2021 09:13:36 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-192-147.adslplus.ch. [188.155.192.147])
        by smtp.gmail.com with ESMTPSA id k16sm20856105wrl.47.2021.04.07.09.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 09:13:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 1/2] memory: drivers for v5.13
Date: Wed,  7 Apr 2021 18:13:32 +0200
Message-Id: <20210407161333.73013-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-5.13

for you to fetch changes up to 25dcca7fedcd4e31cb368ad846bfd738c0c6307c:

  memory: pl353: fix mask of ECC page_size config register (2021-04-05 16:15:58 +0200)

----------------------------------------------------------------
Memory controller drivers for v5.13

1. OMAP: fix unlikely but possible out of bounds read.
2. PL353: fix mask used in setting ECC page_size in config register.
3. Minor cleanup: Freescale Corenet.

----------------------------------------------------------------
Colin Ian King (1):
      memory: gpmc: fix out of bounds read and dereference on gpmc_cs[]

Qiheng Lin (1):
      memory: fsl-corenet-cf: Remove redundant dev_err call in ccf_probe()

gexueyuan (1):
      memory: pl353: fix mask of ECC page_size config register

 drivers/memory/fsl-corenet-cf.c | 4 +---
 drivers/memory/omap-gpmc.c      | 7 +++++--
 drivers/memory/pl353-smc.c      | 2 +-
 3 files changed, 7 insertions(+), 6 deletions(-)
