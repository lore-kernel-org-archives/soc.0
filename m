Return-Path: <SRS0=BoSG=VI=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE5CEC433F5
	for <soc@archiver.kernel.org>; Sat, 30 Apr 2022 22:52:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6A071C385AD; Sat, 30 Apr 2022 22:52:58 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E6F78C385AA
	for <soc@kernel.org>; Sat, 30 Apr 2022 22:52:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E6F78C385AA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f173.google.com with SMTP id v59so20388144ybi.12
        for <soc@kernel.org>; Sat, 30 Apr 2022 15:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=gCU66tvXeSU6dA6Pn4/+rETPiTto61Xnn69qL7e5XcQ=;
        b=UN5a13VFi1suVKpZGOhA/aKKwG1UlV6MWRuZkY98Q7DMdiZtZIzQbAThsdVIPnYDB1
         0gErMPUJ0ifdf9m8Mamjq1aBIb2IP46TrCFMiznarYW6xEMLlF5eCcUjR3uVO2rQuvdm
         zVkEZebJxtKkGi1uc3eyCVVki2UORcrVpcpR4bE3dxVhW6Pkyqf9C/HYBSSEa8/FzFsK
         jj9YyPu00xt/gNPVPm7sBbFScXwGBzqNU1xpv5lIazweSJpe/fFCB0AgoxSuMK/ZqtJY
         hSCvICcexLqD1D73iNQPiWEApFIsiqmJQS9byOpeQY8VfO1deWBeEihaqoj/GsCFlW1h
         vYRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=gCU66tvXeSU6dA6Pn4/+rETPiTto61Xnn69qL7e5XcQ=;
        b=W2lZ5yB3Co8AbqC9PlmiLnTjCzNxNiuC5vvAHVqUl1tWsOa0vpBwao2VHrSlilOgwR
         B2ja9WhbSMOxJdRFwhwClYOK8N+uXU1f/a4B++XeGBCtVTonSHf+aQpa64Tl+ZbkitKC
         cw8RWRNVSB39+PNGSAr+7O7KLmAgbYFCfTe3cNconQhymfNZ9jaiuzndw37S4mz3mqNs
         h48e+QZKzuiNJL0fQhSajEDuAfZXAF999qovf85lOjWIKWLVhTmZlTD2+ZwSPXlQUgVo
         +/BEWCf6Q5gfvea1NIF2y5WKFXJ3DF92g54JsgKPCcxYsbBs24rdylmLKAe97mRm9ngt
         Iuew==
X-Gm-Message-State: AOAM531rTtRPy8f86lyxdfGk7BHvw0G5u9JUm+5NWgaaHSPs9q6T9Tu2
	uLemWZbk+aLao1UCK2iFrWWTg8Kk/TjIR+L7Cf/1sLeByOX5zw==
X-Google-Smtp-Source: ABdhPJwiwuSMk9Cwr2CZQvIbXsWH8MXU+HRvYQBSx8n0ZXceIKsGwwrs07vko/srmjtrAa5pSZZN6emLDUDDiU/JiaM=
X-Received: by 2002:a25:bcc7:0:b0:648:d728:d39 with SMTP id
 l7-20020a25bcc7000000b00648d7280d39mr5320326ybm.514.1651359174758; Sat, 30
 Apr 2022 15:52:54 -0700 (PDT)
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 1 May 2022 00:52:43 +0200
Message-ID: <CACRpkdYngWscqak5phKm58O2GF0RmVETgwW4NCKTBiASdaEcyg@mail.gmail.com>
Subject: [GIT PULL] DTS updates for the v5.19 kernel
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi SoC folks,

please pull in these Arm Ux500 DTS changes for the v5.19 kernel.

The details are in the signed tag!

Yours,
Linus Walleij

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
tags/ux500-dts-v5.19

for you to fetch changes up to 49148f4c39f04cb7bcfc1f42c3051d9ef8655fba:

  ARM: dts: ux500: Add GPS to the Codina (2022-04-26 23:17:48 +0200)

----------------------------------------------------------------
Ux500 DTS updates for the v5.19 kernel cycle:

- New devicetree for Codina TMO (SGH-T599).

- Add the Amastaos proximity sensor to the Codina.

- Add line impedance per machine to the Fuel Gauge
  nodes.

- Add GPS to Janice, Skomer and Codina.

- Add NFC to the Codina for GT-I8160P.

- Some janitorial like clock names.

----------------------------------------------------------------
Kuldeep Singh (1):
      ARM: dts: ste-dbx: Update spi clock-names property

Linus Walleij (8):
      dt-bindings: arm: ux500: Document Codina-TMO
      ARM: dts: ux500: Add Codina TMO device tree
      ARM: dts: ux500: Register Amstaos proximity sensor
      ARM: dts: ux500: Add line impedance to fuel gauge
      ARM: dts: ux500: Add GPS to Janice device tree
      ARM: dts: ux500: Add GPS to Skomer device tree
      ARM: dts: ux500: Add NFC to the Codina
      ARM: dts: ux500: Add GPS to the Codina

 Documentation/devicetree/bindings/arm/ux500.yaml   |   5 +
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/ste-dbx5x0.dtsi                  |  12 +-
 arch/arm/boot/dts/ste-ux500-samsung-codina-tmo.dts | 785 +++++++++++++++++++++
 arch/arm/boot/dts/ste-ux500-samsung-codina.dts     |  80 ++-
 arch/arm/boot/dts/ste-ux500-samsung-gavini.dts     |   4 +
 arch/arm/boot/dts/ste-ux500-samsung-golden.dts     |   4 +
 arch/arm/boot/dts/ste-ux500-samsung-janice.dts     |  44 +-
 arch/arm/boot/dts/ste-ux500-samsung-kyle.dts       |   4 +
 arch/arm/boot/dts/ste-ux500-samsung-skomer.dts     |  35 +-
 10 files changed, 956 insertions(+), 18 deletions(-)
 create mode 100644 arch/arm/boot/dts/ste-ux500-samsung-codina-tmo.dts
