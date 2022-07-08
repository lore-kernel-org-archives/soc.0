Return-Path: <SRS0=gyIo=XN=gmail.com=matthias.bgg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16ED4C433EF
	for <soc@archiver.kernel.org>; Fri,  8 Jul 2022 17:44:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D24CBC341CB; Fri,  8 Jul 2022 17:44:22 +0000 (UTC)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A5EA1C341C0;
	Fri,  8 Jul 2022 17:44:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A5EA1C341C0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f51.google.com with SMTP id k15so20369166iok.5;
        Fri, 08 Jul 2022 10:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:cc:from
         :subject:content-transfer-encoding;
        bh=e2a2aakg7asa60Ly4AzOQRlmXuf/4HcVNE3nrON0SwM=;
        b=def6ylCrLuBld63nifteRPIl8oykXVA8e7nXHdvkgfU7s3UzJCOYlRphh4dCbmJVdD
         XYw6kYker1fdHkL8RjtLnNQvk/uaMpGTfxUtFuiW1mYAqKwRi5fDbOuqEC66ZzILvtqQ
         VJSSYdz7ZpVBdtsUS1R9IEMOT1Mh203Pn7E/PEzPaRs6Cp7wm9rEiaBbgUlaZZDYm5aM
         s71lvcMZgHH+LmV7s46fhIPkdY8vYBI/Ysi2aBAcxjH/qO0cKrJ004YA91Lx6tAAggfa
         ZCBzdRzU/7wFgQ05Hm6xyqd2RL5i3mJuo3qDPGJRYAfpIdYZpoRYrP+yfzIj1B6avtS0
         AFOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:from:subject:content-transfer-encoding;
        bh=e2a2aakg7asa60Ly4AzOQRlmXuf/4HcVNE3nrON0SwM=;
        b=jgzHXOnvDA3289S+a8ewDG7L6Pb8nsXuqorbasoR6TmHK339K+GZaq9eP9hnk6elQK
         BcL2VD2kcl+G3k+wSxd+V2h5BkCU0iO/grs4VAhTkrvcxj98A7LVwqg0Nqld3RXIVehP
         0IwT82tHYS0RbLa7MD7pPbQL22w6MVf5k5J+QFBiJuHnZQqs6Mvb1mdxe0TgyJcUaBep
         Ph+bldNGbdUELxSdn02o4QULglT0stLv/sm1WXp9gjAel5CNKtsP56iyXs7wGTndjKFS
         d32WbBPjhQkPB8fcV+dGrENGyfda6WqGMAl7XLUHhJ4hzxfCr3KPyrAgg40qNzL1jcuy
         zKqQ==
X-Gm-Message-State: AJIora/1RM5+brVYQEnP/0T1uirdqCqU5H/BaMVVllwWRw7LA0D/ThU+
	jGFomkEUt99hYC8vlQh8J4hekkSuhyN0JQ==
X-Google-Smtp-Source: AGRyM1uoK7cdGMilJtRZRpvpdOI96D3J2uskMsBvTVk6lGgtZtDTYdys2fdowfIOFeVC2UEyRlDyqg==
X-Received: by 2002:a05:6638:3801:b0:33c:8edf:215 with SMTP id i1-20020a056638380100b0033c8edf0215mr2679887jav.227.1657302260590;
        Fri, 08 Jul 2022 10:44:20 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id p17-20020a92d691000000b002dc3bcad8f0sm2543353iln.60.2022.07.08.10.44.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Jul 2022 10:44:19 -0700 (PDT)
Message-ID: <b0d5b584-2693-73b3-79f6-3e2292f006ea@gmail.com>
Date: Fri, 8 Jul 2022 19:44:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 "allen-kh.cheng" <allen-kh.cheng@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Fabio Estevam
 <festevam@gmail.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Moudy Ho <moudy.ho@mediatek.com>,
 Nick Hainke <vincent@systemli.org>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, Roger Lu <roger.lu@mediatek.com>,
 Xiangsheng Hou <xiangsheng.hou@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] arm64: dts: MediaTek updates for v5.20
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Olof and Arnd,

Please have a look on the updates for 64 bit MediaTek boards.

We have some good news here. We have gained support for Acer Chromebook 514 
(MT8192) and Acer Chromebook Spin 513 (MT8195). Support is not complete, but 
things progress. Apart from that there is still updates to the MT8183 based 
boards and a few for MT8173.

Another highlight is Angelos great work on the older MT6795, which got a few new 
nodes in this release. I want to mention that there are many more drivers in the 
pipeline, which I hope will get part of v5.21.

Regarding MT8186, we have quite a few driver in the pipeline, but the DTS wasn't 
ready to be merged, so for now we only have the compatible definition and 
hopefully real support will also come in v5.21.

