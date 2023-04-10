Return-Path: <SRS0=Jlev=AB=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFBF4C77B61
	for <soc@archiver.kernel.org>; Mon, 10 Apr 2023 23:26:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D4B03C4339B; Mon, 10 Apr 2023 23:26:16 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E3CCFC433EF;
	Mon, 10 Apr 2023 23:26:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E3CCFC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f174.google.com with SMTP id fc12so3071487qtb.5;
        Mon, 10 Apr 2023 16:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681169174; x=1683761174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VQQjgv80HUN6UIYUFa11nZUMT8IVR3Ic5+4VvO5LWJA=;
        b=foeMZWFsjGg8wQM+b1iffBsbNGh5uWYMTq/+8esVZ5a6x9P4uqhMciT4BvviFpbrw4
         IznAfmQMcYG8IJCgN57c3jaryo78vVSvh8dU0IcGAUqapj448Me7jd1QjhGa0rV8vElr
         /Q1VlJfDcUuiKTJM1XYBsnYV3/x0spSA3HwmZHsosGZVZXyBL3DozvwH45X9JWYAQjkR
         WtA7MygeR9Db/dccdtAPlvW4Ni7RteXxgOMJ9oeOEhKZRbGuJpQ5Mn/tKiCVmcnLXfuy
         APSPTzATiqvqnr1+5XFnMGLqLNDdkFhyY++AbI1ozRTOxQWqPHa8eebxhAHLChhu+4FP
         Kypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681169174; x=1683761174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VQQjgv80HUN6UIYUFa11nZUMT8IVR3Ic5+4VvO5LWJA=;
        b=Vt3SlpBkFldiDxXzXC+3Bd5/43/0LN1eR5/6kUJT1FQOlOmYUQ+uazuXE/ZeZypI8w
         zm0qqEiBln0UE2U/qYZLyciCLaVdBjkLr3btkGLuTOkeJWyONwSDTVr+2mi2iuFUp+Nt
         9mtu8Ll1g5YINxaj4UbYskfh1avSmFCqMwxWOqHMukVDaNh2WdJ8R05sEqg0HAlcA7k9
         MaqKge+HHKy5LTcPo0IvDZ32rqS5cg3XSubIBwmXs0xhoOvYBJOxGLU6r4ny/Wrd7D+H
         CKJXzxhEax2qCmW5GILPWeeE1JBT9R8ENloQYftt3l7NzzuMRwfjXsyGP1C63TxsSzwX
         aJ6w==
X-Gm-Message-State: AAQBX9dQFWgi9AcD8vEPHuTnKfFryyZ+p02q+8Z2uMptQwouYqgrwhHQ
	sOR+DtLHrkESb4wDlar6Q/yYsbJzr96YtQ==
X-Google-Smtp-Source: AKy350bgLARCg2Ao0KQz/Hn91OyQZBEHqX0wiVXNUXIkTlirxQMrCkGiKr0BS2GlY90zyGxqt5BpnA==
X-Received: by 2002:a05:622a:142:b0:3e2:ccf9:bf9d with SMTP id v2-20020a05622a014200b003e2ccf9bf9dmr21773439qtw.61.1681169174208;
        Mon, 10 Apr 2023 16:26:14 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id v126-20020a379384000000b007460093cccdsm3604775qkd.25.2023.04.10.16.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Apr 2023 16:26:13 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Zhaoyang Li <lizhaoyang04@hust.edu.cn>,
	Dan Carpenter <error27@gmail.com>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Nick Alcock <nick.alcock@oracle.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Ye Xingchen <ye.xingchen@zte.com.cn>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 3/4] Broadcom drivers changes for 6.4
Date: Mon, 10 Apr 2023 16:26:05 -0700
Message-Id: <20230410232606.1917803-3-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230410232606.1917803-1-f.fainelli@gmail.com>
References: <20230410232606.1917803-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.4/drivers

for you to fetch changes up to c3fbced9af885a6f217fd95509a613d6590916ce:

  soc: bcm: brcmstb: biuctrl: fix of_iomap leak (2023-04-03 13:37:24 -0700)

----------------------------------------------------------------
This pull request contains Broadcom SoCs drivers changes for 6.4, please
pull the following:

- Zhaoyang fixes an of_iomap() leak in the STB BIU driver

- Florian removes the bare-metal ARM suspend/resume code which has long
  been replaced by the standard PSCI suspend/resume.

----------------------------------------------------------------
Florian Fainelli (1):
      soc: bcm: brcmstb: Remove bare-metal ARM suspend/resume code

Nick Alcock (2):
      kbuild, soc: bcm: raspberrypi-power: remove MODULE_LICENSE in non-modules
      kbuild, soc: bcm: bcm2835-power: remove MODULE_LICENSE in non-modules

Ye Xingchen (1):
      bus: brcmstb_gisb: Use devm_platform_get_and_ioremap_resource()

Zhaoyang Li (1):
      soc: bcm: brcmstb: biuctrl: fix of_iomap leak

 drivers/bus/brcmstb_gisb.c            |   4 +-
 drivers/soc/bcm/bcm2835-power.c       |   1 -
 drivers/soc/bcm/brcmstb/Kconfig       |   4 +-
 drivers/soc/bcm/brcmstb/biuctrl.c     |   4 +
 drivers/soc/bcm/brcmstb/pm/Makefile   |   1 -
 drivers/soc/bcm/brcmstb/pm/aon_defs.h | 105 ----
 drivers/soc/bcm/brcmstb/pm/pm-arm.c   | 874 ----------------------------------
 drivers/soc/bcm/brcmstb/pm/s2-arm.S   |  69 ---
 drivers/soc/bcm/raspberrypi-power.c   |   1 -
 9 files changed, 6 insertions(+), 1057 deletions(-)
 delete mode 100644 drivers/soc/bcm/brcmstb/pm/aon_defs.h
 delete mode 100644 drivers/soc/bcm/brcmstb/pm/pm-arm.c
 delete mode 100644 drivers/soc/bcm/brcmstb/pm/s2-arm.S
