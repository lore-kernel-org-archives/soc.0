Return-Path: <SRS0=Mtmc=3W=linaro.org=neil.armstrong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D82FC4332F
	for <soc@archiver.kernel.org>; Tue, 22 Nov 2022 15:28:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 45587C433C1; Tue, 22 Nov 2022 15:28:50 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 25084C433D7
	for <soc@kernel.org>; Tue, 22 Nov 2022 15:28:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 25084C433D7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id p13-20020a05600c468d00b003cf8859ed1bso11568264wmo.1
        for <soc@kernel.org>; Tue, 22 Nov 2022 07:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:organization:reply-to:content-language:cc
         :to:subject:from:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SzPOjMvl1wDV/XsfinABeMniFcH6xew9GepIKMGt1Q8=;
        b=rcrExMNDawfXqiWUKKNEM9GpbkL/hVNidwXYd6GkEGBw23P8F1ho9G03+vz2AEU1YG
         ZGyi71tPR6tf/a3qbjuPJsMdW2HdPoQEO/+Snv6M1mmB7r+5M/tYPMgYRPB6f7A15zCQ
         hssruoM9kg0DEf+GpfVguyKgfHmPXZFrGxNhBPH3B0WBX9LKKq/d40EbDwbqO4T53Qs4
         zpDN0B44x4lvVEIRpAbmMhHW9IcHMZIafpALE4MDrnfMjQGe2MCOqUMNo3NQQfo4ARAm
         iuRoc5HdBOYee1IsVmMaZE2leZC3kgmRYpAt9Ew4nNQeSg/x76KciKv8Mv9Nv69cuxUp
         Gzcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:organization:reply-to:content-language:cc
         :to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SzPOjMvl1wDV/XsfinABeMniFcH6xew9GepIKMGt1Q8=;
        b=lA3ARwmDp+HkdkeKgcvenMnHWJY1qAShnShUAczhPUDuw2w677vErsf9LiJI1LIYp4
         BkS+IjnmZvfguVD0ELtPmwEGFzTacrO/pn6luHvV98oVouWalRU7d+YRvPj6r3Akfeoz
         yEeWvNf538XPMq8uM4n/f0C+rrQ8nfqY4Q0kF1+vEem7RwMC3tX1gCmRmSTCLycrpFAf
         zhTfqKcDefhDonxMGDVG6RJzUQr4/bwiJPaXqETIUzO542HGV6bxr/YtGKqKWurt0V6a
         nzyYqaArO8E9xoObPfs5dvp2N+ZIIKLUxuKsfv9ITvFLzTPV0+kuLMJwlil09GAt6L/q
         iAQQ==
X-Gm-Message-State: ANoB5plF7AjZmgfndZJyHERcMn+7mu2lrG4QaR1dMfZQoy5ed3aKB9M3
	L1SnpHYHQQuc+vYNoY9ojZkWbsAuTjvrPA==
X-Google-Smtp-Source: AA0mqf43OJPbvw69nuSE0Kzz1kX3i6bcYOxBk2CE/mqkRqFBjldEyD/25WaXuWrOn9cBWphF6yK0kg==
X-Received: by 2002:a05:600c:4e4b:b0:3cf:7624:5fcd with SMTP id e11-20020a05600c4e4b00b003cf76245fcdmr16388380wmq.195.1669130927356;
        Tue, 22 Nov 2022 07:28:47 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:6969:11a1:a2af:e8c0? ([2a01:e0a:982:cbb0:6969:11a1:a2af:e8c0])
        by smtp.gmail.com with ESMTPSA id q14-20020a05600c46ce00b003c6c182bef9sm27857871wmo.36.2022.11.22.07.28.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Nov 2022 07:28:46 -0800 (PST)
Message-ID: <8faa1d3c-5a17-2c3f-92d1-f8fe3df74131@linaro.org>
Date: Tue, 22 Nov 2022 16:28:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic ARM64 DT updates for v6.2
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Language: en-US
Reply-To: neil.armstrong@linaro.org
Organization: Linaro Developer Services
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Here's a set of Amlogic ARM64 DT changes for v6.2, with 1 new board:
- Support for SPI clk pullups on pre-G12A
- Active cooling on Odroid N2/N2+
- DDR PMU on G12A, G12B & SM1
- Update cache properties in Amlogic DTs
- remove clock-frequency from rtc in Amlogic DTs
- Initial support of the new Portable Game Console from Hardkernel: Odroid Go Ultra

Neil

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

   Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm64-dt-for-v6.2

for you to fetch changes up to 62e73f000696cc41cfd237a1ad90b001ad0f76c6:

   arm64: dts: amlogic: add initial Odroid Go Ultra DTS (2022-11-21 11:51:56 +0100)

----------------------------------------------------------------
Amlogic ARM64 DT changes for v6.2:
- meson-gxl: add SPI pinctrl nodes for CLK
- meson-gxbb: add SPI pinctrl nodes for CLK
- Enable active coling using gpio-fan on Odroid N2/N2+
- remove clock-frequency from rtc
- Update cache properties for amlogic
- Add DDR PMU node for G12 series SoC
- document Odroid Go Ultra compatible
- add initial Odroid Go Ultra DTS

----------------------------------------------------------------
Amjad Ouled-Ameur (2):
       arm64: dts: meson-gxl: add SPI pinctrl nodes for CLK
       arm64: dts: meson-gxbb: add SPI pinctrl nodes for CLK

Anand Moon (1):
       arm64: dts: meson: Enable active coling using gpio-fan on Odroid N2/N2+

Jiucheng Xu (1):
       arm64: dts: meson: Add DDR PMU node

Neil Armstrong (2):
       dt-bindings: amlogic: document Odroid Go Ultra compatible
       arm64: dts: amlogic: add initial Odroid Go Ultra DTS

Pierre Gondois (1):
       arm64: dts: Update cache properties for amlogic

Sebastian Reichel (1):
       arm64: dts: meson: remove clock-frequency from rtc

  Documentation/devicetree/bindings/arm/amlogic.yaml |   1 +
  arch/arm64/boot/dts/amlogic/Makefile               |   1 +
  arch/arm64/boot/dts/amlogic/meson-a1.dtsi          |   1 +
  arch/arm64/boot/dts/amlogic/meson-axg.dtsi         |   1 +
  arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  |   6 +
  arch/arm64/boot/dts/amlogic/meson-g12a.dtsi        |   5 +
  .../dts/amlogic/meson-g12b-odroid-go-ultra.dts     | 722 +++++++++++++++++++++
  .../boot/dts/amlogic/meson-g12b-odroid-n2.dtsi     |  42 ++
  arch/arm64/boot/dts/amlogic/meson-g12b.dtsi        |   5 +
  arch/arm64/boot/dts/amlogic/meson-gx.dtsi          |   1 +
  arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi        |  14 +
  .../dts/amlogic/meson-gxl-s905x-khadas-vim.dts     |   1 -
  arch/arm64/boot/dts/amlogic/meson-gxl.dtsi         |  14 +
  .../boot/dts/amlogic/meson-gxm-khadas-vim2.dts     |   1 -
  .../boot/dts/amlogic/meson-gxm-minix-neo-u9h.dts   |   1 -
  arch/arm64/boot/dts/amlogic/meson-sm1.dtsi         |   5 +
  16 files changed, 818 insertions(+), 3 deletions(-)
  create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
