Return-Path: <SRS0=X6Z7=HX=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D329C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Feb 2021 02:59:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5231D65130
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Feb 2021 02:59:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5231D65130
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OD0GwM7AMgHOuiZXlzf5XreWI03RIS5JeA5B9iWv6xc=; b=EC9q7/kTY0sX4crUGQz7NGPm++
	CJgjHq6UnGFCz6YsAQRbqcw6FAB5tU3G0h9S+jKfy8KMNEB2yx7GJ1aNGUdxQE45MzFbAefr4tV2P
	lklZfkPbywDy9Zbn120ygOxxhYVMv6BQlK8RVchDGVVXQn5YbQRa+6eZ0l1aMg9DVXWrmPeUA1EmX
	7TfAjlh1Xo+ptTWSb+xpHBsvGSiXg95M4ZOWOHa/e8xNrKvg0rYxMB4d/0tObEQdPRaltliSjV/Px
	ODWoFXA/T6IAqG7/4IUPXfHZMM9aqCk+pN+L5luJyK0sHtm7UOeGbA8pOpEYcrFjyyprvmHuBtOIA
	tvz98XeQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lDewD-0004Mp-9j; Sun, 21 Feb 2021 02:57:37 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lDew9-0004LF-Lk
 for linux-arm-kernel@lists.infradead.org; Sun, 21 Feb 2021 02:57:35 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 4F5A464EF7;
 Sun, 21 Feb 2021 02:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613876251;
 bh=V7/dZ099Tb6lH58YI/2FfDyYBPeoPepzyijvFSKFXtI=;
 h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
 b=MrBmFllGAfj8gzeDEGs/KSHpB4pvEUKqPlH/79xIzmsE8NWrOkdiORHyQ5yMUU8yT
 KkxFCr6oeFumFixSq99EUxP5OxZUH913IcroMyw2bfMV4gUTgyDveZUztxpdPfQLMK
 s05tC2Qxsl9rokVJhyBVg6XBDixk0U+BMS3djxC/fgJ9YBope8NVV4fjDcSzaDUvTq
 eKDoHIome1ZPPUj4w8teDqJH/IOAaJQ3AbV4PLiP3Rzqib+U5ZR7F+J01m6SeBVvxA
 C90P7da85e/P5PcLAGJfVL0N7C/HeQba/HWqkAx8KwCdljt7B18r1xJlqcU9ehzicG
 KDwrkkSutruDw==
Subject: Re: [GIT PULL 3/6] ARM SoC changes for v5.12
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a0kOOOR4RP_A9v9R4_PeGsa9z3=TqcvH-Cs9oRq4mNDhQ@mail.gmail.com>
References: <CAK8P3a0w-vPNBF=4ieg3YUyNHzy+qiZ5iK-9M1cRxA+TakScYw@mail.gmail.com>
 <CAK8P3a0kOOOR4RP_A9v9R4_PeGsa9z3=TqcvH-Cs9oRq4mNDhQ@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a0kOOOR4RP_A9v9R4_PeGsa9z3=TqcvH-Cs9oRq4mNDhQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-soc-v5.12
X-PR-Tracked-Commit-Id: c2bd78de41fc3bdeb183bc24bbb2c4c0f3cfdb9a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5011bb9fbb194834dd04ae6c986d439032ecc717
Message-ID: <161387625113.20427.15408784927818520135.pr-tracker-bot@kernel.org>
Date: Sun, 21 Feb 2021 02:57:31 +0000
To: Arnd Bergmann <arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210220_215734_306967_7D43D749 
X-CRM114-Status: UNSURE (   5.24  )
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
Message-ID: <20210221025731.3uSI-wW1phr_QAfHpcKkJXI0XuT8TQRGSYcwRDjdzzE@z>

The pull request you sent on Sun, 14 Feb 2021 23:43:28 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-soc-v5.12

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5011bb9fbb194834dd04ae6c986d439032ecc717

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
