Return-Path: <SRS0=Uajl=HF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFE77C433E6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Feb 2021 19:40:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5279164DDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Feb 2021 19:40:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5279164DDC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HaTjuTYtaFImNOeQJCjIz947/sj8nf9aItFdKXWLc/s=; b=qa/bIF/MeN7seoi+Mpq5wamgaC
	fMePJ6SInIR7PvGbeIDQqYE3MSnSo+MTd0gjQHVmkQ/sV2UDSbHlqqqv+KAAJ3E7jmkHZoOST3Uxb
	lc44aKTSOchTGFemw8ymTem3IDFv3aAcGudcjDn/rvx1R19KCkouJDzrOuRNtKWY/MoPxrC4BuWJn
	LzkYy+lbYAZaNA6muX5mlbFnMMjqWypEgWYSpZp1cP9QLjHbwUgANrRRFccKUuQKptezIYhWS6jb2
	XQtp060FXLuB8piRUHq5aWSM9eI1ho3LCBRvBFtcgvgIph4xxWu5Q9MSgMtsAYXlx87fAPhbCaNVP
	CQlL310w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7NzB-0002jP-F4; Wed, 03 Feb 2021 19:38:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7Nz8-0002ii-6T
 for linux-arm-kernel@lists.infradead.org; Wed, 03 Feb 2021 19:38:42 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 75E6764E0D;
 Wed,  3 Feb 2021 19:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612381120;
 bh=w99r7UjKBoJx1OyWtsBVn9Ao7mTyOY/7Ix9pos/w/tQ=;
 h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
 b=iOGJFzRB8gpEqCiyayllp6NOTtzyM/CmEoMi9lr60FrAEWI15j0ye1dSy3R/WQnYC
 W/jd5Vwaug/K5xS/qIes7jzVk0NkUgJ/Kfi3ri24vIqpp7k6MS28Avq4b7kqCvkV0j
 Zn8rQ3ooM0gNAk9EMVtv1la9SLLBAJSDiC/L1Mt9TO6UVjBiS3MzQk8ov6vHlEDbUb
 V5WbhD4HKUq/ABoXVuScxocXH4dLF8Y/bzW4Y4kwgdemrBcaJr6gNZhRnaml71T11X
 00zsxGK6LJdVcpqIjF/0X8NW9wdoeanm5ywa2lp98PhnmuolCifvouMn5vjsogumBz
 7psB6WO042PSA==
Subject: Re: [GIT PULL] ARM: SoC fixes for v5.11, part 3
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a1Ud0DtX+GGnap1r+Yu+KONeqq64q+2y2D3mVPGN4vwuQ@mail.gmail.com>
References: <CAK8P3a1Ud0DtX+GGnap1r+Yu+KONeqq64q+2y2D3mVPGN4vwuQ@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a1Ud0DtX+GGnap1r+Yu+KONeqq64q+2y2D3mVPGN4vwuQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into
X-PR-Tracked-Commit-Id: 459630a3ebb4110c571f103fbc2d8120be001e39
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 54fe3ffef0ebb60b1273d0d7b047ee9b4723cc61
Message-ID: <161238112045.20071.3264479308047100060.pr-tracker-bot@kernel.org>
Date: Wed, 03 Feb 2021 19:38:40 +0000
To: Arnd Bergmann <arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210203_143842_308536_9664638A 
X-CRM114-Status: UNSURE (   5.76  )
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
Cc: Heiko Stuebner <mmind@kernel.org>, Marek Vasut <marex@denx.de>,
 Tony Lindgren <tony@atomide.com>, Shawn Guo <shawnguo@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Alexandre TORGUE <alexandre.torgue@foss.st.com>, SoC Team <soc@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210203193840.uF0-oT1vGm9YKjVKccKQxqN6cWqP1Pl2WzpZpKCQcSs@z>

The pull request you sent on Wed, 3 Feb 2021 13:41:24 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/54fe3ffef0ebb60b1273d0d7b047ee9b4723cc61

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
