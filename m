Return-Path: <SRS0=64cw=CD=gmail.com=matthias.bgg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83CECEB64D9
	for <soc@archiver.kernel.org>; Thu, 15 Jun 2023 16:49:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 67B7FC433C8; Thu, 15 Jun 2023 16:49:59 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F1876C433C9;
	Thu, 15 Jun 2023 16:49:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F1876C433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-3f8d0d68530so22752755e9.0;
        Thu, 15 Jun 2023 09:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686847796; x=1689439796;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CugRH/JO6frh29Es/LFj3oS7qZxIny6fWkY4VeZwuZ0=;
        b=nNmNtsrVu2/kjFEh5xRbQnL6+BVauixnSqs/XurjBnrxH/9pbOZDEIW2gfZW4Xb8Qx
         7+jsxQZQ1Ox7MdpbMoITXqcQw8HaMAPpVOZAEpQ7H5Uont9zxh/ZgGVjtwSOehZvDP5z
         rdOtit00JXIxEZ9CcRL6ptmdHz64BWeBgks7MmDUt3HGygG0W6D008H4McG4kPqsP2FM
         9VtWdUk1SIcIf8keVC4PjPYChPwUfKzRnBct2j4U5hejbiiZ/kaio81POIbOwXcAjTkI
         feepFmvz1+iV9FERVIWKFruq3jaoUFdB1NR/BP/LKgASe6Jo0P7qga8Q9A18iUBwaQ0P
         tbzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686847796; x=1689439796;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CugRH/JO6frh29Es/LFj3oS7qZxIny6fWkY4VeZwuZ0=;
        b=ShMiRtnKVeSX2j9PK+wtQ4WdAv+lGhYNzhD1CsiY5nEPsXC7V6VE0lRCPp4j90aIUC
         4yMemXEPue2C5GuDL6NgvMAb/4W04Jm10J9PSheLY9pyzqVdNUigqHzae8u53ayJBzeL
         p4DF70n/WMrCe/MAUV9OdZUlwbMyQT/oNKWcN/ZchDwQkMjzUYcCeQar1B0t8Wo7ZmSQ
         UUQUBmDBrvZYf0/ZV0hsHiBWA9y0wUydz6TDI+9YwDB7L2Ruk8NUecbPq438M1iG0bm0
         uR+vElLyqUfet7Y+Hzl94qbfy5uhYX4qyNmPQGYiuqJivSxvNYH6CND4V6YA47vcy637
         zpNA==
X-Gm-Message-State: AC+VfDx3LsxMt6ej02pKBX6LDB0ieu+pzmjeLguNfW4icNaLCo2nf8/C
	x3J9U/2RpPBBwXkSCBPthKm+6xrWr8w=
X-Google-Smtp-Source: ACHHUZ7sHBxxgCUcV5C6tokLdVPovHA08X5PXf3xeLuXtkslkH/17llmGUxcXsJ1WGC7H1XewxgglQ==
X-Received: by 2002:a1c:4b09:0:b0:3f8:d0e7:dad8 with SMTP id y9-20020a1c4b09000000b003f8d0e7dad8mr6294653wma.3.1686847795897;
        Thu, 15 Jun 2023 09:49:55 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id l19-20020a7bc453000000b003f42328b5d9sm21105129wmi.39.2023.06.15.09.49.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jun 2023 09:49:54 -0700 (PDT)
Message-ID: <27843c96-142e-930e-33b2-b634182e7cfa@gmail.com>
Date: Thu, 15 Jun 2023 18:49:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Content-Language: en-US, ca-ES, es-ES
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>
Cc: "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 Alexandre Mergnat <amergnat@baylibre.com>,
 "allen-kh.cheng" <allen-kh.cheng@mediatek.com>,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Balsam CHIHI <bchihi@baylibre.com>, Chen-Yu Tsai <wens@csie.org>,
 Daniel Golle <daniel@makrotopia.org>,
 Douglas Anderson <dianders@chromium.org>,
 Frank Wunderlich <frank-w@public-files.de>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Icenowy Zheng <icenowy@aosc.io>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Pin-Yen Lin <treapking@chromium.org>, Yunfei Dong <yunfei.dong@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] arm64: dts: mediatek: Updates for v6.5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Olof and Arnd,

