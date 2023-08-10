Return-Path: <SRS0=IwMG=D3=gmail.com=joel.stan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F57C001DB
	for <soc@archiver.kernel.org>; Thu, 10 Aug 2023 12:28:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2D4C0C433C7; Thu, 10 Aug 2023 12:28:13 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3C25FC433C8
	for <soc@kernel.org>; Thu, 10 Aug 2023 12:28:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3C25FC433C8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-99c1d03e124so119756766b.2
        for <soc@kernel.org>; Thu, 10 Aug 2023 05:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1691670488; x=1692275288;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zVnE64GF5JkTluD6xr4hJ+bYfY9RuuI4BGvlCOpCCMU=;
        b=VDAxragmobNCNMxFQz2XyiCW5yU5RkNvh6MRyvrfKJcSaTk/3rFuOSPMhDd1m+FXhN
         9sn6b8zuiCpSFUGwDcZ5DZwOrdViqe1Oed+fMur1cPZsXWuvuVgNxU2Q8HXl7yxNU2aJ
         zqhz8aHrIQZRY4zcmS4dfoJbN491rxT64lw2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691670488; x=1692275288;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zVnE64GF5JkTluD6xr4hJ+bYfY9RuuI4BGvlCOpCCMU=;
        b=OCwxD1mnggaelrtUDp23FVyTiOa9qPXcaL67lIbr4xJ1a3b7McOjC4hK8VvTjKEDst
         QshFTLYwu4odwzlQxglm3Z3+XF2ctDDpiOUfJcIwIHoSkkET/GTpS7aPqX7d3pkK5CHg
         qLWEm/4dsrpPmHT5f9E9lWykL0oSHNARiLFVmHzGchiVZA2pbiDityYaol0dbLQlXpf1
         ICccM5jI/TQVccCBg9NPGKi6xJmMhSkbkL4iGqzyf80ZQrRun9hOzqjBSNwLyuaJGoXK
         2wpYQFSgEV6lbHUE50gw8ZflSdQGnsn+07BU6IJuBSfw0fP1tc08xGR/2ALvoqV1L/xq
         08ig==
X-Gm-Message-State: AOJu0YxI8cNwtxY8ZnVYsg464SNRdIn1mcCB8WXRZAl9n1nJUxH/2An+
	1uaFWBspb60gEivnohTub1h4s+/cdwTO9zgVBGxhCdM6QbQ=
X-Google-Smtp-Source: AGHT+IGNA+TXbCwNm9jkM37jKrm+NtIht8GpC02YTUKWnLMrvEr/qay2O650NoPdj03fbiDH1o7GifDtMY0AT9BdH+k=
X-Received: by 2002:a17:906:9d1:b0:99c:5056:4e2e with SMTP id
 r17-20020a17090609d100b0099c50564e2emr1636720eje.31.1691670488193; Thu, 10
 Aug 2023 05:28:08 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 10 Aug 2023 12:27:55 +0000
Message-ID: <CACPK8Xc76O5kLEAXRtbFXZcP=ObrKR0Kpez_er+zV2vZffZe7A@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: devicetree changes for 6.6
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"

Hi Soc team,

Here are the aspeed device tree changes for v6.6.

The tag has a -2 as I had a typo in the first tag. I removed that tag
from the repo.

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
tags/aspeed-6.6-devicetree-2

for you to fetch changes up to 32b7343226e622e36c7b241f3c6513f396a5a185:

  ARM: dts: aspeed: Add AST2600 I3C control pins (2023-08-10 21:39:42 +0930)

----------------------------------------------------------------
ASPEED device tree updates for 6.6

 - New machines

  * Inventec's Starscream AST2600 BMC, for a x86 server platform
  * Meta's Yossemite 4 AST2600 BMC, for a multi-node server platform

 - Big device tree rework for IBM's Power10 BMC platforms

 - Updates for wedge400 and Mt Mitchell

 - AST2600 I3C and VUART descriptions

----------------------------------------------------------------
Chanh Nguyen (3):
      ARM: dts: aspeed: mtmitchell: Enable the BMC UART8 and UART9
      ARM: dts: aspeed: mtmitchell: Update ADC sensors for Mt.Mitchell
DVT systems
      ARM: dts: aspeed: mtmitchell: Add MCTP

Chen PJ (2):
      dt-bindings: arm: aspeed: add Inventec starscream-bmc
      ARM: dts: aspeed: Adding Inventec Starscream BMC

Delphine CC Chiu (2):
      dt-bindings: arm: aspeed: add Facebook Yosemite 4 board
      ARM: dts: aspeed: yosemite4: add Facebook Yosemite 4 BMC

Dylan Hung (1):
      ARM: dts: aspeed: Add AST2600 I3C control pins

Eddie James (3):
      ARM: dts: aspeed: bonnell: Add DIMM SPD
      ARM: dts: aspeed: Add P10 FSI descriptions
      ARM: dts: aspeed: everest: Reorganise FSI description

Joel Stanley (4):
      ARM: dts: aspeed: Add AST2600 VUARTs
      ARM: dts: aspeed: bonnell: Reorganise FSI description
      ARM: dts: aspeed: rainier: Reorganise FSI description
      ARM: dts: aspeed: everest: Move common devices up

Lakshmi Yadlapati (1):
      ARM: dts: aspeed: rainier: Remove TPM device

Tao Ren (3):
      ARM: dts: aspeed: Update spi alias in Facebook AST2500 Common dtsi
      ARM: dts: aspeed: wedge400: Enable more ADC channels
      ARM: dts: aspeed: wedge400: Set eMMC max frequency

 .../devicetree/bindings/arm/aspeed/aspeed.yaml     |    2 +
 arch/arm/boot/dts/aspeed/Makefile                  |    2 +
 .../dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts    |  129 +-
 .../dts/aspeed/aspeed-bmc-facebook-wedge400.dts    |    4 +-
 .../dts/aspeed/aspeed-bmc-facebook-yosemite4.dts   |  624 +++++++
 .../arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dts |  364 +---
 .../arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dts | 1837 ++++++++++++--------
 .../arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dts |  683 +-------
 .../dts/aspeed/aspeed-bmc-inventec-starscream.dts  |  389 +++++
 arch/arm/boot/dts/aspeed/aspeed-g6-pinctrl.dtsi    |   10 +
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi            |   20 +
 .../dts/aspeed/ast2500-facebook-netbmc-common.dtsi |    4 +
 arch/arm/boot/dts/aspeed/ibm-power10-dual.dtsi     |  380 ++++
 arch/arm/boot/dts/aspeed/ibm-power10-quad.dtsi     | 1305 ++++++++++++++
 14 files changed, 3924 insertions(+), 1829 deletions(-)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-starscream.dts
 create mode 100644 arch/arm/boot/dts/aspeed/ibm-power10-dual.dtsi
 create mode 100644 arch/arm/boot/dts/aspeed/ibm-power10-quad.dtsi
