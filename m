Return-Path: <SRS0=hXuc=NA=gmail.com=matthias.bgg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE91BC4338F
	for <soc@archiver.kernel.org>; Mon,  9 Aug 2021 12:20:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8685E60EBC; Mon,  9 Aug 2021 12:20:14 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55BE760F35;
	Mon,  9 Aug 2021 12:20:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 55BE760F35
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id b11so5004024wrx.6;
        Mon, 09 Aug 2021 05:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=1/Vf6khXnMrxkAMIT2n3x/n+5pDItmvi3VuJWN3SJoc=;
        b=Aag/zScHv2Uw7pewKl5p/Tli0gqoxQqe4OsnKmuW9smx2rAGXO8CCeVCjXblDpmYJt
         nMVMMEwf6CRvU5T6qjOsvKV3PjdWRTDWl/YSuUUQ0uK4kL0mTLXDhJwKVk0M2AC9p07M
         hQx073MNXcWmtA65uuLSP/ZHbJm07BPgW2gDCfjtIN7Arn+qOHwIsZVb+pOdUfbZC9ce
         4i2M/l4ahpImfqkLqnIZq4ry9gpv/HzB0ip+M2XrjEqv1VaYMTbk+la49hZFR4zqb+od
         HL07drGAh7X7m3YGkwO75Tcl5RIeGRTdKRxiGY+/xRz7uNATiUhpb1TvraMcc+Cop8YL
         h+mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=1/Vf6khXnMrxkAMIT2n3x/n+5pDItmvi3VuJWN3SJoc=;
        b=FpF5BIOMIQ7G2ONwZgwk7qse+lCeRp8NHU7hX1s0leJ6cjRdz++P8aH7uK4quZftvd
         sdo9i9IfASMmpt1GfN1QE/cQysjyMzJGVd9Bj/BeEl8DjCpRHkH3HQSuzBGBsWV2w3eb
         8qEo8tTywZwRS9A+DbnDdd4ALhZwnDFQ79mjZ3cfIGBxwmBinq9vRu8DJw5QVwFoSS5O
         N++mw2ObO4dVr/6e0rj1Kk2bbMB27h3xJh5rz9NnyQhQYd60Kgv4AuzKgDqDmF8enS2E
         Du3jrPZf7cNys5AYlwB4fAdm2wmzBaAHrU7CNPR8efixeX9viAUy3wCeUhqhUK6dGyOb
         BIJQ==
X-Gm-Message-State: AOAM531P1Z88/4s1x1IvGg/Dhsf1U9lHahvAA2xFvpD523zMa26UKOGt
	okXIntCGuV3VssbPjIqpcG9Mf7o0unepMQ==
X-Google-Smtp-Source: ABdhPJyeQrS6U506drqM/mRWodOZkXMDuZnGOitClStMmWat9pBhcNXm2avMXsszjMO1sMPL+MwuWA==
X-Received: by 2002:a5d:44cb:: with SMTP id z11mr25066859wrr.100.1628511613037;
        Mon, 09 Aug 2021 05:20:13 -0700 (PDT)
Received: from ziggy.stardust (static-55-132-6-89.ipcom.comunitel.net. [89.6.132.55])
        by smtp.gmail.com with ESMTPSA id j4sm17427937wmi.4.2021.08.09.05.20.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Aug 2021 05:20:12 -0700 (PDT)
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>
Cc: "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Bilal Wasim
 <bilalwasim676@gmail.com>, Hsin-Yi Wang <hsinyi@chromium.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] arm64: dts updates for v5.15
Message-ID: <26c4026a-9f26-d5a3-c30f-439120a4eaa0@gmail.com>
Date: Mon, 9 Aug 2021 14:20:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Arnd and Olof,

Please have a look for the arm64 DTS updates. This time we only have smaller
changes for existing boards, but no new HW. But don't worry, probably for v5.16
we will see some new SoCs.

Regards,
Matthias

---
The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/
tags/v5.14-next-dts64

for you to fetch changes up to ce5db043d2e8811f30de3ebb5d9e6bd8a33596c4:

  dt-bindings: mediatek: Add optional mediatek,gce-events property (2021-08-05
17:37:54 +0200)

----------------------------------------------------------------
MT8173:
- Add regulator for MFG_ASYNC power domain
- Use alias for MMC to get fixed numbers

MT8183:
- Use alia for MMC to get fixed numbers
- Add optional event number for Global Comman Engine

----------------------------------------------------------------
Bilal Wasim (1):
      arm64: dts: mediatek: mt8173: Add domain supply for mfg_async

Hsin-Yi Wang (4):
      arm64: dts: mt8183: kukui: Use aliases to mmc nodes
      arm64: dts: mt8173: elm: Use aliases to mmc nodes
      arm64: dts: mt8183: add mediatek,gce-events in mutex
      dt-bindings: mediatek: Add optional mediatek,gce-events property

 Documentation/devicetree/bindings/mailbox/mtk-gce.txt | 15 +++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi          | 10 ++++++++++
 arch/arm64/boot/dts/mediatek/mt8173-evb.dts           |  4 ++++
 arch/arm64/boot/dts/mediatek/mt8173.dtsi              |  2 +-
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi        |  2 ++
 arch/arm64/boot/dts/mediatek/mt8183.dtsi              |  2 ++
 6 files changed, 34 insertions(+), 1 deletion(-)