here come the upadtes for the 64 bit DTs. I'm happy to see that a lot is going 
on touching all device types. On the network processor side we have some news on 
the BPI-R3 where we enable the thermal driver and the PWM for the SoC fan 
cooling. BPI-R64 got interrupt support for the switch chip.

On the mobile phone site the SoC that can be found in the Sony Xperia M5 got 
several updates like PMIC, eMMC support.

For the IoT SoCs we got watchdog, PMIC, MMC, USB and ethernet support on the 
MT8365 (aka Genio 350).

On the SoCs mainly used in Chromebooks is where most activity happened. A new 
binding was landed to add a quirk for the broken firmware on most of this SoCs. 
This will allow to use a kernel with pseudo NMIs enabled. Apart from that we see 
activity on the rather old MT8173 as well as massive updates for the newer 
chips, MT8195, MT8192 and MT8186.

Please have a look and apologies for being that late in the cycle.

Regards,
Matthias

---

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

   Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/ 
tags/v6.4-next-dts64

for you to fetch changes up to 3bfbff9b461e3506dfb5b2904e8c15a0aea39e07:

   arm64: dts: mt7986: increase bl2 partition on NAND of Bananapi R3 (2023-06-15 
13:14:59 +0200)

----------------------------------------------------------------
MT6795:
- add GCE, MMSYS, IOMMU and PMIC wrapper nodes
- Enable PMIC combo, eMMC and SDIO support to the Sony Xperia M5

MT7622:
- add SPI-NAND chip and interrupt support for switch node to the
   BPI-R64

MT7986:
- add PWM, thermal, efuse, auxadc and thermal zone nodes
- BPI-R3 enable WiFi leds and enable PWM
- BPI-R3 reserve more space on NOR and NOR flash to be able to store bl2
   uncompressed
- BPI-R3 add PWM fan for cpu cooling

MT8173:
- fine tune the regulator of the eDP pannel
- use EDID for eDP panel instead of hard coded type

MT8183:
- add quirk for GIC problem for Kukui based boards to make "pseudo NMIs"
   work
- provide fimrware name to SCP

MT8186:
- add USB, SPMI, ADSP, Global Command Engine (GCE) nodes
- add nodes to enable display support
- add cache coherent interconnect
- add dynamic voltage scaling for CPU and GPU

MT8192:
- enable Bluetooth on the Hayato board
- add quirk for GIC problem for Kukui based boards to make "pseudo NMIs"
   work
- add cpufreq node and video decoder
- add dma-ranges needed by the IOMMU rework
- Fine tune capacity-dmips-mhz

MT8195:
- add thermal zones and video decoder
- enable PCI ports on cherry (e.g. Acer Chromebook Spin 513 CP513-2H) to
   enable WiFi and Bluetooth combo.
- add quirk for GIC problem for Kukui based boards to make "pseudo NMIs"
   work

MT8365:
- add watchdog, PMIC, MMC, USB OTG, ethernet nodes
- add Operation Performance Points
- PSCI node and CPU idle support

Several SoCs:
- advertise L2 and L3 cache as unified
- add chasss-type

----------------------------------------------------------------
Alexandre Mergnat (7):
       arm64: dts: mediatek: add watchdog support for mt8365 SoC
       arm64: dts: mediatek: add mt6357 PMIC support for mt8365-evk
       arm64: dts: mediatek: add mmc support for mt8365-evk
       arm64: dts: mediatek: add usb controller support for mt8365-evk
       arm64: dts: mediatek: add ethernet support for mt8365-evk
       arm64: dts: mediatek: add OPP support for mt8365 SoC
       arm64: dts: mediatek: add cpufreq support for mt8365-evk

