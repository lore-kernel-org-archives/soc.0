Return-Path: <SRS0=0Pte=AF=gmail.com=matthias.bgg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B4FC77B6E
	for <soc@archiver.kernel.org>; Fri, 14 Apr 2023 17:01:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 59000C433EF; Fri, 14 Apr 2023 17:01:34 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0FD09C433D2;
	Fri, 14 Apr 2023 17:01:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0FD09C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id l18so18143203wrb.9;
        Fri, 14 Apr 2023 10:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681491691; x=1684083691;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tpYSQRcLoZ2NNWNhd1p0+Azk81/34fPL8j6kX4EVcck=;
        b=bCcjSgTmtygluGkiwy7ZH/Yg6HWR0r9DKq71+6NqvqyaNyOEphhiAkiGDpBAzwPhaN
         dTr6esiOR89FgDRQZnFMsUi+/pepQmeSxKUKGlBd0OIUg1yhmJXB1XUXvv5MQThF7P+C
         VKdhWZZwhdM/j4K4326XCaghhFj4meAaTgjj92PdQw9v8Xsjr+CIJmSZf0Vi2eYynABj
         cgxRjtCLjXoYKAqXCiK6F5DW7UzRBjllC0zUSZ+GcEXawPabqaPMCXHhTZ0Nu+D/y3Pg
         CyKk17+PaR0qVMytzUuW39c1DO5Cp1qTr9AWE+0GndRH2pFS0JlHMWpVYkWFNk3myGDM
         PIlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681491691; x=1684083691;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tpYSQRcLoZ2NNWNhd1p0+Azk81/34fPL8j6kX4EVcck=;
        b=e5uTHHoxGUD3qEsUVZqbjlLbmE4c+h0j48pDlpadqMqpoeJyvwvMSKR81iTsN0xLWw
         BYVGFX5qsraiIX/RyQVdWH75mxDNVUyDSiry8BiouTzI7yI8NCOEW7VW9Ww6R1Hb7eZN
         /hJD3XwU0u+j6Dq6EVOEGhH+DVihjObpkcNYV77gdBUWLJtB1T9jGPxF3TenEdMjgu3+
         BAPV3BJHdQ511lgmbkz0fowJ7AC6WzCBCZ4bm3nGd+crS08ytTEe71MrkNn88lRhv3Nr
         G4d40h8HgIdh5rrfdn4YXtJj95EE5GGJfhALtgGkjWcge1WMOc1fWZrZCwRydGKpJN1Q
         abdA==
X-Gm-Message-State: AAQBX9fhWXvZ1pZAeNBS5PD97MIlW/9WDPR46iU1mc76w6rpMb8ZRUNk
	9jdPKGQY3ZM8dgPltPOjogUKxLg+Fo/KXg==
X-Google-Smtp-Source: AKy350ZrjI0stSD4JEQTpCjrHz4ZUNwDVniU/jwdDHZurgbltaw4iFK4TqKYrpFEcd3N7ZOwacMAgw==
X-Received: by 2002:adf:e352:0:b0:2f5:a651:6bb2 with SMTP id n18-20020adfe352000000b002f5a6516bb2mr4356304wrj.15.1681491691190;
        Fri, 14 Apr 2023 10:01:31 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id j15-20020a5d564f000000b002f7780eee10sm1250868wrw.59.2023.04.14.10.01.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Apr 2023 10:01:29 -0700 (PDT)
Message-ID: <6920736b-ddb3-29df-d0b2-46db40cef49f@gmail.com>
Date: Fri, 14 Apr 2023 19:01:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Balsam CHIHI <bchihi@baylibre.com>, Fabien Parent <fparent@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Moudy Ho <moudy.ho@mediatek.com>, "Nancy.Lin" <nancy.lin@mediatek.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>,
 Xiangsheng Hou <xiangsheng.hou@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] MediaTek ARM64 DTS updates for 6.4 (resend)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

[resending as I forgot to CC the mailinglists]

Hi Olof and Arnd,

