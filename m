Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 860BFC433EF
	for <soc@archiver.kernel.org>; Sat, 19 Mar 2022 23:32:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 31516C340F5; Sat, 19 Mar 2022 23:32:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ED1BC340ED;
	Sat, 19 Mar 2022 23:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1647732767;
	bh=q90rJhy0FCf9WZ4etZn+6EjqeVNSyA5KFJMVRIzmVtI=;
	h=From:Date:Subject:To:List-Id:Cc:From;
	b=BE7TvNAY2ftvKSeGFij2bHrKqaiBUwrfgsOG0OFyCK2BA/3ZjYus82IRoHRpy9K2H
	 UsmC43/Uxy4aDwQVPenC3Ltis4ZRRnHR2SVA9qLSiQ96lyNz4qXoCOLEb2LPqbXDwc
	 9wGqFdovr7TvkI6aSYnWOqSjZSg9y2pN5I5YjScGPM1Dco89puuv8oSskekAsKSWEB
	 l1QbWYsjI1CUhu5Q4WPJ9f+SjcXCIaiNPiK0t24fZEnx1X0HaKn2Ce6EdcQ1np2FNp
	 cjt+m4BuFjjkk6Ibgd3T0GRd6vEIkgRqAwYsrOJrLPYBnDq9iWzUEVGTXueIq08F6l
	 aWbl0iJWsG8Mw==
Received: by mail-wm1-f46.google.com with SMTP id h16so6132848wmd.0;
        Sat, 19 Mar 2022 16:32:46 -0700 (PDT)
X-Gm-Message-State: AOAM530Xkl2Q9VCiA9nBHk04dCc+JUVSvLIjto8qI/Z08x7+r7aT+Ydg
	nHXhmD6cEkZLYV8gf7CWhEoMNB8v9a1+dxZvmA8=
X-Google-Smtp-Source: ABdhPJx74LUCktQTOclww6WRJ3gEC0yEpKR6QxvywEL321vUgZdQHgNVsMKxkQ4xZi1WHKVViX/6Kge2WdmS1G9SxLo=
X-Received: by 2002:a1c:f219:0:b0:38c:782c:3bb with SMTP id
 s25-20020a1cf219000000b0038c782c03bbmr12363936wmc.94.1647732765309; Sat, 19
 Mar 2022 16:32:45 -0700 (PDT)
MIME-Version: 1.0
From: Arnd Bergmann <arnd@kernel.org>
Date: Sun, 20 Mar 2022 00:32:29 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1NPYBhj3icwvQm1muRiWTAZEJT+ORovVsiwCCAAkYSqg@mail.gmail.com>
Message-ID: <CAK8P3a1NPYBhj3icwvQm1muRiWTAZEJT+ORovVsiwCCAAkYSqg@mail.gmail.com>
Subject: ARM: SoC fix for 5.17, part 4
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>, Marc Zyngier <maz@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>
Content-Type: text/plain; charset="UTF-8"

The following changes since commit dfd42facf1e4ada021b939b4e19c935dcdd55566:

  Linux 5.17-rc3 (2022-02-06 12:20:50 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
tags/soc-fixes-5.17-4

for you to fetch changes up to 1447c635802fd0f5e213ad5277753108d56a4db3:

  Revert "arm64: dts: freescale: Fix 'interrupt-map' parent address
cells" (2022-03-16 19:41:14 +0100)

----------------------------------------------------------------
ARM: SoC fix for 5.17, part 4

Here is one last regression fix for 5.17, reverting a patch
that went into 5.16 as a cleanup that ended up breaking
external interrupts on Layerscape chips.

The revert makes it work again, but also reintroduces a
build time warning about the nonstandard DT binding that
will have to be dealt with in the future.

----------------------------------------------------------------
Vladimir Oltean (1):
      Revert "arm64: dts: freescale: Fix 'interrupt-map' parent address cells"

 arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi | 24 ++++++++++++------------
 arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi | 24 ++++++++++++------------
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi | 24 ++++++++++++------------
 3 files changed, 36 insertions(+), 36 deletions(-)
