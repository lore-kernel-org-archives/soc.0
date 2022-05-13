Return-Path: <SRS0=25J4=VV=gmail.com=matthias.bgg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12FE0C433F5
	for <soc@archiver.kernel.org>; Fri, 13 May 2022 11:39:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E7A23C34115; Fri, 13 May 2022 11:39:06 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C4BBEC34100;
	Fri, 13 May 2022 11:39:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C4BBEC34100
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id u3so11097909wrg.3;
        Fri, 13 May 2022 04:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:cc:from
         :subject:content-transfer-encoding;
        bh=+rNyRXg/6PtDjr8H+pru93r+wkFlZAX93k/DxKpYPQ0=;
        b=bcLSJ90vLqIdqH7tf9FBMsU1CZG5jpcIVtwTkoXNwjSnDgz6+b0GRUwK1UvL7qU0FS
         UGpkdjhmXChTV/MZqGpP7GThmwnl9ITjAaS/2xD535KiTNd62C58smuUnLH+abCufsFP
         JSdIX/grka1x/V4OT1i2V1fsLOiHl4fGAvmjOZ82m5HbWov/rit7NZ6iazrxmAx5esfp
         B45KQGWqukJT/cLDbv57JWuR53BKls1bk6B2MCPZB0KTpoygPTxXi1LhftFxEUCNpUer
         7hyZsExeV4MdiiFps32HuN3WPzMrjvKAlYuHo86/QFKRRPJUEw7HzkFvjbM0WLd1rP2N
         fUBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:from:subject:content-transfer-encoding;
        bh=+rNyRXg/6PtDjr8H+pru93r+wkFlZAX93k/DxKpYPQ0=;
        b=HDEM9WTLGUUCaCqmyxe//5dBMUVdlB+Bn/D4Wmkn9j7ZCgqKznHtMuTPa4v47Pw5c/
         kRzrqUN2FIUo6Xj0CfviN99nm3vvU7f8SKZQL+z5uK1BDq7JttNEWLHnlN36n22tEUgC
         lH2CC1+sPEQVo7r2Ksdauq+dykuy69pcJOgHx/HN7PauvYIuzSjiPGaT1VZFddMZ9K6b
         5YLZGLOwFio+vCuuFKaXzVeZfl8BE6wfeU60qLgVciiwgRsJ9Vgr6KQj6Lahuam2KkKi
         U7VrXbj1Hn1HKEkEh5bN/fRnavw+JQedB1CschG0Ew8lZyau1SidYHFkgKU84vsD35AF
         gR/A==
X-Gm-Message-State: AOAM531QZyGsL4wy+lRgzZ+mW3InN9/NeRudn8KAmWFUM9wCJlHiAN65
	1qA139aN6vC9XTaLwOQg/GHUf3YeKNId9A==
X-Google-Smtp-Source: ABdhPJzxCyA9CQQjrzZI5u1ByJwH/i7XyyAY8JL/5V5tuS64Uevf4hKO8erQ1XhvoIj6UKvXtofJJA==
X-Received: by 2002:a05:6000:186b:b0:20c:d9bf:250c with SMTP id d11-20020a056000186b00b0020cd9bf250cmr3830380wri.2.1652441944001;
        Fri, 13 May 2022 04:39:04 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id e15-20020adfa74f000000b0020c5253d8e5sm1894601wrd.49.2022.05.13.04.39.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 May 2022 04:39:03 -0700 (PDT)
Message-ID: <2cd90ca7-7541-d47a-fec6-b0c64cf74fa3@gmail.com>
Date: Fri, 13 May 2022 13:39:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
Cc: "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "allen-kh.cheng" <allen-kh.cheng@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chuanhong Guo <gch981213@gmail.com>, Dang Huynh <danct12@riseup.net>,
 Fabien Parent <fparent@baylibre.com>, Hui Liu <hui.liu@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Rui Salvaterra <rsalvaterra@gmail.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>, Yong Wu <yong.wu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] arm64: mediatek: DT updates for v5.19
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Olof and Arnd,

Please have a look on the 64 bit DT updates for Mediatek. Most notably we add 
support for two MT8195 based boards, the EVB and the demo board. Apart from that 
we got the evalutation board for MT8192 added and with it quite some device support.

Sorry for the delay with the pull request.

Regards,
Matthias

---

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

   Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/ 
tags/v5.18-next-dts64

for you to fetch changes up to c75104762ddace5973deb4ea54d35bf2b64bba98:

   arm64: dts: mt8192: Follow binding order for SCP registers (2022-05-13 
13:27:40 +0200)

----------------------------------------------------------------
MT8195:
- add evaluation and demo board

MT8192:
- add new nodes: pwrap, PMIC, scp, USB, efuse, IOMMU, smi, DPI, PCIe,
   SPMI, audio system, MMC and video enconder
- add evaluation board

MT8183:
- fix dtschema issues
- update compatible for the display ambient light processor (disp-aal)
- fix dtschema warning for the pumpki board

