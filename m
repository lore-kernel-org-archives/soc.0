Return-Path: <SRS0=FMRd=O3=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA6B6C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Oct 2021 21:06:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89E7061056
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Oct 2021 21:06:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 89E7061056
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SJtp+esrBCWakEhMhxpB5qgxehbUdMNS0RKE5cB3m+k=; b=GCFONDd7Oh9Esp
	DtrrouB5BwyK5SgtNF+i03U7KgfDOmIOWjlQF9cw2ETEniiosMq4VjWvlBIcU/98Je3xDBrdKmqZO
	jljCoDE7ZnIm5lhMMk3pxdamgkOQnFJnUm8v/zlQL3CVSIrgwuUpuxmIiMC+tKtJnw57cAktzbuZV
	U4MzIV7oAoZ9URzYdq+xM6y7q26eqAFOOVXmDj+Lh6qJXaIIdIsnR9uF5WlyKS5pJJF9KBeeiDXNs
	oNXQhOlPB8oti2lfd0Py/bVSUnWaEeYS1d1ms96XSVDGkItbcIw2ySQfA6YapQ2HcloMtqJE4boQ9
	yvGZjTpCUurt93Q9aMjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYaYx-000m7Q-2i; Thu, 07 Oct 2021 21:04:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYaYt-000m6m-Nt
 for linux-arm-kernel@lists.infradead.org; Thu, 07 Oct 2021 21:04:21 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 436DB61056;
 Thu,  7 Oct 2021 21:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633640659;
 bh=v4oLcjeW1xaih2bFoNyRKXDjpxexseaJaBHiIQXsZEw=;
 h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
 b=ENAjR722V5oWQbcgL0D+tFGPXQrvgMP21tx8ZmPvjljCaiwHPHaIE1FcYfe/JfOgO
 WNsXsBiUFaGLBagvn3FQVJculIh77d6MZC0+BvDOFCM/5bNXj3sWJQJFyU4UKw0BZ4
 S1wc1U6WunPGdYMIwZWi7aSil6KLTmrLEKphW4Z0TIZaeVYs5bHrtyzF+7lcD281Cp
 M/z3U5Mlb4N0auirFjbrFQ70psUZLoR3VwP+7gQ5SuPrfHUb3DDRVjMt2XXUSOwNBB
 roHE+rjSXgHXp6PnjrPGutFTNQ0z9Sb70ZwP/87QiSQ/KJvBfekrFkxPTO5e3Z1Lvf
 xU7GTlaIeyplg==
Subject: Re: [GIT PULL] ARM: SoC fixes for v5.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a2aqDaL0dh0k+ZXJ2xq5LKa5z2r2r_WUBdC9m8eKxavXA@mail.gmail.com>
References: <CAK8P3a2aqDaL0dh0k+ZXJ2xq5LKa5z2r2r_WUBdC9m8eKxavXA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <CAK8P3a2aqDaL0dh0k+ZXJ2xq5LKa5z2r2r_WUBdC9m8eKxavXA@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
 tags/armsoc-fixes-5.15
X-PR-Tracked-Commit-Id: 897c2e746cc795870361fcf9cbf282524589fa5f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3e899c7209dd8f7afca59518c5ace0f03385dbc3
Message-ID: <163364065912.30969.4669198160716269013.pr-tracker-bot@kernel.org>
Date: Thu, 07 Oct 2021 21:04:19 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Tony Lindgren <tony@atomide.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, SoC Team <soc@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_140419_814335_0D3B2B9C 
X-CRM114-Status: UNSURE (   4.36  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20211007210419.zee7CMKsjmVmUtMh12y4o1DxiYW6dzRU43UaKB8bn8Q@z>

The pull request you sent on Thu, 7 Oct 2021 22:55:50 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/armsoc-fixes-5.15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3e899c7209dd8f7afca59518c5ace0f03385dbc3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