Allen-KH Cheng (7):
       arm64: dts: mediatek: mt8186: Add MTU3 nodes
       arm64: dts: mediatek: mt8186: Add SPMI node
       arm64: dts: mediatek: mt8186: Add ADSP node
       arm64: dts: mediatek: mt8186: Add GCE node
       arm64: dts: mediatek: mt8186: Add display nodes
       arm64: dts: mediatek: Add cpufreq nodes for MT8192
       arm64: dts: mt8192: Add video-codec nodes

Amjad Ouled-Ameur (1):
       arm64: dts: mediatek: Add CPU Idle support

AngeloGioacchino Del Regno (10):
       arm64: dts: mediatek: mt6795: Add support for the CMDQ/GCE mailbox
       arm64: dts: mediatek: mt6795: Add MMSYS node for multimedia clocks
       arm64: dts: mediatek: mt6795: Add support for IOMMU and LARBs
       arm64: dts: mediatek: mt6795: Add PMIC Wrapper node
       arm64: dts: mediatek: Add MT6331 PMIC devicetree
       arm64: dts: mediatek: mt6795-xperia-m5: Add MT6331 Combo PMIC
       arm64: dts: mediatek: mt6795-xperia-m5: Add eMMC, MicroSD slot, SDIO
       arm64: dts: mediatek: mt8195: Assign dp-intf aliases
       arm64: dts: mediatek: cherry: Enable PCI-Express ports for WiFi
       arm64: mediatek: Propagate chassis-type where possible

Balsam CHIHI (1):
       arm64: dts: mediatek: mt8195: Add AP domain thermal zones

Chen-Yu Tsai (5):
       arm64: dts: mediatek: mt8192-asurada-hayato: Enable Bluetooth
       arm64: dts: mediatek: mt8186: Add CCI node and CCI OPP table
       arm64: dts: mediatek: mt8186: Wire up CPU frequency/voltage scaling
       arm64: dts: mediatek: mt8186: Add GPU speed bin NVMEM cells
       arm64: dts: mediatek: mt8186: Wire up GPU voltage/frequency scaling

Daniel Golle (7):
       arm64: dts: mt7622: declare SPI-NAND present on BPI-R64
       arm64: dts: mt7622: handle interrupts from MT7531 switch on BPI-R64
       arm64: dts: mt7986: add PWM
       arm64: dts: mt7986: add thermal and efuse
       arm64: dts: mt7986: add thermal-zones
       arm64: dts: mt7986: add pwm-fan and cooling-maps to BPI-R3 dts
       arm64: dts: mt7986: increase bl2 partition on NAND of Bananapi R3

Douglas Anderson (3):
       arm64: dts: mediatek: mt8183: Add mediatek,broken-save-restore-fw to kukui
       arm64: dts: mediatek: mt8192: Add mediatek,broken-save-restore-fw to asurada
       arm64: dts: mediatek: mt8195: Add mediatek,broken-save-restore-fw to cherry

Frank Wunderlich (3):
       arm64: dts: mt7986: add PWM to BPI-R3
       arm64: dts: mt7986: set Wifi Leds low-active for BPI-R3
       arm64: dts: mt7986: use size of reserved partition for bl2

Hsin-Yi Wang (1):
       arm64: dts: mediatek: mt8183: kukui: Add scp firmware-name

Icenowy Zheng (1):
       arm64: dts: mediatek: mt8173-elm: remove panel model number in DT

Krzysztof Kozlowski (1):
       arm64: dts: mediatek: add missing cache properties

Nícolas F. R. A. Prado (2):
       arm64: dts: mediatek: mt8192: Add missing dma-ranges to soc node
       arm64: dts: mediatek: mt8192: Fix CPUs capacity-dmips-mhz

Pin-yen Lin (1):
       arm64: dts: mt8173: Power on panel regulator on boot

