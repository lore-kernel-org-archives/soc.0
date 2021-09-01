Return-Path: <SRS0=S75E=NX=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87F27C432BE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Sep 2021 22:46:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58F1160FC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Sep 2021 22:46:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 58F1160FC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qnYb8hqbf0cVH0q0KO94G3t2fJ/uI9pwRTSp1hXec44=; b=v7ImTvP1xCC/0i
	7NJWeg5INxjlMl4CtjjONqxtALgiRBWWERDcj5JYopdYZroVZqZqr0jCQqLTbaZQItGVDBO+JT3in
	QlB/fGN8tahVGF6Xx5v7iP2asCFyk7w0O19LQUlHeHwDgsxsR0I+pat79FYq1f6CO7tqM4I+TCXSN
	N8uswy8ilc9B3S11Iro0mAZzz2fWRaFYPEO86D6CWwR3BoIIgE5dOc5TV2z+Dz/WgXqrFxF5opUTd
	eKLkc4JWh97NLTTYsiMd0E4egkmfXuSJbmmCx1q1orAKZ0mpKTyo++yNbTh1spUNL0GmBFaLc9NYh
	WGARJg/aJ55SqyPgkixA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLYyY-007k3u-Uh; Wed, 01 Sep 2021 22:44:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLYxl-007joz-LV
 for linux-arm-kernel@lists.infradead.org; Wed, 01 Sep 2021 22:44:12 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 61ECD61075;
 Wed,  1 Sep 2021 22:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630536249;
 bh=oM4yT3F4zEKFbmYDOGZtKhNIXw2H5+GYedhR1IagYlM=;
 h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
 b=GvqRrezzirNKa4JVPD6tmTwe1RcZj1NbiWC/EeG1j6DmHUnDIMArxnWOLOiRvc4jJ
 00lfpyU1LWts4KSqvJnw67JSScQ6GwzYdU+xvG/CctAnvICaqrwKNf1JfmY1Vy8V8q
 G3lKB0FURDHLCJj5iBP8O7NCAOGpKP5TpwFC/YNSR14nh6CszZVvwBqMAH/hf/SR9F
 fjVM4nnBBjFUts2MHEc0DoTQyJzt1KuvysZ4Q8++xc+dkRWSF2cuAhFbLqJ46ThUxF
 FDKvlpZIM6Dn+Lnnuh8fA0Zbhkx7md2xuDBJHI/JmfQ/foOxZuwfUVxkbZtvebVTDV
 yaIKKjcTehuRQ==
Subject: Re: [GIT PULL 3/4] ARM: defconfigs for v5.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a382k=ALTzRc=d_XyyM186tgjGRKux-r36xk-F_BsAzXg@mail.gmail.com>
References: <CAK8P3a2GtDmpEz0KzeeKXEZZScLff-_=vv3UkOr3Ds9605g-oA@mail.gmail.com>
 <CAK8P3a382k=ALTzRc=d_XyyM186tgjGRKux-r36xk-F_BsAzXg@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a382k=ALTzRc=d_XyyM186tgjGRKux-r36xk-F_BsAzXg@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/defconfig-5.15
X-PR-Tracked-Commit-Id: 79cd0bb66e359f5f9398de9d2e86eac776947691
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 32b47072f319bb65e9afad59e78153d83496f1f5
Message-ID: <163053624937.31944.8567283950832234252.pr-tracker-bot@kernel.org>
Date: Wed, 01 Sep 2021 22:44:09 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_154409_738123_788142A3 
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
Message-ID: <20210901224409.seSIzTwSg1cFh3irrFr-C9_ogPWqZ0AfvLHN2t5p3PA@z>

The pull request you sent on Wed, 1 Sep 2021 19:59:18 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/defconfig-5.15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/32b47072f319bb65e9afad59e78153d83496f1f5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
