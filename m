Return-Path: <SRS0=AhuM=O7=gmail.com=matthias.bgg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EECCC433FE
	for <soc@archiver.kernel.org>; Mon, 11 Oct 2021 09:58:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 330E060F24; Mon, 11 Oct 2021 09:58:37 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A38D60F21;
	Mon, 11 Oct 2021 09:58:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0A38D60F21
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id r7so54293303wrc.10;
        Mon, 11 Oct 2021 02:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:cc:from
         :subject:content-transfer-encoding;
        bh=Xa9rPx05yj1VCchMuuz19wy7IZ4LhseyGnS4cNvXPFs=;
        b=Ir+iZu4kzQQGAXLmK5QyQ26h4BYKHc3+xrm3m9r8M9OMVJD7Y254kG0s0T5JEjb4su
         HNz/d+w5jLLCDPs3sLuoiZTRbmwn/+GMgwdVw2eGehGVonX/kvvGk4h2IT3n2QlxlpJ9
         Zr4LuPuRn3LzNFMEWfHC/zASmr3kj3UbproBJyuOlvyhZjpzIpDPXY3HyXZAnT3lT0na
         2KucHPBBtFVuiLnWkxYgCHdZ54pdV9ElWb00cNhPAF5Zjdvk1S2A7qthPekGsEPJMgb3
         10pA0LQbOMKP6jtJxz2n+OzVhBX4j/ZJ6rCMHTeYmlmsodFmftG7xgvoY2Ol2N81QBzX
         JoOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:from:subject:content-transfer-encoding;
        bh=Xa9rPx05yj1VCchMuuz19wy7IZ4LhseyGnS4cNvXPFs=;
        b=fQOAxrsu50dU70NJBzlVywXp6JMx2hr3bfLhzj6CiKpMuJEGuomklCIO9+20/7WUSY
         6RJxtve1ICFukTEr7j6pyCUF9C8n4cZGcshQCzXvAPUhFM6RhFgUg1hhoSYr5+F1jnY9
         2f2E23SE58Xw14ycBPiVURV+Zr5n6kFIE/r1iDsHOewe/VY/tIR2ZWQZU/0Y3qtqmAHE
         sYX9yLm5ELHoNkwrzUuEj5llySiNhvqOsJeSn4rHs2JnCblIFScUcAyjIclOzsIyqz8M
         KphVE/U/yQzn6IRJFvm4ztLAcaw5zVYK3DH8nhl83adpydG/JBEjxauuLZTGNZumY66r
         bBqA==
X-Gm-Message-State: AOAM531ssfEE6sDq+LOm0tUFjoJHZizUvTyNi3iRg3ZQcic79EBSymja
	zLBg7ydWZNMiMMu5YZNVZnmHi/9lRFhVeA==
X-Google-Smtp-Source: ABdhPJx0A8P3e3MkR+yzpT9LZPd1lUkkokvGg7bb/J8FmaPKsnhdf7c1sODT+TT+0yJlOK2sSD6BmQ==
X-Received: by 2002:a05:600c:8a4:: with SMTP id l36mr19923223wmp.17.1633946315480;
        Mon, 11 Oct 2021 02:58:35 -0700 (PDT)
Received: from ?IPV6:2620:113:80c0:8000:c::779? (nat0.nue.suse.com. [2001:67c:2178:4000::1111])
        by smtp.gmail.com with ESMTPSA id e8sm10349784wrg.48.2021.10.11.02.58.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Oct 2021 02:58:35 -0700 (PDT)
Message-ID: <1a3d63a3-c020-3319-26f6-a2ec338cc42e@gmail.com>
Date: Mon, 11 Oct 2021 11:58:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>
Cc: "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 Chuanjia Liu <chuanjia.liu@mediatek.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Kansho Nishida <kansho@chromium.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] arm64: dts64: mediatek updates for v5.16
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Arnd and Olof,

Here come the latest updates for arm64 DTS cahgnes.
Biggest change is, that we have now support for a reset controller inside the 
mmsys. This goes inhand with changes to the driver, that you will find in the 
soc pull request.

Please have a look.

Regards,
Matthias

---

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/ 
tags/v5.15-next-dts64

for you to fetch changes up to 4bdb00edbd2ae354471f8d37d976a864bf29b60f:

   arm64: dts: mt8183: Add the mmsys reset bit to reset the dsi0 (2021-10-08 
15:11:14 +0200)

----------------------------------------------------------------
- mt8173: add reset for dsi0 to mmsys
- move dt-bindings reset controller includes to correct folder
- split PCIe node to use new format for mt2712 and mt7622
- mt8183: add audio node to chromebook devices
- mt8192: add clock controller node

