Return-Path: <SRS0=vtH0=HD=gmail.com=matthias.bgg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F2AAC433E0
	for <soc@archiver.kernel.org>; Mon,  1 Feb 2021 09:54:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3F2EE64EA6; Mon,  1 Feb 2021 09:54:03 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2B4464EAC;
	Mon,  1 Feb 2021 09:54:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2B4464EAC
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=matthias.bgg@gmail.com
Received: by mail-wr1-f52.google.com with SMTP id s7so12852595wru.5;
        Mon, 01 Feb 2021 01:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=d30/WqC5Sr8iUYYqfq19zQKJNZP17PGn+43sKEWUOrs=;
        b=pAJu87KNgZ/rko5hpxYAYXP6pIDxuv7dayJ4dxt8Cy0jqob30WTeRO39Oq2nt9cQpZ
         5VGDieD5mSuCkUclZu79RiBTVYfr/7WqqlnLmQEJvFFpG2EAF376UGosWKyFX1vqg9BF
         FlcZDYMnlw2KDhl8huT17Bj0rIllIlkSynRkPdOAPC1yhocCVGLiwCBtA4XyFXlfPIi+
         +IRHk/kDGXJagQFTcwGT1i7/2Ll+Tog9qT769Gwxyvlx5LV4YZhp+2umDfVaNLzY/pQG
         /5/ywA1kyxG0aiN517UmvN4prhDNrHxpuZ9qZz8pLdL8bkNe1ORtZnRWdhba1TFmyUIw
         7byA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=d30/WqC5Sr8iUYYqfq19zQKJNZP17PGn+43sKEWUOrs=;
        b=VC55loBbmIzXqQeAle7SqA+7Fx/JSLzi2MixTtyf3S8t3OfJmjKZ553Xtyz2efvSyj
         yxNUx618o3f+2n+cnSJE9gS4AQ44UwPsgWz8VBRaBpcxILsY/iL+Bt4NwxCY6gLPa8Lc
         AJc8elUC9Fx9BoSpXvFLS8sMcHn5cOZOq0BihUaG65cPqSBmbkS5ce/g+4sD4r/hfft8
         nWFnLhAxLN8hAhG0jNvv5HVmguIMwCp2J2gXTtEL8yJvWmiocCdIEEQ7QCXvEiDny+BW
         h+vNWOfbdsNk/0OWzC8TQ3z4hXb1DKJ0sHtLmDLmRy6rxROn2NnAnsuuSX//sKm1ZzKR
         t9ew==
X-Gm-Message-State: AOAM530Azj+blE98z0L66hs2W/ST+Dop8B1AVf41XfkNU/QMLaHsg2rs
	7fb8Jm8e9JtMTSC0aLjyfwE=
X-Google-Smtp-Source: ABdhPJzx6z8Sox35xoBAgnXigMReq9/U391Zebk6MofU2hDdrRQ1+NkEbHV3m69ux9L1udtsw1L50w==
X-Received: by 2002:a5d:4574:: with SMTP id a20mr16892144wrc.201.1612173241221;
        Mon, 01 Feb 2021 01:54:01 -0800 (PST)
Received: from ziggy.stardust ([213.195.126.134])
        by smtp.gmail.com with ESMTPSA id t17sm9190627wmi.46.2021.02.01.01.54.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Feb 2021 01:54:00 -0800 (PST)
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Fabien Parent <fparent@baylibre.com>, Hsin-Yi Wang <hsinyi@chromium.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] soc: mediatek: updates for v5.12
Message-ID: <5faa52c2-0ddb-b809-7444-ce6f6ff6d8ad@gmail.com>
Date: Mon, 1 Feb 2021 10:53:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Arnd and Olof,

Please find below the updates for the mediatek SoC drivers. The most outstanding
thing is, that we now support also the MT8167 power domains.

Regards,
Matthias

---
The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/
tags/v5.11-next-soc

for you to fetch changes up to dd65030295e20338bbb8238454c2e9546b6e5e17:

  soc: mediatek: pm-domains: Don't print an error if child domain is deferred
(2021-01-31 15:59:16 +0100)

----------------------------------------------------------------
pm-domains:
- add support for MT8167
- add support for regulator needed by a PM domain
- make error message in deferred probe case better

cmdq-helper:
- remove arch specific flush function, use mailbox rx_callback instead

----------------------------------------------------------------
Chun-Kuang Hu (1):
      soc: mediatek: cmdq: Remove cmdq_pkt_flush()

Enric Balletbo i Serra (1):
      soc: mediatek: pm-domains: Don't print an error if child domain is deferred

Fabien Parent (2):
      dt-bindings: power: Add MT8167 power domains
      soc: mediatek: pm-domains: Add support for mt8167

Hsin-Yi Wang (2):
      dt-bindings: power: Add domain regulator supply
      soc: mediatek: pm-domains: Add domain regulator supply

 .../bindings/power/mediatek,power-controller.yaml  | 11 +++
 drivers/soc/mediatek/mt8167-pm-domains.h           | 86 ++++++++++++++++++++++
 drivers/soc/mediatek/mt8183-pm-domains.h           |  1 +
 drivers/soc/mediatek/mtk-cmdq-helper.c             | 32 --------
 drivers/soc/mediatek/mtk-pm-domains.c              | 51 ++++++++++++-
 drivers/soc/mediatek/mtk-pm-domains.h              |  2 +
 include/dt-bindings/power/mt8167-power.h           | 17 +++++
 include/linux/soc/mediatek/infracfg.h              |  8 ++
 include/linux/soc/mediatek/mtk-cmdq.h              | 12 ---
 9 files changed, 173 insertions(+), 47 deletions(-)
 create mode 100644 drivers/soc/mediatek/mt8167-pm-domains.h
 create mode 100644 include/dt-bindings/power/mt8167-power.h