Regards,
Matthias

---
The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

   Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/ 
tags/v5.19-next-dts64

for you to fetch changes up to 9c61051561b02dc3c0974f8f883f986c62517bc3:

   arm64: dts: mt8183: Add panel rotation (2022-07-07 16:52:49 +0200)

----------------------------------------------------------------
Some fixes to follow DT spec.

MT6795:
- Big update of supported devices: cpu-map, L2 cache, PMU, watchdog,
   MediaTek timer, Arm CCI, pincontroller

MT7622:
- Change WPS button to active low

MT8173:
- Add infracfg property to the IOMMU node (also for mt2712e)
- Add optional AXI clock to NOR Flash node

MT8183:
- add Medaitek CCI support
- add support for Smart Voltag Scaling (SVS)
- add GCE support to mutex
- Add panel default rotation to some chromebooks
- Add power supply to power domain so that SRAM for the GPU has power

MT8186:
- compatible added, DTS not yet ready.

MT8192:
- Add support for Acer Chromebook 514

MT8195:
- Add efuse node
- Enable USB wakeup support
- Add support for Acer Chromebook Spin 513

----------------------------------------------------------------
Allen-KH Cheng (2):
       dt-bindings: arm: mediatek: Add mt8186 pericfg compatible
       dt-bindings: arm: Add compatible for MediaTek MT8186

AngeloGioacchino Del Regno (24):
       arm64: dts: mediatek: mt8173: Add mediatek,infracfg phandle for IOMMU
       arm64: dts: mediatek: mt2712e: Add mediatek, infracfg phandle for IOMMU
       arm64: dts: mediatek: mt6795: Create soc bus node and move mmio devices
       arm64: dts: mediatek: mt6795: Add cpu-map and L2 cache
       arm64: dts: mediatek: mt6795: Add Cortex A53 PMU nodes
       arm64: dts: mediatek: mt6795: Add watchdog node to avoid timeouts
       arm64: dts: mediatek: mt6795: Add fixed clocks for 32kHz and 26MHz XOs
       arm64: dts: mediatek: mt6795: Remove incorrect fixed-clocks
       arm64: dts: mediatek: mt6795: Add general purpose timer node
       arm64: dts: mediatek: mt6795: Add ARM CCI-400 node and assign to CPUs
       arm64: dts: mediatek: mt6795: Add pinctrl controller node
       arm64: dts: mediatek: mt6795: Specify interrupts for vGIC
       arm64: dts: mediatek: mt8183-kukui: Assign sram supply to mfg_async pd
       dt-bindings: arm: mediatek: Add MT8195 Cherry Tomato Chromebooks
       arm64: dts: mediatek: Introduce MT8195 Cherry platform's Tomato
       arm64: dts: mediatek: cherry: Add platform regulators layout and config
       arm64: dts: mediatek: cherry: Assign interrupt line to MT6359 PMIC
       arm64: dts: mediatek: cherry: Add support for internal eMMC storage
       arm64: dts: mediatek: cherry: Document gpios and add default pin config
       arm64: dts: mediatek: cherry: Enable I2C and SPI controllers
       arm64: dts: mediatek: cherry: Enable T-PHYs and USB XHCI controllers
       arm64: dts: mediatek: cherry: Enable MT6360 sub-pmic on I2C7
       arm64: dts: mediatek: cherry: Enable support for the SPI NOR flash
       arm64: dts: mediatek: cherry: Add I2C-HID touchscreen on I2C4

Chunfeng Yun (4):
       arm64: dts: mediatek: mt8195: add efuse node and cells
       arm64: dts: mediatek: mt8195: enable usb remote wakeup
       arm64: dts: mediatek: mt8192: fix dtbs check warning of efuse
       arm64: dts: mediatek: mt8183: change efuse node name

Fabio Estevam (1):
       arm64: dts: mediatek: Replace 'enable-sdio-wakeup'

Hsin-Yi Wang (1):
       arm64: dts: mt8183: Add panel rotation

Krzysztof Kozlowski (4):
       arm64: dts: mediatek: adjust whitespace around '='
       arm64: dts: mediatek: align gpio-key node names with dtschema
       arm64: dts: mediatek: mt7622-bananapi-bpi-r64: align led node names with 
dtschema
       arm64: dts: mediatek: mt7622-rfb1: remove wrong gpio-keys property

Moudy Ho (1):
       arm64: dts: mt8183: add GCE client property for Mediatek MUTEX

Nick Hainke (1):
       arm64: dts: mt7622: fix BPI-R64 WPS button

