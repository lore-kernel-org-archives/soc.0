Return-Path: <SRS0=S75E=NX=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D27DC432BE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Sep 2021 22:46:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2BF561075
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Sep 2021 22:46:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F2BF561075
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FxM5/nj36M4CGEEn+CMkr4V1yuYaCy2Lor+prBwRXok=; b=NqC2ZeK2l0bEKM
	VVFMUZ7/cFMa2Qed25Ujy6P91F2x7ei5BT9Dnrk0lh/JKI9uxlLrzh6FIonZFrAKf91yQhEU1njKE
	Z7anpn4713Rgq9r1YkQLRvGBbF6vADaYsq0wP1ZQvid0s+6rv+Obfd6l1XUQZUm4LkIkC1V968CGv
	+3u1YoIgZoH2DjRozk8V9945U5pS7Tvlkl+Wrwg8NqJESo2/HFox2JBo+TtuI3LrI954TqOQfSd2L
	fq4Jk1al9k92wf8birdHv+SjKGB+Ruvl4RIwdJaxgfrZCAiKzXLXnmg7u2BpEBc/ujwPfBrXHIKWb
	X4pyXXXxY/n2UuKISYng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLYxz-007jrL-Ii; Wed, 01 Sep 2021 22:44:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLYxl-007joa-79
 for linux-arm-kernel@lists.infradead.org; Wed, 01 Sep 2021 22:44:10 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id DD0BB6108E;
 Wed,  1 Sep 2021 22:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630536248;
 bh=3UrfkiDJhUDQYaI3hsoR73dEX5znLBzKGMjRp0zqRMM=;
 h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
 b=Jyzi34YaXEMCzsG9tGU6z2QoV1bcShjz0x/qJmUidT+FyWy2YAKNQDJ2IPU4m3+Hz
 1LEt3d1ujVfkHo7RiKAJnh6kfik8ZWCaXb6gyNyC9AGAw8xjnFVutalM/cOHc9REPP
 uF6A/CRQUb9GYkzGOjmrOmbPAgaHY8rIN8QYOxspUTn2JmLyDnVMFux5WArX6PWm/p
 KTP1SYh972lyJilYzn3Ewgxnu2PV4yaENPN55HQOkvNSSVcAGQpW73QiCO1hsJY2sP
 iu9f3nDFkRE3/q9kaa9O6zLf3OGorQmXf1YJiyhPiX72vmg3x+O/q+GMs5HxCeS8PU
 NLYBWOj80Tf0Q==
Subject: Re: [GIT PULL 1/4] ARM: SoC updates for 5.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a3jec5z=V8ZMTbqDp4pqZ-P0-dJ81qTdwCWa1rP9nieeQ@mail.gmail.com>
References: <CAK8P3a2GtDmpEz0KzeeKXEZZScLff-_=vv3UkOr3Ds9605g-oA@mail.gmail.com>
 <CAK8P3a3jec5z=V8ZMTbqDp4pqZ-P0-dJ81qTdwCWa1rP9nieeQ@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a3jec5z=V8ZMTbqDp4pqZ-P0-dJ81qTdwCWa1rP9nieeQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-5.15
X-PR-Tracked-Commit-Id: 51e321fed0ff8d64eff809a4ee0547254cdcc4a1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 634135a07b887a8ad8904da8c147407650747a38
Message-ID: <163053624887.31944.18225380267706333661.pr-tracker-bot@kernel.org>
Date: Wed, 01 Sep 2021 22:44:08 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_154409_332057_4BB8A82A 
X-CRM114-Status: UNSURE (   5.17  )
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
Message-ID: <20210901224408.RxUk61eXradUOf9STbRvCavqWxpBY7xfV6ZDZ_9_xUI@z>

The pull request you sent on Wed, 1 Sep 2021 19:56:35 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-5.15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/634135a07b887a8ad8904da8c147407650747a38

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
