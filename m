Return-Path: <SRS0=OxWk=3V=gmail.com=matthias.bgg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17F5DC433FE
	for <soc@archiver.kernel.org>; Mon, 21 Nov 2022 18:41:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D29D4C43145; Mon, 21 Nov 2022 18:41:22 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C9E73C433D6;
	Mon, 21 Nov 2022 18:41:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C9E73C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 84-20020a1c0257000000b003cfe48519a6so7208934wmc.0;
        Mon, 21 Nov 2022 10:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D490D0JZjZZBSCRXGD1ZT2ILibnfjFk5In0W7vg80co=;
        b=B99duKO75tej602Ya3gRRC/93VTK8692SIujBlOZBESz6kOqjegM2KN7wLv5E4QLZi
         iC06t0CDHRcfOiVYke183n9CtHDufC8XPgPStOp873bU/RTIulRD/7ozjJ1rb8PSKt1w
         7Tpb6WeRB+x+827JWbF9OsLA80CTzQz2Kth7U/oJzoWt8R6kFmr7FoSgKuwldH/4V+aA
         AA/tr07W9IrSEFL5P9lYfkj1z3XoSrRr6FxLruj0qhOOSRv6vtkbVFawH2M1zX2qsy36
         b7QAcTUZJ6xlySQSg9tUu7PWFpofqW4A77qIt8We2oduLVO9jSO8IqjEBmOH2Uz2G5KD
         dc8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=D490D0JZjZZBSCRXGD1ZT2ILibnfjFk5In0W7vg80co=;
        b=gzJ6O4h+rmteyDe3oH7LSgC/gcIB/Cz6SdTqdnK2xC4JLYUHIhS49mu6lNfgZ1+oEU
         y55yB0++1u9ifhLi3wn71Hr9Mhj/yvrsJQ5WtHlCy3KW/ZasGNqCoOMRQZwrjQElViNt
         QR3fb8zR0zGBLNKEK0pkgvEdQMG4/cXkQhU9pdvrLYUs8FYZGs358Y+qHTFITiOUcUon
         zCd5Tkl8B90mF31hAgHjm4s58VvINhnyz+U/595crGmgS06EN8COWj58YpHma/Ytj0+b
         6RUUY0vEwRw9+mpVn4OiZMDeWcqCd+HZP7xVvlqJgoASJnrH6T+TtSIABCuAepFNFhbE
         m6PQ==
X-Gm-Message-State: ANoB5pksUhoFHmi1znpwqqACpdQtC/o/jCH4xOYB81CxW9iMZRaT4jig
	fG57faH0jwcxnQekGeQqiWUFIMau4jk=
X-Google-Smtp-Source: AA0mqf6RzPJysA+UpcRDSFesEUNAvwSPepHv9+Gfs/mXsh3vTqiTeLQq5eT1dWrep1/wIYbrl0cgpg==
X-Received: by 2002:a05:600c:19d1:b0:3cf:ca1a:332a with SMTP id u17-20020a05600c19d100b003cfca1a332amr17523442wmq.118.1669056079784;
        Mon, 21 Nov 2022 10:41:19 -0800 (PST)
Received: from [192.168.1.131] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id n1-20020a5d6b81000000b00226dba960b4sm11975714wrx.3.2022.11.21.10.41.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 10:41:18 -0800 (PST)
Message-ID: <cc756001-a942-90b0-b79d-62c1fc189828@gmail.com>
Date: Mon, 21 Nov 2022 19:41:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>
Cc: "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "jason-jh.lin" <jason-jh.lin@mediatek.com>,
 =?UTF-8?B?WGlubGVpIExlZSAo5p2O5piV56OKKQ==?= <xinlei.lee@mediatek.com>,
 Fadwa CHIBY <fchiby@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] soc: mediatek: updates for v6.2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Arnd and Olof,

Please have a look on the latest patches for the SoC divers.

Best regards,
Matthias

---

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

   Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/ 
tags/v6.1-next-soc

for you to fetch changes up to 7fd731a8264346bbcaed7d47058533a4de686219:

   soc: mediatek: Add deprecated compatible to mmsys (2022-11-21 19:25:34 +0100)

----------------------------------------------------------------
mmsys:
- add support for MT8186
- add correct compatible solution for vdosys[0,1] on MT8195

pmic wrapper:
- add support for MT8365

----------------------------------------------------------------
Fabien Parent (3):
       dt-bindings: soc: mediatek: pwrap: add MT8365 SoC bindings
       soc: mediatek: pwrap: add support for sys & tmr clocks
       soc: mediatek: pwrap: add mt8365 SoC support

Jason-JH.Lin (3):
       dt-bindings: arm: mediatek: mmsys: change compatible for MT8195
       Revert "soc: mediatek: add mtk-mmsys support for mt8195 vdosys0"
       soc: mediatek: add mtk-mmsys support for mt8195 vdosys0

Matthias Brugger (1):
       soc: mediatek: Add deprecated compatible to mmsys

Xinlei Lee (1):
       soc: mediatek: Add all settings to mtk_mmsys_ddp_dpi_fmt_config func

  .../bindings/arm/mediatek/mediatek,mmsys.yaml      |  14 +-
  .../devicetree/bindings/soc/mediatek/pwrap.txt     |   3 +
  drivers/soc/mediatek/mt8186-mmsys.h                |   8 +-
  drivers/soc/mediatek/mtk-mmsys.c                   | 176 +++++----------------
  drivers/soc/mediatek/mtk-mmsys.h                   |   6 -
  drivers/soc/mediatek/mtk-pmic-wrap.c               | 114 ++++++++++++-
  include/linux/soc/mediatek/mtk-mmsys.h             |   7 +
  7 files changed, 176 insertions(+), 152 deletions(-)
