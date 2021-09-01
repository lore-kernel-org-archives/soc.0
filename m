Return-Path: <SRS0=S75E=NX=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BAC9C432BE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Sep 2021 22:46:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17D88610CC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Sep 2021 22:46:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 17D88610CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O3GlXAzkvuAihs3a2Hdd6ZrYTianp/IvXV8k/La9ETs=; b=Xhv/Ai+ETMZxsi
	G/VGL6mThYROjgUT1uFh9VjDkDLtnv/r5uZn/OUirKOb3odV1jauZfNr3kFLUBPoLc/829XIHHCd1
	1miaaLRrwyz67qQpBzoaqmtW80Vod8gGcwehX8khWtqUHCmaY8MH8A6eYECY9xufAak7G6VE48Wsh
	S2xNy04DLgmNROQs9uXC7uRRtMcbYEBd7qz8r+9rIIADVFE627N86HEd/et6em5y3o25Rjn4t64YU
	RlLNMSuHDXXnVTxCYqk/bpvXX8u72wFVlbDE8LevOXK29RHWBmcnUIX+zFBAcWub+W8k3BN6ZdpTg
	i/cl4r/ejY2L5PiyTE1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLYyB-007jtX-Mr; Wed, 01 Sep 2021 22:44:35 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLYxl-007jpM-TC
 for linux-arm-kernel@lists.infradead.org; Wed, 01 Sep 2021 22:44:12 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 9D7EA610CB;
 Wed,  1 Sep 2021 22:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630536249;
 bh=PxLliJ2+T1nIQxDhsacMjysnZpLAapFYy4+Kd0jv4Xk=;
 h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
 b=GGZlOX5GQUGZZ/bfdty7lmK4RfpI8A1trBV/+TrofMXwyD3ifstw5L2TN7ElyzjPK
 67Ib8bZT/tTgd71JKFssCYir+bp87VrMlSHonwMpP4BQ71/Cr0EMsVgZ5GE7XBhpET
 iWG1cJ7ZsaU31eL7d4o9b23qZ3UsvOzsKEPjTQviOq1u/WoTjH5jRadV9zPVAMw2T/
 3waYjjwmEz6Ow/ZXQ5SI9xSNqHzHoMBbZqX9BME8Fud59MchbvphMPh55tYd5LkQ2I
 Mu+qIDl8cqCHXC6JzOlGaAtte8Uc1hseTJI1CrzZZBcW59vuZjRp/YAtT4rgdbpKeY
 3yx3tuVT8fCbw==
Subject: Re: [GIT PULL 4/4] ARM: SoC DT changes for 5.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a2OTMQFQ6CWWQTcSS9wx0_iOukHt7pzMZjxOQHs3fXb5Q@mail.gmail.com>
References: <CAK8P3a2GtDmpEz0KzeeKXEZZScLff-_=vv3UkOr3Ds9605g-oA@mail.gmail.com>
 <CAK8P3a2OTMQFQ6CWWQTcSS9wx0_iOukHt7pzMZjxOQHs3fXb5Q@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a2OTMQFQ6CWWQTcSS9wx0_iOukHt7pzMZjxOQHs3fXb5Q@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/dt-5.15
X-PR-Tracked-Commit-Id: 9e62ec0e661ca7161e5830bdbf8e69831b41e866
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7c636d4d20f8c5acfbfbc60f326fddb0e1cf5daa
Message-ID: <163053624960.31944.11984624584076510998.pr-tracker-bot@kernel.org>
Date: Wed, 01 Sep 2021 22:44:09 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_154409_994653_DB4A5C35 
X-CRM114-Status: UNSURE (   5.02  )
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
Message-ID: <20210901224409.7E5yAbpWf8DnksWc1S9sH-1YVvEKy9y0T5zza7mIKjY@z>

The pull request you sent on Wed, 1 Sep 2021 20:00:09 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/dt-5.15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7c636d4d20f8c5acfbfbc60f326fddb0e1cf5daa

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
