Return-Path: <SRS0=QfHf=Y4=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61E95C3F6B0
	for <soc@archiver.kernel.org>; Wed, 24 Aug 2022 22:22:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 14D22C433C1; Wed, 24 Aug 2022 22:22:59 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 989F9C433B5
	for <soc@kernel.org>; Wed, 24 Aug 2022 22:22:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 989F9C433B5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id w20so8082652edd.10
        for <soc@kernel.org>; Wed, 24 Aug 2022 15:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc;
        bh=+BMgjgzGOXgGsMIfSAXBTJaYENdE9nKFfILcBfbOuCA=;
        b=AQ/yn6RPiLKCRemOfgnjvszYZm62R/RsYu7CssIMdoiSpMPhNvsSLJD3WXEbMkmY5R
         UuFjSpushiRED2NyGO8AdEKEQH0xdKN1QltGyYeGtE+aoqOVHRKB2iuveud4RCidlAYi
         6A0gJedbZaCudIuVXTTYJFe/Dl8KN2Ayc+VgqNpM+Z4L5yFFMV4Da71NDm64bFQGiScB
         A6o0cqlSTcIpegpR/qum6dfYgvYS9KsAPNj9wS4pvARA6A/a1NP7LhyhiDA1FxWoljbg
         02sfnAXxdtu5Kri3xtDUziYDLxjONmOfLZ5l6e9Zkxsw/iUDL3cNWnGgmgwSJaZ+H/kW
         XR+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc;
        bh=+BMgjgzGOXgGsMIfSAXBTJaYENdE9nKFfILcBfbOuCA=;
        b=q9oLZ9up0KMaWAg43nB4AEEf0YpnSd8QBk7FDn9VO6j7myWOZeRvOTl4GoTktvc9FZ
         9uWghx/6g6CO04cMMw3mWD0pQRlj2VCy9AVgOGl6loQhUzvUumZADA7zSRmwzbrgPKyN
         eyFt8lK+aqPyzqPrh5wfLQ/lykDJNuyr+zU0KF3fP8hTbcXEtbdTtA0FUOL8ePa9fYoU
         a+7RwBvTPR5aILFMfWiEd5s2wyP8g8a/7JYcgD4J/xEqmI6rvlzUXrTtIVamc38yhb+P
         tzWXUIp6yF5KoGPyWJW1yUokbX7g6sbyLajD26S8CDEA/b8bf7UmKATvhhRWBe57xt2Y
         q4IA==
X-Gm-Message-State: ACgBeo0ayZs5t1YoG0VunmuoCh+xaFe9isahFzXB+yK2AnoZK3ekFrgp
	aFBfIrP4rKgUo4/if1mfONg6HeXzcrKamMV0NxgSfW0gb3wUaHhE
X-Google-Smtp-Source: AA6agR5uiWqqNOP4zx5N0xqu3f75ZK3nS7D3KG/76pkgbEAkFFQmJpxqz8fMQJFoWM8KPmmHT7fL3cRvPHc4xnMmVBE=
X-Received: by 2002:a05:6402:50d4:b0:447:85f:52d5 with SMTP id
 h20-20020a05640250d400b00447085f52d5mr860237edb.205.1661379775497; Wed, 24
 Aug 2022 15:22:55 -0700 (PDT)
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 25 Aug 2022 00:22:44 +0200
Message-ID: <CACRpkdZfTe8NSGR2ZCkn-1JcNobjfWeXqajSqcJMp8+WtY+2Xw@mail.gmail.com>
Subject: [GIT PULL] DTS fixes for the Versatile family
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, 
	Kuldeep Singh <singh.kuldeep87k@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi SoC folks,

these DTS fixes for the Versatile family missed the last merge
window because I forgot to send them.

Mea culpa.

Please pull it in for v6.1!

Yours,
Linus Walleij

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
tags/versatile-dts-v6.1

for you to fetch changes up to 6c939e28b192075e1d3b9b267100a3dd9d6a7cf7:

  ARM: dts: versatile: Update spi clock-names property (2022-08-19
10:51:13 +0200)

----------------------------------------------------------------
These are some Versatile family DTS fixes, fixing some
node names and clock names related to SPI.

----------------------------------------------------------------
Kuldeep Singh (3):
      ARM: dts: integratorap: Update spi node properties
      ARM: dts: realview: Update spi clock-names property
      ARM: dts: versatile: Update spi clock-names property

 arch/arm/boot/dts/arm-realview-eb.dtsi    | 2 +-
 arch/arm/boot/dts/arm-realview-pb1176.dts | 2 +-
 arch/arm/boot/dts/arm-realview-pb11mp.dts | 2 +-
 arch/arm/boot/dts/arm-realview-pbx.dtsi   | 2 +-
 arch/arm/boot/dts/integratorap-im-pd1.dts | 4 ++--
 arch/arm/boot/dts/versatile-ab.dts        | 2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)
