Return-Path: <SRS0=ALrW=FD=gmail.com=matthias.bgg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A5F6C5519F
	for <soc@archiver.kernel.org>; Sun, 29 Nov 2020 21:16:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id CF66320809; Sun, 29 Nov 2020 21:16:15 +0000 (UTC)
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51E092078D;
	Sun, 29 Nov 2020 21:16:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WXAKKnzW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51E092078D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=matthias.bgg@gmail.com
Received: by mail-ed1-f65.google.com with SMTP id d18so12691716edt.7;
        Sun, 29 Nov 2020 13:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=Wzet6YIBcFXIXVjhyotb3WolYA/AVJvDgx1lWrdlNFA=;
        b=WXAKKnzWawzpwaTo42EU1aSJn+Tc7blnHCWoQkVGoZdpM6hba7V+r2FVQLHJqPyqTs
         eQpSFbAeBrm+BX130MyHog/kzs+04MhZ0PODPZiDWjsG4RAeDeWr5pSVaqXULTZjRcgE
         OKD61cXUoTbbq1Qfp0NGRF0UKYvhqNTu6Y4nEQgsUTCJaYE0hxlJ49qONsFqNawPWwRo
         KabhX2nb9D3ktNlKQFCMmUcW6/4+P6A0UypsQLw6zOOPYkGkrc78X8Y7xrKYuvQviwFd
         5xs83o90g/gh/zoDYy5EdLWsKsITCacD+57nVZN3Hx2hyYwyEJXG6o0hBrhLnQiCzScb
         Q9Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=Wzet6YIBcFXIXVjhyotb3WolYA/AVJvDgx1lWrdlNFA=;
        b=tahDM1kQjsNmp9AjYvfXZ8GCs5ejCiEe5a3ZbzvnBIpGQ9BZhz0muzGzE09BuVUYgu
         P22Ws42BJcb/FYqkey9kJ1sPGGB5k62GZwqq8+/DKo43o0LvC8jKI5uZdRPOSRJVv0eB
         IU56q1KznrrIeJrwQYD8dgRY2euNvshDq45jAyEjSeIrtoiPNYS0aBvN0XKMiHgIVenJ
         UpIO0fjhXchXEkhI+ZGRerXB8bhF+84f7P21hzdTtnScfiy0QgTStVf6IQphV8DcxXSR
         YiZSyzwitCougafFjiNN8SIil+x+5E9c5b7Sq1W8MfBgyrWpBflsFkId39pzR4DSZvXx
         5KlA==
X-Gm-Message-State: AOAM532YJecuq4o5PZyq9sNjXMp3mXzl4+Fw9ATyaSN4C7pZLC8wYsLl
	vvtVx13VhzOgOQ5Kz2ywJoM=
X-Google-Smtp-Source: ABdhPJxbZdS9blYIpT7OBFHB2Ihl7v8kwNwSXIxqZfxUD5+w2A4rIq+dgRDAFgq57ybPbQYHSwR/Kg==
X-Received: by 2002:a05:6402:c96:: with SMTP id cm22mr18352434edb.121.1606684573856;
        Sun, 29 Nov 2020 13:16:13 -0800 (PST)
Received: from ziggy.stardust ([213.195.126.134])
        by smtp.gmail.com with ESMTPSA id k3sm7861373ejd.36.2020.11.29.13.16.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Nov 2020 13:16:13 -0800 (PST)
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Hanks Chen <hanks.chen@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Jitao Shi <jitao.shi@mediatek.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Seiya Wang <seiya.wang@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] arm64: mediatek: devicetree changes for v5.11
Message-ID: <72fe1c4f-f27c-c455-dfd9-66bde90bb295@gmail.com>
Date: Sun, 29 Nov 2020 22:16:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Arnd and Olof,

Please have a look at the following devicetree changes for v5.11.

The most remarkable changes are support for three (!) new MediaTek boards, the 
AiOT chip mt8167, the smart phone chip mt6779 and the tablet/laptop chip mt8192.

Beware that I had to create a stable branch to share the binding includes for 
the new power domain driver found on mt8183 and mt8192.

Regards,
Matthias
---

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/ 
tags/v5.10-next-dts64

for you to fetch changes up to 5833bc6c7319dd59441562d853b8e435e3bc8ac2:

   dts64: mt7622: disable spi1 and uart2 because pins are used by pwm 
(2020-11-27 17:05:32 +0100)

----------------------------------------------------------------
mt8173:
- add new power domain controller node

mt8183:
- add new power domain controller
- add display, iommu and dsi nodes

mt8192:
- add basic support, pinctrl, uart, spi, i2c and timer

mt8516:
- add auxadc, efuse and usb nodes

mt8167:
- add basic support for the SoC
- add support for the pumkin board

