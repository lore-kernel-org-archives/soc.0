Return-Path: <SRS0=vfwn=QX=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2EFCC433EF
	for <soc@archiver.kernel.org>; Mon,  6 Dec 2021 01:23:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B2098C341C6; Mon,  6 Dec 2021 01:23:38 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E768AC00446
	for <soc@kernel.org>; Mon,  6 Dec 2021 01:23:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E768AC00446
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f49.google.com with SMTP id x19-20020a9d7053000000b0055c8b39420bso11697132otj.1
        for <soc@kernel.org>; Sun, 05 Dec 2021 17:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=Wpq05oFc+WUrPeRMYVPrGjsqzOXQxIHmown7olOMIYc=;
        b=Ya8u2zujOukrAvWqvDKUEFtA9IJ642NhnUr0PP79bKmVHtiwyeA9VhO68t1MSD9tug
         jy1eqDt/1Erin1ef4Q2OSzxzfGW0sYFIpyyeSuImFpzGdbZCi+9kjgy8ITeN0+2vB83Y
         SutHvnSwrOITQWJZE2eaECIy0TWRqe/iYaryAmXiU5Rt1GiXGddWXsvZfcDoSytq+RlS
         aP44+RzWE66mh73KsrvtFfHXt6zjmwT+Y7GQ1UmtFqyzXLmB2rAQ9xcDsfueTZt03OqT
         GKgzHjddY2NZhxtmrK+Hoy0p4oGEJkNiNqp+5xjMy/tQFLPWw2j8EpeQSCN9b8X90gmM
         r+ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=Wpq05oFc+WUrPeRMYVPrGjsqzOXQxIHmown7olOMIYc=;
        b=mNMI22O9CGqT8gVFNBuhGmureX1xdAH5tlVtzn4Gs4ZhuaKzGq1bPa2dSJWFJlJFTl
         aA/bTmQwJBD7BxB4W6NXaox3WmzKOERjYQZcGejKkPKbcP7/gvm6jfj10Ir+L9o4wJSB
         f5ZfB6FSPchHsarZa9elealpq31SbgdEimJcMt1SCFtThoK7as+qW29v0kY/d6iDEB71
         ZoM46AS2+8BmVrDbcA2znNPqzSNH21P8eqwOdAW6hKULdpGIFvYQWDRD+XvHp2ZQTVuk
         FTuNutKr6Jtr4nfTRSkMLAeq5eQZA0tR2TM/1BylDuEy1d0uCXrKvaUTyfSqWNNszxPb
         Xt0A==
X-Gm-Message-State: AOAM532RpbV4vz+HaztHNpGyOIr7+DCmkuIKjbiqHj3Snuh0hIxyUPgV
	Y8r9OOrNulcOh0y9p/FHjy7pdCPx8Q2j+nEBHG+Gwah2bImsFA==
X-Google-Smtp-Source: ABdhPJybBS6CkYKKlCsdFN616kJV3apDHrOfoLh8dPo7o6L4V9V9X3MWmKqm4ZHYPb2je6S2nL2ZEZaqBllD5EwcMmU=
X-Received: by 2002:a9d:74d0:: with SMTP id a16mr25985696otl.237.1638753816996;
 Sun, 05 Dec 2021 17:23:36 -0800 (PST)
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 6 Dec 2021 02:23:25 +0100
Message-ID: <CACRpkdZXZBpexMUuwTV-RB7_QAjBQkSbRsaBtgFShcqxuNTUgw@mail.gmail.com>
Subject: [GIT PULL] IXP4xx changes for v5.17
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi ARM SoC folks,

these are some two IXP4xx patches cleaning up a little bit in
KConfig & such which should go into v5.17.

Please pull it in! Details in signed tag.

Yours,
Linus Walleij

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
tags/ixp4xx-arm-soc-v5.17

for you to fetch changes up to 019cd8a9e3bcbbf6bac8036a9ae545f7858e0c08:

  ARM: ixp4xx: remove unused header file pata_ixp4xx_cf.h (2021-12-06
02:18:39 +0100)

----------------------------------------------------------------
Some IXP4xx SoC and driver related changes for v5.17:

- Drop unused Kconfig options
- Drop unused platform data header file

----------------------------------------------------------------
Jonathan Corbet (1):
      ARM: ixp4xx: remove unused header file pata_ixp4xx_cf.h

Lukas Bulwahn (1):
      ARM: ixp4xx: remove dead configs CPU_IXP43X and CPU_IXP46X

 arch/arm/mach-ixp4xx/Kconfig                 | 13 -------------
 include/linux/platform_data/pata_ixp4xx_cf.h | 21 ---------------------
 2 files changed, 34 deletions(-)
 delete mode 100644 include/linux/platform_data/pata_ixp4xx_cf.h
