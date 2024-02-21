Return-Path: <SRS0=MIRM=J6=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A736C54788
	for <soc@archiver.kernel.org>; Wed, 21 Feb 2024 22:35:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5FC00C43399; Wed, 21 Feb 2024 22:35:34 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 58F65C433F1
	for <soc@kernel.org>; Wed, 21 Feb 2024 22:35:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 58F65C433F1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6083befe2a7so39133597b3.0
        for <soc@kernel.org>; Wed, 21 Feb 2024 14:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708554932; x=1709159732; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qNNPLiMZIvFIjbJatWBpQjhrqg62von28N3bY5RLgJw=;
        b=Bdpio+2Fr9acwn75FVhSG2nMsFA/6AVYmXEb4oVmcyQb5JVZ//b4VgFEYVOHuV4oLX
         2q+r/Wpgnitlgh9JEjmd87Cnb1x/mjDvVBSk52xCUDaEPzwPPKa+W+YagoImw0YKCLKY
         lBg2Wto5fg1uLaWeGlz1rnjAVUfB8wn/1Ypw/LUyfwLF24KsSbhP3KDsEeIpGeTyTp0S
         QaHxKUeGNy+xu6raZbXhdB/BMDzyPcheXznHnwcJJqLiwGiK7UDPkGgozbBBt2sWMvAg
         kz6agXKpcx80Wdj9UoJZRZ7dj5e0HD7rNmhFngIt4Ms4jBboGNgu4awT4IVhEGtHJIrI
         xpcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708554932; x=1709159732;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qNNPLiMZIvFIjbJatWBpQjhrqg62von28N3bY5RLgJw=;
        b=QCQRqVjArevobxzgXyXngHOQXlPsm3maReDN4l/k5QDtVQdMIEvM2Sj3kfdGhQbZhM
         f8Av3io79f6+xyU0lfednDy3TTOSIgu2o/uJaiCgz3qxhLm/srdqOq/KKFOs+MDFO1eS
         UaIrx1viTFl0qwfvy+lRKGoCezRey+CzlVpWBAL1OC8RUwftSds+0kxT6QJjZdExCvw1
         nfqjfDBmVaNm4ptbXPFIT8ucScrXIG/SyKLJU3jNokCU8mkpq9XGHglVj88iUFvrWPXC
         MyEdzrl882fpZmV62wC5yKucfZ2Chu0QE9NYTVocOungd3bsGEn0ulk9F3xz1v5PihCS
         ZOPg==
X-Gm-Message-State: AOJu0YyKVA6Iuj5uELLEBLsV7WrniQqfPLoASG0PVdlHZAvdY8yGZ/zI
	qgX2mv8tmuKd3S1h7nfm/+QOmka1W3YXZmRgswXKCsVXrzI5gWjnvf1EZkuYAhQMwSGXdaya1B6
	GHwzv/4ypxQlogdAyKcpjrFdjqFbyNIkyzkyUu8PdfUnOidT7ATc=
X-Google-Smtp-Source: AGHT+IGknbpBLSxyew4UhqhWjPXNMdg9iwJqqtQkNhyq8ojF5dQz8R4Rh6Hb2XFOnuzvIBE07OoChR/hOy428ypk1IU=
X-Received: by 2002:a05:690c:c16:b0:608:1be7:6e5c with SMTP id
 cl22-20020a05690c0c1600b006081be76e5cmr12137179ywb.49.1708554931207; Wed, 21
 Feb 2024 14:35:31 -0800 (PST)
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 21 Feb 2024 23:35:20 +0100
Message-ID: <CACRpkdaL6j6OdixHFHoMms4e=tXEw_6ynBMFb6m8=7KkVgEedA@mail.gmail.com>
Subject: [GIT PULL] ARM Versatile DTS fixes for v6.9
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"

Hi SoC folks,

these are some ARM Versatile DTS fixes for v6.9.
Details in the signed tag!

Please pull it in.

Yours,
Linus Walleij

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
tags/versatile-dts-v6.9

for you to fetch changes up to d41e4dfc316bbd9a4572df26f0d740d6cc685de1:

  dt-bindings: arm: realview: Spelling s/ARM 11/Arm11/, s/Cortex
A-/Cortex-A/ (2024-02-21 23:30:01 +0100)

----------------------------------------------------------------
DTS fixes for the ARM Versatile boards:

- Use the "mtd-rom" compatible for the Realview ROM
- Fix up two VGA connector cells and labels
- Fix up the Cortex spelling

----------------------------------------------------------------
Geert Uytterhoeven (2):
      ARM: dts: arm: realview: Fix development chip ROM compatible value
      dt-bindings: arm: realview: Spelling s/ARM 11/Arm11/, s/Cortex
A-/Cortex-A/

Linus Walleij (2):
      ARM: dts: versatile: Fix up VGA connector
      ARM: dts: integrator: Fix up VGA connector

 Documentation/devicetree/bindings/arm/arm,realview.yaml | 6 +++---
 arch/arm/boot/dts/arm/arm-realview-pb1176.dts           | 2 +-
 arch/arm/boot/dts/arm/integratorap-im-pd1.dts           | 3 +--
 arch/arm/boot/dts/arm/versatile-ab.dts                  | 3 +--
 4 files changed, 6 insertions(+), 8 deletions(-)
