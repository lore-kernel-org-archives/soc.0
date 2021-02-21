Return-Path: <SRS0=X6Z7=HX=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2BC2C433E6
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Feb 2021 02:59:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51F076512F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Feb 2021 02:59:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51F076512F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MUYqAH4RFXV9fP+LJHtBBGfKe2cQ6yO80Uasu4Yb8iY=; b=B+ZZfRvNCBhRbDJ6RbQ7oxpSTa
	By3+G0lraSGXHlCT5CWXCnrln5n2R75DAXA+Z883Z8EA9x5PGdzrwyDMiFC4U3tc3CRJaz8iuOJYw
	85d0M0E9EN+hB2vyKlyA6xH0TBY/V/xvZOnLLlsWio6IEiykDbZxmckgSb198CRQrSxu+DkXGkM/G
	l/GypK9gV5F1R9MimdNtCyV/bK+MlM4GdxmfgxJria7AmaGeeF0BaAXjtARm5Tuuj9of6jPcYiTrs
	+Ui1k0DwXqgZNwq1aePBlDbM89cub+PIflD4IgGAzLwwaBNGOYjIUnLXXUOdAAXkdVCN0Hfl60NWm
	dsMho48Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lDewN-0004O9-Sr; Sun, 21 Feb 2021 02:57:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lDew9-0004LG-QP
 for linux-arm-kernel@lists.infradead.org; Sun, 21 Feb 2021 02:57:36 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 11DA764EF6;
 Sun, 21 Feb 2021 02:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613876251;
 bh=J51+N3yYee7ChZbIsvdrIPbUbDp4Qi9Bh9CEHd/1LsI=;
 h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
 b=Rxez1YcykW4AAOeNgKN7DLbaFwb/J/LledKQ28zCXoNsjJxYgoRP+DSYgisSAN9en
 FnoC0HQPIT4NqzQsAzFkmXlp1yNJEatVUAdGU8sLWC10cxxpLUyyLJSIJIgjJ5VmVV
 qrJ9HjyTYdfjVfhIYtWUMuiDJLRbaLx8nVOBwKEnnXnlyCrwWhfwHW7ORYIyr+TVkp
 /UdZ0mLGmSCGNcF1QNkn32dwXq/CiRtzdmJo6joZBtNPXFA12+B04cIJ0nZatVC8Vw
 hbiZ5oReOJxRipXEmdV9NOMU0g5cZiif1Ghs3ozA8FGFe0d2ATbNqAT1V02YKySvON
 +nKLpDadTz2YQ==
Subject: Re: [GIT PULL 2/6] ARM SoC platform removal for v5.12
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a28_WrRo_gdgotYmexseB6ivUfGJyaF6VMF_04EEmGpxw@mail.gmail.com>
References: <CAK8P3a0w-vPNBF=4ieg3YUyNHzy+qiZ5iK-9M1cRxA+TakScYw@mail.gmail.com>
 <CAK8P3a28_WrRo_gdgotYmexseB6ivUfGJyaF6VMF_04EEmGpxw@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a28_WrRo_gdgotYmexseB6ivUfGJyaF6VMF_04EEmGpxw@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
 tags/arm-platform-removal-v5.12
X-PR-Tracked-Commit-Id: ce1380c9f4bc48f6e6133ef9fc24dc9f3df500ac
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 584ce3c9b408a89fe5b7ac5b5b246b85c78defed
Message-ID: <161387625101.20427.2403785209981932774.pr-tracker-bot@kernel.org>
Date: Sun, 21 Feb 2021 02:57:31 +0000
To: Arnd Bergmann <arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210220_215734_352317_416404A1 
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
Message-ID: <20210221025731.Qpc7aMjxNCY5OVKcNOY208fhbrs2yeM6Sy7shE-l_V0@z>

The pull request you sent on Sun, 14 Feb 2021 23:42:47 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-platform-removal-v5.12

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/584ce3c9b408a89fe5b7ac5b5b246b85c78defed

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
