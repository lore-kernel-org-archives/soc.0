Return-Path: <SRS0=l/su=55=gmail.com=matthias.bgg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DDA9C38142
	for <soc@archiver.kernel.org>; Wed,  1 Feb 2023 18:14:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D5180C4339B; Wed,  1 Feb 2023 18:14:16 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 62D6DC433EF;
	Wed,  1 Feb 2023 18:14:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 62D6DC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id d4-20020a05600c3ac400b003db1de2aef0so2150754wms.2;
        Wed, 01 Feb 2023 10:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2s7Bnpn4tdL6ZT8OZhpNnm4kjABi9s9ef7qYQmT+sVw=;
        b=drkgdP+ekZPVrtppAi50a25isigIUPd7UmBwqj2eQEX8xDI9ZuRDaWLtj5EomMaOoK
         ukUdfijOKcCa4dqy1cmhS/LsH4Ep6rdBl5o7ayNvqwSNS0nKN3CU2erMXgiNPIWSK+ox
         NWYo+P9Q7s8lJe12kqX9GVMRrWVymbbUgargsGGg0st57JzuGEM8LewnWcnmcq+z0ShT
         MTSG33N20pEHE2rw9yJcIU5upm6lfRdjLohPFxYVgWhptXnfSoxuTF5qvlIfcMWeJ4X9
         go/VPmuwIpYoprXHQPNSHSQ5dPOVEUu973tDAEMQOFF4X4KR+CdOj5NT/AFcmZmiStWX
         DMzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2s7Bnpn4tdL6ZT8OZhpNnm4kjABi9s9ef7qYQmT+sVw=;
        b=Xry060PaU/T2wZb9I9eXc6vZoMCaZ7MI3o6wZ4ViWtf8pg9PFwOgUJbRuUn0WyaBaA
         RvtJgRaHV2uaOrbXufrQzPzH6N5pnkh46sRbxbmJijMbNWFfQvOqF2u8xHoEE7Pdrt6V
         VdscA9i8+FCBvajdu+y3vPbP74mkZ/xxV956lVw5aGybhNHuVW2TobYvrqjOSOL/ACCC
         BroKk2/19O1RWLCZ1zMGRRPEnlw3a1qtCBra95xf5DI+OLGg1HmjBxXzimQjdr5YOe8q
         5bRbRrKBc7DWix5xv6OqQXsRcUd3YU3/+HPbYcabCjNe5t8qXamqb6IWYcmHn1QLnSwg
         7T8A==
X-Gm-Message-State: AO0yUKXly/Dp5HZFm8qACK8yJWjiKwFTIdo3JcHpiw0NkxOiThrEIn5c
	l3LJCr8UyZLUvZg4EQ2ZhjS2S0tqEEI=
X-Google-Smtp-Source: AK7set/8qQb1Hjw/betjv72ZaigX0crtS9Q2pSRmxgWLGBSHuXF8mCw+9KMjFoffloFpy6+/1ilkCg==
X-Received: by 2002:a05:600c:540c:b0:3df:9858:c03d with SMTP id he12-20020a05600c540c00b003df9858c03dmr153738wmb.18.1675275253589;
        Wed, 01 Feb 2023 10:14:13 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id l16-20020a1c7910000000b003dc1d668866sm2378907wme.10.2023.02.01.10.14.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Feb 2023 10:14:12 -0800 (PST)
Message-ID: <2eefe6d4-6ca3-dc5f-6a04-f4f3c49692dd@gmail.com>
Date: Wed, 1 Feb 2023 19:14:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 Alexandre Mergnat <amergnat@baylibre.com>,
 "allen-kh.cheng" <allen-kh.cheng@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Balsam CHIHI <bchihi@baylibre.com>, =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?=
 <bero@baylibre.com>, Biao Huang <biao.huang@mediatek.com>,
 Chen-Yu Tsai <wens@csie.org>, Frank Wunderlich <frank-w@public-files.de>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Pin-Yen Lin <treapking@chromium.org>, Sam Shih <sam.shih@mediatek.com>,
 kyrie wu <kyrie.wu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] arm64: dts: mediatek updates for v6.3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Olof,
Hi Arnd,

Below are large list of updates for 64 bit based MediaTek boards. While we have 
some smaller updates to older HW, like MT8183 and MT8173, a lot is happening in 
the around the Chromebooks chips.

The MT8186 has got support for several peripherals like IOMMU, power domains, 
DSI, audio and DPI.

The MT8192 (Acer Chromebook 514) got support for the internal display and audio.

The MT8195 (Acher Crhomebook Spin 513) got support for the power domains as well 
as JPG en- and decoder.

Apart from that we got support for the MT7986 based BananaPi R3.

Please have a look!

Regards,
Matthias

---
The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

   Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/ 
tags/v6.2-next-dts64

