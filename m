Return-Path: <SRS0=OvMt=HC=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F4A3C433DB
	for <soc@archiver.kernel.org>; Sun, 31 Jan 2021 22:18:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3C28864E2D; Sun, 31 Jan 2021 22:18:13 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E84F64E29;
	Sun, 31 Jan 2021 22:18:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E84F64E29
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=f.fainelli@gmail.com
Received: by mail-pl1-f180.google.com with SMTP id u11so8877132plg.13;
        Sun, 31 Jan 2021 14:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Cy7H6RjOSWJaQHgQqPSzs728mDlUm0icPLVytrCrESM=;
        b=ndmxwi/zgkeF4HS+QACbI92MwWTq6HQTwYp6B+ZrzxdIzkS7+ujD/IoYVh3mYFbWxP
         HikBY0QoIKdDs6I3d4zUg/Rc7gT6HgRkiOm26foVgF+zU7fdxaP8bLXfnobSlGjYSdZL
         Al6ZYfbc1OEzmf91mv1+knf8sNwVCGnLEJx2wyNEA/QJXdNPc2QSSlkA5y7PMLdUpSje
         dV8sUQokvTtRaVcyNjcudghsV4bmtU4PU50lK4+2F/ERuGZgnffoM6YToHpeUE9N/+xe
         KwFpOClOyOauW5+G+gLLIRssSBNjH+cgORMl0ch9I1Ry05EPEYxJFTzjCFzz9J4rrubz
         AQ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Cy7H6RjOSWJaQHgQqPSzs728mDlUm0icPLVytrCrESM=;
        b=AzCurtsA+Hrhlf1u+4MC7MvT5UMW82/W9HvrCluY8Fikma7oxQbkP0qaIkTrS7whHk
         aHYfQTf4a/PDLVMMrTq8bKZ5J+tM78maIp2r0t9dcK8JK1L94C4SFVp7TX9a7SBt4SAU
         sss7TAdIBaq1GAUvvu1W2YPrI+gjvIHq4GmoI7ACm1/yJqCEL+EGJ6NLFiWoJ8BziA20
         LqFvl+1vf3IAt6UPJOl3MaSTxoJyAq67ZHAljC1WYDHpSRsYexsOVL3hjWT9fn6mJ68Y
         IlVqhAEKGWaen4n5tcAcHzl/GtASkaaHbS6QpYR4vI4N2sFDHhzKuHtMFIA9aE378uuF
         V4yw==
X-Gm-Message-State: AOAM531pvQS+h8tI2XuVoXNSuHY+erhqFD75cHSVr+gAtWrN1jlPCV6u
	wSSOuLB2m7j2LuttHKbIT8KgDZaKz0k=
X-Google-Smtp-Source: ABdhPJy6upU/bZBOa4WobjbR1Z2RXkAusy3PH7J/EPW6l45rMgoymOR4RgCl7EjRSPZ6LGr3KV0eeg==
X-Received: by 2002:a17:902:7445:b029:e1:5a7b:3f15 with SMTP id e5-20020a1709027445b02900e15a7b3f15mr2586609plt.29.1612131492227;
        Sun, 31 Jan 2021 14:18:12 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a4sm15512177pfg.41.2021.01.31.14.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Jan 2021 14:18:11 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Maxime Ripard <maxime@cerno.tech>,
	Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 7/7] Broadcom soc changes for 5.12
Date: Sun, 31 Jan 2021 14:17:21 -0800
Message-Id: <20210131221721.685974-7-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210131221721.685974-1-f.fainelli@gmail.com>
References: <20210131221721.685974-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.12/soc

for you to fetch changes up to e066cfd867aabe621be5c1855fc42ff699781ae4:

  Merge tag 'tags/bcm2835-soc-next-2021-01-25' into soc/next (2021-01-25 13:14:49 -0800)

----------------------------------------------------------------
This pull request contains Broadcom ARM-based SoCs Kconfig/machine entry
changes for 5.12, please pull the following:

- Maxime adds a select of the Broadcom STB standard L2 interrupt
  controller driver which is used in the Raspberry Pi 4 HDMI controller to
  support I2C and CEC interrupts

- Florian adds a debug URT entry for the 72116 STB SoC

----------------------------------------------------------------
Florian Fainelli (2):
      ARM: brcmstb: Add debug UART entry for 72116
      Merge tag 'tags/bcm2835-soc-next-2021-01-25' into soc/next

Maxime Ripard (1):
      ARM: bcm: Select BRCMSTB_L2_IRQ for bcm2835

 arch/arm/include/debug/brcmstb.S | 30 ++++++++++++++++--------------
 arch/arm/mach-bcm/Kconfig        |  1 +
 arch/arm64/Kconfig.platforms     |  1 +
 3 files changed, 18 insertions(+), 14 deletions(-)