mt6779:
- add initial support, interrupt controller, clocks, uart

mt7622:
-  PWM node for all available PWM channels

----------------------------------------------------------------
Enric Balletbo i Serra (7):
       arm64: dts: mt8173-elm: Remove ddc property from panel
       dt-bindings: power: Add bindings for the Mediatek SCPSYS power domains 
controller
       dt-bindings: power: Add MT8183 power domains
       arm64: dts: mediatek: Add mt8173 power domain controller
       arm64: dts: mediatek: Add smi_common node for MT8183
       arm64: dts: mt8183: Add iommu and larb nodes
       arm64: dts: mt8183: Add display nodes for MT8183

Fabien Parent (9):
       arm64: dts: mediatek: mt8183: fix gce incorrect mbox-cells value
       dt-bindings: iio: adc: auxadc: add doc for MT8516 SoC
       arm64: dts: mediatek: mt8516: add auxadc node
       arm64: dts: mediatek: mt8516: rename usb phy
       arm64: dts: mediatek: mt8516: add usb1 node
       arm64: dts: mediatek: mt8516: add efuse node
       dt-bindings: arm64: dts: mediatek: Add mt8167-pumpkin board
       arm64: dts: mediatek: add dtsi for MT8167
       arm64: dts: mediatek: add MT8167 pumpkin board dts

Frank Wunderlich (2):
       dts64: mt7622: enable all pwm for bananapi r64
       dts64: mt7622: disable spi1 and uart2 because pins are used by pwm

Hanks Chen (1):
       arm64: dts: add dts nodes for MT6779

Hsin-Yi Wang (1):
       arm64: dts: mt8183: Add pwm and backlight node

Jitao Shi (1):
       arm64: dts: mt8183: Add dsi node

Krzysztof Kozlowski (1):
       arm64: dts: mediatek: align GPIO hog names with dtschema

Matthias Brugger (2):
       Merge tag 'v5.10-next-pm-domains-stable' into HEAD
       arm64: dts: mediatek: Add mt8183 power domains controller

Seiya Wang (1):
       arm64: dts: Add Mediatek SoC MT8192 and evaluation board dts and Makefile

Weiyi Lu (1):
       dt-bindings: power: Add MT8192 power domains

  .../devicetree/bindings/arm/mediatek.yaml          |   4 +
  .../devicetree/bindings/iio/adc/mt6577_auxadc.txt  |   1 +
  .../bindings/power/mediatek,power-controller.yaml  | 293 ++++++++
  arch/arm64/boot/dts/mediatek/Makefile              |   3 +
  arch/arm64/boot/dts/mediatek/mt6779-evb.dts        |  31 +
  arch/arm64/boot/dts/mediatek/mt6779.dtsi           | 271 ++++++++
  .../boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts  |  13 +-
  arch/arm64/boot/dts/mediatek/mt8167-pinfunc.h      | 744 +++++++++++++++++++++
  arch/arm64/boot/dts/mediatek/mt8167-pumpkin.dts    |  20 +
  arch/arm64/boot/dts/mediatek/mt8167.dtsi           |  61 ++
  arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi       |   1 -
  arch/arm64/boot/dts/mediatek/mt8173.dtsi           | 164 +++--
  arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi     |  28 +
  arch/arm64/boot/dts/mediatek/mt8183.dtsi           | 408 ++++++++++-
  arch/arm64/boot/dts/mediatek/mt8192-evb.dts        |  29 +
  arch/arm64/boot/dts/mediatek/mt8192.dtsi           | 512 ++++++++++++++
  arch/arm64/boot/dts/mediatek/mt8516.dtsi           |  40 +-
  arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi   |  28 +-
  include/dt-bindings/power/mt8183-power.h           |  26 +
  include/dt-bindings/power/mt8192-power.h           |  32 +
  20 files changed, 2638 insertions(+), 71 deletions(-)
  create mode 100644 
Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
  create mode 100644 arch/arm64/boot/dts/mediatek/mt6779-evb.dts
  create mode 100644 arch/arm64/boot/dts/mediatek/mt6779.dtsi
  create mode 100644 arch/arm64/boot/dts/mediatek/mt8167-pinfunc.h
  create mode 100644 arch/arm64/boot/dts/mediatek/mt8167-pumpkin.dts
  create mode 100644 arch/arm64/boot/dts/mediatek/mt8167.dtsi
  create mode 100644 arch/arm64/boot/dts/mediatek/mt8192-evb.dts
  create mode 100644 arch/arm64/boot/dts/mediatek/mt8192.dtsi
  create mode 100644 include/dt-bindings/power/mt8183-power.h
  create mode 100644 include/dt-bindings/power/mt8192-power.h
