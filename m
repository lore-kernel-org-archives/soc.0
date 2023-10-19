Return-Path: <SRS0=NQ9O=GB=gmail.com=matthias.bgg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 015CBCDB465
	for <soc@archiver.kernel.org>; Thu, 19 Oct 2023 11:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DE26AC433CB; Thu, 19 Oct 2023 11:30:30 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BAAACC433C9;
	Thu, 19 Oct 2023 11:30:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BAAACC433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-9c3aec5f326so144896566b.1;
        Thu, 19 Oct 2023 04:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697715028; x=1698319828; darn=kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4++QhAQg+/03UfB843ypMKyW5Q/oDjHNpsI6P/rHtMI=;
        b=S8qDjAt+5MZNh/m7SMnXW8eiCx+t/t3faV9Q8A8Q40OCH5LkTwLTFMQ2Kc/3Mposzx
         x1Rem2c91cnA1v1A6cu502sIC93ijFGGxeOkfvsUau2AAQiaAXsV5fYtro/Uar4c8LZ+
         55Coq8A25BR9NvHvP0rkB1o6HJJcNhEZ/14y1Bunb3lp8FBtGBNhBAgko5Jn/RJyCQgr
         heWFohh7bbzFq/rv04eWtzfz/JlfmSr8W42U9R0/Q+Nb5Jv/GM3/71r3K1BoZSdMm3br
         TnQUndhBwyCCIHqedk7XVsLuXfgCo1KRxrTdB5K06n0eLv8Tjd39fFIFa9iqnAW2pszq
         CVAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697715028; x=1698319828;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4++QhAQg+/03UfB843ypMKyW5Q/oDjHNpsI6P/rHtMI=;
        b=XqI1rialXkmjI9Ml1FK0n0/pe9AXvgLqEW3KNdK16BWIHXgqP3K8uWdmZnRJRyDeWQ
         rJ3OTNY7cij6VmElEpWKhN7VdNKEj5Ra6jHpSWy6/qC/SRIeglbwm0dZvSFDCqgNLJHy
         XIrFFbdR1UtzEu+m4awgIUtg3vni7PUfq+Op8HgvBW++DJc6xsxpK1CqGIcvL8owhcoH
         HOvTUfVedRi2YqEI6pukd2o6ea7g4Na5n+QjFQu2aRSo1r0MRzuvad3xE1T4/DO1QTtv
         OFr8JkzjoH7rjSvow3xHnkNKF5pUd07j/PZNcBzKk5o/MeF2jzJw1NG6sz4Aaa1u91vZ
         0LEg==
X-Gm-Message-State: AOJu0YwemitH8rrSk3NfinLQUmrZS3ItvhiLxnrLupQke8HkE9bIwuxd
	pp3KBs9e/wtcCubYpNh0gg/d/qzVb+Q=
X-Google-Smtp-Source: AGHT+IH6lhh5H3ucq4FquoRuYGX+x5ITg3xc8/1C3phGxtzbyl4dEsKYA3TdDq0W3AWO0eGmIOw8+A==
X-Received: by 2002:a17:907:2d12:b0:9ae:577b:3832 with SMTP id gs18-20020a1709072d1200b009ae577b3832mr1713173ejc.24.1697715027955;
        Thu, 19 Oct 2023 04:30:27 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.161.188])
        by smtp.gmail.com with ESMTPSA id oz4-20020a170906cd0400b009c751e41ebasm2645285ejb.141.2023.10.19.04.30.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Oct 2023 04:30:26 -0700 (PDT)
Message-ID: <298f159c-f80d-3ba8-fde9-b11b59e5a58e@gmail.com>
Date: Thu, 19 Oct 2023 13:30:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US, ca-ES, es-ES
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Mergnat <amergnat@baylibre.com>, Chen-Yu Tsai <wens@csie.org>,
 Macpaul Lin <macpaul.lin@mediatek.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] arm64: dts: mediatek: Updates for v6.7 - third try
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Arnd and Olof,

This is the third try to send you a pull request that meets all requirements. 
Sorry for the mess in this round.

Please find below a few patches for the 64 bit DTS files targeted for v6.7.

The patches were picked up with the help from Angelo.
With these changes we have now support for the Genio 1200 EVK board for IoT 
applications. Also the MT8365 from the same business line has much more support 
of peripherals.
Also support for the new 4th revision of the Acer Chromebook 514 was added. The 
difference with older board is the audio codec used.
On the Mobile phone side of things, support for the Helio X10, which is used by 
the Sony Xperia M5 got support for the display.

Happy merging,
Matthias

