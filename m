Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-25.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 237E5C432BE
	for <soc@archiver.kernel.org>; Fri, 27 Aug 2021 22:11:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id F0ED460FE6; Fri, 27 Aug 2021 22:11:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D944360FD9
	for <soc@kernel.org>; Fri, 27 Aug 2021 22:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1630102296;
	bh=JTxzS70Eae3M17A5AkpDhdhW+2RlJn+kj8ZC2ujOmLw=;
	h=From:Date:Subject:To:List-Id:Cc:From;
	b=u4vXICyjQWuKwHBzPWTzXJud0fZko30NIUO0m0hf5ArNvwK9mEMcLplleH3joI8mb
	 eGIgHVQf0DarDu/V/v+DUo5jzHmqAug/HuFAUldnNzaIBrMdcTUz2LlG8jwC9g1iB0
	 QdquEIqMg0OjurXQYV1mmrsdg+ZUBeA8lUsCduBWptasJAqUt/ePpmcvKCC+cks+Ly
	 PAE0GTn1r3LDNDnp+qC9OhgQxdzq/usXCbmaV+KHoTC3qW2TGDyYS5rZDFhI3ia0i4
	 F6jg4dTdFSrD7i3Y23/suIvlxabHux/seW/LXbbA0qSqex9Es1P2LYsC8PUzL/rPkK
	 8yBvl5EQJ6DyA==
Received: by mail-wr1-f48.google.com with SMTP id u16so12529393wrn.5
        for <soc@kernel.org>; Fri, 27 Aug 2021 15:11:36 -0700 (PDT)
X-Gm-Message-State: AOAM530I5dnqxI1u2fojUx2WIxMuwYMiwiIR4r4KBZ00rToQOFrkZBXK
	woHebk9PnkpPa9pn29YyCHV67KkEqySl74fPAJ4=
X-Google-Smtp-Source: ABdhPJw5h51whmEY8B+GJ3zolntMEQWozwc08dkSbvLXt09z8eKTrcdlXbFZIh8TwqFqXSA+LX04Nk+Vpq4W9k8cIbc=
X-Received: by 2002:a5d:58c8:: with SMTP id o8mr13036323wrf.361.1630102295574;
 Fri, 27 Aug 2021 15:11:35 -0700 (PDT)
MIME-Version: 1.0
From: Arnd Bergmann <arnd@kernel.org>
Date: Sat, 28 Aug 2021 00:11:20 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3wuNeoxDucwTPQvganekRSt4H708AX5pUfj=aYzo_Yog@mail.gmail.com>
Message-ID: <CAK8P3a3wuNeoxDucwTPQvganekRSt4H708AX5pUfj=aYzo_Yog@mail.gmail.com>
Subject: [GIT PULL] ARM: SoC fixes for 5.14, part 4
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, SoC Team <soc@kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

The following changes since commit e22ce8eb631bdc47a4a4ea7ecf4e4ba499db4f93:

  Linux 5.14-rc7 (2021-08-22 14:24:56 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
tags/soc-fixes-5.14-4

for you to fetch changes up to 6c35ca06974105d929f25f487c6ae7a47fffa128:

  Merge tag 'reset-fixes-for-v5.14' of
git://git.pengutronix.de/pza/linux into arm/fixes (2021-08-26 13:47:45
+0200)

----------------------------------------------------------------
ARM: SoC fixes for 5.14, part 4

Just two trivial fixes from the reset driver tree, nothing else came up
since the last soc fixes.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>

----------------------------------------------------------------
Arnd Bergmann (1):
      Merge tag 'reset-fixes-for-v5.14' of
git://git.pengutronix.de/pza/linux into arm/fixes

Geert Uytterhoeven (1):
      reset: RESET_MCHP_SPARX5 should depend on ARCH_SPARX5

Sai Krishna Potthuri (1):
      reset: reset-zynqmp: Fixed the argument data type

 drivers/reset/Kconfig        | 2 +-
 drivers/reset/reset-zynqmp.c | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)
