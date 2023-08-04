Return-Path: <SRS0=DfUx=DV=linaro.org=neil.armstrong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DCE7C04A94
	for <soc@archiver.kernel.org>; Fri,  4 Aug 2023 13:26:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4B379C433CA; Fri,  4 Aug 2023 13:26:06 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 95BB4C433C7
	for <soc@kernel.org>; Fri,  4 Aug 2023 13:26:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 95BB4C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-3fe2bc27029so20358525e9.3
        for <soc@kernel.org>; Fri, 04 Aug 2023 06:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691155562; x=1691760362;
        h=content-transfer-encoding:subject:organization:content-language:cc
         :to:reply-to:from:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wgD4eA96bB3QvB2FGglWSuEb2Q5AUVL/UL+vTrhNbw8=;
        b=FdZFJ0wrfhp6BtwdxGyExEAuKXs14OlEg1joDHtsIi8P2dwb7l3dF+4S7jty8P7mmN
         ii4M2JwJk0Cc+2XWwFDfLmfsp8zpWB/M/ynQtMVTHuY3kOBupaMr0H8eQA5atuC5c2p8
         WiWbBlx2Du/E9UxWMIAhabkJdFcM0rA67a6bL/SV2/Hjs906imtCWrJKbzM/ZJljajzZ
         zOQcb7BVwx3AatxSEOzUON2y3VMVLdDUgV819BYWKHfLSCnIL7erCE9QWancObqElsN3
         Gz/NlSlgWII2qdTDHrWRwZpL06eKK0Wf3a2eJg0BkvDzQc6Hag4xLwX/EFKtHQFJBymB
         CBoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691155562; x=1691760362;
        h=content-transfer-encoding:subject:organization:content-language:cc
         :to:reply-to:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wgD4eA96bB3QvB2FGglWSuEb2Q5AUVL/UL+vTrhNbw8=;
        b=a4zhqGdN9ndY4M8OAP0go48FmucsqsTwVeRMD6wSzTtn9N0vLptdZ/0LWOduEbF0e6
         DGESvCdElxNpDncQVvbCkra2Jnj4rUwRqlMYbxBZefE7nMQueOtPCgDPN57rkQM45uf4
         uxZiEi5tnilpPJMf7S7rFkf4i+0C2z8qafJ6zKRz35MkcReqzIbIfEohH4FneWdJ/yKu
         09w4fO2O/Tzg+gNWHi6sgn+XT82+tFhI/9yTEaBIZDT+Pm+NCSIE9daOJ+rG2Va4vpyP
         vN5lJOdRgMPUOgMjZmlxZPfXrEikYOsTkpiuMR980siB8wO+1zpEsR6wepZ4rhh66O+U
         UpLQ==
X-Gm-Message-State: AOJu0YwI1Y5XizaiM+E0PvArUcSQuVJNrkbNZ44Qr3ZfGdJLhE920IFz
	DdsNXK9tt12rsc3yNafrdziqltBbyZKIpraAXD+ztw==
X-Google-Smtp-Source: AGHT+IEVvSMcZN1bcAZvHN7x1EqS8fL/aGIKCpN5gjGUAm/Yf12ORtuN6qsiGf+dwdlwZSaJW2u54A==
X-Received: by 2002:a05:600c:214d:b0:3fc:25:ced6 with SMTP id v13-20020a05600c214d00b003fc0025ced6mr1479650wml.13.1691155562558;
        Fri, 04 Aug 2023 06:26:02 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:62a2:ed99:fec9:25cc? ([2a01:e0a:982:cbb0:62a2:ed99:fec9:25cc])
        by smtp.gmail.com with ESMTPSA id 10-20020a05600c234a00b003fc16ee2864sm2382650wmq.48.2023.08.04.06.26.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Aug 2023 06:26:02 -0700 (PDT)
Message-ID: <77e328b5-0d47-36e8-f62d-c745df06fb87@linaro.org>
Date: Fri, 4 Aug 2023 15:26:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Language: en-US
Organization: Linaro Developer Services
Subject: [GIT PULL] amlogic Drivers updates for v6.6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Here's an Amlogic Drivers changeset for v6.6, including merge of genpd-v6.5-rc1-1
in order to move the Amlogic GenPD drivers to the new directory.

The PR contains:
- C3 Power Domains support
- include correct DT includes from Rob
- NULL pointer dereference fix in meson_sm
- Merge of genpd-v6.5-rc1-1

Neil

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

   Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-drivers-for-v6.6

for you to fetch changes up to f2ed165619c16577c02b703a114a1f6b52026df4:

   firmware: meson_sm: fix to avoid potential NULL pointer dereference (2023-08-04 15:19:01 +0200)