Please have a look to the 64 bit changes for MediaTek chips. We had quite some 
activity to get GPU on the different SoCs used in Chromebooks up and running.

Apart from that we got support for the MT8365 SoC and EVK. Also support the Sony 
Xperia M5 (based on MT6795) get more mature. It's nice to see how MediaTek 
upstream support is taking over other areas then 'just' Chromebooks.

Regards,
Matthias

---
The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

   Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/ 
tags/v6.3-next-dts64

for you to fetch changes up to 13961ef828cbc254cc272221b7fc54851caa39a7:

   arm64: dts: mediatek: mt6795-xperia-m5: Add Bosch BMM050 Magnetometer 
(2023-04-12 14:44:15 +0200)

----------------------------------------------------------------
mt6795
- enable frequency hopping controller (FHCTL)
- add i2c, power domains and some clocks for video enconde/decode
- Sony Xperia M5 enable touchscreen, proximity sensor, accelerometer
   and NFC

mt8173
- align keys with DT binding

mt8183
- enable GPU DVFS

mt8186
- enable GPU

mt8192
- enable GPU

mt8195
- add mutex for Video Processor Pipeline Subsystem (VPP)
- add support for Mali-G57 Valhall Natt GPU baked by panfrost
- add support for display on vdosys1
- add thermal support
- add display PWM

mt8365
- add support for the eval kit including i2c, pmic-wrapper, mmc and
   ethernet

----------------------------------------------------------------
Alexandre Bailon (1):
       arm64: dts: mediatek: Increase the size BL31 reserved memory

Alexandre Mergnat (5):
       arm64: dts: mediatek: add i2c support for mt8365 SoC
       arm64: dts: mediatek: enable i2c0 for mt8365-evk board
       arm64: dts: mediatek: add pwrap support to mt8365 SoC
       arm64: dts: mediatek: add mmc support for mt8365 SoC
       arm64: dts: mediatek: add ethernet support for mt8365 SoC

Alyssa Rosenzweig (2):
       arm64: dts: mediatek: mt8192: Add GPU nodes
       arm64: dts: mediatek: mt8192-asurada: Enable GPU

AngeloGioacchino Del Regno (31):
       arm64: dts: mediatek: mt8183-kukui: Couple VGPU and VSRAM_GPU regulators
       arm64: dts: mediatek: mt8183-kukui: Override vgpu/vsram_gpu constraints
       arm64: dts: mediatek: mt8183: Remove second opp-microvolt entries from 
gpu table
       arm64: dts: mt8183-pumpkin: Couple VGPU and VSRAM_GPU regulators
       arm64: dts: mediatek: mt8183-evb: Couple VGPU and VSRAM_GPU regulators
       arm64: dts: mediatek: mt8183: Use mediatek,mt8183b-mali as GPU compatible
       arm64: dts: mediatek: mt8192: Add mfg_ref_sel clock to MFG0 domain
       arm64: dts: mediatek: mt8192-asurada: Assign sram supply to MFG1 pd
       arm64: dts: mediatek: mt8192-asurada: Fix voltage constraint for Vgpu
       arm64: dts: mediatek: mt8192-asurada: Couple VGPU and VSRAM_OTHER regulators
       arm64: dts: mediatek: mt8195: Add mfg_core_tmp clock to MFG1 domain
       arm64: dts: mt8195: Add panfrost node for Mali-G57 Valhall Natt GPU
       arm64: dts: mediatek: mt8195-cherry: Enable Mali-G57 GPU
       arm64: dts: mediatek: mt8186: Add GPU node
       arm64: dts: mediatek: mt8183-pumpkin: Override vgpu/vsram_gpu constraints
       arm64: dts: mediatek: mt8183-evb: Override vgpu/vsram_gpu constraints
       arm64: dts: mediatek: mt8195: Add display pwm nodes
       arm64: dts: mediatek: cherry: Add configuration for display backlight
       arm64: dts: mediatek: mt6795: Add Frequency Hopping Controller node
       arm64: dts: mediatek: mt6795: Add apmixedsys syscon node
       arm64: dts: mediatek: mt6795: xperia-m5: Enable Frequency Hopping
       arm64: dts: mediatek: mt6795: Add nodes for I2C controllers
       arm64: dts: mediatek: mt6795: Add SoC power domains
       arm64: dts: mediatek: mt6795: Add VDECSYS and VENCSYS clocks
       arm64: dts: mediatek: mt6795-xperia-m5: Enable I2C 0-3 busses
       arm64: dts: mediatek: mt6795-xperia-m5: Add Synaptics RMI4 Touchscreen
       arm64: dts: mediatek: mt6795-xperia-m5: Add Sensortek STK3310 Proximity
       arm64: dts: mediatek: mt6795-xperia-m5: Add NXP PN547 NFC on I2C3
       arm64: dts: mediatek: mt6795: Add tertiary PWM node
       arm64: dts: mediatek: mt6795-xperia-m5: Add Bosch BMA255 Accelerometer
       arm64: dts: mediatek: mt6795-xperia-m5: Add Bosch BMM050 Magnetometer

