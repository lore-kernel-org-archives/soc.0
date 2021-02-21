Return-Path: <SRS0=X6Z7=HX=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67F04C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Feb 2021 02:59:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1889D6512C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Feb 2021 02:59:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1889D6512C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HbTmqEY6G3nvOr/Oncie18TwBT1FxsD99Ayh6AuHof4=; b=qVTXq2I1TtG/fnxcCewRiGsT8G
	xXkxuWHyauq6e75kywzeXNs+eBqCs9no7u5QEwq4eBsDqAhJ731+uIK5DzdUri/UTdxhZ6XXZbePd
	Y360SxNnA9y2gPpptOvvgQQd5pWqE02llrYlD8O6vFNsErlyyhOSI57wPU7Ge6WA+O+1E6x6RnrME
	kop12/4133KIw6jvN6Nq9FKHuIBfp4LQdV7u6L53pat0Z7xMs9VPDlcEvQsTKBJ+/vs6y7JUZkx+1
	Fk1UlAaa6hCwGh+yQEY6iVeFHqF9BckmbNN0lvEEBNa+6+jRZazs1UJdJgwZuRGvfgNSHDUKPoEdN
	UimXhqTg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lDewV-0004Oq-Vy; Sun, 21 Feb 2021 02:57:56 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lDew9-0004LE-Oz
 for linux-arm-kernel@lists.infradead.org; Sun, 21 Feb 2021 02:57:36 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 627A264EF9;
 Sun, 21 Feb 2021 02:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613876251;
 bh=LCK0VHBAKoWSQjOxwjyyLU88OlNKxcypa4CM+z3N2dM=;
 h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
 b=EfuCmyFZniP3N63Q+t8i9te0/sddFbwAM9ufv273mXaSRWlAymxTI+IjgOZbubSKI
 1ShovOwBUGHsU8sxWfHx/9e2HCVqFStPbt7tWqva+jE/opLHr+PuUcgXxUD/cLoFXP
 Z4Xd3Xh6cQjI+NP8C6+EqiEg/OifsIwMFQIC36ev9Hb62JFqHxXEVFZQbzi2zoRfIe
 kHX9zEHh4Zc3ITyhB8fuqr+JH1ojS3I/LijJdb+ribgMcADn+AnzhyMkFJfIwDFmi2
 3URe2TaAAUi9EhjWVJ/nFtME1unqvbduwxUfIW+cdnyNjKrYA0IYJYq2hXrEUhqfIp
 hRwSvDDl0nDhg==
Subject: Re: [GIT PULL 4/6] ARM SoC defconfigs for v5.12
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a0rK+By11RG+A5NxJ5kWQCWzB3Qs7BFiJfL8sqRtMt2ww@mail.gmail.com>
References: <CAK8P3a0w-vPNBF=4ieg3YUyNHzy+qiZ5iK-9M1cRxA+TakScYw@mail.gmail.com>
 <CAK8P3a0rK+By11RG+A5NxJ5kWQCWzB3Qs7BFiJfL8sqRtMt2ww@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a0rK+By11RG+A5NxJ5kWQCWzB3Qs7BFiJfL8sqRtMt2ww@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
 tags/arm-defconfig-v5.12
X-PR-Tracked-Commit-Id: 21e4675d9305f6ccd20b95d943882d607c8ae288
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 56bf6fc266ca14d2b9276c8a62e4ff6783bfe68b
Message-ID: <161387625124.20427.12672981125117094900.pr-tracker-bot@kernel.org>
Date: Sun, 21 Feb 2021 02:57:31 +0000
To: Arnd Bergmann <arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210220_215734_351245_05D3ECEA 
X-CRM114-Status: UNSURE (   5.30  )
X-CRM114-Notice: Please train this message.
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
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210221025731.3LY4dIAiOoDQ9AP-aoy4VwCXXwy0qMcVJgXlC9BDI6s@z>

The pull request you sent on Sun, 14 Feb 2021 23:44:16 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-defconfig-v5.12

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/56bf6fc266ca14d2b9276c8a62e4ff6783bfe68b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
