Return-Path: <SRS0=S75E=NX=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 099BEC4320E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Sep 2021 22:46:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF54E61075
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Sep 2021 22:46:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CF54E61075
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B2XN1OWbWWLBGOlG7P7aVuesUTpWjNJG23e22W5m0jE=; b=lWVe6UaxR3bBg8
	FxB83FZ0XrL6dKcoKtbzFXlwLfsvYmqu09yjw4U8H7djeRsNcKbask9z2rl3Ws4S/1wWrJpydyi04
	6FaxYoDjLlxAm0btJPuFcobQzd53PBOFh71dqRnJML7CyfNm8NETQVT+JMpyUiuZFzFGJwncyAfp0
	VTm2C+NY3SR91VvVJkdUZT47Y+yCZGFxDHrQBQKQQ1n09p19LiogrN+vsPj2jJqwEu43tt1/9rI4A
	vNygjHwIy/UfWfo0ClEIyGyyoYjYX2wLeUHyiWkiYiu5RLqkBI6a7gBx8crPrrvDpIwwcL/lPyPOm
	E27gQRm3LvZ0+vXXXjgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLYyN-007jyg-5j; Wed, 01 Sep 2021 22:44:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLYxl-007jon-F6
 for linux-arm-kernel@lists.infradead.org; Wed, 01 Sep 2021 22:44:12 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 27BDE610C7;
 Wed,  1 Sep 2021 22:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630536249;
 bh=n98B7JjdLPThQoLHZGSUq2Alu0Nexkag0Yp6QBZWFrE=;
 h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
 b=t70ILwWFzpEtFojlTb3AdIO6AYEkmsxbELsn/ha3B9USo92BQTeszoOvF8CBbktqU
 FkKsL2VBtAFQFVx3yBzz2U6ea4McUj+4TzTznoQY/iXJiH11isli0V9qneJeymKsd/
 SbDkb8N/1XHKwqWzqUcgX1/tXeExDTWTnKyBE3RPm/2Cm6QhGnIMIvjsny7Dtmx6ad
 U6ZVERezexOn3SEjLvZhVyHOtsKIL61UQZsoDovvmGP3HJs1sCEjEmMd4UdZ4PDoA7
 lZb4Yd6En3DqLGuHf0pmS2le/VQH09bpsRviMT/61OOrZApEOwassatmvYiGo3d1Zl
 9pRkTsaF5Bdmw==
Subject: Re: [GIT PULL 2/4] ARM: SoC drivers for 5.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a0xs=kVKDMD4fyCh0tt+884=coomhjca72=2pWkG_daWQ@mail.gmail.com>
References: <CAK8P3a2GtDmpEz0KzeeKXEZZScLff-_=vv3UkOr3Ds9605g-oA@mail.gmail.com>
 <CAK8P3a0xs=kVKDMD4fyCh0tt+884=coomhjca72=2pWkG_daWQ@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a0xs=kVKDMD4fyCh0tt+884=coomhjca72=2pWkG_daWQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/drivers-5.15
X-PR-Tracked-Commit-Id: 06779631d18ff2901af604eadea0d7b2193db7a1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 866147b8fa59530812fc769027a94468d89401e7
Message-ID: <163053624913.31944.16750928575487447696.pr-tracker-bot@kernel.org>
Date: Wed, 01 Sep 2021 22:44:09 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_154409_570118_4377171A 
X-CRM114-Status: UNSURE (   5.06  )
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
Message-ID: <20210901224409.QzOoR3zvv4ojfU5GZOz-G3YDQwFsqyRC50Wu7m-pKyQ@z>

The pull request you sent on Wed, 1 Sep 2021 19:57:29 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/drivers-5.15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/866147b8fa59530812fc769027a94468d89401e7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
