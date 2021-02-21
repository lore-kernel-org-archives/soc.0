Return-Path: <SRS0=X6Z7=HX=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCBFFC433E9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Feb 2021 02:59:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 796F36512C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Feb 2021 02:59:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 796F36512C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LdTcFSpKbtHUwn4+SvcypfyImnx34jHtnUw8lmEshsg=; b=AxuhisknkMKuIvt2g65PDAYGn7
	nd3q6b70C4iqfdR4bqp/sh4fk9M42TukeEHvq9WR/Nm8XLsaoTJqNgaWDfKejz4/PG9RSk1nDspqT
	j/RqcTeo3D90/r4KKBu59D3aGPJPkd9phT7616Sv/IAQwq603XQkaC3+Z6fo1pbMvy4z+qi25u04i
	Mphp/qT9drCn7AqRuqk62mfaxG267tt+oAb2nIb4lANvQ9M6z8aeLvzClCBtoQQLY25zWvni/xEeI
	goFeRALdqK7P/10Olo039at9pIab3HFl8vX+2x9Dzud4ofTlUTOdBvWyTdwdGnyMo0qxqI+kmuRSI
	9DqbcKjw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lDewS-0004Oa-Go; Sun, 21 Feb 2021 02:57:52 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lDew9-0004LI-N5
 for linux-arm-kernel@lists.infradead.org; Sun, 21 Feb 2021 02:57:36 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 87A6564EFF;
 Sun, 21 Feb 2021 02:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613876251;
 bh=43oKlJakbkmj+bTx5N6/ULvVZabZ4m+4gl0YkAliklc=;
 h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
 b=EFVPt1yoSe5ZuJagUcKd0MFZuhrBbGV3sBo6ng9ozqPWADujC4ZkhO5y4gfwD38W/
 LPgOe0qCfukGk32/L56yPdxv3gnixg1RBWpspY1gs6wAKtN7997DkCZCX5lIgNqR1L
 gSdCF4Ntzv9vVsLoETnnuwrd6N7s/mNy5sART/6pBzXy3H1+Li/9kq+4LGu8hUt9L9
 iSgzMYx8ahZr6LfvcStLgaYspSOSWLwoh0HitMxTiepSJvGi6wmp0hqLaz/TdKhrTb
 oj5wi3IujW/OqW97O4ByzAFSMZYnn8JXAuRH3/BKW0x6HYvQPL22No267MzDNupBnc
 jh9lNRD47xhXg==
Subject: Re: [GIT PULL 6/6] ARM SoC changes for v5.12
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a24DeEegVmydqduEFDuiTy6cyOb9Qng9X+33rUuMqMw1Q@mail.gmail.com>
References: <CAK8P3a0w-vPNBF=4ieg3YUyNHzy+qiZ5iK-9M1cRxA+TakScYw@mail.gmail.com>
 <CAK8P3a24DeEegVmydqduEFDuiTy6cyOb9Qng9X+33rUuMqMw1Q@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a24DeEegVmydqduEFDuiTy6cyOb9Qng9X+33rUuMqMw1Q@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
 tags/arm-drivers-v5.12
X-PR-Tracked-Commit-Id: 4f79a8b06fccec3dd68935db5a4662435c472abf
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e767b3530acbf651593e3d357fe1168a024d8061
Message-ID: <161387625147.20427.12654426496687737014.pr-tracker-bot@kernel.org>
Date: Sun, 21 Feb 2021 02:57:31 +0000
To: Arnd Bergmann <arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210220_215734_352006_3D885AEB 
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
Message-ID: <20210221025731.M03OMcxvEJYX72S2haHHuA85TVlmBYW4VlMlZxXW3SY@z>

The pull request you sent on Sun, 14 Feb 2021 23:49:07 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-drivers-v5.12

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e767b3530acbf651593e3d357fe1168a024d8061

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