----------------------------------------------------------------
Amlogic drivers changes for v6.6:
- Add C3 Power Domains
- Explicitly include correct DT includes in Amlogic SoC drivers
- fix to avoid potential NULL pointer dereference in meson_sm
- Merge of genpd-v6.5-rc1-1 to move genpd amlogic drivers

----------------------------------------------------------------
Neil Armstrong (1):
       Merge tag 'genpd-v6.5-rc1-1' of git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm into v6.6/drivers-genpd

Rob Herring (1):
       soc: amlogic: Explicitly include correct DT includes

Ulf Hansson (18):
       genpd: Create a new subsystem directory to host genpd providers
       soc: actions: Move power-domain driver to the genpd dir
       soc: amlogic: Move power-domain drivers to the genpd dir
       soc: apple: Move power-domain driver to the genpd dir
       soc: bcm: Move power-domain drivers to the genpd dir
       soc: imx: Move power-domain drivers to the genpd dir
       soc: mediatek: Move power-domain drivers to the genpd dir
       soc: qcom: Move power-domain drivers to the genpd dir
       soc: renesas: Move power-domain drivers to the genpd dir
       soc: rockchip: Mover power-domain driver to the genpd dir
       soc: samsung: Move power-domain driver to the genpd dir
       soc: starfive: Move the power-domain driver to the genpd dir
       soc: sunxi: Move power-domain driver to the genpd dir
       soc: tegra: Move powergate-bpmp driver to the genpd dir
       soc: ti: Mover power-domain drivers to the genpd dir
       soc: xilinx: Move power-domain driver to the genpd dir
       ARM: ux500: Convert power-domain code into a regular platform driver
       ARM: ux500: Move power-domain driver to the genpd dir

Xianwei Zhao (3):
       soc: amlogic: use name instead of index as criterion
       dt-bindings: power: add Amlogic C3 power domains
       soc: c3: Add support for power domains controller

