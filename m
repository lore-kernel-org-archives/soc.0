Return-Path: <SRS0=RulI=S2=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E39E5C433F5
	for <soc@archiver.kernel.org>; Fri, 11 Feb 2022 21:56:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A9971C340F0; Fri, 11 Feb 2022 21:56:10 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E95E4C340EE
	for <soc@kernel.org>; Fri, 11 Feb 2022 21:56:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E95E4C340EE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f173.google.com with SMTP id p19so28856863ybc.6
        for <soc@kernel.org>; Fri, 11 Feb 2022 13:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=xbC8/7zZWapRlMhxc2uy/RGvYp+XdXMtARtmdnMzDko=;
        b=UMIPLktwVly4/dKO4qBxwne9yLdX0J7KcY62hWul6m7LNBdubrHEk6frSMBbjOxhLm
         j6eogfipfceAuMq/sXvkPq4HR/CwVSwCpw2+7DvG04NnHvnQCsMOuIQy+r/EWOCM+V3B
         St8kkzQNgN/gExUuAgGzvWGTkAKpW0SwznGwyLsIf20fWbBrsqpB2iBujCJYqWvvcoxw
         +9tGDX0BpvLW2wGXBX988r5r6xbIO5mzZbHv7yPgvq3GDJ27mZQe0a1OdEc6OK+4c0CT
         Z2kuCK4oa6krGJB8aetAddlo8KnYi8fpbq/UvLeVTmda7+jFJACCOZrUn8FqX6IjYyGw
         PMQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=xbC8/7zZWapRlMhxc2uy/RGvYp+XdXMtARtmdnMzDko=;
        b=haIQgkgMrdboez01T5qF8fBLukzC5BUNl/HTxwekS7f3DAsolBwBS4uxjMBwp5/oKf
         V8y0rmVe89d6GdXhyKqeWCg+rNSVY1Ao+WD5hN3b5s0yQknxq0bMoJ00O/l9oUg/GBnc
         rY15q90h9N0RCW9ckR0Pze2YQdRZr8Dyx63/4aXq2qZziCFROIt1oyHjk5D7GUr2FAe0
         85KR07JhEfARf+OdcNSxcXsd6cZvUFw/ZY+HVdI2ZUGiUk/tpd+TlKww7NbAJjm5uYR1
         9OPj4Rd/PLDRf+pjVyq9vA3i5HfTsM3JXX11rd5IEQ3Yh1/NC+kd01tGm5U4ZLsyhqab
         2c/A==
X-Gm-Message-State: AOAM532dONKI+XuSIOIjrZ3Q+3YSsqtD3DfDFagXrYPu8eJ4mLp20AzR
	HLNpDtCBxMqpyTw9YugoKfcthmUPBdQbX5b1a8Tw/BUdW2zna4MG
X-Google-Smtp-Source: ABdhPJxFqmAA5cF9bgGVu/y84+bz0XyyWfxPXm61+0goSii5Z9udZ6KNK+0W2BrYds5qH+lGxDkWD+ZTfiHBFpqU52E=
X-Received: by 2002:a25:30d4:: with SMTP id w203mr3367369ybw.511.1644616568754;
 Fri, 11 Feb 2022 13:56:08 -0800 (PST)
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Feb 2022 22:55:57 +0100
Message-ID: <CACRpkdaDcEqtSnWzRBnBHVweh2n=Dj3meHG9LND+K0Czb9ORGg@mail.gmail.com>
Subject: [GIT PULL] Ux500 DTS updates for v5.18
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi SoC team,

please pull the following Ux500 DTS-related changes into the
SoC tree for v5.18! Details in the signed tag.

Yours,
Linus Walleij

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
tags/ux500-dts-v5.18-1

for you to fetch changes up to cbc72c0f2713772766e1a6d5f9c7375ed4506447:

  ARM: dts: ux500: Correct Janice accel mount matrix (2022-02-11 22:49:26 +0100)

----------------------------------------------------------------
Ux500 DTS updates for the v5.18 kernel cycle:

- Add battery thermal zones so we can monitor the battery temperature
- Enable charging options on AB8505
- Fix up all the AB8500 and AB8505 nodes in accordance with the new
  schema.
- Fix the mounting matrix for the Janice phone.

----------------------------------------------------------------
Linus Walleij (4):
      ARM: dts: ux500: Add battery thermal zones and NTCs
      ARM: dts: AB8505: Enable charging options
      ARM: dts: ux500: Update AB850[05] nodes
      ARM: dts: ux500: Correct Janice accel mount matrix

 arch/arm/boot/dts/ste-ab8500.dtsi              | 39 +++++++++++++-------------
 arch/arm/boot/dts/ste-ab8505.dtsi              | 34 +++++++++++-----------
 arch/arm/boot/dts/ste-href-ab8500.dtsi         |  2 +-
 arch/arm/boot/dts/ste-href.dtsi                | 25 ++++++++++++++---
 arch/arm/boot/dts/ste-snowball.dts             | 27 ++++++++++++++----
 arch/arm/boot/dts/ste-ux500-samsung-codina.dts | 22 +++++++++++++--
 arch/arm/boot/dts/ste-ux500-samsung-gavini.dts | 22 +++++++++++++--
 arch/arm/boot/dts/ste-ux500-samsung-golden.dts | 22 +++++++++++++--
 arch/arm/boot/dts/ste-ux500-samsung-janice.dts | 24 ++++++++++++++--
 arch/arm/boot/dts/ste-ux500-samsung-kyle.dts   | 22 +++++++++++++--
 arch/arm/boot/dts/ste-ux500-samsung-skomer.dts | 22 +++++++++++++--
 11 files changed, 203 insertions(+), 58 deletions(-)
