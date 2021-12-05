Return-Path: <SRS0=ZlMi=QW=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC2AC433EF
	for <soc@archiver.kernel.org>; Sun,  5 Dec 2021 13:24:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 70555C341C8; Sun,  5 Dec 2021 13:24:03 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 80D95C341C7
	for <soc@kernel.org>; Sun,  5 Dec 2021 13:24:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 80D95C341C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f41.google.com with SMTP id u18-20020a9d7212000000b00560cb1dc10bso10086769otj.11
        for <soc@kernel.org>; Sun, 05 Dec 2021 05:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=YZPu34XNvTgena9ZGCQIzvogObA2r0z/Izu4qbnACXg=;
        b=ZeekSF19aPOaVTbMXABBnLEcAQml28hV7c0Ds9gg5W1cdlQxc7EV10cFmsl/sXv9Sr
         HX4eatKFXCp/MYP7xhfcn2p4ouCyFzR9fWsVYLfSybm03qmGS087CtIx2IEyzv36buWk
         SEoFW0L55KgHSJfFZrsLkj10/Lkw68/UdExR8IS5jec6PHwonkm5jXseqv7t/iyUJaO9
         fWZbLRBlqnJm4xf5ulMfsngnK1gTV+vJS2y4tJmhFBi2c2DWP20ij533oPc3mpjXHSMZ
         GhaYFryuT5w00Z0JbaU02XWOEIsZ5fvuPrQeBAOfPNtxNe3avlT7057zQVcVG/R5EnUc
         sxyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=YZPu34XNvTgena9ZGCQIzvogObA2r0z/Izu4qbnACXg=;
        b=ZXvFoxIdQdLyCi2ZB0DNi4aLZACFGz1u2GfgR3j326v5SspeH7IUZ1YWyseFUfPNvx
         Li2oHtYQ4eiwXEpZauOkOABkzN7ezdAzOQpCrgw3k+1zbfg/P+mPQV6vMpU2ZVex/KWd
         h++0pEP55YVDAN+4IGIRdE7SE9YmJuCLZL97C7A1KvTxf5w8sGYKNB7P2ZgMilHoCS1z
         Uz60ltsuDzYptgcQPoTpbQ1xgxB/yas5LNROJZLbabAcRoLECwNyE2SkBX5xqwZiHsFS
         SwWZy/84sKZoeupBT1ka3Qdo1OVHCozHL3MpvJFYkgx/8Em6STLKQzWGv+XS4vfrcwKv
         C7oQ==
X-Gm-Message-State: AOAM531+QPootFTylTrHswWSEPIU42kcA/gGGEsQAGahP2GKonQ24AUY
	oZ9v+8I/ueij8ebMLjuOyIVQYrPRZ5KfTAsG/z2AE88orCXcSA==
X-Google-Smtp-Source: ABdhPJxKdyoGxo7lfk1IT5rrswvUBVR3zNCqSgvkqXb/CVafl4JFWJDINdB80CWwHp6a5GykDSUloRfXZWkhEPovkhA=
X-Received: by 2002:a9d:a42:: with SMTP id 60mr25875795otg.179.1638710641132;
 Sun, 05 Dec 2021 05:24:01 -0800 (PST)
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 5 Dec 2021 14:23:49 +0100
Message-ID: <CACRpkdZuDPLj5Tcxbyd+JGfvBGQ8RuMP9PAsGsZT7pY8KoyOKg@mail.gmail.com>
Subject: [GIT PULL] Ux500 DTS updates for v5.17
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi SoC folks,

the following are two small DTS updates for the Ux500 device
trees for v5.17.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
tags/ux500-dts-v5.17-1

for you to fetch changes up to 11611eecb8aa1ab07f78e9bf0f2d8c40188e7826:

  ARM: dts: ux500: Fixup Gavini magnetometer (2021-11-23 23:01:41 +0100)

----------------------------------------------------------------
Ux500 DTS updates for the v5.17 kernel series:

- Add reset lines to applicable IP blocks
- Fix the magnetometer in the Gavini device tree

----------------------------------------------------------------
Linus Walleij (2):
      ARM: dts: ux500: Add reset lines to IP blocks
      ARM: dts: ux500: Fixup Gavini magnetometer

 arch/arm/boot/dts/ste-dbx5x0.dtsi              | 26 +++++++++++++++++
 arch/arm/boot/dts/ste-ux500-samsung-gavini.dts | 39 +++++++++++++-------------
 2 files changed, 45 insertions(+), 20 deletions(-)
