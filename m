Return-Path: <SRS0=Szqg=LA=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BC09C4743D
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jun 2021 20:15:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDDAD613AF
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jun 2021 20:15:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDDAD613AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/N15C+TG3JYg3XepD5EAFhnlZ7QCYwVlxZhbgA4Udco=; b=UElATzJL4tfkSK
	SJ3Ha8Jr3Sd2cnyzcvQjpkfE3/gMyC4yEEN0LIDvhTdLom3fSc+Mb/cao4wgB894J3gnCr0peCep/
	hQz640xSTFGH1ZYsP51UKRSO5rkDwHPGitKMdgCVLwAozXZCtUt9VaUPiq994d8UajV/mMMCjhMEq
	u7NqvVYybgLiG5/gGnZq/31v375MO0FK2OSdh8mtxupWWnVEFz/o/0BfovY24dNuPfZzCYTdprLxp
	geFLOxhCSY09FrIFYA326r+4Lln3ZhUzTRRxDhZQyx1mqc+3sJpQH8Uk9g+mdJvbXNNJygl2IrBWa
	v/xfgHDer/I3wdZDrarA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpz9s-000lHX-Vj; Sun, 06 Jun 2021 20:14:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpz9q-000lHB-5N
 for linux-arm-kernel@lists.infradead.org; Sun, 06 Jun 2021 20:14:07 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 4D522613AF;
 Sun,  6 Jun 2021 20:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623010445;
 bh=qFIWkfsL3N/CxGgEuHQ+owwXxgek2OswTYnZmFjD04g=;
 h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
 b=KF7mcRp+jpHStZpKk5bnFTKE4iJWSRahuxf1XroxfUWayvPTu3JqzKZMZ07546c54
 4LO7sxNK8W8cwNcFYNF2rST244VtQiG5yIDGlbSR6K+6Wwxmz+R5aZL/5xIlBHPeJt
 eXcRcfPMnD+wptYVsTOKbmSF5/N+ab/UYxXyXxD2JyLz3Idz6Ae979VuN1rWtR0rq2
 SSUn9oZl3BKCHqOIx2ZEqTmZlnzLcCHBifDNUsmlY69Yvv2kZRN65DlrzIYYr1tjHs
 ZlsbzNGmkl2UZzuo0E8BTPomIgPuO5neWxmZSQc4SKEc0S+OGDa+dZl2X89e3K0/8M
 rNu0HRXNw4s4A==
Subject: Re: [GIT PULL] ARM: SoC fixes for v5.13
From: pr-tracker-bot@kernel.org
In-Reply-To: <20210606192724.GA7363@lx2k>
References: <20210606192724.GA7363@lx2k>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <20210606192724.GA7363@lx2k>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
 tags/arm-soc-fixes-v5.13-2
X-PR-Tracked-Commit-Id: b9c112f2c223ce50ef6579c9825a62813b205de4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: decad3e1d1ed150588dd9d44beacf82295b9d5a5
Message-ID: <162301044516.15135.10381507080461852412.pr-tracker-bot@kernel.org>
Date: Sun, 06 Jun 2021 20:14:05 +0000
To: Olof Johansson <olof@lixom.net>
List-Id: <soc.lore.kernel.org>
Cc: torvalds@linux-foundation.org, olof@lixom.net, soc@kernel.org,
 arm@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210606_131406_239427_A31157C8 
X-CRM114-Status: UNSURE (   3.53  )
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
Message-ID: <20210606201405.ufHlCOP7RxiI4v3v_L0agwTno30xOFaB7StDhY2M5tI@z>

The pull request you sent on Sun, 6 Jun 2021 12:27:24 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-soc-fixes-v5.13-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/decad3e1d1ed150588dd9d44beacf82295b9d5a5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
