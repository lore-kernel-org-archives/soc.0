Return-Path: <SRS0=rU4/=ZW=gmail.com=matthias.bgg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E61BBC54EE9
	for <soc@archiver.kernel.org>; Mon, 19 Sep 2022 10:54:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CD137C433D7; Mon, 19 Sep 2022 10:54:38 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CA41FC433D6;
	Mon, 19 Sep 2022 10:54:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CA41FC433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id bq9so46906294wrb.4;
        Mon, 19 Sep 2022 03:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date;
        bh=CZ0mR94UcNRwzJdy6hZjjG35nbIA/4JhGrEA4EFuTvY=;
        b=DLCjWrOxPK2f0H+PbIL9nC2iE3mBY22Iiel1lj9cZnn1YoEQm+GUYgb23lrrFzLc34
         6S7agCUYOOeBPwINyQEiCtqbA/wvlSTE83H3tWV8svQgcoEc97hHl4TawHPlg9tV1qt4
         ZzNDmcTy5yP6Rc6/SnkxvX8WuHD+dYs8OsiC3WeivEVoTW+M28ZfdP7ErucQBcSXjKxe
         o/H8IF96QnvlAgc4fylaRtVOiyBNDvvOAyeqYLx62YBmCHuB0duIpHc0FpfnmkuIXZn1
         2Xh8xZlTSb+GRsqN1Aye5FmpBliaWQXf88eBcICfgCN+7e383GhnoiIn3usiyfHGoykE
         NpEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date;
        bh=CZ0mR94UcNRwzJdy6hZjjG35nbIA/4JhGrEA4EFuTvY=;
        b=roVOx/9ZqPAZ8dnzp/IViCUNPl1ugYqPj9nV/WnSdNzLWx1TqnG1sSZ/VOgW2+JrJu
         H9wdeH1694vUdfORe8CdeZqBqwGD6IXGVTjvKj4bIcjSlC7oQJYoZKlISlG4zxKR1A8+
         VkPbk+3b1yKviYz8JPSOUxv8qzTmfLHFAbrmGzuAct5lo0mApXmT43pz8Zzs5Cy4/R2x
         t+5v+HuqsboK09L4ZUaZttNgqHD13WXf4MeTWeCmP4YYoKvO9HLvuVfHDB8KVA6Ys0j5
         Zt7ZVTS6Zlr8oukAHmOkyafIB3HyxdEaknNyeUHSv6ylOGroDYPZA1LkThW2vSdBvAhY
         LS9A==
X-Gm-Message-State: ACrzQf0rat5a4MARw0VXef9V1Cn6xTaI2v/c0QjEUpIatbR2bVpY1dxA
	n7ZqmucYb2W1HWY0AX5DXy9hdA/vhg4=
X-Google-Smtp-Source: AMsMyM5WuGQb/dpvWM/Fp5nw736lQDHyZXjbWoCTvKziJ9HtGOMU/N7SWgQ9nPxpblcVQHg1Zwn72g==
X-Received: by 2002:a05:6000:1788:b0:22b:2ce:c6ae with SMTP id e8-20020a056000178800b0022b02cec6aemr1630868wrg.236.1663584875960;
        Mon, 19 Sep 2022 03:54:35 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id l32-20020a05600c1d2000b003a845fa1edfsm21646289wms.3.2022.09.19.03.54.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 03:54:34 -0700 (PDT)
Message-ID: <498fe3e5-a237-121a-d500-fbb0994906cb@gmail.com>
Date: Mon, 19 Sep 2022 12:54:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "allen-kh.cheng" <allen-kh.cheng@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jean Delvare <jdelvare@suse.de>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Sen Chu <sen.chu@mediatek.com>, Tinghan Shen <tinghan.shen@mediatek.com>,
 xinlei.lee@mediatek.com
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] ARM: soc: MediaTek related SoC diver updates for v6.1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Arnd and Olof,

Hopefully not too late, see below the MediaTek updates for v6.1.

The most important updates are support for the PMIC wrapper on MT8183. MT6795 
got support for the display mutex part and MT8186 for the MDP3 mutex.

Best regards,
Matthias

---

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

   Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/ 
tags/v6.0-next-soc

for you to fetch changes up to b404cb45990bf24d41c29fe856aafb0746a7b81f:

   soc: mediatek: Add mmsys func to adapt to dpi output for MT8186 (2022-09-15 
23:50:28 +0200)

----------------------------------------------------------------
pmic-wrapper:
- add support for mt8188

SVS:
- several driver cleanups

power-domain:
- several cleanups of the dt-bindings and driver

mutex:
- add support to mt6795 disp mutex
- add support for mt8186 mdp3 mutex

----------------------------------------------------------------
Allen-KH Cheng (2):
       dt-bindings: soc: mediatek: Add mdp3 mutex support for mt8186
       soc: mediatek: mutex: Add mt8186 mutex mod settings for mdp3

AngeloGioacchino Del Regno (8):
       soc: mediatek: mtk-svs: Switch to platform_get_irq()
       soc: mediatek: mtk-svs: Remove hardcoded irqflags
       soc: mediatek: mtk-svs: Drop of_match_ptr() for of_match_table
       soc: mediatek: mtk-svs: Use devm variant for dev_pm_opp_of_add_table()
       soc: mediatek: mtk-svs: Commonize t-calibration-data fuse array read
       soc: mediatek: mtk-svs: Use bitfield access macros where possible
       dt-bindings: soc: mediatek: Add display mutex support for MT6795
       soc: mediatek: mutex: Add support for MT6795 Helio X10 display mutex

Christophe JAILLET (1):
       soc: mediatek: pm-domains: Simplify some error message

Jean Delvare (1):
       soc: mediatek: Let PMIC Wrapper and SCPSYS depend on OF

Nícolas F. R. A. Prado (1):
       soc: mediatek: mtk-svs: Explicitly include bitfield header

Sen Chu (1):
       dt-bindings: soc: mediatek: pwrap: add compatible for mt8188

Tinghan Shen (3):
       dt-bindings: power: mediatek: Refine multiple level power domain nodes
       dt-bindings: power: mediatek: Support naming power controller node with 
unit address
       dt-bindings: power: mediatek: Update maintainer list

Xinlei Lee (1):
       soc: mediatek: Add mmsys func to adapt to dpi output for MT8186

  .../bindings/power/mediatek,power-controller.yaml  | 135 ++--------
  .../bindings/soc/mediatek/mediatek,mutex.yaml      |   2 +
  .../devicetree/bindings/soc/mediatek/pwrap.txt     |   1 +
  drivers/soc/mediatek/Kconfig                       |   2 +
  drivers/soc/mediatek/mt8186-mmsys.h                |   6 +
  drivers/soc/mediatek/mtk-mmsys.c                   |  20 ++
  drivers/soc/mediatek/mtk-mutex.c                   |  44 ++++
  drivers/soc/mediatek/mtk-pm-domains.c              |   6 +-
  drivers/soc/mediatek/mtk-pmic-wrap.c               |   2 +-
  drivers/soc/mediatek/mtk-scpsys.c                  |   2 +-
  drivers/soc/mediatek/mtk-svs.c                     | 284 +++++++++++++--------
  include/linux/soc/mediatek/mtk-mmsys.h             |   2 +
  include/linux/soc/mediatek/mtk-mutex.h             |   2 +
  13 files changed, 274 insertions(+), 234 deletions(-)
