Return-Path: <SRS0=ZqES=PX=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9CA2C433FE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Nov 2021 00:14:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BEF6861207
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Nov 2021 00:14:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BEF6861207
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=on2dEhvweb9xhuLlJ4zl70IteD1j6t+qGO/jLTwzIXE=; b=r1nZDKn2twRgpa
	vnRiR/yg9ABtB37PaDyhtMHzEZcIANLeMUyaTTe4jsf4uzHJFGIFOwuR+ASfhWY71H8ic+DCrRxKG
	XMgvsGuC12eaAeZtBPQQgYtQj2KzAAj2QWfvEa4en/DoIQmGNy+7B9kZOVuVdGWl/3Oqhq6Ft62d1
	A+/TlU3lnqK2B2b/0XCpyWwFT+DJOmrcFN0sygfA4xwIdqvF5bNjq9qS4Mi3PkRlw/spgnCJUaXX2
	AWHwD+6M91zFwZovwT4S5iVRiLZZf42fiA6nRpqDcyQphdvjD9OZGv0D1dFt9JnXc7ZIpM0+9RAS5
	mQRabXIvYtnrV1wA5QTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miQNJ-0079Eg-OK; Thu, 04 Nov 2021 00:13:01 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miQN6-0079CA-LK
 for linux-arm-kernel@lists.infradead.org; Thu, 04 Nov 2021 00:12:49 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 4C3BD611CB;
 Thu,  4 Nov 2021 00:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635984767;
 bh=+ML6VCFgUSy1tcIMNjAJ3CyRpbIIhRo9orQztRd9JD0=;
 h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
 b=uWKQ39mdxcja6Phmt/dYkZzjy5eV0KpeW7nrHjLiINfoXWNCW98b/FQq2rKf2CI0C
 oqXbWywwKFpCp9IC1kVpJzxbpj5XdPQE5BvELetgIz0yhNfK79cVY8L1wAl5NQRa7t
 ylqT6BC/SCCfA/fDgiFqYxzC6hedd9ZRR0OngdSKYCX/Tk4AasM0UbS6Xr2DqBwV69
 gIDR5zeeUQK1Kp/Nf3nElppME7jHWmQeNkTp/ZFg0LlMd2FWFfv2lZmICctISs/Tjt
 n5Acp6gQ6+Gvq84gc6RSopFgobBypUVt2WYpyehCMRjuvtIVZJp+vG5bwJKxL+yTF4
 MxKrweV19M3vQ==
Subject: Re: [GIT PULL 3/4] ARM: SoC drivers for 5.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a2gzowTrpNtuMN6RH2J2BbrSBihJG5hh2EOSpxwZ=jYog@mail.gmail.com>
References: <CAK8P3a2FokRce-oN3dRJPihmDPWuqgWfWg1FNG6WKpWiUa4eNQ@mail.gmail.com>
 <CAK8P3a2gzowTrpNtuMN6RH2J2BbrSBihJG5hh2EOSpxwZ=jYog@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a2gzowTrpNtuMN6RH2J2BbrSBihJG5hh2EOSpxwZ=jYog@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/drivers-5.16
X-PR-Tracked-Commit-Id: 6a03568932b2711c91e1572f08867690b52a18df
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d461e96cd22b5aeb1df448536b92e8d8e88c4a05
Message-ID: <163598476727.32364.11194691650067602463.pr-tracker-bot@kernel.org>
Date: Thu, 04 Nov 2021 00:12:47 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211103_171248_746054_4685D897 
X-CRM114-Status: UNSURE (   5.12  )
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
Message-ID: <20211104001247.f_setpNGmAGJGd_t3ytmPddUPuTa5H-yLs08h3D4wKI@z>

The pull request you sent on Wed, 3 Nov 2021 23:55:15 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/drivers-5.16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d461e96cd22b5aeb1df448536b92e8d8e88c4a05

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
