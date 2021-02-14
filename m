Return-Path: <SRS0=BbVa=HQ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-24.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEE82C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Feb 2021 22:42:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BE9964DF4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Feb 2021 22:42:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BE9964DF4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B5WxKL0Y78/tELSwmfHXtCGYmRIROJtg9embnJQeraI=; b=c0nXpB2TnTa9PXAgkw3UsN0V51
	pD0VNhCqPTUeNHFR00DdzEIu+S/c/l8LWuc/UCfKjYRMOP03lz7Ij+HzuClPFVwvPSgWLUTdTH16n
	HRPiKp9Zb98SmibIk6NH1bBF5Y44rZDyd4IvTsYabVYdwSoFBjAiva4NPrUXulrAYEGtS6r1wnVy+
	qwLilVqPaIm67wtZcyJgsfmJotOQizzH/c4+HKHQtIezG9JipLT4Xuv1QeAp1aOtQ+g1MGR9LMtLk
	o5p8ZYTNWVS8w0lvfu7wFzACKD4oLW/SH7f10qYb4rn1WEJwlhKiDc5bnwg2xD0MZSSe8FAQCg3e7
	IvKPscNQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lBQ5G-0007bT-T4; Sun, 14 Feb 2021 22:41:42 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lBQ5E-0007b2-9g
 for linux-arm-kernel@lists.infradead.org; Sun, 14 Feb 2021 22:41:41 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 411C964E29
 for <linux-arm-kernel@lists.infradead.org>;
 Sun, 14 Feb 2021 22:41:37 +0000 (UTC)
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
Received: by mail-oi1-f169.google.com with SMTP id d20so5992135oiw.10
 for <linux-arm-kernel@lists.infradead.org>;
 Sun, 14 Feb 2021 14:41:37 -0800 (PST)
X-Gm-Message-State: AOAM530TNZcuITYTfWZobKxlqYz5v8GbsEb/KKxPjjOkGau7icXVK+xq
 PqVwuXgdBjdk7BwncVG4acquTF4/VefiecRkx2c=
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210214_174140_412611_1DF4291E 
X-CRM114-Status: GOOD (  12.86  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210214224120.XF8dQ5-Is9mLhk_2fiXx3i7UBu5F8DHZQEmL7gsyIi8@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