Balsam CHIHI (2):
       arm64: dts: mediatek: mt8195: Add thermal zones and thermal nodes
       arm64: dts: mediatek: mt8195: Add temperature mitigation threshold

Fabien Parent (2):
       arm64: dts: mediatek: Initial mt8365-evk support
       arm64: dts: mediatek: add mt6357 device-tree

Krzysztof Kozlowski (1):
       arm64: dts: mediatek: mt8173: correct GPIO keys wakeup

Matthias Brugger (1):
       arm64: dts: mt8167: Align mmsys node name with dtschema

Moudy Ho (1):
       arm64: dts: mediatek: mt8195: add MUTEX configuration for VPPSYS

Nancy.Lin (1):
       arm64: dts: mt8195: add display node for vdosys1

Nícolas F. R. A. Prado (1):
       arm64: dts: mediatek: mt8192-asurada: Add MFG0 domain supply

Roy-CW.Yeh (1):
       arm64: dts: mediatek: mt8195: add MMSYS configuration for VPPSYS

Xiangsheng Hou (1):
       arm64: dts: mediatek: Fix existing NAND controller node name

  arch/arm64/boot/dts/mediatek/Makefile              |   1 +
  arch/arm64/boot/dts/mediatek/mt2712e.dtsi          |   2 +-
  arch/arm64/boot/dts/mediatek/mt6357.dtsi           | 282 +++++++++
  .../boot/dts/mediatek/mt6795-sony-xperia-m5.dts    | 166 ++++++
  arch/arm64/boot/dts/mediatek/mt6795.dtsi           | 182 ++++++
  arch/arm64/boot/dts/mediatek/mt7622.dtsi           |   2 +-
  arch/arm64/boot/dts/mediatek/mt8167.dtsi           |   2 +-
  arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi       |   6 +-
  arch/arm64/boot/dts/mediatek/mt8183-evb.dts        |  17 +-
  arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi     |  17 +-
  arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts    |  17 +-
  arch/arm64/boot/dts/mediatek/mt8183.dtsi           |  34 +-
  arch/arm64/boot/dts/mediatek/mt8186.dtsi           |  17 +
  arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi   |  24 +-
  arch/arm64/boot/dts/mediatek/mt8192.dtsi           | 116 +++-
  arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi    |  29 +
  arch/arm64/boot/dts/mediatek/mt8195.dtsi           | 633 ++++++++++++++++++++-
  arch/arm64/boot/dts/mediatek/mt8365-evk.dts        | 183 ++++++
  arch/arm64/boot/dts/mediatek/mt8365.dtsi           | 488 ++++++++++++++++
  19 files changed, 2181 insertions(+), 37 deletions(-)
  create mode 100644 arch/arm64/boot/dts/mediatek/mt6357.dtsi
  create mode 100644 arch/arm64/boot/dts/mediatek/mt8365-evk.dts
  create mode 100644 arch/arm64/boot/dts/mediatek/mt8365.dtsi
