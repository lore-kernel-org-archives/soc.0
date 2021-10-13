Return-Path: <SRS0=qGb1=PB=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CDA0C433F5
	for <soc@archiver.kernel.org>; Wed, 13 Oct 2021 17:40:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 275BE600D3; Wed, 13 Oct 2021 17:40:25 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDDC56113D;
	Wed, 13 Oct 2021 17:40:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EDDC56113D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id oa4so2818121pjb.2;
        Wed, 13 Oct 2021 10:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=p2crvvUAHMrZgU7zfHk6KygnQXdoRqBhOZ+tLUtqtdk=;
        b=LR8XRvEESo63rybQDEPZ5umeAvhuHGrvKFn8dhrpzQ8wzZeu5VZ5uoOBZ5yiEPTL9z
         UkUMIlv8uCzvXm/YsHhPDhNTVDxXwc7P1TjGd9S6hINd4g3pM5V68EifsC1DIys7NmgI
         ECq4U56V39ZZzxmR1q4uyiqVAwHLSmhksihuGYnW5xFMVqZV+eFAvw1zJ84TngBwUc75
         TaK8G3Ck1tGU4KuYYpc3GQVM3zSypQKHGDX5RB69KOG4LmobwUdrxxtsihW2cmlqRXTB
         rhhDeI3DEvdd6R7qjeCfqf1A2Qf8mLH0I4sBQv2xtNtlxPo5g5jYzycw6HlKovWnGiJH
         sbtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p2crvvUAHMrZgU7zfHk6KygnQXdoRqBhOZ+tLUtqtdk=;
        b=CArKFVJ44kkIhmf0oUgar4sA5+PgMWD6HKRgXhWnicCuqvteTBVIto1szbQGe7LD2m
         DvyJAtABtCUxkLBcTncRBLgl6Dwz05VDppmLjEeisGOhIUIl+F9hKEhm3f8L3yg//Br1
         Jn90C8U0bi6OrQkfzKr1euPJFcCGzDEmsYLTVAuFkES1nCXnZ4ZqiTCg6ld27QS42lEN
         J9/nFd4+OnTwySmvwyi43CRE1e2d961DKAJE+5sEm0gzPKPYaG5rsRUJk7K23Ma3x5Sj
         1reBCP3FDSchvRdU1Et66unYGWpu5OdL39w8omPPot20UGkP9IehhmJWfNErruqpVC7T
         5UiA==
X-Gm-Message-State: AOAM531pABb5ik9oV77behbpvMTyd5Xvk3dgXcoB7nJStll8sxIK3Dno
	B/1UxISlp+zbaO/ogoiZNJKKeA/nDkw=
X-Google-Smtp-Source: ABdhPJxgGs+o5FRJgIEEUXitJxYfVDFD5ZnZ6IrXalFxWCx4mZk0XyPJZr8FODehvTxocK1cZX/qbA==
X-Received: by 2002:a17:90a:e16:: with SMTP id v22mr15072422pje.209.1634146823992;
        Wed, 13 Oct 2021 10:40:23 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id e15sm133794pfc.134.2021.10.13.10.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 10:40:23 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Cai Huoqing <caihuoqing@baidu.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 3/3] Broadcom drivers changes for 5.16
Date: Wed, 13 Oct 2021 10:40:16 -0700
Message-Id: <20211013174016.831348-3-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013174016.831348-1-f.fainelli@gmail.com>
References: <20211013174016.831348-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.16/drivers

for you to fetch changes up to 707a4cdf86e5d6a2c4fad51fb98a6ff3425f820e:

  bus: brcmstb_gisb: Allow building as module (2021-09-27 14:04:08 -0700)

----------------------------------------------------------------
This pull request contains Broadcom ARM/ARM64 SoC drivers changes for
5.16, please pull the following:

- Cai updates the bcm-pmb and bcm63xx-power drivers to use the
  devm_platform_ioremap_resource() helper

- Florian updates the Bus Interface Unit code to tune the 72116 and
  72113 chips according to their existing counterparts. The GISB driver is
  updated to be built as a non-removable module

----------------------------------------------------------------
Cai Huoqing (2):
      soc: bcm: bcm-pmb: Make use of the helper function devm_platform_ioremap_resource()
      soc: bcm63xx-power: Make use of the helper function devm_platform_ioremap_resource()

Florian Fainelli (3):
      soc: bcm: brcmstb: biuctrl: Tune MCP settings for 72113
      soc: bcm: brcmstb: biuctrl: Tune MCP settings for 72116
      bus: brcmstb_gisb: Allow building as module

 drivers/bus/Kconfig                     | 2 +-
 drivers/bus/brcmstb_gisb.c              | 7 ++++++-
 drivers/soc/bcm/bcm63xx/bcm-pmb.c       | 4 +---
 drivers/soc/bcm/bcm63xx/bcm63xx-power.c | 4 +---
 drivers/soc/bcm/brcmstb/biuctrl.c       | 2 ++
 5 files changed, 11 insertions(+), 8 deletions(-)
