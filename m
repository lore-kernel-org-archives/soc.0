Return-Path: <SRS0=l7M8=GL=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C4FEC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Jan 2021 22:18:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF50B23AA7
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Jan 2021 22:18:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF50B23AA7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bj6AZKty28tYFeC+VEVmQqK8VstEE/RHLF8Oux4HgFE=; b=2OkmGT4E153D2TSXj8hn68blnB
	TY/ctQOYjSJFuWTrkQohS9QO6MJSHS8YKAlMuf8MOvwOAUKK2HPPiiDRQWz7nAupbKO07MQ4gv/Ix
	J+ahyuEJZaPHWAKrd2XuUz0yi+bNqk95GpfATv+w9TzevF/bCAJdYXMI/n3qyAlGxqXWPznoJX4Yj
	zpD2P39G1tWmD/aDQbFgr62Q1tY41QCIH44YVl57KYiDMMn6YsrWMomsWlz4vJ9WaySaD0qnh3x0l
	Bc3qyBzd4VhbrJ11sgl3hJgEGHnXgrkAddUisMXmcZH2JEXaUPtgTpyiRxae+NubioR8A3K2S5+in
	7XG8VfOA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ky03J-0008Js-5N; Fri, 08 Jan 2021 22:16:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ky03D-0008Ip-LP
 for linux-arm-kernel@lists.infradead.org; Fri, 08 Jan 2021 22:16:09 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id D36AE23AAC;
 Fri,  8 Jan 2021 22:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610144165;
 bh=kG7h/49J8CyEdV5W63JubMtwsWREcD/4kg04Gptndt4=;
 h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
 b=jHZMb8vexShuhvdmrRFcVkB+4ggs/up9onsOINorirPIlwkczfWWAk/BD3h8OJe3C
 p671++IxOvl00uG0g7BilT6ogX7MaJdX2Ei6JxJH6ofLP9u2YOXMDE5A0RuhgYXSaj
 AsiB6ufInNzeolSWYk/i1Uk/3twxTjwAf2K7lCjrFcL87wyny0BqaEilsDKkjhotbd
 B0vDYZPi8KXAODo0DzNjbFyMSP6lkJuefWSCXQs1ASEvA86BTmDilAuDBCuTvXaw65
 8G6VNfGeQAFzcgt9czy3vrzhwMyRHoyKUK2EMxNr/wmjqcYnmSwhK2zecLiqnEtDky
 /hRJeq0ffrEFg==
Subject: Re: [GIT PULL] ARM: SoC fixes for v5.11
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a3aQwtP9kpujNeErTVHDOxALMtEpg5QQgKJMfQ+ZaFn4w@mail.gmail.com>
References: <CAK8P3a3aQwtP9kpujNeErTVHDOxALMtEpg5QQgKJMfQ+ZaFn4w@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <CAK8P3a3aQwtP9kpujNeErTVHDOxALMtEpg5QQgKJMfQ+ZaFn4w@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
 tags/arm-fixes-5.11-1
X-PR-Tracked-Commit-Id: bac717171971176b78c72d15a8b6961764ab197f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 95f05058b2bbe3b85c8617b961879e52f692caa5
Message-ID: <161014416584.31342.17090341049735137699.pr-tracker-bot@kernel.org>
Date: Fri, 08 Jan 2021 22:16:05 +0000
To: Arnd Bergmann <arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210108_171607_786642_94C2764F 
X-CRM114-Status: UNSURE (   4.63  )
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
Cc: Tony Lindgren <tony@atomide.com>, SoC Team <soc@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210108221605.p2L8e_Qa89dWiRUhW5tBoZ1cLd_7QVjzEP3MkMxdAgI@z>

The pull request you sent on Fri, 8 Jan 2021 18:10:47 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-fixes-5.11-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/95f05058b2bbe3b85c8617b961879e52f692caa5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