Yunfei Dong (1):
       arm64: dts: mt8195: Add video decoder node

  arch/arm64/boot/dts/mediatek/mt2712-evb.dts        |   1 +
  arch/arm64/boot/dts/mediatek/mt6331.dtsi           | 284 ++++++++
  arch/arm64/boot/dts/mediatek/mt6755-evb.dts        |   1 +
  arch/arm64/boot/dts/mediatek/mt6779-evb.dts        |   1 +
  arch/arm64/boot/dts/mediatek/mt6795-evb.dts        |   1 +
  .../boot/dts/mediatek/mt6795-sony-xperia-m5.dts    | 101 +++
  arch/arm64/boot/dts/mediatek/mt6795.dtsi           |  94 +++
  arch/arm64/boot/dts/mediatek/mt6797-evb.dts        |   1 +
  arch/arm64/boot/dts/mediatek/mt6797-x20-dev.dts    |   1 +
  .../boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts  |  43 +-
  arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts       |   1 +
  arch/arm64/boot/dts/mediatek/mt7622.dtsi           |   1 +
  .../dts/mediatek/mt7986a-bananapi-bpi-r3-nand.dtso |   6 +-
  .../dts/mediatek/mt7986a-bananapi-bpi-r3-nor.dtso  |   7 +-
  .../boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts  |  49 ++
  arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts       |   1 +
  arch/arm64/boot/dts/mediatek/mt7986a.dtsi          |  76 +++
  arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts       |   1 +
  arch/arm64/boot/dts/mediatek/mt8167-pumpkin.dts    |   1 +
  .../boot/dts/mediatek/mt8173-elm-hana-rev7.dts     |   1 +
  arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dts   |   1 +
  arch/arm64/boot/dts/mediatek/mt8173-elm.dts        |   1 +
  arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi       |   4 +-
  arch/arm64/boot/dts/mediatek/mt8173-evb.dts        |   1 +
  arch/arm64/boot/dts/mediatek/mt8183-evb.dts        |   1 +
  .../dts/mediatek/mt8183-kukui-jacuzzi-burnet.dts   |   1 +
  .../dts/mediatek/mt8183-kukui-jacuzzi-damu.dts     |   1 +
  .../mt8183-kukui-jacuzzi-juniper-sku16.dts         |   1 +
  .../dts/mediatek/mt8183-kukui-kakadu-sku22.dts     |   1 +
  .../boot/dts/mediatek/mt8183-kukui-kakadu.dts      |   1 +
  .../dts/mediatek/mt8183-kukui-kodama-sku16.dts     |   1 +
  .../dts/mediatek/mt8183-kukui-kodama-sku272.dts    |   1 +
  .../dts/mediatek/mt8183-kukui-kodama-sku288.dts    |   1 +
  .../boot/dts/mediatek/mt8183-kukui-krane-sku0.dts  |   1 +
  .../dts/mediatek/mt8183-kukui-krane-sku176.dts     |   1 +
  arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi     |   6 +
  arch/arm64/boot/dts/mediatek/mt8186-evb.dts        |   1 +
  arch/arm64/boot/dts/mediatek/mt8186.dtsi           | 717 ++++++++++++++++++++-
  .../boot/dts/mediatek/mt8192-asurada-hayato-r1.dts |  81 +++
  arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi   |   4 +
  arch/arm64/boot/dts/mediatek/mt8192.dtsi           |  84 ++-
  arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi    |  29 +
  arch/arm64/boot/dts/mediatek/mt8195.dtsi           | 254 ++++++++
  arch/arm64/boot/dts/mediatek/mt8365-evk.dts        | 235 +++++++
  arch/arm64/boot/dts/mediatek/mt8365.dtsi           | 142 ++++
  45 files changed, 2223 insertions(+), 20 deletions(-)
  create mode 100644 arch/arm64/boot/dts/mediatek/mt6331.dtsi
