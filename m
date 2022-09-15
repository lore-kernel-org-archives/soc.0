Return-Path: <SRS0=XNjI=ZS=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F08EECAAD8
	for <soc@archiver.kernel.org>; Thu, 15 Sep 2022 02:30:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 869D6C433D7; Thu, 15 Sep 2022 02:30:57 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6A0BDC433D6;
	Thu, 15 Sep 2022 02:30:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6A0BDC433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f169.google.com with SMTP id g12so12229881qts.1;
        Wed, 14 Sep 2022 19:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=4ChlSBkXtg+EtenXRFQN58Rym6ZmfxVoYP7+UzPucBM=;
        b=VVwo/0YPI4Hhr7Zyh7gksYtufFj5eShvk0NzKUgYSYYzm+q3drm9P7SF0RNOkq03SC
         aSXngWDmieu01fXMuyrYw/N9JfnnOHIIc8WH1ZWPkgbxZoMOj99hDXAASIqigO5r508e
         Telk5cDAq2kIVQTFqIKSUh1GFVAeq/a+9iIKhA990Qj7oSRzPQfynfsLjaaXlASlxI1I
         y31TqA3vrmjbmfbaJ+G1Ta3e5sn9/BnD68dOWjQv6QkNde9KtLrkjPQegctwELN9F8pY
         JNgx0yITxjUIqfAUIstdtxzre5lCjxz6UvmMM/h1Nngvp9asVgdzGOSWhw42A3QnrAZr
         1+kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=4ChlSBkXtg+EtenXRFQN58Rym6ZmfxVoYP7+UzPucBM=;
        b=1I/4tino5deyJC1DCElcoq3SGQPPHANtT6eC0N60OZ8QVOGrfdLd075+Fng2B4MVw8
         GbBNX51kpwnZKBwWwjV/8DABgGCdv0kfj+O35ChLJBEl+EDtGRM3ii7V8NFZ+GYCc/L+
         wxnzTB+PqGZDMcyJ9Khc11FugAaXalILozYFVOjCSl95fXY9Nszqn4ejiFxo50LTYFHN
         SO3yKfKhKCp+8Bqj9gt+wRy2Cq/kyC4sxGmNGnnmtdn619b5Ed0N1ZazrmlZPeVoL2V7
         Rqv+X4oP/4PJSBGQd7Dqy/WiKlxkhJfUybKI47fAHzKyL/OsNPtffJmfJYomP5thWN0q
         Ow/w==
X-Gm-Message-State: ACgBeo15oWKKR3u9SBsPjdffcYbAfMTnaSbUo5vOCn321hCgdWKA5xET
	sAQqNTBUVV/ZQMvZghi4hgnn+X1t4zI=
X-Google-Smtp-Source: AA6agR768M+mpvDO+CYkalLcKOqRyX0X8m5XPit/9ZiXlPbzfT+uyyqUTl1owofSTLM355EwHOyFSg==
X-Received: by 2002:ac8:7fc5:0:b0:343:681d:c3fb with SMTP id b5-20020ac87fc5000000b00343681dc3fbmr36346438qtk.157.1663209054775;
        Wed, 14 Sep 2022 19:30:54 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id u16-20020a05620a0c5000b006bbe7ded98csm3062982qki.112.2022.09.14.19.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 19:30:53 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: William Zhang <william.zhang@broadcom.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Wolfram Sang <wsa@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Florian Fainelli <f.fainelli@gmail.com>,
	"Guilherme G . Piccoli" <gpiccoli@igalia.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 4/5] Broadcom drivers changes for 6.1
Date: Wed, 14 Sep 2022 19:30:43 -0700
Message-Id: <20220915023044.2350782-4-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220915023044.2350782-1-f.fainelli@gmail.com>
References: <20220915023044.2350782-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.1/drivers

for you to fetch changes up to 7bb49d774f481fdd7bd053e034e4d206770fda04:

  arm64: bcmbca: Make BCM4908 drivers depend on ARCH_BCMBCA (2022-08-15 09:55:34 -0700)

----------------------------------------------------------------
This pull request contains Broadcom ARM/ARM64 SoC drivers updates for
6.1, please pull the following:

- Guilherme adds a comment to the panic notifier, part of his big panic
notifier rework series

- William migrates all of ARCH_BCM4908 dependencies to ARCH_BCMBCA

----------------------------------------------------------------
Guilherme G. Piccoli (1):
      soc: bcm: brcmstb: Document panic notifier action and remove useless header

William Zhang (1):
      arm64: bcmbca: Make BCM4908 drivers depend on ARCH_BCMBCA

 drivers/i2c/busses/Kconfig            |  4 ++--
 drivers/mtd/parsers/Kconfig           |  6 +++---
 drivers/net/ethernet/broadcom/Kconfig |  4 ++--
 drivers/pci/controller/Kconfig        |  2 +-
 drivers/phy/broadcom/Kconfig          |  4 ++--
 drivers/pinctrl/bcm/Kconfig           |  4 ++--
 drivers/reset/Kconfig                 |  2 +-
 drivers/soc/bcm/bcm63xx/Kconfig       |  4 ++--
 drivers/soc/bcm/brcmstb/pm/pm-arm.c   | 16 ++++++++++++++--
 drivers/tty/serial/Kconfig            |  4 ++--
 drivers/watchdog/Kconfig              |  2 +-
 11 files changed, 32 insertions(+), 20 deletions(-)
