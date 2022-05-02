Return-Path: <SRS0=iIJx=VK=baylibre.com=narmstrong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FB2DC433EF
	for <soc@archiver.kernel.org>; Mon,  2 May 2022 13:04:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EF542C385A4; Mon,  2 May 2022 13:04:01 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C2757C385AC
	for <soc@kernel.org>; Mon,  2 May 2022 13:03:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C2757C385AC
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f48.google.com with SMTP id l62-20020a1c2541000000b0038e4570af2fso8408224wml.5
        for <soc@kernel.org>; Mon, 02 May 2022 06:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:from:to:cc:subject
         :content-language:organization:content-transfer-encoding;
        bh=woyiUxX21hwHxzXlHDKoRRV4Wmq+fW3F3m7H8e8RJJY=;
        b=gyLREp2daS42h+AFGG0n8ZDSNjk12hWY7QCLOU11BQMJ/g2ZGEuFZDBF0wbAfuu3Wm
         z7t1F7BCyTy/wmojOZgaWuH1hTfmBPsRMN9B6NqwkQ8uW4+rssLfm360eJVE/uRdcGT+
         8zgrTqK9ZHuI4cLSAH1kB6ma7djI04j42VYicbjfugKd5FlYReoofz5xMW5VAiv7QhDv
         tins7lNd/+J9ikOjC6M9Am4SwLtTyAvaEcgeHb0E15/frCt+0oMCUTdpBj4igzaz9FmE
         GTpp3b2Lz4H1ExHeOWKK1x9i2hCkUxNo9M64ceH/eTAbb6cFehJVG8tJZHd6Js0Ly1RO
         3a2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:from:to
         :cc:subject:content-language:organization:content-transfer-encoding;
        bh=woyiUxX21hwHxzXlHDKoRRV4Wmq+fW3F3m7H8e8RJJY=;
        b=UBbpKRxSObty2sqDTRdWI4M+hMdhpOdD3IxgTJsWEg0/0ziSqcMMbO3MIg9DxrqIMS
         Oov+GoL7TccmQRRH31Mt/lJHpQWIhL5yJaGQCp6961s1E3/KQYJpzIeXqGvyfERSR4pe
         T5a8YXSvK4ZkFNhEp9CDzTux3xM6+08IyhqiZl8bCoKQiRnqwE9AL8pQuPOQEBCZjGaV
         jwZcl4QChafFkry8ONz6sIJJ2VCdX+A1xPbJwCjEL+mDRzSv71xFsezws/TBr+RGRLuA
         cd7fvqaoPh/QFp7rGAMZ2GA2DPwIlMxiXojKZwf4V6mR6lGJbUEMIQfvogLAi6yUvFTy
         zthg==
X-Gm-Message-State: AOAM530nHoVrXVUleWsbaOLIQz5iogZgm3hytdsGZRI+vTIShmnDr4yd
	unPmD5sM2q2eJTAcIP374heaAjj+gll03HM0
X-Google-Smtp-Source: ABdhPJxMt48SCOuNZ/cR3NGhuJLTDDSKWYXmdSiCTQsU1a7bR6mneWuk+ZGbuoj9vrVXkkNBr7xosg==
X-Received: by 2002:a7b:c8d6:0:b0:394:25ff:2de with SMTP id f22-20020a7bc8d6000000b0039425ff02demr11966001wml.154.1651496637353;
        Mon, 02 May 2022 06:03:57 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:1ae3:6f5f:320e:f969? ([2001:861:44c0:66c0:1ae3:6f5f:320e:f969])
        by smtp.gmail.com with ESMTPSA id s8-20020a05600c29c800b003942a244f2csm7665691wmd.5.2022.05.02.06.03.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 May 2022 06:03:56 -0700 (PDT)
Message-ID: <1e5179ab-2d92-0d64-c57b-e002ec2f0806@baylibre.com>
Date: Mon, 2 May 2022 15:03:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
From: Neil Armstrong <narmstrong@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] arm64: dts: amlogic updates for v5.19
Content-Language: en-US
Organization: Baylibre
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Here's a set of Amlogic ARM64 DT changes for v5.19, with minor fixes and additions.

Neil

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

   Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm64-dt-for-v5.19

for you to fetch changes up to 456733feb0da2dbb1288b9e8f5765df163620c2c:

   arm64: dts: meson: alpa sort the board Makefile (2022-04-11 14:52:44 +0200)

----------------------------------------------------------------
Amlogic ARM64 DT changes for v5.19:
- DTS makefile alpsa sort
- align SPI NOR node name with dtschema
- add support for S4 power domain, gpio_intc, pinctrl
- updates and fixes for JetHub D1/H1 boards

----------------------------------------------------------------
Christian Hewitt (1):
       arm64: dts: meson: alpa sort the board Makefile

Krzysztof Kozlowski (1):
       arm64: dts: meson: align SPI NOR node name with dtschema

Qianggui Song (2):
       arm64: dts: meson-s4: add pinctrl node
       arm64: dts: meson-s4: add gpio_intc node

Shunzhou Jiang (1):
       arm64: dts: add support for S4 power domain controller

Vyacheslav Bocharov (4):
       arm64: meson: add dts bluetooth node for JetHub H1
       arm64: meson: dts: update serial alias in dts for JetHub D1
       arm64: meson: update SDIO voltage in dts for JetHub D1
       arm64: meson: update WiFi SDIO in dts for JetHub D1

  arch/arm64/boot/dts/amlogic/Makefile               | 38 +++++++++++-----------
  .../dts/amlogic/meson-axg-jethome-jethub-j100.dts  | 16 ++++++---
  .../boot/dts/amlogic/meson-gx-libretech-pc.dtsi    |  2 +-
  .../dts/amlogic/meson-gxl-s805x-libretech-ac.dts   |  2 +-
  .../amlogic/meson-gxl-s905w-jethome-jethub-j80.dts |  6 ++++
  .../amlogic/meson-gxl-s905x-libretech-cc-v2.dts    |  2 +-
  .../boot/dts/amlogic/meson-gxm-khadas-vim2.dts     |  2 +-
  arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi |  2 +-
  arch/arm64/boot/dts/amlogic/meson-s4.dtsi          | 33 +++++++++++++++++++
  .../boot/dts/amlogic/meson-sm1-odroid-hc4.dts      |  2 +-
  10 files changed, 76 insertions(+), 29 deletions(-)
