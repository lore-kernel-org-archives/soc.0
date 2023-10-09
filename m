Return-Path: <SRS0=fsjQ=FX=gmail.com=matthias.bgg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A715E95A8E
	for <soc@archiver.kernel.org>; Mon,  9 Oct 2023 10:35:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 53BCAC433C9; Mon,  9 Oct 2023 10:35:00 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4E6B7C433C8;
	Mon,  9 Oct 2023 10:34:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4E6B7C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-99357737980so762357066b.2;
        Mon, 09 Oct 2023 03:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696847697; x=1697452497; darn=kernel.org;
        h=content-transfer-encoding:subject:cc:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9YUkzYC9b2rzdqnb8rIk9Q53PP7Dw9g4wRmdWVmjnTs=;
        b=K7qtZcaN7Qqtt98cvgODFVYukSYLRoa4VB0XD7Y4/dzdaWdSabsudM2fPWLUe+t7UX
         NkjWv9W96va9ZX+fSciHa25rSHPityLBTudBXA4+gwvwZEt+FchwxlYEDPdZQ3qogOa2
         MGhcZPSo6atgnxTyV5W34bcVCfQ8B03p1Ub2twQcN4Alvn4eDBHJmfdSgtUDjQLuTFyF
         ouqqPnbdxapvR0hHS9sOh3H8N6dxMi5+c7o5HkShj4jrMpM8LC72axwgRQ7VaaObXjEQ
         A91NNhO6WNUW7/IsHHMh7j6aYBZxeR+nuxj3Gz8gcjeXSExoPw6s/VA1CQy2tsvM97mD
         a4Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696847697; x=1697452497;
        h=content-transfer-encoding:subject:cc:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9YUkzYC9b2rzdqnb8rIk9Q53PP7Dw9g4wRmdWVmjnTs=;
        b=Mlgzj9m7Z4LZ2bUbi2kb2u6POLm5YzyUboI/xFjTYNe/pOJKdAzJ9HArTDFTFbiHCm
         PopfK2IPWkUAUduqSyiW1zXX22OVHAT9feW8oqaLzq4m5WxQgmxU1l8e5t6lyp0Cz2Nj
         /66Y/mar9uNBevZLq7NgIUox6hCsbmxIAkVkYCLpkv+e9fDxCAUP5QQOySKBAPBYOCL0
         Oxmn2E9Dwes2IJqG+Y4GhTUgzlykj8gbRuUHTx3rxquq/FA28P8yo6I2YnxoncmvZSTY
         jNmQjnGereCi74KY1mdmXVr+g5wNZPttxqnHouOyCZ9OCAuDlKN2BAEU7UwHt23Dbyex
         AO7w==
X-Gm-Message-State: AOJu0Yww2qXRYqVpB7Bl7RAXfcc5b+EvmYDUx8D567ofamEiNyVMPDGN
	ON0Caq6GlRtpXap48/bF9JX5thq5eks=
X-Google-Smtp-Source: AGHT+IGhKD+tXQcKdNKjbY6RRzyK2L8mvDla0H42TWnRcIxtPBO5ZpdJqMO1b1fI2w0jBfTUxDURvw==
X-Received: by 2002:a17:906:1097:b0:9b2:b786:5e9c with SMTP id u23-20020a170906109700b009b2b7865e9cmr13153248eju.28.1696847697183;
        Mon, 09 Oct 2023 03:34:57 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.161.188])
        by smtp.gmail.com with ESMTPSA id a6-20020a1709062b0600b009ae57888718sm6484722ejg.207.2023.10.09.03.34.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 03:34:56 -0700 (PDT)
Message-ID: <7a877ad9-481f-bad8-5cad-5d013c6cd70d@gmail.com>
Date: Mon, 9 Oct 2023 12:34:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US, ca-ES, es-ES
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Mergnat <amergnat@baylibre.com>, Chen-Yu Tsai <wens@csie.org>,
 Macpaul Lin <macpaul.lin@mediatek.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Subject: [GIT PULL] arm64: dts: mediatek: Updates for v6.7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Arnd and Olof,

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
The following changes since commit 8a749fd1a8720d4619c91c8b6e7528c0a355c0aa:

   Linux 6.6-rc4 (2023-10-01 14:15:13 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/ 
tags/v6.6-next-dts64

for you to fetch changes up to 252d6a178ee3df2984194b3579851b00cbe8cdbd:

   arm64: dts: mediatek: cherry: Configure eDP and internal display (2023-10-06 
11:10:18 +0200)

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

Macpaul Lin (2):
       dt-bindings: arm64: mediatek: add mt8395-evk board
       arm64: dts: mediatek: add device-tree for Genio 1200 EVK board

Nícolas F. R. A. Prado (5):
       dt-bindings: arm64: dts: mediatek: Add rev5-sku2 of hayato
       dt-bindings: arm64: dts: mediatek: Add rev4 of spherion
       arm64: dts: mediatek: Remove asurada-audio dtsi files
       arm64: dts: mediatek: Add hayato-rev5-sku2
       arm64: dts: mediatek: Add spherion-rev4

  .../devicetree/bindings/arm/mediatek.yaml          |  16 +
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
  16 files changed, 1749 insertions(+), 69 deletions(-)
  delete mode 100644 
arch/arm64/boot/dts/mediatek/mt8192-asurada-audio-rt1015p-rt5682.dtsi
  delete mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-audio-rt1015p.dtsi
  delete mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-audio-rt5682.dtsi
  create mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dts
  create mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dts
  create mode 100644 arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
