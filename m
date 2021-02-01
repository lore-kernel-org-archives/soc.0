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
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4A91C433E0
	for <soc@archiver.kernel.org>; Mon,  1 Feb 2021 10:12:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5F6BB64DB2; Mon,  1 Feb 2021 10:12:30 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD9C264DF5;
	Mon,  1 Feb 2021 10:12:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD9C264DF5
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=matthias.bgg@gmail.com
Received: by mail-wr1-f53.google.com with SMTP id q7so15877447wre.13;
        Mon, 01 Feb 2021 02:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=QpxNtNbna4Scltna+Nb6lMeZ0gHBJTYgia9t/bkI6Zs=;
        b=opI0B60cn7stle5LAAHoczgTI/0TODtirP6jlFWz/0ABOCvPdBzMoU7UoIyvLywx3d
         gD5Nb9aSUwazeEhA93xs8zyQqne1acq5GGryY8VwCrqXdbfhrHJQTAv4W8fl2tid5u99
         wK4MzMbGgxD6RYThZ9iY3mYmZafJVKSNfXKhaxl4OqyW28Ghhd9wLATMWj3TRh7DaMou
         DzGgWnWInHAJ8bOm8BrZX3Eehas//UBKrcbAOHavgebciYPtasraZdzYMQ3XSlgToXcF
         upPPlTPiJRCcjyItGf9/yIWt9epbRaIXl5EmATvqJYoVe5Oe2ihYw5Eg49FgHQucoNmq
         TCyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=QpxNtNbna4Scltna+Nb6lMeZ0gHBJTYgia9t/bkI6Zs=;
        b=oiVy79Uky8ecR3QiUhVg6CYNeACuUeL8LHNMdqkPDh1kunw9kCx2eOs3yhnvTzMHV9
         9rHkV56E2oP4xk6ZGt7EWvhEK5Ca3WUXNgzqW+QylscJfp2PNsODTRpAR7JpbGTdH/Oc
         TlMYsldEhitlfbMq0okpq7VFMi0LdQMlKQCM4aEnKNsZHI1kWipVSY5LT7JSv6OLHu8p
         dQm/ERQEDqQ+9kzZXYWE3LcZRsyAWCSnBsHaiH3Nqi6xV2gsKx0U569+FGuNVNYigEdk
         XLJ7qs9DXaTUJIOO/yrHyjiRcj4sfTqMgzopv2FPYx5+vzop0A51ArwDsgWfiOr9WUIX
         HSQQ==
X-Gm-Message-State: AOAM530iVVq5ECxbnDJDC1B73S904rdk4GOS2JYubjeSZZ9+ajVXvtpI
	3boNRH6G4nH69z/3sllHBeE=
X-Google-Smtp-Source: ABdhPJxZz4ds0zipa2CrBlxfV5OmoWiYePP7VyYh3ZBX28tShz97Q6Ozhp5ECqTMej7yM6ZpUN4VbA==
X-Received: by 2002:a5d:4988:: with SMTP id r8mr17433084wrq.26.1612174348382;
        Mon, 01 Feb 2021 02:12:28 -0800 (PST)
Received: from ziggy.stardust ([213.195.126.134])
        by smtp.gmail.com with ESMTPSA id j7sm2286301wrp.72.2021.02.01.02.12.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Feb 2021 02:12:27 -0800 (PST)
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>
Cc: "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Argus Lin <argus.lin@mediatek.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Fabien Parent <fparent@baylibre.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Hsin-Yi Wang <hsinyi@chromium.org>, James Liao <jamesjj.liao@mediatek.com>,
 Neal Liu <neal.liu@mediatek.com>, Yongqiang Niu
 <yongqiang.niu@mediatek.com>, Bayi Cheng <bayi.cheng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] arm64: dts: mediatek: updates for v5.12
Message-ID: <565be0cc-460a-7d0b-47da-09bf0401e8fe@gmail.com>
Date: Mon, 1 Feb 2021 11:12:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Olof and Arnd,

Please find below the updates for the MediaTek dts64.
Lots of work is done in the MT8183 SoC which can be found in some newer
Chromebooks, especially around grafics support. Not so much is happening on the
shiny new MT8192, as we still lack some core drivers, which provide a lots of
dependencies.

Apart from that we support two new devices for the MT6779 from the mobile chip
line. One is a SoC specific device called DEVAPC. It provides a kind of bus
firewall which will pass information on potentially malicious bus accesses from
TF-A to the SoC. It had been a long journey for the driver and I'm happy that it
is now supported by the device.

On the IoT side of the chips we now have support for the APDMA controller for
the MT8516 UARTs.

Regards,
Matthias

---
The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/
tags/v5.11-next-dts64

for you to fetch changes up to 18d6e3f6744d6105ab61de790170cb60534eeebc:

  arm64: dts: mt8183: Fix GCE include path (2021-02-01 09:48:19 +0100)

----------------------------------------------------------------
mt6779:
- add DEVAPC node to detect mallicious bus accesses
- add PMIC wrapper node

mt7622:
- add reset to mmc node

mt8183:
- fix typo in drma-fifo-size property
- refine compatible for the disp-gamma
- add phandel of PM domain to the PWM node
- add second PWM node
- add regulator to MFG power domain
- enable DSI node in kukui
- add krane sku0, which uses different panel
- fix mailbox dt-bindings include path

mt8192:
- add NOR flash node
- add PSCI based CPU idle states

mt8516:
- add node for the UART's APDMA controller

----------------------------------------------------------------
Argus Lin (1):
      arm64: dts: mt6779: Support pwrap on Mediatek MT6779 platform

Enric Balletbo i Serra (1):
      arm64: dts: mt8183: Add missing power-domain for pwm0 node

Fabien Parent (3):
      arm64: dts: mediatek: mt8183: add pwm node
      arm64: dts: mediatek: mt8183-evb: add PWM support
      arm64: dts: mediatek: mt8516: add support for APDMA

Frank Wunderlich (1):
      dts64: mt7622: fix slow sd card access

Hsin-Yi Wang (4):
      arm64: dts: mediatek: mt8183: Add domain supply for mfg
      arm64: dts: mt8183: config dsi node
      arm64: dts: mt8183: Add krane-sku0 board.
      dt-bindings: arm64: dts: mediatek: Add krane sku0

James Liao (1):
      arm64: dts: mt8192: Add cpu-idle-states

Matthias Brugger (1):
      arm64: dts: mt8183: Fix GCE include path

Neal Liu (1):
      arm64: dts: mt6779: Support devapc

Yongqiang Niu (2):
      arm64: dts: mt8183: rename rdma fifo size
      arm64: dts: mt8183: refine gamma compatible name

bayi cheng (1):
      arm64: dts: mt8192: add nor_flash device node

 .../devicetree/bindings/arm/mediatek.yaml          |  4 +-
 arch/arm64/boot/dts/mediatek/Makefile              |  1 +
 arch/arm64/boot/dts/mediatek/mt6779.dtsi           | 17 +++++++
 arch/arm64/boot/dts/mediatek/mt7622.dtsi           |  2 +
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts        | 12 +++++
 .../boot/dts/mediatek/mt8183-kukui-krane-sku0.dts  | 23 +++++++++
 .../dts/mediatek/mt8183-kukui-krane-sku176.dts     |  5 ++
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi     | 46 +++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8183.dtsi           | 26 +++++++---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi           | 57 ++++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8516.dtsi           | 30 ++++++++++++
 11 files changed, 216 insertions(+), 7 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dts
