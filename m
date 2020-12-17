Return-Path: <SRS0=g+kj=FV=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DD54C4361B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Dec 2020 00:58:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 561202388A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Dec 2020 00:58:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 561202388A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V6Bl9pgTr8iG6SGUGqu1wGwHUyHMoXN8F7yIiKz7uVg=; b=t6bPZSke19Nh+aYrQm/y7GnTwn
	tohXyhewRXbQfF2KSkR+LmiiGsJcTgmA3SE6woM81yhUlrcxB/XmBKFInulxdQ1/kqdNIh01nWLak
	GMI16cxOnPOngUysvpOJHvrjxTfDVr0rUlDneMMjR09zEq/HX5bgvyCpI9i3A8fhdUHxqFrLqz35c
	o4y3msqjZxlRidTEcTaQVLy556KCnHG8MzGdBfaooKg/mO7YWbGye8SEHlmr+XmmuBgTa11QWYZ6V
	GA5kvwMgLUXkCZQaaG1R0Nqj6b5sljmnyMbBhGKRxnzaI/aWy+sO2IC62eruLIO5Zjbuk2zvPv/6w
	Aq7efpgQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kphbm-0002n7-Mh; Thu, 17 Dec 2020 00:57:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kphba-0002lK-Ko
 for linux-arm-kernel@lists.infradead.org; Thu, 17 Dec 2020 00:57:20 +0000
Subject: Re: [GIT PULL 4/5] ARM: SoC updates for OMAP GenPD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608166638;
 bh=pxmP3C9gdN/9bJHndXB2idVk+QRerKKiQZKKuU5d/SY=;
 h=From:In-Reply-To:References:Date:To:List-Id:Cc:From;
 b=lvHhpgJNjZ5vgxZajTCMD/kLIPTAknDNDJCUsgqmHTM+gLt6du1DP1STCnF4zqr7F
 dpWHBBwMVJDzSiWnlt3jTOKzJhiKOeDuMEvZP0nLfYncgzBrmLbqNr1LKEy3GJk/ie
 /GuHIHtJ5nnbp9JbOWoGQhQ5obkWZyqBDeFrujbntS6vgghpAaweZpLUPmAKUrs1X1
 oHU/f2jEAGHUqAUsBwBM0hyrksvWDIY4CNm9RCLryf7VIYu8zvPo0mqvV13Az+jz7T
 P2yYzF0F96/fixALLmPyOGakGzmDAG5kPZEAP02qDpOGkhzHM+gcPkCtAq3hRYtJ+H
 J9HhRMYiPwfpw==
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a0MxuA4BMsHnEkcfmH3TfJnQxV_DQ-S858VM2fPA2-AuA@mail.gmail.com>
References: <CAK8P3a009=T3WorioFWX8d=tEK78_o6ZHM6TGSmWmd37-_izug@mail.gmail.com>
 <CAK8P3a0MxuA4BMsHnEkcfmH3TfJnQxV_DQ-S858VM2fPA2-AuA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <CAK8P3a0MxuA4BMsHnEkcfmH3TfJnQxV_DQ-S858VM2fPA2-AuA@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
 tags/arm-soc-omap-genpd-5.11
X-PR-Tracked-Commit-Id: 7fbee7e3386cb51e5ebc60c4d7cea13ffeab31d6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: accefff5b547a9a1d959c7e76ad539bf2480e78b
Message-ID: <160816663803.8160.1676370483633044090.pr-tracker-bot@kernel.org>
Date: Thu, 17 Dec 2020 00:57:18 +0000
To: Arnd Bergmann <arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_195718_759896_75FA8B69 
X-CRM114-Status: UNSURE (   5.36  )
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
Message-ID: <20201217005718.tLoPgf4PD7Gw-Pt-kyg9Q2I-vwZ-V2UHVsYJoQb4Aug@z>

The pull request you sent on Thu, 17 Dec 2020 00:28:19 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-soc-omap-genpd-5.11

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/accefff5b547a9a1d959c7e76ad539bf2480e78b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
