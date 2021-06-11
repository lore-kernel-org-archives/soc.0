Return-Path: <SRS0=vghQ=LF=gmail.com=matthias.bgg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 297ACC48BE0
	for <soc@archiver.kernel.org>; Fri, 11 Jun 2021 11:03:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id F12E06108D; Fri, 11 Jun 2021 11:03:48 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C73A461357;
	Fri, 11 Jun 2021 11:03:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C73A461357
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=matthias.bgg@gmail.com
Received: by mail-wm1-f43.google.com with SMTP id h11-20020a05600c350bb02901b59c28e8b4so7939287wmq.1;
        Fri, 11 Jun 2021 04:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=1PP6pTt87xNCC8xSBbNZ3OmYpZ0rFEwxWleyUjKg5eA=;
        b=dMiORa6kflrGKYa1vAEpTCyPpBFKSLUN04fnFjlKlFvlX14GbgiUzu3a86UeicRnuO
         Jy6G2UxwtYJQsJvTT5xwWKzrAGzqLxNB+Q/ebUrGpaLHGNs63NQzsZgI6HM1BfRexl3l
         +CgMV9eHPfvtPHhSw5zrPXW1M0VVQZtXPPqAiBwUIOFdhbHsNkWdu0Gt775JKf6GE6Ix
         Jki8Uv61R44qmEl+puIvZdikyMzRDx5ZuS6vmd2WVejG5PTEZCb6wUb0lVGMCAR0jrtL
         XnY8TESN3fIoXNcIaPc+zjs5wxipxTh/0PMCz/qzOaAwbj29uZUEhQzie0GW2a4Iywu8
         IJFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=1PP6pTt87xNCC8xSBbNZ3OmYpZ0rFEwxWleyUjKg5eA=;
        b=uYvxDAitE+Dxa7t63U0SwwyydrvKwapjhwdTxqduwVdliGIe/HPlN0XduGA5l/MUZ3
         wy4JIXlzJ2bUWUqI+Cv0YP6k6I/loHv9+YfHa6J8SoDI9V4iqW9t6Jc5VY0XTIF/UmZo
         kvQakOoK6m6qzTUpSAFoMvqDYggfbASV8s204KA3yI5Dbm4NhHxmzzx+tW4t8gp/HokV
         90gQtvY45DToOFHlEc8O95jvLfJCun20xKp5/JOtLRuOeHVh9iBCifS415O+pFA8Y7Dv
         i/Z+WZCNNZGg5p4T7HfnarX/CxdxKCZ3Rm+3nWz8hUI1gyV/zOEsnrh3Fptx/EnONhR+
         jCAA==
X-Gm-Message-State: AOAM533WFhTJHUfnPJtigVpQz/p2f57H9uugdFYQ+ujxw2MoxcYZx/fv
	HYcC66QvSSHR5Zi5fWjWHTM=
X-Google-Smtp-Source: ABdhPJwg/WVdQNUy+OYO0ohwbX0HYwAcrdwAwpPcVkqkXHfnL4NIRhqvqlvrvtDD21LNTGALjWQzEA==
X-Received: by 2002:a1c:6004:: with SMTP id u4mr19774275wmb.110.1623409427447;
        Fri, 11 Jun 2021 04:03:47 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
        by smtp.gmail.com with ESMTPSA id c12sm7651854wrr.90.2021.06.11.04.03.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jun 2021 04:03:47 -0700 (PDT)
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, Fabien Parent <fparent@baylibre.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Ikjoon Jang <ikjn@chromium.org>,
 Irui Wang <irui.wang@mediatek.com>, Michael Kao <michael.kao@mediatek.com>,
 Nicolas Boichat <drinkcat@chromium.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] arm64: mediatek: DTS updates for v5.14
Message-ID: <117d5eb5-bc99-70bb-a1a9-d7141fe96527@gmail.com>
Date: Fri, 11 Jun 2021 13:03:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Arnd and Olof,



Please have a look at the DTS patches for v5.14
.
Especially note all the new Chromebooks based on MT8183 that get started to get
supported.


Regards,

Matthias



---

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/
tags/v5.13-next-dts64

