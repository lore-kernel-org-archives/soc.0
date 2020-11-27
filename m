Return-Path: <SRS0=Z36m=FB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 335CFC6379D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2020 23:31:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7C1120885
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2020 23:31:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZNBnSs4Z";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="HWX4qv9Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7C1120885
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3B4rgIBwsXR7qsfq3NZfmFVXR8T47EkxDVbDBSXnHkE=; b=ZNBnSs4ZjU41U9GingSQhy8Cfd
	OD00yZgQaF6uxXdGRPVDayP9RB6NXqKwIzGfPtQ3RuW7KYF/jP0JjYpslYGCKwukDrH8exw2FbBU4
	tamGWt68cvl1rbS4/NhBG6DkI/DFGYDrspUWDaMYh3Fv6izHs2IyhKiOKQLKWrW6ms8HK79T6EO9Y
	FANpSGJQvoXQZXtqeqtpwLvlG2Ba6By6A+eSfnW6ld/xdtLjVKpcc041cwRVEW3ssjsrKzRlejzjD
	87cVlJLLzTclqL6IVKvJWuIcfA1KK/F+/cF5M8tcxrYlck3UblKloklm826pAaU4CzhLYpyfAlOCs
	oTTQyXGw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kinBq-0004Mw-2r; Fri, 27 Nov 2020 23:30:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kinBf-0004Kp-Pz
 for linux-arm-kernel@lists.infradead.org; Fri, 27 Nov 2020 23:30:01 +0000
Subject: Re: [GIT PULL] ARM: SoC fixes for v5.10, part 3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606519799;
 bh=odBZsXzhtmwpQwNUqeWXKjwv0rU3WQpAR6B8J4GXyyw=;
 h=From:In-Reply-To:References:Date:To:List-Id:Cc:From;
 b=HWX4qv9Q2bO0OxEKwa8/vS2/IVJTLHSfQwHUM865iPy6Coirz3xNsvKLkSCvhQa1a
 /dZhuGiqo6MyF2Watw9YLarI41GusxA/hx4mp0o3dtcvCLMQ3RvY1P6ydA32aY3VGz
 frj44h+cOjksY3V4qa/WSRUow8FYCqR7yAgrTtvA=
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a2Habmz95y+J+-4NiT5SGYhO_Fia-SHhapX-3NYRbEMmw@mail.gmail.com>
References: <CAK8P3a2Habmz95y+J+-4NiT5SGYhO_Fia-SHhapX-3NYRbEMmw@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a2Habmz95y+J+-4NiT5SGYhO_Fia-SHhapX-3NYRbEMmw@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
 tags/arm-soc-fixes-v5.10-3
X-PR-Tracked-Commit-Id: ae597565d13febc73b9066c05935c1003a57a03e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 303bc934722b53163bfb1c25da7db5d35c0e51b6
Message-ID: <160651979900.32137.11200973603883765915.pr-tracker-bot@kernel.org>
Date: Fri, 27 Nov 2020 23:29:59 +0000
To: Arnd Bergmann <arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_183000_298903_C5318F1A 
X-CRM114-Status: UNSURE (   5.31  )
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
Message-ID: <20201127232959.rXNFsilPdPE6x1PnNk5sJ7zi-7eEXtUMp1KQRsy8jOE@z>

The pull request you sent on Fri, 27 Nov 2020 21:51:05 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-soc-fixes-v5.10-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/303bc934722b53163bfb1c25da7db5d35c0e51b6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
