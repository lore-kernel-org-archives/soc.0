Return-Path: <SRS0=cWTr=5W=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 485A5C54E94
	for <soc@archiver.kernel.org>; Wed, 25 Jan 2023 21:43:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 044A6C433EF; Wed, 25 Jan 2023 21:43:21 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 01585C433D2
	for <soc@kernel.org>; Wed, 25 Jan 2023 21:43:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 01585C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-4fda31c3351so254225917b3.11
        for <soc@kernel.org>; Wed, 25 Jan 2023 13:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RkEzgOp5cexhcFMF9iOQ+m4oI4xFucW6voNny2ZuExw=;
        b=uqfhWwPTUwdBWcLCvM0JKSUdwHooH6KUj+hAbqKeGLCXg1zsBXqOB2gjr116uwNArz
         4guQAitor68aJTt2eRxXrz2uzwlydhdZIq+gK13gfW2rTO4GUMqgkRx4a7xknSuVb/ri
         VvL0a9MA1wZu/sjct4I/KGfE4ninypumZ4dPNC10svSkGwwz1aBKQxVDIfN0xSeAr2E4
         CW/vrEcfRz2xUSyBU+Nf18IEBOUtDEGz/NA7uly/oFB9lPInUb/zyEi2QUxNVZQcXE/x
         qX0J5YLh0l+iGDYbTr1MV3eVHPZ/TC0m//E+/BtXaKgRI2eKwa91SzoyrCnnFc5WJLGi
         yFJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RkEzgOp5cexhcFMF9iOQ+m4oI4xFucW6voNny2ZuExw=;
        b=Xx6z4GLCfhq5UQ9xHuWkuN4i5jneRfJSgV331e72glPxTuZ7sYcwVmveymCKRoZTES
         +WfvkHINNomFU9DQsXVCWenjL4lGChxW3I+12Rt6MeUGCWaV6578o5rI4vGBe8sKEEbT
         H6Q85nsU2RbM4umgZPIU5bjTskYUnobwaNdI9yLAOB0bghJUhgn0OZpBsD0/ncyD9F3J
         HvEmI6/1SaFpE/zmvNWr4Sqq0Bx1OqcEgAxEVFFjnst6bcMwQ1mIcrExoK4XxpOnZkNs
         v4PicGXSZJueGfGmIvZOibGLnOFUO2ewAXnKdrnxxzx2SGxTDrC82bfj/ScW9jFiEu5q
         ysPw==
X-Gm-Message-State: AFqh2kpDPWaI1W6xpKzNCCZn+x1/qLPhAqUbQ/b5jml0Onl0fSQlR8fX
	kxwJ2Exixauu1RsIQ8n6jRcF5RFm59WCcSLLZEPx6z0Nemu5AlG7
X-Google-Smtp-Source: AMrXdXvyf/tIhI2i73QEgBZSsbBFNRG1pR7Jg8mEeTOiwbaPPRQZqRhxyjFom+8TOnKus+ZSAn5pibRpjkpA3c1TVOs=
X-Received: by 2002:a05:690c:39b:b0:4f3:8d0e:edce with SMTP id
 bh27-20020a05690c039b00b004f38d0eedcemr2910280ywb.185.1674682998780; Wed, 25
 Jan 2023 13:43:18 -0800 (PST)
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 25 Jan 2023 22:43:07 +0100
Message-ID: <CACRpkdY24Lv0F3ct2R6ALPpAdxWz_vEjrPAGNSF3pcoOj-Xqcg@mail.gmail.com>
Subject: [GIT PULL] Ux500 DTS updates
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi SoC folks,

here are some minor Ux500 DTS updates for the v6.3 kernel,
details in the signed tag.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
tags/ux500-dts-v6.3

for you to fetch changes up to ddd932e45ec761996219b9efceb9fd5445bb3ab3:

  ARM: dts: ux500: Add clkout-clock node (2023-01-06 00:28:21 +0100)

----------------------------------------------------------------
Some Ux500 DTS updates for the v6.3 kernel:

- Add the embedded eSRAMs to the device tree

- Fix up LED node names

- Add a clkout-node for the external clock

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      ARM: dts: ste: align LED node names with dtschema

Linus Walleij (2):
      ARM: dts: ux500: Add eSRAM to the device tree
      ARM: dts: ux500: Add clkout-clock node

 arch/arm/boot/dts/ste-db8500.dtsi |  4 ----
 arch/arm/boot/dts/ste-db9500.dtsi |  4 ----
 arch/arm/boot/dts/ste-dbx5x0.dtsi | 21 +++++++++++++++++++++
 arch/arm/boot/dts/ste-href.dtsi   | 12 ++++++------
 4 files changed, 27 insertions(+), 14 deletions(-)
