Return-Path: <SRS0=ALrW=FD=gmail.com=matthias.bgg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55BA4C3E8C5
	for <soc@archiver.kernel.org>; Sun, 29 Nov 2020 21:22:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id F0E6320829; Sun, 29 Nov 2020 21:22:25 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 695402078D;
	Sun, 29 Nov 2020 21:22:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hKr1UKx0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 695402078D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=matthias.bgg@gmail.com
Received: by mail-ej1-f43.google.com with SMTP id s13so1775416ejr.1;
        Sun, 29 Nov 2020 13:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=8zPXm1FBDR9qfVumeaUOjP3wuQsBIpEAySwImCtGpPc=;
        b=hKr1UKx0pDGx7PEAKapmxdpIOuF2VjB1mXd8MGEMMRIiGtzYAE6nFsiF1BfySdyhEC
         Ur2OuyrAghYdfNvDuTAkcz5yfvgVdYob8+pgIO/nVjWpiC8KY0xUYf8gcNE5fVBhxu36
         yN6szorqQHIgYCA2qV1Cbc01Nqm+I8F6AFSmcoUFARbiXdY7oIrHXzA811OHViAoUYLf
         ys+ysh4t42DKS9ebj1xYv5tWZjf4k8bokJXamj9TlfmYrTRBPBOctAOLMSog57IuXj2W
         Fz34D9ewvbEKTslczDOaWo82Ut1RJDBf70a4jd23jlMAqnnTeWR+5gTcS6kVVogFob/b
         wbrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=8zPXm1FBDR9qfVumeaUOjP3wuQsBIpEAySwImCtGpPc=;
        b=bjm1Mn14DgpLaP42urZDYNFhLZs/hkYt1uHnN4EBmflagZNJnSqn2Y8YO6eeNsixNW
         dxsmtNyRvy2LDdoQzalHDj2WE+Dnj3F4FvdMn1b+PoqBsjsi2gHLl6P6VPlpnCr3c3Bo
         1tw6Ob0kbh/lMuRM26kDHbkEU8ODqc5fBnCbfxtChdTiSyJdHYJLPjpCZkHGigKz12Iu
         V6Y/BM6xS6rRM2uBw918EsGvtrNRmUiYsjTs+Gj6mSjs5xTGZsku+GlBXeAMFqF3lIho
         tJc3gI9t5ZyXbCQfLPyNq4EI8WAj2Uxc7VWw7fXX5SFiOAsCh2WyV2MeOxRKCr864itx
         VzKg==
X-Gm-Message-State: AOAM531PvY78s8pTCM2cvB3LKCr1eH6LrJz0OL44Hj0Itz0vjIEjHY5y
	tdFXDMaVtioe9PpTFwJ5ej0uDORbaLFxig==
X-Google-Smtp-Source: ABdhPJzevcx/WzHeFiw1cNVO5mrWErqDpdFenCCaJuFtBmfR2FpmE6dpM9+NTHxiR3b2EerILyZfaw==
X-Received: by 2002:a17:906:3899:: with SMTP id q25mr2796412ejd.173.1606684943998;
        Sun, 29 Nov 2020 13:22:23 -0800 (PST)
Received: from ziggy.stardust ([213.195.126.134])
        by smtp.gmail.com with ESMTPSA id z29sm8169733edi.1.2020.11.29.13.22.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Nov 2020 13:22:23 -0800 (PST)
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Neal Liu <neal.liu@mediatek.com>, Nicolas Boichat <drinkcat@chromium.org>,
 Weiyi Lu <weiyi.lu@mediatek.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] soc: mediatek: changes for v5.11
Message-ID: <b03fe343-e183-c6f3-f2dc-4c58aae3146b@gmail.com>
Date: Sun, 29 Nov 2020 22:22:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Olof and Arnd,

Please find below the commit for the MediaTek SoC drivers. The most important 
changes are the inclusion of two new drivers. Devapc is an TrustZone interface 
found on the mobile phone chips to identify malicious accesses from bus 
controllers. Apart from that you can find a new power domain driver. We have the 
old scpsys driver for quite some time around, But it has some limitations, that 
we could only overcome with a brand new driver with a new binding. Right now 
these new driver supports mt8192 and mt8183 but the plan is, to move all SoCs to 
the new driver model and later on retire the old driver.

Please beware that I had to create a stable branch to share some include files 
for the driver between the dts64 and this branch.

Regards,
Matthias

---

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/ 
tags/v5.10-next-soc

for you to fetch changes up to cc6576029aedc79ce87b9fcb22cbd396d47f2852:

   soc: mediatek: mmsys: Use devm_platform_ioremap_resource() (2020-11-28 
00:37:12 +0100)