Zhang Shurong (1):
       firmware: meson_sm: fix to avoid potential NULL pointer dereference

  .../bindings/power/amlogic,meson-sec-pwrc.yaml     |  3 ++-
  MAINTAINERS                                        | 22 ++++++++++++----
  arch/arm/mach-ux500/Makefile                       |  1 -
  arch/arm/mach-ux500/cpu-db8500.c                   |  5 ----
  arch/arm/mach-ux500/pm_domains.h                   | 17 ------------
  drivers/Makefile                                   |  1 +
  drivers/firmware/meson/meson_sm.c                  |  2 ++
  drivers/genpd/Makefile                             | 16 ++++++++++++
  drivers/genpd/actions/Makefile                     |  2 ++
  drivers/{soc => genpd}/actions/owl-sps.c           |  0
  drivers/genpd/amlogic/Makefile                     |  4 +++
  drivers/{soc => genpd}/amlogic/meson-ee-pwrc.c     |  3 +--
  drivers/{soc => genpd}/amlogic/meson-gx-pwrc-vpu.c |  3 +--
  drivers/{soc => genpd}/amlogic/meson-secure-pwrc.c | 30 ++++++++++++++++++++--
  drivers/genpd/apple/Makefile                       |  2 ++
  .../apple/pmgr-pwrstate.c}                         |  0
  drivers/genpd/bcm/Makefile                         |  5 ++++
  drivers/{soc/bcm/bcm63xx => genpd/bcm}/bcm-pmb.c   |  0
  drivers/{soc => genpd}/bcm/bcm2835-power.c         |  0
  .../{soc/bcm/bcm63xx => genpd/bcm}/bcm63xx-power.c |  0
  drivers/{soc => genpd}/bcm/raspberrypi-power.c     |  0
  drivers/genpd/imx/Makefile                         |  7 +++++
  drivers/{soc => genpd}/imx/gpc.c                   |  0
  drivers/{soc => genpd}/imx/gpcv2.c                 |  0
  drivers/{soc => genpd}/imx/imx8m-blk-ctrl.c        |  0
  drivers/{soc => genpd}/imx/imx8mp-blk-ctrl.c       |  0
  drivers/{soc => genpd}/imx/imx93-blk-ctrl.c        |  0
  drivers/{soc => genpd}/imx/imx93-pd.c              |  0
  drivers/genpd/mediatek/Makefile                    |  3 +++
  .../{soc => genpd}/mediatek/mt6795-pm-domains.h    |  0
  .../{soc => genpd}/mediatek/mt8167-pm-domains.h    |  0
  .../{soc => genpd}/mediatek/mt8173-pm-domains.h    |  0
  .../{soc => genpd}/mediatek/mt8183-pm-domains.h    |  0
  .../{soc => genpd}/mediatek/mt8186-pm-domains.h    |  0
  .../{soc => genpd}/mediatek/mt8188-pm-domains.h    |  0
  .../{soc => genpd}/mediatek/mt8192-pm-domains.h    |  0
  .../{soc => genpd}/mediatek/mt8195-pm-domains.h    |  0
  drivers/{soc => genpd}/mediatek/mtk-pm-domains.c   |  0
  drivers/{soc => genpd}/mediatek/mtk-pm-domains.h   |  0
  drivers/{soc => genpd}/mediatek/mtk-scpsys.c       |  0
  drivers/genpd/qcom/Makefile                        |  4 +++
  drivers/{soc => genpd}/qcom/cpr.c                  |  0
  drivers/{soc => genpd}/qcom/rpmhpd.c               |  0
  drivers/{soc => genpd}/qcom/rpmpd.c                |  0
  drivers/genpd/renesas/Makefile                     | 30 ++++++++++++++++++++++
  drivers/{soc => genpd}/renesas/r8a7742-sysc.c      |  0
  drivers/{soc => genpd}/renesas/r8a7743-sysc.c      |  0
  drivers/{soc => genpd}/renesas/r8a7745-sysc.c      |  0
  drivers/{soc => genpd}/renesas/r8a77470-sysc.c     |  0
  drivers/{soc => genpd}/renesas/r8a774a1-sysc.c     |  0
  drivers/{soc => genpd}/renesas/r8a774b1-sysc.c     |  0
  drivers/{soc => genpd}/renesas/r8a774c0-sysc.c     |  0
  drivers/{soc => genpd}/renesas/r8a774e1-sysc.c     |  0
  drivers/{soc => genpd}/renesas/r8a7779-sysc.c      |  0
  drivers/{soc => genpd}/renesas/r8a7790-sysc.c      |  0
  drivers/{soc => genpd}/renesas/r8a7791-sysc.c      |  0
  drivers/{soc => genpd}/renesas/r8a7792-sysc.c      |  0
  drivers/{soc => genpd}/renesas/r8a7794-sysc.c      |  0
  drivers/{soc => genpd}/renesas/r8a7795-sysc.c      |  0
  drivers/{soc => genpd}/renesas/r8a7796-sysc.c      |  0
  drivers/{soc => genpd}/renesas/r8a77965-sysc.c     |  0
  drivers/{soc => genpd}/renesas/r8a77970-sysc.c     |  0
  drivers/{soc => genpd}/renesas/r8a77980-sysc.c     |  0
  drivers/{soc => genpd}/renesas/r8a77990-sysc.c     |  0
  drivers/{soc => genpd}/renesas/r8a77995-sysc.c     |  0
  drivers/{soc => genpd}/renesas/r8a779a0-sysc.c     |  0
  drivers/{soc => genpd}/renesas/r8a779f0-sysc.c     |  0
  drivers/{soc => genpd}/renesas/r8a779g0-sysc.c     |  0
  drivers/{soc => genpd}/renesas/rcar-gen4-sysc.c    |  0
  drivers/{soc => genpd}/renesas/rcar-gen4-sysc.h    |  0
  drivers/{soc => genpd}/renesas/rcar-sysc.c         |  0
  drivers/{soc => genpd}/renesas/rcar-sysc.h         |  0
  drivers/{soc => genpd}/renesas/rmobile-sysc.c      |  0
  drivers/genpd/rockchip/Makefile                    |  2 ++
  .../pm_domains.c => genpd/rockchip/pm-domains.c}   |  0
  drivers/genpd/samsung/Makefile                     |  2 ++
  .../samsung/exynos-pm-domains.c}                   |  0
  drivers/genpd/st/Makefile                          |  2 ++
  .../genpd/st/ste-ux500-pm-domain.c                 | 25 ++++++++++++++----
  drivers/genpd/starfive/Makefile                    |  2 ++
  .../jh71xx_pmu.c => genpd/starfive/jh71xx-pmu.c}   |  0
  drivers/genpd/sunxi/Makefile                       |  2 ++
  drivers/{soc => genpd}/sunxi/sun20i-ppu.c          |  0
  drivers/genpd/tegra/Makefile                       |  2 ++
  drivers/{soc => genpd}/tegra/powergate-bpmp.c      |  0
  drivers/genpd/ti/Makefile                          |  3 +++
  drivers/{soc => genpd}/ti/omap_prm.c               |  0
  drivers/{soc => genpd}/ti/ti_sci_pm_domains.c      |  0
  drivers/genpd/xilinx/Makefile                      |  2 ++
  .../xilinx/zynqmp-pm-domains.c}                    |  0
  drivers/soc/actions/Makefile                       |  1 -
  drivers/soc/amlogic/Makefile                       |  3 ---
  drivers/soc/amlogic/meson-canvas.c                 |  1 +
  drivers/soc/apple/Makefile                         |  2 --
  drivers/soc/bcm/Kconfig                            | 22 +++++++++++++++-
  drivers/soc/bcm/Makefile                           |  3 ---
  drivers/soc/bcm/bcm63xx/Kconfig                    | 21 ---------------
  drivers/soc/bcm/bcm63xx/Makefile                   |  3 ---
  drivers/soc/imx/Makefile                           |  7 +----
  drivers/soc/mediatek/Makefile                      |  2 --
  drivers/soc/qcom/Makefile                          |  3 ---
  drivers/soc/renesas/Makefile                       | 27 -------------------
  drivers/soc/rockchip/Makefile                      |  1 -
  drivers/soc/samsung/Makefile                       |  1 -
  drivers/soc/starfive/Makefile                      |  3 ---
  drivers/soc/sunxi/Makefile                         |  1 -
  drivers/soc/tegra/Makefile                         |  1 -
  drivers/soc/ti/Makefile                            |  2 --
  drivers/soc/xilinx/Makefile                        |  1 -
  include/dt-bindings/power/amlogic,c3-pwrc.h        | 25 ++++++++++++++++++
  110 files changed, 210 insertions(+), 122 deletions(-)
  delete mode 100644 arch/arm/mach-ux500/pm_domains.h
  create mode 100644 drivers/genpd/Makefile
  create mode 100644 drivers/genpd/actions/Makefile
  rename drivers/{soc => genpd}/actions/owl-sps.c (100%)
  create mode 100644 drivers/genpd/amlogic/Makefile
  rename drivers/{soc => genpd}/amlogic/meson-ee-pwrc.c (99%)
  rename drivers/{soc => genpd}/amlogic/meson-gx-pwrc-vpu.c (99%)
  rename drivers/{soc => genpd}/amlogic/meson-secure-pwrc.c (86%)
  create mode 100644 drivers/genpd/apple/Makefile
  rename drivers/{soc/apple/apple-pmgr-pwrstate.c => genpd/apple/pmgr-pwrstate.c} (100%)
  create mode 100644 drivers/genpd/bcm/Makefile
  rename drivers/{soc/bcm/bcm63xx => genpd/bcm}/bcm-pmb.c (100%)
  rename drivers/{soc => genpd}/bcm/bcm2835-power.c (100%)
  rename drivers/{soc/bcm/bcm63xx => genpd/bcm}/bcm63xx-power.c (100%)
  rename drivers/{soc => genpd}/bcm/raspberrypi-power.c (100%)
  create mode 100644 drivers/genpd/imx/Makefile
  rename drivers/{soc => genpd}/imx/gpc.c (100%)
  rename drivers/{soc => genpd}/imx/gpcv2.c (100%)
  rename drivers/{soc => genpd}/imx/imx8m-blk-ctrl.c (100%)
  rename drivers/{soc => genpd}/imx/imx8mp-blk-ctrl.c (100%)
  rename drivers/{soc => genpd}/imx/imx93-blk-ctrl.c (100%)
  rename drivers/{soc => genpd}/imx/imx93-pd.c (100%)
  create mode 100644 drivers/genpd/mediatek/Makefile
  rename drivers/{soc => genpd}/mediatek/mt6795-pm-domains.h (100%)
  rename drivers/{soc => genpd}/mediatek/mt8167-pm-domains.h (100%)
  rename drivers/{soc => genpd}/mediatek/mt8173-pm-domains.h (100%)
  rename drivers/{soc => genpd}/mediatek/mt8183-pm-domains.h (100%)
  rename drivers/{soc => genpd}/mediatek/mt8186-pm-domains.h (100%)
  rename drivers/{soc => genpd}/mediatek/mt8188-pm-domains.h (100%)
  rename drivers/{soc => genpd}/mediatek/mt8192-pm-domains.h (100%)
  rename drivers/{soc => genpd}/mediatek/mt8195-pm-domains.h (100%)
  rename drivers/{soc => genpd}/mediatek/mtk-pm-domains.c (100%)
  rename drivers/{soc => genpd}/mediatek/mtk-pm-domains.h (100%)
  rename drivers/{soc => genpd}/mediatek/mtk-scpsys.c (100%)
  create mode 100644 drivers/genpd/qcom/Makefile
  rename drivers/{soc => genpd}/qcom/cpr.c (100%)
  rename drivers/{soc => genpd}/qcom/rpmhpd.c (100%)
  rename drivers/{soc => genpd}/qcom/rpmpd.c (100%)
  create mode 100644 drivers/genpd/renesas/Makefile
  rename drivers/{soc => genpd}/renesas/r8a7742-sysc.c (100%)
  rename drivers/{soc => genpd}/renesas/r8a7743-sysc.c (100%)
  rename drivers/{soc => genpd}/renesas/r8a7745-sysc.c (100%)
  rename drivers/{soc => genpd}/renesas/r8a77470-sysc.c (100%)
  rename drivers/{soc => genpd}/renesas/r8a774a1-sysc.c (100%)
  rename drivers/{soc => genpd}/renesas/r8a774b1-sysc.c (100%)
  rename drivers/{soc => genpd}/renesas/r8a774c0-sysc.c (100%)
  rename drivers/{soc => genpd}/renesas/r8a774e1-sysc.c (100%)
  rename drivers/{soc => genpd}/renesas/r8a7779-sysc.c (100%)
  rename drivers/{soc => genpd}/renesas/r8a7790-sysc.c (100%)
  rename drivers/{soc => genpd}/renesas/r8a7791-sysc.c (100%)
  rename drivers/{soc => genpd}/renesas/r8a7792-sysc.c (100%)
  rename drivers/{soc => genpd}/renesas/r8a7794-sysc.c (100%)
  rename drivers/{soc => genpd}/renesas/r8a7795-sysc.c (100%)
  rename drivers/{soc => genpd}/renesas/r8a7796-sysc.c (100%)
  rename drivers/{soc => genpd}/renesas/r8a77965-sysc.c (100%)
  rename drivers/{soc => genpd}/renesas/r8a77970-sysc.c (100%)
  rename drivers/{soc => genpd}/renesas/r8a77980-sysc.c (100%)
  rename drivers/{soc => genpd}/renesas/r8a77990-sysc.c (100%)
  rename drivers/{soc => genpd}/renesas/r8a77995-sysc.c (100%)
  rename drivers/{soc => genpd}/renesas/r8a779a0-sysc.c (100%)
  rename drivers/{soc => genpd}/renesas/r8a779f0-sysc.c (100%)
  rename drivers/{soc => genpd}/renesas/r8a779g0-sysc.c (100%)
  rename drivers/{soc => genpd}/renesas/rcar-gen4-sysc.c (100%)
  rename drivers/{soc => genpd}/renesas/rcar-gen4-sysc.h (100%)
  rename drivers/{soc => genpd}/renesas/rcar-sysc.c (100%)
  rename drivers/{soc => genpd}/renesas/rcar-sysc.h (100%)
  rename drivers/{soc => genpd}/renesas/rmobile-sysc.c (100%)
  create mode 100644 drivers/genpd/rockchip/Makefile
  rename drivers/{soc/rockchip/pm_domains.c => genpd/rockchip/pm-domains.c} (100%)
  create mode 100644 drivers/genpd/samsung/Makefile
  rename drivers/{soc/samsung/pm_domains.c => genpd/samsung/exynos-pm-domains.c} (100%)
  create mode 100644 drivers/genpd/st/Makefile
  rename arch/arm/mach-ux500/pm_domains.c => drivers/genpd/st/ste-ux500-pm-domain.c (75%)
  create mode 100644 drivers/genpd/starfive/Makefile
  rename drivers/{soc/starfive/jh71xx_pmu.c => genpd/starfive/jh71xx-pmu.c} (100%)
  create mode 100644 drivers/genpd/sunxi/Makefile
  rename drivers/{soc => genpd}/sunxi/sun20i-ppu.c (100%)
  create mode 100644 drivers/genpd/tegra/Makefile
  rename drivers/{soc => genpd}/tegra/powergate-bpmp.c (100%)
  create mode 100644 drivers/genpd/ti/Makefile
  rename drivers/{soc => genpd}/ti/omap_prm.c (100%)
  rename drivers/{soc => genpd}/ti/ti_sci_pm_domains.c (100%)
  create mode 100644 drivers/genpd/xilinx/Makefile
  rename drivers/{soc/xilinx/zynqmp_pm_domains.c => genpd/xilinx/zynqmp-pm-domains.c} (100%)
  delete mode 100644 drivers/soc/bcm/bcm63xx/Kconfig
  delete mode 100644 drivers/soc/bcm/bcm63xx/Makefile
  delete mode 100644 drivers/soc/starfive/Makefile
  create mode 100644 include/dt-bindings/power/amlogic,c3-pwrc.h
