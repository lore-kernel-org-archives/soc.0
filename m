Return-Path: <SRS0=emAv=I5=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81CFBC433ED
	for <soc@archiver.kernel.org>; Wed, 31 Mar 2021 13:15:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5841F61981; Wed, 31 Mar 2021 13:15:45 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE0866196C
	for <soc@kernel.org>; Wed, 31 Mar 2021 13:15:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE0866196C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linus.walleij@linaro.org
Received: by mail-lf1-f48.google.com with SMTP id m12so29080870lfq.10
        for <soc@kernel.org>; Wed, 31 Mar 2021 06:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=ffMHx/w3qoLWyJ1HxMIYLOz2/5g7xRocjYfRzqH5Slk=;
        b=XZdcOhJRghcHgqYTfJdH2BU1nkpxvYmuVVLDtp8WByRtZ5yEcZpwV5O/CwjxwRYWbU
         Usv5R7RlW+bw52j4ag3iVlvy3UT+8VvP+cmSeEedHW3tPPEFFFbGwtLLyRnM4WvcZ7hc
         IWIXXc7xz3/hnmNvsfwVVKVW/Nil7R2t1+ZM3pManVRmtJ+XlI05twaxwft7K/0h3hCr
         XckjNRhyYz/Bv/BC75UgAwK0vK9awo/KOsGCeTIhPT63J+16Pudq4WWM+V8o87b8ZG4q
         EQozVVmDCSHHUpmRMuomKKTd+RjzMD3HiJc9lg0Vq/OoPvCcWl9NqXChsfkSKzvP0ZAA
         GxrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=ffMHx/w3qoLWyJ1HxMIYLOz2/5g7xRocjYfRzqH5Slk=;
        b=DcCW2+GmFdx3tuUHgpJIdjsrGfdEM8l3cyk7QtbrDIQqOJx6MAF/uzhjkHyzJsri0O
         DI33ujGvqV1iR+29kjjGtISQoHWYkaoGKM80lPY3pma1n69q1Mal3yvveTtkEZZNp34w
         M79QM+px+R1nz1hnxcQss6BeXAb3bo9EJg+9IRQai5r9efxVfaLOH8wjtxaSKIiOnnM7
         4EIYMXkOYcgicrUXTRWAzD1cbYghRUKdqdfW2CQC7FrvnD5hy2E8cgu9LPK5tLB/SC/J
         ig50F/7zJRHnPazpda+lQ7MsZ9QiLux1D4/dXW7Yc2VCblvQn4vQtjTXmj1TGNdm6jGf
         nHUw==
X-Gm-Message-State: AOAM530dwsH/JdCHI6F5Cr3iWrN7Dsp67KcF3uVq1aZFCK3k72L0TwDK
	zOvA8Oa/SorQKXso1dYOIHpQBkInwXB5wMiASksDXycigJ3rR6C5
X-Google-Smtp-Source: ABdhPJwaXY2Zz4DM0em7kHXdwm6056yIlIE+c+sOInOTJtg8WM3jBplMp00Kt7Pe9nM/1KrHubC3CcLboYa+1iFhC2M=
X-Received: by 2002:a19:343:: with SMTP id 64mr2135995lfd.649.1617196543019;
 Wed, 31 Mar 2021 06:15:43 -0700 (PDT)
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 31 Mar 2021 15:15:32 +0200
Message-ID: <CACRpkdanRQ6A85d=7vgpzbg-m3-yFcpQ4fuzrxZu3RJ0DrA2bQ@mail.gmail.com>
Subject: [GIT PULL] Ux500 DTS changes for v5.13
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi ARM/SoC folks,

these are some Ux500 DTS changes for the v5.13 kernel.
Please pull it in!

Yours,
Linus Walleij

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
tags/ux500-dts-v5.13

for you to fetch changes up to fa99edd84feacc3c5609fbc51744c37d33a2c65a:

  ARM: dts: ux500: Add Cypress CTTYSP touch to TVK UIB (2021-03-30
11:34:50 +0200)

----------------------------------------------------------------
Ux500 DTS changes for the v5.13 kernel cycle:

- Fix up the WLAN on Janice
- Fix the touchscreen on TVK R2
- Push down definitions to the UIBs instead of
  trying to share too much.
- Bump the AUX1 voltage on the AB8500 so the
  touchscreen will work.
- Define the CTTYSP touchscreen on the TVK R3.

----------------------------------------------------------------
Linus Walleij (10):
      ARM: dts: ux500: Fix BT+WLAN on Janice
      ARM: dts: ux500: Fix touchscreen on TVK R2
      ARM: dts: ux500: Move Synaptics to right include
      ARM: dts: ux500: Push sensors to TVK R2 board
      ARM: dts: ux500: Fix up TVK R3 sensors
      ARM: dts: ux500: Push TC35893 defines to each UIB
      ARM: dts: ux500: Totally separate TVK R2 and R3
      ARM: dts: ux500: Clarify UIB version per board
      ARM: dts: ux500: Bump AUX1 voltage
      ARM: dts: ux500: Add Cypress CTTYSP touch to TVK UIB

 arch/arm/boot/dts/ste-ab8500.dtsi              |   4 +-
 arch/arm/boot/dts/ste-href-tvk1281618-r2.dtsi  | 214 +++++++++++++++++++++++-
 arch/arm/boot/dts/ste-href-tvk1281618-r3.dtsi  | 210 +++++++++++++++++++++---
 arch/arm/boot/dts/ste-href-tvk1281618.dtsi     | 218 -------------------------
 arch/arm/boot/dts/ste-href520-tvk.dts          |   4 +-
 arch/arm/boot/dts/ste-hrefprev60-tvk.dts       |   2 +-
 arch/arm/boot/dts/ste-hrefv60plus-tvk.dts      |   4 +-
 arch/arm/boot/dts/ste-ux500-samsung-janice.dts |  48 ++----
 8 files changed, 419 insertions(+), 285 deletions(-)
 delete mode 100644 arch/arm/boot/dts/ste-href-tvk1281618.dtsi