for you to fetch changes up to 6bbd1241700ac10c0ae71b86030ad9a6ca41b93b:

   arm64: dts: mediatek: mt8516: Fix the watchdog node name (2023-02-01 14:54:57 
+0100)

----------------------------------------------------------------
mt7986:
- add USB host support
- add support for mmc, pcie
- add support for Bananpi R3

mt8173:
- switch to SMC watchdog for Acer Chromebook R13
- move panel under aux bus

mt8183:
- support detachable keyboards on kukui based Chromebooks
- describe 13 MHz clock correctly
- complete CPU cache information

mt8186:
- Add pm-domains, iommu, dsi
- describe 13 MHz clock correctly
- complete CPU cache information
- add crypto support for the eMMC
- add audio controler, DPI and ADSP mailbox support
- describe CPUs as a single cluster

mt8192:
- describe 13 MHz clock correctly
- complete CPU cache information
- enable display regulators, backlight, internal display and audio on
   Acer Chromebook 514
- describe CPUs as a single cluster

mt8195:
- Add power domain to t-phy
- describe 13 MHz clock correctly
- complete CPU cache information
- enable audio for Acer Chromebook Spin 513
- add ethernet support for the demo board
- add JPG enconder and decoder device
- describe CPUs as a single cluster

Smaller changes for mt6795, mt7622, mt8516 and mt6358.

----------------------------------------------------------------
Alexandre Mergnat (2):
       arm64: dts: mt6358: change node names
       arm64: dts: mt8173: change node name

Allen-KH Cheng (9):
       arm64: dts: mt8186: Add power domains controller
       arm64: dts: mt8186: Add IOMMU and SMI nodes
       arm64: dts: mt8186: Add dsi node
       arm64: dts: mediatek: mt8186: Add crypto support for eMMC controller
       arm64: dts: mediatek: mt8186: Add ADSP mailbox nodes
       arm64: dts: mediatek: mt8186: Add audio controller node
       arm64: dts: mediatek: mt8186: Add DPI node
       arm64: dts: mediatek: mt7986: Fix watchdog compatible
       arm64: dts: mediatek: mt8516: Fix the watchdog node name

AngeloGioacchino Del Regno (21):
       arm64: dts: mediatek: mt8195: Use P1 clocks for PCIe1 controller
       arm64: dts: mediatek: mt8195: Add power domain to U3PHY1 T-PHY
       arm64: dts: mt8195: Add complete CPU caches information
       arm64: dts: mt8192: Add complete CPU caches information
       arm64: dts: mt8186: Add complete CPU caches information
       arm64: dts: mt8183: Add complete CPU caches information
       arm64: dts: mt6795: Add complete CPU caches information
       arm64: dts: mediatek: cherry: Add Audio Front End (AFE) support
       arm64: dts: mediatek: cherry: Enable the Audio DSP for SOF
       arm64: dts: mediatek: cherry: Add external codecs and speaker amplifier
       arm64: dts: mediatek: cherry: Add sound card configuration
       arm64: dts: mediatek: mt8173-elm: Move display to ps8640 auxiliary bus
       arm64: dts: mt8195: Fix CPU map for single-cluster SoC
       arm64: dts: mt8192: Fix CPU map for single-cluster SoC
       arm64: dts: mt8186: Fix CPU map for single-cluster SoC
       arm64: dts: mt8195: Change idle states names to reflect actual function
       arm64: dts: mt8186: Change idle states names to reflect actual function
       arm64: dts: mt8192: Change idle states names to reflect actual function
       arm64: dts: mediatek: mt7622: Add missing pwm-cells to pwm node
       arm64: dts: mediatek: mt8186: Fix watchdog compatible
       arm64: dts: mediatek: mt8195: Fix watchdog compatible

Balsam CHIHI (1):
       arm64: dts: mt8195: Add efuse node to mt8195

Bernhard Rosenkränzer (2):
       dt-bindings: arm64: dts: mediatek: Add mt8365-evk board
       arm64: dts: mediatek: Remove pins-are-numbered property

Biao Huang (1):
       arm64: dts: mt8195: Add Ethernet controller

Chen-Yu Tsai (5):
       arm64: dts: mediatek: mt8183: Fix systimer 13 MHz clock description
       arm64: dts: mediatek: mt8192: Fix systimer 13 MHz clock description
       arm64: dts: mediatek: mt8195: Fix systimer 13 MHz clock description
       arm64: dts: mediatek: mt8186: Fix systimer 13 MHz clock description
       arm64: dts: mediatek: mt8192: Mark scp_adsp clock as broken

Frank Wunderlich (1):
       arm64: dts: mt7986: add Bananapi R3

Hsin-Yi Wang (2):
       arm64: dts: mt8183: kukui: Split out keyboard node and describe detachables
       arm64: dts: mt8183: jacuzzi: Move panel under aux-bus

