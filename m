Return-Path: <SRS0=jMxD=LE=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C8BCC48BDF
	for <soc@archiver.kernel.org>; Thu, 10 Jun 2021 22:23:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2FBCB61403; Thu, 10 Jun 2021 22:23:32 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0727B613F1
	for <soc@kernel.org>; Thu, 10 Jun 2021 22:23:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0727B613F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linus.walleij@linaro.org
Received: by mail-lj1-f174.google.com with SMTP id e11so6954619ljn.13
        for <soc@kernel.org>; Thu, 10 Jun 2021 15:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=upPFWARj1vHFZRQDqKP9hbOCIWJSnJnB+X/H1bZtVZg=;
        b=g45/6eODNvJclK52BVGTTwaCQ4UNflJcKE+AuAReDKd8eph+m6ltQYmKB59c5igYZL
         1gD0Yjjv57p0Z/7X6/qveb4gFGHjdkb0l8OYOdj8KOoJn09BsHLFteUDOWmlKFZsQ61p
         xcMlHi8cIkeaXaOm2i/9niGGoC5EJclbJdQBNk0ns0zzgU5E1SuemWZAMAxyUTmdc4N7
         IJmrh7xfSRoQaA3IvdYUfhvAtn8xf1dO+oFX8XNE/0xT8tYdAvFSjTFJHJkuVIciN/FN
         ktyIlH3sV8kBOoTEKCWAIaroKVW7tQWEMTGzfRFkIJIwP6NTxldeODZq4km93jhQXITD
         oKMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=upPFWARj1vHFZRQDqKP9hbOCIWJSnJnB+X/H1bZtVZg=;
        b=VMBhkcgEiVk2T5O6mrS5y1By/yP83z06Bn+PP+9BnYZIUN+h79c0tllKsjHzeIl2CE
         b//pTExMezp8Y3/hL1mHwcRZKa/oEKbygNCXjZ3Nj75j5F77gOvSnWqb0a6hHq+jDtq8
         wuSvM9fzkN+uQoUuAWpMM91RJySShLK5FCOCTfoFtTq+aZJsUjP73D5YYhXxmP2f/HLr
         5usbZdHQbn7tBsT7F3KUrLfLH36isJhxkq31wOltWQySLSVyFZxUkmYKwICdGWkCACAH
         JysjUgh8DM8QgUEK4qhYdqgCQ59O6oAlBVKDc70bPMSOg72DlsPj03wlmb1isxI7FOV9
         y9bA==
X-Gm-Message-State: AOAM532Wo4c3BMwjogyk4YZfAx7kr23Zfv+uJRC2isQbobsiXs9fiERX
	/Cwef9UsxbeCrr1AZV2bdo6uvm8/sk7oT/cul1pE/ZgwYbapUQ==
X-Google-Smtp-Source: ABdhPJx5i3to20WSxsPuB0EMWt578arivcS9fjm0W2+N5fF7i+MzOS7H+lQYCH1VimMHY+ePknYf1mp/34cFgGAAwkU=
X-Received: by 2002:a05:651c:1057:: with SMTP id x23mr529393ljm.467.1623363810175;
 Thu, 10 Jun 2021 15:23:30 -0700 (PDT)
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Jun 2021 00:23:19 +0200
Message-ID: <CACRpkdYh9kZJU6PAxghPRGBco_61wRZgUnTZr_3qvySPCo5rBw@mail.gmail.com>
Subject: [GIT PULL] Ux500 DTS changes for v5.14
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Sebastian Reichel <sre@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi SoC maintainers,

here is a collection of DTS changes for the Ux500 platform that
have been circulated on the list, please pull them in!
Details in the signed tag.

Thanks,
Linus Walleij

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
tags/ux500-dts-v5.14

for you to fetch changes up to e409c1e1d5cb164361229e3a3f084e4a32544fb6:

  ARM: dts: ux500: Fix orientation of Janice accelerometer (2021-05-24
01:19:27 +0200)

----------------------------------------------------------------
Some Ux500 DTS updates for v5.14:
- Fix interrupt cells, GPIO controller node names in accordance
  with new YAML schemas.
- Add proper compatible strings for Broadcomm Wifi and BT.
- Fix upp and add some mount matrices for accelerometers so
  e.g. UI:s work as they should.
- Drop the DRDY pin assignment for a non-existing pin on a
  magnetometer.

----------------------------------------------------------------
Linus Walleij (5):
      ARM: dts: ux500: Fix orientation of accelerometer
      ARM: dts: ux500: Drop drdy pin assignment from magnetometer
      ARM: dts: ux500: Fix some compatible strings
      ARM: dts: href: Mount matrices for TVK R2
      ARM: dts: ux500: Fix orientation of Janice accelerometer

Sebastian Reichel (2):
      ARM: dts: ux500: Fix interrupt cells
      ARM: dts: ux500: Rename gpio-controller node

 arch/arm/boot/dts/ste-ab8500.dtsi              | 28 +++++++++++++-------------
 arch/arm/boot/dts/ste-ab8505.dtsi              | 24 +++++++++++-----------
 arch/arm/boot/dts/ste-href-ab8500.dtsi         |  2 +-
 arch/arm/boot/dts/ste-href-tvk1281618-r2.dtsi  |  6 ++++++
 arch/arm/boot/dts/ste-href-tvk1281618-r3.dtsi  |  4 +++-
 arch/arm/boot/dts/ste-href.dtsi                |  2 +-
 arch/arm/boot/dts/ste-snowball.dts             |  2 +-
 arch/arm/boot/dts/ste-ux500-samsung-golden.dts |  3 ++-
 arch/arm/boot/dts/ste-ux500-samsung-janice.dts | 11 +++++-----
 arch/arm/boot/dts/ste-ux500-samsung-skomer.dts |  3 ++-
 10 files changed, 47 insertions(+), 38 deletions(-)