----------------------------------------------------------------
power-domains:
- add support for new power domain driver.
- add support for mt8183 and mt8192

devapc:
- add support for the devapc device found on mt6779 to identify of
   malicious bus accesses from a controller to a device

mmsys:
- move DDP routing IDs into the driver

cmdq:
- drop timeout handler support as not usefull

scpsys:
- print warning on theoretical error

----------------------------------------------------------------
Chun-Kuang Hu (1):
       soc / drm: mediatek: cmdq: Remove timeout handler in helper function

Enric Balletbo i Serra (5):
       mfd: syscon: Add syscon_regmap_lookup_by_phandle_optional() function.
       dt-bindings: power: Add bindings for the Mediatek SCPSYS power domains 
controller
       dt-bindings: power: Add MT8183 power domains
       soc: mediatek: Add MediaTek SCPSYS power domains
       soc: mediatek: mmsys: Use devm_platform_ioremap_resource()

Matthias Brugger (10):
       MAINTAINERS: change mediatek wiki page
       Merge tag 'ib-mfd-mediatek-v5.11' into HEAD
       Merge tag 'v5.10-next-pm-domains-stable' into HEAD
       soc: mediatek: pm-domains: Add bus protection protocol
       soc: mediatek: pm_domains: Make bus protection generic
       soc: mediatek: pm-domains: Add SMI block as bus protection block
       soc: mediatek: pm-domains: Add extra sram control
       soc: mediatek: pm-domains: Add subsystem clocks
       soc: mediatek: pm-domains: Allow bus protection to ignore clear ack
       soc: mediatek: pm-domains: Add support for mt8183

Neal Liu (2):
       dt-bindings: devapc: add bindings for mtk-devapc
       soc: mediatek: add mt6779 devapc driver

Nicolas Boichat (1):
       soc: mediatek: Check if power domains can be powered on at boot time

Weiyi Lu (3):
       dt-bindings: power: Add MT8192 power domains
       soc: mediatek: pm-domains: Add default power off flag
       soc: mediatek: pm-domains: Add support for mt8192

Yongqiang Niu (1):
       soc / drm: mediatek: Move DDP component defines into mtk-mmsys.h

  .../bindings/power/mediatek,power-controller.yaml  | 293 ++++++++++
  .../devicetree/bindings/soc/mediatek/devapc.yaml   |  58 ++
  MAINTAINERS                                        |   2 +-
  drivers/gpu/drm/mediatek/mtk_drm_crtc.c            |   3 +-
  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h        |  34 +-
  drivers/mfd/syscon.c                               |  18 +
  drivers/soc/mediatek/Kconfig                       |  21 +
  drivers/soc/mediatek/Makefile                      |   2 +
  drivers/soc/mediatek/mt8173-pm-domains.h           |  94 ++++
  drivers/soc/mediatek/mt8183-pm-domains.h           | 221 ++++++++
  drivers/soc/mediatek/mt8192-pm-domains.h           | 292 ++++++++++
  drivers/soc/mediatek/mtk-cmdq-helper.c             |  41 +-
  drivers/soc/mediatek/mtk-devapc.c                  | 308 +++++++++++
  drivers/soc/mediatek/mtk-infracfg.c                |   5 -
  drivers/soc/mediatek/mtk-mmsys.c                   |  11 +-
  drivers/soc/mediatek/mtk-pm-domains.c              | 614 +++++++++++++++++++++
  drivers/soc/mediatek/mtk-pm-domains.h              | 102 ++++
  drivers/soc/mediatek/mtk-scpsys.c                  |   5 +-
  include/dt-bindings/power/mt8183-power.h           |  26 +
  include/dt-bindings/power/mt8192-power.h           |  32 ++
  include/linux/mfd/syscon.h                         |  11 +
  include/linux/soc/mediatek/infracfg.h              | 107 ++++
  include/linux/soc/mediatek/mtk-cmdq.h              |  10 +-
  include/linux/soc/mediatek/mtk-mmsys.h             |  33 ++
  24 files changed, 2243 insertions(+), 100 deletions(-)
  create mode 100644 
Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
  create mode 100644 Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
  create mode 100644 drivers/soc/mediatek/mt8173-pm-domains.h
  create mode 100644 drivers/soc/mediatek/mt8183-pm-domains.h
  create mode 100644 drivers/soc/mediatek/mt8192-pm-domains.h
  create mode 100644 drivers/soc/mediatek/mtk-devapc.c
  create mode 100644 drivers/soc/mediatek/mtk-pm-domains.c
  create mode 100644 drivers/soc/mediatek/mtk-pm-domains.h
  create mode 100644 include/dt-bindings/power/mt8183-power.h
  create mode 100644 include/dt-bindings/power/mt8192-power.h
