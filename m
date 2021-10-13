Return-Path: <SRS0=+cAE=PB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2A64C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Oct 2021 17:43:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85BB860E0B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Oct 2021 17:43:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 85BB860E0B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ji6BXIHb5/1S5GnhifDQfPl5tdjfFk6+D94soC+npfA=; b=ZghDh2v0CnToP0
	JQySnb6Jj8Z3I+IDCUoKX831O+2n1bNob2+LCIgYcRwQnbGPN2GyAa3PhLVmK02xYjkJPClwnqFiU
	kpSM7NvjBeTerHB5Exf+Ev5A+4dqAQTUKa83yv3CUB42+OmkwAWGTuci8rEK9xEArvz31bPwclXzY
	Ix1hCsbLYpT6Xi1DWQx4dDxLJIuDGkNedarnWuWp2SsgMZ7xAY/+uGNzhauUGUHdFMcHIxlVge5E5
	pi6tfv9/UY5hzqWzv5A4aEL+9NSGwRXF3EACSPWA9GOkrdgHtbn2c0V1AvwkLRymKmNPfjH+GAoLt
	hsCkP6C8GhJV9/q090SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maiFC-000Bcq-4Z; Wed, 13 Oct 2021 17:40:46 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maiEr-000Bas-5a
 for linux-arm-kernel@lists.infradead.org; Wed, 13 Oct 2021 17:40:26 +0000
Received: by mail-pj1-x1036.google.com with SMTP id k23so2851492pji.0
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 13 Oct 2021 10:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
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
 b=obTvtUKdU6AMG+BU3Thjoj/c4+HzW24nueDo5xZ+yzO/V6+XsF1pI0zxWaIGNbr1M9
 M6YUMczu4JdnEwoG+XwQrqVhGIy7xY0VQfp3CL5SFEQHHz6K1L2NAfSIHqGD06lJMJSY
 c3uXnLq/SRLUHefQHAxZOPFRkmI+7c0xmU8rWlakZnX8Z9NjzeJKeAhwUTQL2cVzsheo
 mIEzSU+VEKOekDjZum7aXGvyzklqhT3qHKA46scYuU2bI4MiWKrdT+pt9azMuhXm19iI
 r1a4C9H3EXSOckOrSHcdJpXPokxt0uowZKFmSWxV48wbjLWZwQl8/eXYzQuWiB/SRrfC
 LdOg==
X-Gm-Message-State: AOAM531pIkhd+GWrdGTYc14T28RkeBX3oy1VZ2gew+tkLwkQHQ8sjris
 FPgZjlKqfVfOMwes36HsFXY=
X-Google-Smtp-Source: ABdhPJxgGs+o5FRJgIEEUXitJxYfVDFD5ZnZ6IrXalFxWCx4mZk0XyPJZr8FODehvTxocK1cZX/qbA==
X-Received: by 2002:a17:90a:e16:: with SMTP id
 v22mr15072422pje.209.1634146823992; 
 Wed, 13 Oct 2021 10:40:23 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id e15sm133794pfc.134.2021.10.13.10.40.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 10:40:23 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Cai Huoqing <caihuoqing@baidu.com>, linux-arm-kernel@lists.infradead.org,
 arnd@arndb.de, olof@lixom.net, khilman@kernel.org,
 bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 3/3] Broadcom drivers changes for 5.16
Date: Wed, 13 Oct 2021 10:40:16 -0700
Message-ID: <20211013174016.831348-3-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013174016.831348-1-f.fainelli@gmail.com>
References: <20211013174016.831348-1-f.fainelli@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211013_104025_230735_29435FB0 
X-CRM114-Status: GOOD (  10.54  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20211013174016.XAWAS4e0C2qheWS5p9r23PSk_dECzMYIMPExVh8qzk4@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
