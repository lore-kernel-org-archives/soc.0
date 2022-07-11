Return-Path: <SRS0=fVYF=XQ=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74ABDC43334
	for <soc@archiver.kernel.org>; Mon, 11 Jul 2022 08:11:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3864EC341CA; Mon, 11 Jul 2022 08:11:32 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5F77EC341C0
	for <soc@kernel.org>; Mon, 11 Jul 2022 08:11:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5F77EC341C0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-31c89111f23so41517437b3.0
        for <soc@kernel.org>; Mon, 11 Jul 2022 01:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=mndZJna0iGt+5GGBdAG9aRx23s8at6jbdvXdUOdtfE0=;
        b=MOg8kA+Yxg384ZFFK3qlxA8gRqkG2ttnouSWC1uATLOAVb1XD5Cxw48JcwsZGbvCzf
         UaW4+QQr36kcRP6HpxqDNkc9/753IECr/inE8P1AAPH4m9VmVZxA9DMnHsdoL87WK/pZ
         7zQwayx38+IKAXqmSWHy0HO0SKoJC4cWjXG+FetnUgo45dekWqCkm3gFNL8VzutjDEEp
         T0JNMhN8VmOr/X1PoxcDxR+39jAxpXiLi6rPBWIZk6j+TVi6m5KuwrYXSKN0yNc5NgaH
         DtaTpphVvXg/U7DRs2MsT5bsNQ2UPLzRTR4yf9nFVuoLi/GVhjOqxld4iqjPlgdCk7Ak
         ev8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=mndZJna0iGt+5GGBdAG9aRx23s8at6jbdvXdUOdtfE0=;
        b=FA8+yogODfpriC1hfIxmu+XARAM8poXcIo5NHiVVswrO1FFRD5DOvKGNG5/79/Dn9i
         Xst/SmJqJE/8Dzt7QIgSoKSLvx0H8N4K6ujHk/V3FX0IO6x/ydDjQCmGQRQ5XnnI9IFv
         FEUJ8XNDtpnSrx7k0Mo+lbsi+F9948Xxhw4zCG/xWZejtAw4lCHSS8UWxA651o5p+Gfn
         egaGsxgas7/lQzC1lOnopPgMN756ZouMDv+Zhx2XsuyBAgRdo9lOQ4plEu8veAKKOeP1
         vIvcnXrgUajbt5g68Ob1jZJXv/mIe0jBNDwSs8HsytEfg1/w7tC2RL1vF2UnIivJD89y
         QD7A==
X-Gm-Message-State: AJIora8YhKIYRABZOtJ03jpT4sizzEl2nVTmhFFI+PJZSNUTNdth92M7
	LXjfisWvZol1pBKQGlrrouCYuxVyPH9FnY4RGsReozxTQI0/3w==
X-Google-Smtp-Source: AGRyM1tVOhVi7iH1Zp327FfOYfwy79gbXZJz76ncwN4JkmQAnUl9j2DI3smQ7sTNtKYaU7pJktih1ZaO+6E/DEbzjL0=
X-Received: by 2002:a81:cc4:0:b0:31c:839c:7e27 with SMTP id
 187-20020a810cc4000000b0031c839c7e27mr18511166ywm.151.1657527090041; Mon, 11
 Jul 2022 01:11:30 -0700 (PDT)
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 11 Jul 2022 10:11:19 +0200
Message-ID: <CACRpkdZh8GdZzGsJ=h_E8RPgAHX8HqXs1871w95TVZD0SXHbkA@mail.gmail.com>
Subject: [GIT PULL] Delete two DaVinci boards
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, Sekhar Nori <nsekhar@ti.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"

Hi SoC folks,

two patches deleting two unmainatined DaVinci boards.
The patches describe how I tried to update these boards
but there is no interest in that so now I am deleting them
as unused and unmaintained,

Please pull it in unless the DaVinci maintainers step in
and says no.

Yours,
Linus Wallej

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
tags/davinci-boards-delete-v5.20

for you to fetch changes up to b4aed01de48652928c8299f793625936f14d1739:

  ARM: davinci: Delete DM646x board files (2022-07-01 14:10:20 +0200)

----------------------------------------------------------------
This deletes two unmaintained DaVinci boards.

----------------------------------------------------------------
Linus Walleij (2):
      ARM: davinci: Delete DM644x board files
      ARM: davinci: Delete DM646x board files

 arch/arm/mach-davinci/Kconfig             |  44 --
 arch/arm/mach-davinci/Makefile            |   6 -
 arch/arm/mach-davinci/board-dm644x-evm.c  | 928 ------------------------------
 arch/arm/mach-davinci/board-dm646x-evm.c  | 873 ----------------------------
 arch/arm/mach-davinci/board-neuros-osd2.c | 238 --------
 arch/arm/mach-davinci/board-sffsdr.c      | 151 -----
 arch/arm/mach-davinci/dm644x.c            | 765 ------------------------
 arch/arm/mach-davinci/dm646x.c            | 726 -----------------------
 8 files changed, 3731 deletions(-)
 delete mode 100644 arch/arm/mach-davinci/board-dm644x-evm.c
 delete mode 100644 arch/arm/mach-davinci/board-dm646x-evm.c
 delete mode 100644 arch/arm/mach-davinci/board-neuros-osd2.c
 delete mode 100644 arch/arm/mach-davinci/board-sffsdr.c
 delete mode 100644 arch/arm/mach-davinci/dm644x.c
 delete mode 100644 arch/arm/mach-davinci/dm646x.c