MT8173:
- add power domains to the video enconder nodes
- add GCE support to the display mutex node

MT7622:
- specify number of DMA requests explicitely
- specify level 2 cache topology
- add SPI-NAND flash device
- fix dtschema warnings for the System Companion Processor (SCP)

----------------------------------------------------------------
Allen-KH Cheng (16):
       arm64: dts: mt8192: Add pwrap node
       arm64: dts: mt8192: Add SCP node
       arm64: dts: mt8192: Add usb-phy node
       arm64: dts: mt8192: Add xhci node
       arm64: dts: mt8192: Fix nor_flash status disable typo
       arm64: dts: mt8192: Add efuse node
       arm64: dts: mt8192: Add m4u and smi nodes
       arm64: dts: mt8192: Add the mmsys reset bit to reset the dsi0
       arm64: dts: mt8192: Add dpi node
       arm64: dts: mt8192: Add PCIe node
       arm64: dts: mt8192: Add H264 venc device node
       arm64: dts: mediatek: mt8173: Add power domain to encoder nodes
       dt-bindings: arm: Add compatible for Mediatek MT8192
       arm64: dts: mt8192: Add spmi node
       arm64: dts: mt8192: Add audio-related nodes
       arm64: dts: mt8192: Add mmc device nodes

AngeloGioacchino Del Regno (1):
       arm64: dts: mediatek: mt8173: Add gce-client-reg handle to disp-mutex

Chuanhong Guo (1):
       arm64: dts: mediatek: add mtk-snfi for mt7622

Dang Huynh (1):
       arm64: dts: mediatek: pumpkin: Remove input-name property

Fabien Parent (5):
       dt-bindings: arm64: dts: mediatek: Add mt8195-demo board
       arm64: dts: mediatek: Add device-tree for MT8195 Demo board
       arm64: dts: mediatek: mt8183-pumpkin: fix bad thermistor node name
       arm64: dts: mediatek: mt8195-demo: Remove input-name property
       arm64: dts: mediatek: mt8195-demo: enable uart1

Hui Liu (1):
       arm64: dts: mt6359: add PMIC MT6359 related nodes

Krzysztof Kozlowski (4):
       arm64: dts: mediatek: mt8183: align Google CROS EC PWM node name with 
dtschema
       arm64: dts: mediatek: align operating-points table name with dtschema
       arm64: dts: mediatek: align thermal zone node names with dtschema
       arm64: dts: mt8183-kukui: align SPI NOR node name with dtschema

Nícolas F. R. A. Prado (2):
       arm64: dts: mediatek: Format mediatek,larbs as an array of phandles
       arm64: dts: mt8192: Follow binding order for SCP registers

Rex-BC Chen (1):
       arm64: dts: mt8183: Update disp_aal node compatible

Rui Salvaterra (2):
       arm64: dts: mt7622: specify the number of DMA requests
       arm64: dts: mt7622: specify the L2 cache topology

Tinghan Shen (2):
       dt-bindings: arm: mediatek: Add mt8195 pericfg compatible
       arm64: dts: Add mediatek SoC mt8195 and evaluation board

Yong Wu (1):
       arm64: dts: mediatek: Get rid of mediatek, larb for MM nodes

  .../devicetree/bindings/arm/mediatek.yaml          |    5 +
  .../bindings/arm/mediatek/mediatek,pericfg.yaml    |    1 +
  arch/arm64/boot/dts/mediatek/Makefile              |    2 +
  arch/arm64/boot/dts/mediatek/mt2712e.dtsi          |   10 +-
  arch/arm64/boot/dts/mediatek/mt6359.dtsi           |  298 ++++++
  arch/arm64/boot/dts/mediatek/mt7622.dtsi           |   20 +
  arch/arm64/boot/dts/mediatek/mt8167.dtsi           |    2 +-
  arch/arm64/boot/dts/mediatek/mt8173.dtsi           |   29 +-
  .../boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi    |    2 +-
  arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi     |    2 +-
  arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts    |    2 +-
  arch/arm64/boot/dts/mediatek/mt8183.dtsi           |   17 +-
  arch/arm64/boot/dts/mediatek/mt8192-evb.dts        |    1 +
  arch/arm64/boot/dts/mediatek/mt8192.dtsi           |  526 +++++++++-
  arch/arm64/boot/dts/mediatek/mt8195-demo.dts       |  450 +++++++++
  arch/arm64/boot/dts/mediatek/mt8195-evb.dts        |  181 ++++
  arch/arm64/boot/dts/mediatek/mt8195.dtsi           | 1045 ++++++++++++++++++++
  arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi   |    1 -
  include/dt-bindings/reset/mt8192-resets.h          |    3 +
  19 files changed, 2545 insertions(+), 52 deletions(-)
  create mode 100644 arch/arm64/boot/dts/mediatek/mt6359.dtsi
  create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-demo.dts
  create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-evb.dts
  create mode 100644 arch/arm64/boot/dts/mediatek/mt8195.dtsi