Nícolas F. R. A. Prado (21):
       arm64: dts: mt8192: Fix idle-states nodes naming scheme
       arm64: dts: mt8192: Fix idle-states entry-method
       dt-bindings: arm64: dts: mediatek: Add mt8192-asurada-spherion
       dt-bindings: arm64: dts: mediatek: Add mt8192-asurada-hayato
       arm64: dts: mediatek: Introduce MT8192-based Asurada board family
       arm64: dts: mediatek: asurada: Document GPIO names
       arm64: dts: mediatek: asurada: Add system-wide power supplies
       arm64: dts: mediatek: asurada: Enable and configure I2C and SPI busses
       arm64: dts: mediatek: asurada: Add ChromeOS EC
       arm64: dts: mediatek: asurada: Add keyboard mapping for the top row
       arm64: dts: mediatek: asurada: Add Cr50 TPM
       arm64: dts: mediatek: asurada: Add Elan eKTH3000 I2C trackpad
       arm64: dts: mediatek: asurada: Add I2C touchscreen
       arm64: dts: mediatek: spherion: Add keyboard backlight
       arm64: dts: mediatek: asurada: Enable XHCI
       arm64: dts: mediatek: asurada: Enable PCIe and add WiFi
       arm64: dts: mediatek: asurada: Add MT6359 PMIC
       arm64: dts: mediatek: asurada: Add SPMI regulators
       arm64: dts: mediatek: asurada: Enable MMC
       arm64: dts: mediatek: asurada: Enable SCP
       arm64: dts: mediatek: asurada: Add SPI NOR flash memory

Rex-BC Chen (5):
       arm64: dts: mediatek: Add opp table and clock property for MT8183 cpufreq
       arm64: dts: mediatek: Add MediaTek CCI node for MT8183
       arm64: dts: mediatek: Add mediatek,cci property for MT8183 cpufreq
       arm64: dts: mediatek: Add infra #reset-cells property for MT8192
       arm64: dts: mediatek: Add infra #reset-cells property for MT8195

Roger Lu (1):
       arm64: dts: mt8183: add svs device information

Xiangsheng Hou (1):
       arm64: dts: mt8173: Fix nor_flash node

  .../devicetree/bindings/arm/mediatek.yaml          |  30 +
  .../bindings/arm/mediatek/mediatek,pericfg.yaml    |   1 +
  arch/arm64/boot/dts/mediatek/Makefile              |   5 +
  arch/arm64/boot/dts/mediatek/mt2712-evb.dts        |   2 +-
  arch/arm64/boot/dts/mediatek/mt2712e.dtsi          |   2 +
  arch/arm64/boot/dts/mediatek/mt6795.dtsi           | 260 ++++--
  .../boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts  |  21 +-
  arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts       |  13 +-
  arch/arm64/boot/dts/mediatek/mt7622.dtsi           |  10 +-
  arch/arm64/boot/dts/mediatek/mt7986a.dtsi          |   4 +-
  .../boot/dts/mediatek/mt8173-elm-hana-rev7.dts     |   6 +-
  arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi       |  24 +-
  arch/arm64/boot/dts/mediatek/mt8173-evb.dts        |  12 +-
  arch/arm64/boot/dts/mediatek/mt8173.dtsi           |  16 +-
  arch/arm64/boot/dts/mediatek/mt8183-evb.dts        |  38 +-
  .../boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi    |   4 +-
  .../boot/dts/mediatek/mt8183-kukui-kakadu.dtsi     |   2 +-
  arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi     |  13 +-
  arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts    |   2 +-
  arch/arm64/boot/dts/mediatek/mt8183.dtsi           | 315 ++++++-
  .../boot/dts/mediatek/mt8192-asurada-hayato-r1.dts |  47 +
  .../dts/mediatek/mt8192-asurada-spherion-r0.dts    |  62 ++
  arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi   | 959 +++++++++++++++++++++
  arch/arm64/boot/dts/mediatek/mt8192.dtsi           |  29 +-
  .../boot/dts/mediatek/mt8195-cherry-tomato-r1.dts  |  15 +
  .../boot/dts/mediatek/mt8195-cherry-tomato-r2.dts  |  35 +
  .../boot/dts/mediatek/mt8195-cherry-tomato-r3.dts  |  36 +
  arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi    | 702 +++++++++++++++
  arch/arm64/boot/dts/mediatek/mt8195-evb.dts        |   8 +-
  arch/arm64/boot/dts/mediatek/mt8195.dtsi           |  76 +-
  arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi   |   4 +-
  31 files changed, 2602 insertions(+), 151 deletions(-)
  create mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dts
  create mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts
  create mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
  create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
  create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts
  create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts
  create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
