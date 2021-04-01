Return-Path: <SRS0=+Tl1=I6=gmail.com=matthias.bgg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA001C433B4
	for <soc@archiver.kernel.org>; Thu,  1 Apr 2021 14:19:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 931F361359; Thu,  1 Apr 2021 14:19:49 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20D4961356;
	Thu,  1 Apr 2021 14:19:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20D4961356
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=matthias.bgg@gmail.com
Received: by mail-ej1-f50.google.com with SMTP id u21so3108232ejo.13;
        Thu, 01 Apr 2021 07:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=mn+zAEfgfvZOPxyZ5lSaKbrrkB5QqVeA9D0gp624xhM=;
        b=oKPwlmnXhSKou2CFeMozxerGBzoLUUiHzspIx48KKx01gSQzGdnABjqfq2auaIWnV9
         b3h0Um/jk92NuC7yPu0lWT+GdmQVT5oxXy8xuLKAg1eWdHYt4R+56DWwijfMwvA0TEli
         ObEdx4Ig4A3SzjE7Wu3gEy4IQuaitPQr077A01JiGz5a0xuh/nXXIA0bUX90S9aKFd17
         qBtdCbJlQD2bkECQe2whOM/QitsNTBDffeUDAeIHHTiTFsZT+4oVMp2G48h7Itqqsljz
         rAqpLUr8DBW364D7KKzlO5Hv42zThrPa5phGytJ2NsmcZ+Pmbri8YCp4iHdgiEapjztL
         lj0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=mn+zAEfgfvZOPxyZ5lSaKbrrkB5QqVeA9D0gp624xhM=;
        b=KspQL5YjpJuCypU8Fjxs+slxlQR6NWh8ZK2mJ7hKCuxIN0AyXxVl/hvl41uNyhzmDR
         u0ufrBQBUAMh2xxnJdT1yj7g2hJlJhfpowLRxq7RtAsSSFh7a+nvtaHIMuK5F6VfM8Bc
         hgBHZ+ANgE8WqaBAYfITwnD11YL6ySpQmKwHmC5ETMGK6rD2FYJb/NCamoRhZVjg5Dew
         /2vaxVTX2274uPwR9GuVP5RrfE1fi/vcfCUunAdSUjIhpapmKt+fulGwXlP6xOeSN0bs
         kLx1RbRUCjc9wYa6ZqNQRpKAQlSLAQ1NFRwMFYKYe2amF1mXjUtxMtMd6oxRu21YoC5t
         hNEg==
X-Gm-Message-State: AOAM530WGgHFETUS4qDGK7gSteQWG8BfYhOZ6Nv2G5aWBTXXFTQEM/Zw
	vPCHTjzig5LqBNPuRy2kg4A=
X-Google-Smtp-Source: ABdhPJzq7fC7fowvOWX05Xwy8o65MMSUt9l/0HJoJywwksfcE1zr8cu5t1bWELd63DqCqS5y+MXolw==
X-Received: by 2002:a17:907:94cc:: with SMTP id dn12mr9422447ejc.177.1617286787716;
        Thu, 01 Apr 2021 07:19:47 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
        by smtp.gmail.com with ESMTPSA id i10sm2826660ejv.106.2021.04.01.07.19.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Apr 2021 07:19:47 -0700 (PDT)
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
Cc: "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, CK HU <ck.hu@mediatek.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Wei Yongjun <weiyongjun1@huawei.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] soc: mediatek: changes for v5.13
Message-ID: <c47d4bdd-9e05-c0de-bacb-3a262fed936d@gmail.com>
Date: Thu, 1 Apr 2021 16:19:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Arnd and Olof,

Below you can find the changes for the SoC drivers. After we fixed in the last
round the power management domain driver. This time it is the MMSYS driver. Up
to now it held one big table with routing information for all SoCs. But that's
not practical over time, so that was splitten up to add only per SoC structures.
That should make it easier in the future to add support for new SoCs. At least
one series didn't hit mainline this time, but should be ready for the next round.

Please take the patches into account for your pull request.

Regards,
Matthias

---

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/
tags/v5.12-next-soc

for you to fetch changes up to 60d93f64a851d276b23b7ef68ddc638258485d32:

  soc: mediatek: pm-domains: Add a power domain names for mt8167 (2021-04-01
11:36:04 +0200)

----------------------------------------------------------------
- add MT8183 support to mutex driver

MMSYS:
- use per SoC array to describe the possible routing
- add support for MT8183

Power management domains:
- fix the case of a domain fails to get added
- add names for each power domain to make debugging easier

PMIC wrapper:
- add support for PMIC wrapper with integrated arbiter
- add support for MT8192/MT6873

----------------------------------------------------------------
CK Hu (2):
      soc: mediatek: mmsys: Create struct mtk_mmsys to store context data
      soc: mediatek: mmsys: Use an array for setting the routing registers

Enric Balletbo i Serra (5):
      soc: mediatek: pm-domains: Fix missing error code in scpsys_add_subdomain()
      soc: mediatek: pm-domains: Add a meaningful power domain name
      soc: mediatek: pm-domains: Add a power domain names for mt8183
      soc: mediatek: pm-domains: Add a power domain names for mt8192
      soc: mediatek: pm-domains: Add a power domain names for mt8167

Hsin-Hsiung Wang (4):
      soc: mediatek: pwrap: use BIT() macro
      soc: mediatek: pwrap: add arbiter capability
      dt-bindings: mediatek: add compatible for MT6873/8192 pwrap
      soc: mediatek: pwrap: add pwrap driver for MT6873/8192 SoCs

Hsin-Yi Wang (1):
      soc: mediatek: mmsys: Add mt8183 mmsys routing table

Wei Yongjun (1):
      soc: mediatek: Make symbol 'mtk_mutex_driver' static

Yongqiang Niu (1):
      soc: mediatek: add mtk mutex support for MT8183

 .../devicetree/bindings/soc/mediatek/pwrap.txt     |   1 +
 drivers/soc/mediatek/mt8167-pm-domains.h           |   7 +
 drivers/soc/mediatek/mt8173-pm-domains.h           |  10 +
 drivers/soc/mediatek/mt8183-mmsys.h                |  54 ++++
 drivers/soc/mediatek/mt8183-pm-domains.h           |  15 +
 drivers/soc/mediatek/mt8192-pm-domains.h           |  21 ++
 drivers/soc/mediatek/mtk-mmsys.c                   | 303 +++------------------
 drivers/soc/mediatek/mtk-mmsys.h                   | 215 +++++++++++++++
 drivers/soc/mediatek/mtk-mutex.c                   |  52 +++-
 drivers/soc/mediatek/mtk-pm-domains.c              |  11 +-
 drivers/soc/mediatek/mtk-pm-domains.h              |   2 +
 drivers/soc/mediatek/mtk-pmic-wrap.c               |  97 ++++++-
 12 files changed, 511 insertions(+), 277 deletions(-)
 create mode 100644 drivers/soc/mediatek/mt8183-mmsys.h
 create mode 100644 drivers/soc/mediatek/mtk-mmsys.h
