Return-Path: <SRS0=Qqmt=MJ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25F58C636CA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Jul 2021 23:04:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1AC561106
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Jul 2021 23:04:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1AC561106
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tXU53sxqqAJb9Sa6PsFS7OET5fU47104UrmvX3dUROs=; b=2m8o3zw2W7eGI3
	MfXi9/ffnuwMUa2gX1y0kFW4Q92xW4oAnf6tdzXk2yokznzxBkDjT2+M9hAXtDFMd2c9Ej5UHoYLD
	X7zLB2GBTzMwuagmCSbJZkWjt1TmnsdjG7hVXeu21T9+GLEQa1FxQqWqhidz/htwlX/HdkQloJDcc
	8E4smb4z7x8qqkLMZrXrH6UhYAhzrxBIrbOJAxqHmpErRO4Kf4spZgNJ7AVOZHU12nXTXiNcMvURF
	DOPFMcMH4sqvUlEotHlxXOSxgjs1tOCyxPY2vDtG486hdP/Sp5SLi3+ySPYJB6iWK4ESf0hVpfLed
	pvKteJK6b/Ia4RyUKx1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4tJO-00778g-OI; Sat, 17 Jul 2021 23:01:34 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4tJK-00778O-SC
 for linux-arm-kernel@lists.infradead.org; Sat, 17 Jul 2021 23:01:32 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 545D661106;
 Sat, 17 Jul 2021 23:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626562889;
 bh=9n60S5U9muDmLfRbjIvlsdR3weLp1v3QJ5ywJI/VDbA=;
 h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
 b=HekEl7H/CtLUv/Z4DkT3KDboPbOpJ//8mCfZn8IdCsE2Si+z1l1iGOJINNcgrjFZ+
 Nsz/n9jES9OfRYF7nmx09t827BMGcQL2G4Z3/JMGDoiG1xd/mljniQAM4azKclfFIb
 GgdV5MyLgSUQXHP0VspZcYi5Mpv4eHZhaLq4gPDv9kqsXxi66Oixp47wm8qcDJ44pn
 9I1qGyNghG15C+C+mpvidClGl0nwEfudrvgvytbbiP/TQyz+DIVBTVN/Gn8a67+8Xi
 747341KzVUJKO6zlARUF0oIEULrpkwF0ta94vh+Z6C6RmY7CnYURm4RgdjojA95krI
 v1jyG0+aTrKfA==
Subject: Re: [GIT PULL] ARM: SoC fixes for v5.14
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a2ZaPZ7y6-GKTuZ1QseNNmNOQP=kS8y8rEnF5LCvOF56Q@mail.gmail.com>
References: <CAK8P3a2ZaPZ7y6-GKTuZ1QseNNmNOQP=kS8y8rEnF5LCvOF56Q@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a2ZaPZ7y6-GKTuZ1QseNNmNOQP=kS8y8rEnF5LCvOF56Q@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
 tags/soc-fixes-5.14-1
X-PR-Tracked-Commit-Id: 82a1c67554dff610d6be4e1982c425717b3c6a23
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1d67c8d993baf8ab6be8a2154b1a94ec1311c869
Message-ID: <162656288920.8190.7314898413582638751.pr-tracker-bot@kernel.org>
Date: Sat, 17 Jul 2021 23:01:29 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Sudeep Holla <sudeep.holla@arm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Thierry Reding <thierry.reding@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210717_160130_972074_ABA688A9 
X-CRM114-Status: UNSURE (   4.16  )
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
Message-ID: <20210717230129.7tVxLcCyJXYK7Z5fR1QOnSoDS-IZcnrQceusS2kmN8E@z>

The pull request you sent on Sun, 18 Jul 2021 00:22:13 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-5.14-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1d67c8d993baf8ab6be8a2154b1a94ec1311c869

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