for you to fetch changes up to a8168cebf1bca1b5269e8a7eb2626fb76814d6e2:

  arm64: dts: mt8183: Add node for the Mali GPU (2021-06-09 15:42:39 +0200)

----------------------------------------------------------------
mt8173:
- split hardware encoder block into two devices.

mt8167:
- add pm domains, multi-media system (mmsys), SMI, local arbiter
  (larb) and IOMMU nodes.

mt8183:
- Add new chromebooks: HP Chromebook 11a, Acer Chromebook 311, HP
  Chromebook x360 11MK G3 EE, Lenovo IdeaPad Flex 3.
- add power domain to SMI common node.
- add power supplies for EEPROM node.

----------------------------------------------------------------
Fabien Parent (5):
      arm64: dts: mediatek: mt8167: add power domains
      arm64: dts: mediatek: mt8167: add mmsys node
      arm64: dts: mediatek: mt8167: add smi_common node
      arm64: dts: mediatek: mt8167: add larb nodes
      arm64: dts: mediatek: mt8167: add iommu node

Hsin-Yi Wang (12):
      dt-bindings: arm64: dts: mediatek: Add mt8183-kukui-jacuzzi-kappa
      dt-bindings: arm64: dts: mediatek: Add mt8183-kukui-jacuzzi-willow
      dt-bindings: arm64: dts: mediatek: Add mt8183-kukui-jacuzzi-burnet
      dt-bindings: arm64: dts: mediatek: Add mt8183-kukui-jacuzzi-kenzo
      dt-bindings: arm64: dts: mediatek: Add mt8183-kukui-jacuzzi-fennel
      arm64: dts: mt8183: Add kukui-jacuzzi-kappa board
      arm64: dts: mt8183: Add kukui-jacuzzi-willow board
      arm64: dts: mt8183: Add kukui-jacuzzi-burnet board
      arm64: dts: mt8183: Add kukui-jacuzzi-kenzo board
      arm64: dts: mt8183: Add kukui-jacuzzi-fennel board
      arm64: dts: mt8183: remove syscon from smi_common node
      arm64: dts: mt8183: add supply name for eeprom

Ikjoon Jang (1):
      arm64: dts: mt8183: add cbas node under cros_ec

Irui Wang (1):
      arm64: dts: mt8173: Separating mtk-vcodec-enc device node

Michael Kao (1):
      arm64: dts: mt8183-kukui: Add tboard thermal zones

Nicolas Boichat (1):
      arm64: dts: mt8183: Add node for the Mali GPU

 .../devicetree/bindings/arm/mediatek.yaml          |  29 ++++-
 arch/arm64/boot/dts/mediatek/Makefile              |   8 ++
 arch/arm64/boot/dts/mediatek/mt8167.dtsi           | 121 +++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8173.dtsi           |  60 +++++-----
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts        |   5 +
 .../dts/mediatek/mt8183-kukui-jacuzzi-burnet.dts   |  30 +++++
 .../mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts  |  44 ++++++++
 .../mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts  |  32 ++++++
 .../dts/mediatek/mt8183-kukui-jacuzzi-fennel.dtsi  |  27 +++++
 .../dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dts |  16 +++
 .../dts/mediatek/mt8183-kukui-jacuzzi-kappa.dts    |  16 +++
 .../dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dts    |  12 ++
 .../mediatek/mt8183-kukui-jacuzzi-willow-sku0.dts  |  13 +++
 .../mediatek/mt8183-kukui-jacuzzi-willow-sku1.dts  |  12 ++
 .../dts/mediatek/mt8183-kukui-jacuzzi-willow.dtsi  |  26 +++++
 .../boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi    |   8 ++
 .../boot/dts/mediatek/mt8183-kukui-kakadu.dtsi     |   4 +
 .../boot/dts/mediatek/mt8183-kukui-kodama.dtsi     |   4 +
 .../boot/dts/mediatek/mt8183-kukui-krane.dtsi      |   4 +
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi     |  23 ++++
 arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts    |   5 +
 arch/arm64/boot/dts/mediatek/mt8183.dtsi           | 110 ++++++++++++++++++-
 22 files changed, 576 insertions(+), 33 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dts
 create mode 100644
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts
 create mode 100644
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dts
 create mode 100644
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dts
 create mode 100644
arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow.dtsi
