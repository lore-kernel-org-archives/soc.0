Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-25.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81C41C433DB
	for <soc@archiver.kernel.org>; Sun, 14 Feb 2021 22:41:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 542F164E08; Sun, 14 Feb 2021 22:41:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2C9F164DFF
	for <soc@kernel.org>; Sun, 14 Feb 2021 22:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1613342497;
	bh=ilynIvTk8rowqbqXFXrfyQMyPBnZ1OIJTDXKz0+eIFE=;
	h=References:In-Reply-To:From:Date:Subject:List-Id:To:From;
	b=tAWxxuW1DTkRt3Cdy/AIMHtcpDgdgCL47AWfGmcadJybLvsvI1gAFAznMWpeCNpu+
	 Z5aHH/77eqgkHvjSXE65WHmfwwrksyOfzs4KxF0kSBL7AddsLXPrw44WP0pH1JRgl0
	 8fORivkQvFU0mfz3j0g067Az3KONWTu7Ctc+dXeahqz07uca/lPVByZ5l0o2l6d06z
	 iknWHIcgqKBviHu5pq16YlylC3Wiv3evF/gZNHIBcnI2+r2ZHcfetLmDftb2iLpR5u
	 hp0xa7qwZSbDu3RHE9giXr1gV09EmPN7Fu83Q960FC3UtedQqTRqiiXZJFl6bIW1e/
	 evWRdM5eoCADQ==
Received: by mail-oi1-f175.google.com with SMTP id y199so6029504oia.4
        for <soc@kernel.org>; Sun, 14 Feb 2021 14:41:37 -0800 (PST)
X-Gm-Message-State: AOAM532TIMpX5CU8M/Sf+eOJ0/MLynZb3aBqql4BUlBuZiy9fxqyFSzb
	9jdNpW2yzBOhXvXoez7ItSB0UUeBPhETW6lRJj8=
X-Google-Smtp-Source: ABdhPJwXcZ90TDhIQykmPAB+dnP3AKWjXWxwqbOSkaOYNxs6iHzf2He2KH+BCSaCbFJUZjYBFdReUuEleLGmzU2I6FU=
X-Received: by 2002:aca:d908:: with SMTP id q8mr6403783oig.67.1613342496551;
 Sun, 14 Feb 2021 14:41:36 -0800 (PST)
MIME-Version: 1.0
References: <CAK8P3a0w-vPNBF=4ieg3YUyNHzy+qiZ5iK-9M1cRxA+TakScYw@mail.gmail.com>
In-Reply-To: <CAK8P3a0w-vPNBF=4ieg3YUyNHzy+qiZ5iK-9M1cRxA+TakScYw@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Sun, 14 Feb 2021 23:41:20 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3sKFzGMZhX_PLSFTVDk9bXgvOhKb98cBAqC33+49n7TQ@mail.gmail.com>
Message-ID: <CAK8P3a3sKFzGMZhX_PLSFTVDk9bXgvOhKb98cBAqC33+49n7TQ@mail.gmail.com>
Subject: [GIT PULL 1/6] ARM SoC bugfixes for v5.12
List-Id: <soc.lore.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

The following changes since commit 1048ba83fb1c00cd24172e23e8263972f6b5d9ac:

  Linux 5.11-rc6 (2021-01-31 13:50:09 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-fixes-v5.12

for you to fetch changes up to 090e502e4e63c608ef8497d295feeb9743ef67b7:

  Merge tag 'socfpga_dts_fix_for_v5.12' of
git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux into
arm/fixes (2021-02-09 23:32:54 +0100)

----------------------------------------------------------------
ARM: SoC fixes for v5.11

There are only two remaining non-urgent ARM SoC bug fixes that
could still apply for v5.11, or for the v5.12 merge window:

- A build fix for the Atmel SAM9 platform to allow building
  with the clang integrated assembler

- A DT fix for ethernet on Intel SoCFPGA, this has been broken
  since it was added in v5.4.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>

----------------------------------------------------------------
Arnd Bergmann (2):
      ARM: at91: use proper asm syntax in pm_suspend
      Merge tag 'socfpga_dts_fix_for_v5.12' of
git://git.kernel.org/.../dinguyen/linux into arm/fixes

Dinh Nguyen (1):
      arm64: dts: agilex: fix phy interface bit shift for gmac1 and gmac2

 arch/arm/mach-at91/pm_suspend.S               | 2 +-
 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
