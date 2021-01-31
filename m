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
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC563C433E0
	for <soc@archiver.kernel.org>; Sun, 31 Jan 2021 22:18:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id AD44264E2A; Sun, 31 Jan 2021 22:18:11 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8391464E27;
	Sun, 31 Jan 2021 22:18:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8391464E27
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=f.fainelli@gmail.com
Received: by mail-pg1-f173.google.com with SMTP id g15so10718436pgu.9;
        Sun, 31 Jan 2021 14:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Cy7H6RjOSWJaQHgQqPSzs728mDlUm0icPLVytrCrESM=;
        b=ZecceKtP4mnRvzX+G9BULnGuizMGXcN+sPvL6VobA/HTraKoQeGASgzqfqXStWtBAH
         cYX91nYf0cdFpbBvq1m7Lgk9i4jeAI4hX+RVCcPuYaHfmj8FPF5Vk9nkTbh0z5kKqg2e
         kU/ZggUmfqtZi/Z1yoxIZVnrVloMteKYu/yv4mvQOsM2O8if6YSTbI2DlY+KM6TF7qTN
         hqbpXTV9aMg3AefS2CVcm3DNhC81VYhjbjJ0aFPHE0lhaYmCeXWDcK3P1fhswQJpYQkT
         /MUmliunPpw7EM6MozIRlp3L9DmAX92V4CE3YR/p+lhu4kuiqbzp0Am34nJr3ixyYPwd
         zbgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Cy7H6RjOSWJaQHgQqPSzs728mDlUm0icPLVytrCrESM=;
        b=aojkCizUL1H1fn8OWXomekGfuPDH9npIKVvclM/kibBYJH/HBE2/besJFEwm4AKaaB
         dWxypZVarnt9/IaaTvnsUl5LmLFVtIbsmgXvLRtZXK9LKv0yIvJbNlYm5jiD0p390h1p
         UNXkGkg827Js5Ar7XSeghpRiMYv/YRaRwaLv3lYjUCXOWRBAyvvQpTYHySHQAggxQ+/n
         8hNEgVKH1pvml8rRyykPnoWMkcc0nKaypwoZPMyehIhpMeXxkAAWOEErRtL9xRaLtQcA
         2x6ilNlUIOxrQscF24EsWFShyfeh2JZzwE6YjWl9Ps2dsiLvV1Pz6XslBVqJ+nhJpZV8
         NcIw==
X-Gm-Message-State: AOAM532aZvEvcA5Nfk+caelQ5V8vbhtTbdGnQfzYQxs6FQCrxscu34di
	RwKNGaB9bprdRAAQci4n2GFzqpjBhxw=
X-Google-Smtp-Source: ABdhPJzRSNtio/NBrFfep7fHfrzy4BXDBG8KVKXoVIVfQ/lAa8qEDQGCuU3mEcOm7n+chBPdtrDTiA==
X-Received: by 2002:a65:6246:: with SMTP id q6mr1020521pgv.6.1612131490747;
        Sun, 31 Jan 2021 14:18:10 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a4sm15512177pfg.41.2021.01.31.14.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Jan 2021 14:18:09 -0800 (PST)
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
Subject: [GIT PULL 6/6] Broadcom soc changes for 5.12
Date: Sun, 31 Jan 2021 14:17:20 -0800
Message-Id: <20210131221721.685974-6-f.fainelli@gmail.com>
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
