Return-Path: <SRS0=2wBR=P5=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 790A0C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Nov 2021 20:11:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4092561247
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Nov 2021 20:11:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4092561247
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x/GRaxlpCZv9Qc7XQXb+Zkb4BwV/CoHorRaIJ671F7Q=; b=OXHJc8OgAeAy96
	g26rUcM8XJZwgTnjtUHLnWOi6kcz/GZNPuDNXxndmShml3796OdelUGGOAyxbzf0OMGzqivhT65Mg
	N6CGCPPDMQLnqVpS/zmQ2am2lUNdA+U+3F5BLzoVxjHo3pybxeqRAWDwQ0qk/5mPrOF/FnfuvI3e9
	wLP/6/f7MZfCMiP1AqkfKBmXUWdtMhwrolOrhGAz/HirXPb2TJJEj/ts2mPvdQECBlgpGtzJiegU2
	yNvSFlOL8Wa8J3lyAbhjQ6Dt05wYhk7bmG3KBRBixv2WGSucDAJVU58ZJbLH9jI9jL9gLiQbejTm+
	08mufNTkeNW6BFMRyYeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mktuu-006Ica-PT; Wed, 10 Nov 2021 20:09:57 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mktup-006IbR-UH
 for linux-arm-kernel@lists.infradead.org; Wed, 10 Nov 2021 20:09:53 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 34E1A6109F;
 Wed, 10 Nov 2021 20:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636574991;
 bh=HzQryat/nU6Ul3b5vA4Vbi1qCwWjWbaPsS9BBfi97WY=;
 h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
 b=t4iNoGXl7I/mjiRufs7kt/GpLLC/JdKDj0yGawEtMySPUs/ER2VQ7t77FURXyGkIH
 Xsn1aomyPGuVOU9kNppQDBUDOubRU0K/NZkyI/xn0x8JWgJdHIKbO0tySxgSN5WYaj
 HndYBbQKGbEzcnxtKI7jl/DMOL1nU+MOINqY0ua92WttBEw4SWRiwVrVHb/30GkEmb
 XBjc0xjaN38Dj8+HpqejvEcqLwe7bisS0XtX9yqch1I9fJIGLDuS41L1FuWLHGYdpw
 3MIO9LjFJhdbABfXPbQVXJeV+7078fGeTdZbLwxSTVAxOXA3COGNFVhHgXNgyntiC3
 H5gxDwXq9GLeg==
Subject: Re: [GIT PULL] ARM: SoC fixes for v5.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a29J4j=PDZfdgKO6bJ05ZCTcqbVJx+8c=RmrU4dXmS8QA@mail.gmail.com>
References: <CAK8P3a29J4j=PDZfdgKO6bJ05ZCTcqbVJx+8c=RmrU4dXmS8QA@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a29J4j=PDZfdgKO6bJ05ZCTcqbVJx+8c=RmrU4dXmS8QA@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-fixes-5.16
X-PR-Tracked-Commit-Id: 76f79231666a7a3c9a1db82c002e083125de5861
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3f55f177edb88293bad08ebe217d3ce20cda427b
Message-ID: <163657499107.19350.16919065852604641580.pr-tracker-bot@kernel.org>
Date: Wed, 10 Nov 2021 20:09:51 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Li Yang <leoyang.li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211110_120952_010201_B2E9F4BF 
X-CRM114-Status: UNSURE (   4.75  )
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
Message-ID: <20211110200951.d7HXhPaZJxqKLmJD69ywNnp0_BqjUcDbb4vY827s-3o@z>

The pull request you sent on Tue, 9 Nov 2021 23:49:23 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-fixes-5.16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3f55f177edb88293bad08ebe217d3ce20cda427b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