----------------------------------------------------------------
Chuanjia Liu (1):
       arm64: dts: mediatek: Split PCIe node for MT2712 and MT7622

Chun-Jie Chen (1):
       arm64: dts: mediatek: Add mt8192 clock controllers

Enric Balletbo i Serra (5):
       arm64: dts: mediatek: Move reset controller constants into common location
       dt-bindings: mediatek: Add #reset-cells to mmsys system controller
       dt-bindings: display: mediatek: add dsi reset optional property
       arm64: dts: mt8173: Add the mmsys reset bit to reset the dsi0
       arm64: dts: mt8183: Add the mmsys reset bit to reset the dsi0

Kansho Nishida (2):
       arm64: dts: mt8183: add audio node
       arm64: dts: mt8183: add kukui platform audio node

  .../bindings/arm/mediatek/mediatek,mmsys.yaml      |   4 +
  .../bindings/display/mediatek/mediatek,dsi.txt     |   6 +
  arch/arm64/boot/dts/mediatek/mt2712e.dtsi          |  97 ++++++------
  arch/arm64/boot/dts/mediatek/mt6358.dtsi           |   1 +
  .../boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts  |  16 +-
  arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts       |   6 +-
  arch/arm64/boot/dts/mediatek/mt7622.dtsi           | 112 +++++++-------
  arch/arm64/boot/dts/mediatek/mt8173.dtsi           |   2 +
  .../mt8183-kukui-audio-da7219-max98357a.dtsi       |  13 ++
  .../mt8183-kukui-audio-da7219-rt1015p.dtsi         |  13 ++
  .../dts/mediatek/mt8183-kukui-audio-da7219.dtsi    |  54 +++++++
  .../dts/mediatek/mt8183-kukui-audio-max98357a.dtsi |  13 ++
  .../dts/mediatek/mt8183-kukui-audio-rt1015p.dtsi   |  13 ++
  .../mt8183-kukui-audio-ts3a227e-max98357a.dtsi     |  13 ++
  .../mt8183-kukui-audio-ts3a227e-rt1015p.dtsi       |  13 ++
  .../dts/mediatek/mt8183-kukui-audio-ts3a227e.dtsi  |  32 ++++
  .../dts/mediatek/mt8183-kukui-jacuzzi-burnet.dts   |   1 +
  .../dts/mediatek/mt8183-kukui-jacuzzi-damu.dts     |   1 +
  .../dts/mediatek/mt8183-kukui-jacuzzi-fennel.dtsi  |   1 +
  .../mt8183-kukui-jacuzzi-juniper-sku16.dts         |   1 +
  .../dts/mediatek/mt8183-kukui-jacuzzi-kappa.dts    |   1 +
  .../dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dts    |   1 +
  .../mediatek/mt8183-kukui-jacuzzi-willow-sku0.dts  |   1 +
  .../mediatek/mt8183-kukui-jacuzzi-willow-sku1.dts  |   1 +
  .../boot/dts/mediatek/mt8183-kukui-kakadu.dts      |   1 +
  .../boot/dts/mediatek/mt8183-kukui-kodama.dtsi     |   1 +
  .../boot/dts/mediatek/mt8183-kukui-krane.dtsi      |   5 +
  arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi     |  67 ++++++++-
  arch/arm64/boot/dts/mediatek/mt8183.dtsi           |  99 ++++++++++++-
  arch/arm64/boot/dts/mediatek/mt8192.dtsi           | 163 +++++++++++++++++++++
  drivers/watchdog/mtk_wdt.c                         |   6 +-
  .../{reset-controller => reset}/mt2712-resets.h    |   0
  include/dt-bindings/reset/mt8173-resets.h          |   2 +
  .../{reset-controller => reset}/mt8183-resets.h    |   3 +
  .../{reset-controller => reset}/mt8192-resets.h    |   0
  35 files changed, 640 insertions(+), 123 deletions(-)
  create mode 100644 
arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-da7219-max98357a.dtsi
  create mode 100644 
arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-da7219-rt1015p.dtsi
  create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-da7219.dtsi
  create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-max98357a.dtsi
  create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-rt1015p.dtsi
  create mode 100644 
arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-ts3a227e-max98357a.dtsi
  create mode 100644 
arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-ts3a227e-rt1015p.dtsi
  create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-ts3a227e.dtsi
  rename include/dt-bindings/{reset-controller => reset}/mt2712-resets.h (100%)
  rename include/dt-bindings/{reset-controller => reset}/mt8183-resets.h (98%)
  rename include/dt-bindings/{reset-controller => reset}/mt8192-resets.h (100%)