Krzysztof Kozlowski (3):
       arm64: dts: mediatek: align LED node names with dtschema
       arm64: dts: mediatek: mt7622: drop serial clock-names
       arm64: dts: mediatek: mt8183: drop double interrupts

Nícolas F. R. A. Prado (5):
       arm64: dts: mediatek: asurada: Add display regulators
       arm64: dts: mediatek: asurada: Add display backlight
       arm64: dts: mediatek: asurada: Enable internal display
       arm64: dts: mediatek: asurada: Enable audio support
       arm64: dts: mediatek: asurada: Add aliases for i2c and mmc

Pin-yen Lin (1):
       arm64: dts: mt8173-elm: Switch to SMC watchdog

Sam Shih (3):
       arm64: dts: mt7986: add usb related device nodes
       arm64: dts: mt7986: add mmc related device nodes
       arm64: dts: mt7986: add pcie related device nodes

kyrie wu (2):
       arm64: dts: mt8195: add jpeg encode device node
       arm64: dts: mt8195: add jpeg decode device node

  .../devicetree/bindings/arm/mediatek.yaml          |   4 +
  arch/arm64/boot/dts/mediatek/Makefile              |   5 +
  arch/arm64/boot/dts/mediatek/mt2712e.dtsi          |   1 -
  arch/arm64/boot/dts/mediatek/mt6358.dtsi           |   6 +-
  arch/arm64/boot/dts/mediatek/mt6795.dtsi           |  50 ++
  arch/arm64/boot/dts/mediatek/mt7622.dtsi           |   2 +-
  .../dts/mediatek/mt7986a-bananapi-bpi-r3-emmc.dtso |  29 ++
  .../dts/mediatek/mt7986a-bananapi-bpi-r3-nand.dtso |  55 ++
  .../dts/mediatek/mt7986a-bananapi-bpi-r3-nor.dtso  |  68 +++
  .../dts/mediatek/mt7986a-bananapi-bpi-r3-sd.dtso   |  23 +
  .../boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts  | 450 ++++++++++++++++
  arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts       | 120 +++++
  arch/arm64/boot/dts/mediatek/mt7986a.dtsi          | 125 ++++-
  arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts       |   8 +
  arch/arm64/boot/dts/mediatek/mt8167.dtsi           |   1 -
  arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi       |  41 +-
  arch/arm64/boot/dts/mediatek/mt8173-evb.dts        |   2 +-
  arch/arm64/boot/dts/mediatek/mt8173.dtsi           |   1 -
  .../mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts  |   2 +-
  .../boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi    |  28 +-
  .../boot/dts/mediatek/mt8183-kukui-kakadu.dtsi     |   6 +
  .../boot/dts/mediatek/mt8183-kukui-kodama.dtsi     |   6 +
  .../boot/dts/mediatek/mt8183-kukui-krane.dtsi      |   6 +
  arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi     |   2 +-
  arch/arm64/boot/dts/mediatek/mt8183.dtsi           |  86 ++-
  arch/arm64/boot/dts/mediatek/mt8186.dtsi           | 579 ++++++++++++++++++++-
  .../mt8192-asurada-audio-rt1015p-rt5682.dtsi       |  19 +
  .../dts/mediatek/mt8192-asurada-audio-rt1015p.dtsi |  26 +
  .../dts/mediatek/mt8192-asurada-audio-rt5682.dtsi  |  21 +
  .../boot/dts/mediatek/mt8192-asurada-hayato-r1.dts |   1 +
  .../dts/mediatek/mt8192-asurada-spherion-r0.dts    |   1 +
  arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi   | 465 +++++++++++++++++
  arch/arm64/boot/dts/mediatek/mt8192.dtsi           | 107 +++-
  .../boot/dts/mediatek/mt8195-cherry-tomato-r1.dts  |  10 +
  .../boot/dts/mediatek/mt8195-cherry-tomato-r2.dts  |  10 +
  .../boot/dts/mediatek/mt8195-cherry-tomato-r3.dts  |  10 +
  arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi    | 109 ++++
  arch/arm64/boot/dts/mediatek/mt8195-demo.dts       |  77 +++
  arch/arm64/boot/dts/mediatek/mt8195.dtsi           | 309 ++++++++++-
  arch/arm64/boot/dts/mediatek/mt8516.dtsi           |   3 +-
  40 files changed, 2764 insertions(+), 110 deletions(-)
  create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc.dtso
  create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-nand.dtso
  create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-nor.dtso
  create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd.dtso
  create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
  create mode 100644 
arch/arm64/boot/dts/mediatek/mt8192-asurada-audio-rt1015p-rt5682.dtsi
  create mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-audio-rt1015p.dtsi
  create mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-audio-rt5682.dtsi
