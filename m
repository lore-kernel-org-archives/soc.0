Return-Path: <SRS0=GkT/=TM=gmail.com=matthias.bgg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E720C433EF
	for <soc@archiver.kernel.org>; Tue,  1 Mar 2022 15:18:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 03958C340F0; Tue,  1 Mar 2022 15:18:36 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 14F04C340EE;
	Tue,  1 Mar 2022 15:18:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 14F04C340EE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id n14so21018687wrq.7;
        Tue, 01 Mar 2022 07:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=q1lNBTZeYALRUo1LFG/EDHt3M3gVuiU8rdIeSEZAnK8=;
        b=QjFq82lb/N8FiIPt2f1X1Vh7b2p99E/pXiHQv5JUgUuClZ30r5x3MNVdPY7Ap23oEa
         4nX/nW86vGPgtqJv61hmNSdpyXAzUHCE7tjB7mUB+1fjanfga6pJAbJ46E7wflX8xIhd
         2pJr5/nImJGpSnm1z6yIKcabzNUQY+GLUjrZlFZ+smscgB+Xca9bXyvmh1rRUvB4nXqg
         Cm8lrflnxIDwERHenXOy1GmweGVAXxf7wbIvBc57KU9+iw3TR7sbpS7k3nvRuE4wDbH/
         nc2g3/UOPfoj/mZrxbxcydmWiovxImEAWOPiwyATy6EHTX3K0emksrRk7EGtbBdWticP
         RaDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=q1lNBTZeYALRUo1LFG/EDHt3M3gVuiU8rdIeSEZAnK8=;
        b=l3tSaBSM13gFcLua7gYgnQ0rX3W/cmkeHgk/e3v1Tm8h7JAc0rXruw4Lp50vcfq6eu
         UY3uI52h1moaUgMNRUxzKkSxq75p8CsiXnLG/5gbcLXrCulKxXc0GAxkNF0bq47xzNkk
         oVM4V7Fy2pg28bXV/QFrZj0TyXRxyVKP7s0iL1vnLv8aBPFcZaUPN6OQ4kkeU3yYiy1S
         Cy+29JE34vmnI2xPQKusczDJ2Wmh+PtqQdGaJdcwuzHFPAkDxeJBqt9uMJavBAiofN9/
         el49cPrDlko6iQDxk1/LHpR7/w5iigSdz0bS5A53skotmarJHIwpZd28HIwd/6S2cZnV
         jz+w==
X-Gm-Message-State: AOAM5328BLSmuQ3z/z9wa82RmdVgrydrKMJpvUlKkhhbUGClycQQ3M9f
	szqhv0TtgF7f5lCeZgJcHpPKlRR9OgElJw==
X-Google-Smtp-Source: ABdhPJxIaMl8fbIjWm2OJ5BpAkK5oAjhYjDOuuRJQnQu0t+xOpcILWYsjteBKQ0nKznxNJHmRuEgXg==
X-Received: by 2002:a5d:598f:0:b0:1e3:649:e6c3 with SMTP id n15-20020a5d598f000000b001e30649e6c3mr20148234wri.520.1646147913166;
        Tue, 01 Mar 2022 07:18:33 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id b10-20020a5d550a000000b001e30e81afd1sm13975979wrv.2.2022.03.01.07.18.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Mar 2022 07:18:32 -0800 (PST)
Message-ID: <9e568f1b-ea49-23a3-6b36-9538d5cef33a@gmail.com>
Date: Tue, 1 Mar 2022 16:18:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [GIT PULL] soc: mediatek: updates for v5.18
Content-Language: en-US
From: Matthias Brugger <matthias.bgg@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
References: <16a53482-5a8c-e95e-8cd4-b8304f110987@gmail.com>
 <b6cd9478-7493-3f8b-144d-9f38b3ec6bdc@gmail.com>
In-Reply-To: <b6cd9478-7493-3f8b-144d-9f38b3ec6bdc@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Arnd and Olof,

Please find below the new pull request for MediaTek SoC drivers for v5.18.
In the previous version of this pull request I missed on patch to the mmsys 
which broke compilation. /o\