---
The following changes since commit 6465e260f48790807eef06b583b38ca9789b6072:

   Linux 6.6-rc3 (2023-09-24 14:31:13 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/ 
tags/v6.6-next-dts64.3

for you to fetch changes up to 4055758a80395cb6d40fa26361e39bcc6f924651:

   Merge remote-tracking branch 'ulfh/genpd_dt' into v6.6-next/dts64.3 
(2023-10-18 09:52:47 +0200)

----------------------------------------------------------------
MediaTek ARM64 DTS updates for v6.7

- Add support for SMI/IOMMU/LARBs, power domains and multimedia
   related subsystems for the MT8365 SoC
- Add support for MediaTek Genio 1200 IoT evaluation board
- Add support for newer revisions of MT8192 Chromebooks
- Add support for internal eDP display on MT8195 Cherry Chromebooks
- Add display and display backlight support for the Helio X10 SoC and
   for the Sony Xperia M5 smartphone

----------------------------------------------------------------
Alexandre Mergnat (7):
       arm64: dts: mediatek: add mmsys support for mt8365 SoC
       arm64: dts: mediatek: add camsys support for mt8365 SoC
       arm64: dts: mediatek: add apu support for mt8365 SoC
       arm64: dts: mediatek: add power domain support for mt8365 SoC
       arm64: dts: mediatek: add smi support for mt8365 SoC
       arm64: dts: mediatek: add larb support for mt8365 SoC
       arm64: dts: mediatek: add iommu support for mt8365 SoC

AngeloGioacchino Del Regno (4):
       arm64: dts: mediatek: mt6795: Add support for display blocks and DPI/DSI
       arm64: dts: mediatek: mt6795-xperia-m5: Add display backlight support
       arm64: dts: mediatek: mt6795-xperia-m5: Add DSI Display and its vregs
       arm64: dts: mediatek: cherry: Configure eDP and internal display

Chen-Yu Tsai (1):
       arm64: dts: mediatek: mt8183-kukui: Add PMIC regulator supplies

Danila Tikhonov (1):
       dt-bindings: power: qcom,rpmpd: Add SM7150

Fabien Parent (1):
       dt-bindings: power: Add MT8365 power domains

Macpaul Lin (2):
       dt-bindings: arm64: mediatek: add mt8395-evk board
       arm64: dts: mediatek: add device-tree for Genio 1200 EVK board

Matthias Brugger (1):
       Merge remote-tracking branch 'ulfh/genpd_dt' into v6.6-next/dts64.3

Nícolas F. R. A. Prado (5):
       dt-bindings: arm64: dts: mediatek: Add rev5-sku2 of hayato
       dt-bindings: arm64: dts: mediatek: Add rev4 of spherion
       arm64: dts: mediatek: Remove asurada-audio dtsi files
       arm64: dts: mediatek: Add hayato-rev5-sku2
       arm64: dts: mediatek: Add spherion-rev4

xianwei.zhao (1):
       dt-bindings: power: add Amlogic T7 power domains

  .../devicetree/bindings/arm/mediatek.yaml          |  16 +
  .../bindings/power/amlogic,meson-sec-pwrc.yaml     |   3 +-
  .../bindings/power/mediatek,power-controller.yaml  |   6 +
  .../devicetree/bindings/power/qcom,rpmpd.yaml      |   1 +
  arch/arm64/boot/dts/mediatek/Makefile              |   3 +
  .../boot/dts/mediatek/mt6795-sony-xperia-m5.dts    | 101 +++
  arch/arm64/boot/dts/mediatek/mt6795.dtsi           | 253 +++++-
  arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi     |  28 +
  .../mt8192-asurada-audio-rt1015p-rt5682.dtsi       |  19 -
  .../dts/mediatek/mt8192-asurada-audio-rt1015p.dtsi |  26 -
  .../dts/mediatek/mt8192-asurada-audio-rt5682.dtsi  |  21 -
  .../boot/dts/mediatek/mt8192-asurada-hayato-r1.dts |  19 +-
  .../dts/mediatek/mt8192-asurada-hayato-r5-sku2.dts |  64 ++
  .../dts/mediatek/mt8192-asurada-spherion-r0.dts    |  19 +-
  .../dts/mediatek/mt8192-asurada-spherion-r4.dts    |  77 ++
  arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi   |  28 +
  arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi    |  33 +
  arch/arm64/boot/dts/mediatek/mt8365.dtsi           | 210 +++++
  .../boot/dts/mediatek/mt8395-genio-1200-evk.dts    | 901 +++++++++++++++++++++
  include/dt-bindings/power/amlogic,t7-pwrc.h        |  63 ++
  include/dt-bindings/power/mediatek,mt8365-power.h  |  19 +
  21 files changed, 1840 insertions(+), 70 deletions(-)
  delete mode 100644 
arch/arm64/boot/dts/mediatek/mt8192-asurada-audio-rt1015p-rt5682.dtsi
  delete mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-audio-rt1015p.dtsi
  delete mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-audio-rt5682.dtsi
  create mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dts
  create mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dts
  create mode 100644 arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
  create mode 100644 include/dt-bindings/power/amlogic,t7-pwrc.h
  create mode 100644 include/dt-bindings/power/mediatek,mt8365-power.h
