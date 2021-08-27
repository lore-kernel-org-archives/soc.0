Return-Path: <SRS0=KoPa=NS=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-24.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2455C432BE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Aug 2021 22:13:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B4EA60F91
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Aug 2021 22:13:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6B4EA60F91
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lgg4/QMSL6olIL1X6/0d4EU/1nPDZ2EGv6bviRa76B8=; b=BTs6RkmmvZq2L5
	Qut8kSyB416Z1W5uKrUrYaJHnoiREatRXP//ey/e7pzNgzwRXqGK/dpDXPwEQvCyOzg8Cu0XqdwT/
	kDVLCYMWb+nwlwyvICPVlY0O5CVcjQDa4vgztmHnn1OvKlz+peH032faIfBGTg0mh6wgEaToYfhol
	t/aonbdqWP4xt98Axt5eUnYsQYX43Iue2pXZd4/TI2curfMqzWS+EaMGc982V6PczdohKyxzDlx3E
	1fRpeoZMecjiRMgT2UOnpJHGFw+Orm9E82jBsnewSUcMqR3PrcHaFqlpBcecGiEa9ARDE6cN1OmJ7
	q9/uTQ5YT0N/NDqUobZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJk4e-00DK7B-9o; Fri, 27 Aug 2021 22:11:44 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJk4X-00DK6i-Pd
 for linux-arm-kernel@lists.infradead.org; Fri, 27 Aug 2021 22:11:41 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D5B9360F91
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 27 Aug 2021 22:11:36 +0000 (UTC)
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
Received: by mail-wr1-f44.google.com with SMTP id q11so12482348wrr.9
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 27 Aug 2021 15:11:36 -0700 (PDT)
X-Gm-Message-State: AOAM531o7SpL1G7WPzCxkYey3h1f5n8t0sTkdsBISE/JWjDkE5pZo/GA
 KI1FahgmDnfAZ2RXizCsE6DKfV/+WUAw49jx8bY=
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210827_151137_890530_1B064130 
X-CRM114-Status: UNSURE (   8.92  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
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
Message-ID: <20210827221120.QB3DOP75Ux6vvFq8Q1ZXeNMyBYrwexarxvZXPMs08X4@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