This is now fixed, so please take the following changes into account.

Regards,
Matthias

---
The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

   Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/ 
tags/v5.17-next-soc

for you to fetch changes up to 45c9e9a608aa11c0e6644fbaa4257e864dfc8c51:

   dt-bindings: arm: mediatek: mmsys: add support for MT8186 (2022-03-01 
16:09:53 +0100)

----------------------------------------------------------------
- add power domains support for mt8195
- disable ACP on mt8192

mt8186:
- add support for power domains
- add mmsys and mutex support needed for DRM
- add reset control based on mmsys subsystem
- add pmic wrapper

----------------------------------------------------------------
Alyssa Rosenzweig (1):
       soc: mediatek: mtk-infracfg: Disable ACP on MT8192

Chun-Jie Chen (7):
       dt-bindings: power: Add MT8195 power domains
       soc: mediatek: pm-domains: Add wakeup capacity support in power domain
       soc: mediatek: pm-domains: Remove unused macro
       soc: mediatek: pm-domains: Move power status offset to power domain data
       soc: mediatek: pm-domains: Add support for mt8195
       dt-bindings: power: Add MT8186 power domains
       soc: mediatek: pm-domains: Add support for mt8186

Johnson Wang (2):
       soc: mediatek: pwrap: add pwrap driver for MT8186 SoC
       dt-bindings: mediatek: add compatible for MT8186 pwrap

Rex-BC Chen (3):
       soc: mediatek: mmsys: add sw0_rst_offset in mmsys driver data
       soc: mediatek: mmsys: add mmsys reset control for MT8186
       dt-bindings: arm: mediatek: mmsys: add support for MT8186

Yongqiang Niu (2):
       soc: mediatek: mmsys: add mt8186 mmsys routing table
       soc: mediatek: add MTK mutex support for MT8186

  .../bindings/arm/mediatek/mediatek,mmsys.yaml      |   1 +
  .../bindings/power/mediatek,power-controller.yaml  |   3 +
  .../devicetree/bindings/soc/mediatek/pwrap.txt     |   1 +
  drivers/soc/mediatek/mt8167-pm-domains.h           |  16 +-
  drivers/soc/mediatek/mt8173-pm-domains.h           |  22 +-
  drivers/soc/mediatek/mt8183-mmsys.h                |   2 +
  drivers/soc/mediatek/mt8183-pm-domains.h           |  32 +-
  drivers/soc/mediatek/mt8186-mmsys.h                | 115 ++++
  drivers/soc/mediatek/mt8186-pm-domains.h           | 344 ++++++++++++
  drivers/soc/mediatek/mt8192-pm-domains.h           |  44 +-
  drivers/soc/mediatek/mt8195-pm-domains.h           | 613 +++++++++++++++++++++
  drivers/soc/mediatek/mtk-infracfg.c                |  19 +
  drivers/soc/mediatek/mtk-mmsys.c                   |  18 +-
  drivers/soc/mediatek/mtk-mmsys.h                   |   3 +-
  drivers/soc/mediatek/mtk-mutex.c                   |  45 ++
  drivers/soc/mediatek/mtk-pm-domains.c              |  17 +-
  drivers/soc/mediatek/mtk-pm-domains.h              |   8 +-
  drivers/soc/mediatek/mtk-pmic-wrap.c               |  71 +++
  include/dt-bindings/power/mt8186-power.h           |  32 ++
  include/dt-bindings/power/mt8195-power.h           |  46 ++
  include/linux/soc/mediatek/infracfg.h              | 133 +++++
  21 files changed, 1566 insertions(+), 19 deletions(-)
  create mode 100644 drivers/soc/mediatek/mt8186-mmsys.h
  create mode 100644 drivers/soc/mediatek/mt8186-pm-domains.h
  create mode 100644 drivers/soc/mediatek/mt8195-pm-domains.h
  create mode 100644 include/dt-bindings/power/mt8186-power.h
  create mode 100644 include/dt-bindings/power/mt8195-power.h
