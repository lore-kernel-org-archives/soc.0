Return-Path: <SRS0=ZqES=PX=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CEBAC433EF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Nov 2021 00:14:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C8E16120A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Nov 2021 00:14:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3C8E16120A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wlh8K7Nd5imY3D1xzvmCe6iZ5jngv7DSE9pIrp6Xm7k=; b=j0CkvzeYh0ppjz
	YiF+ks0GXlgNd+MQWa2HfBCc+HwIBmhI+rGzEpJ93xqJ198kf/+hhC3aterJSLDbysx9pwqlQmdlI
	i3KQ95S8ReJsDEu3ZtLIAuocsMyIIxDMHChX0S+puWTW9KOpuEk8Too5Fbbv/qNMqAo4es5i4UXq1
	80A9a6cSRdzaC/RLCyBhU5b224+y/v85oYjIGEqzfOAdZOyC7xZc/a6cVXW8qisFaubJEWbme5v9y
	dVBFGgwqKg4Zj/gLnz2gG9SYgf+h2chaHzu19Asv0ISCDeU6puzxedC1lGeUofr4zbcU8o936qi6K
	W7w6J38pX+ku50zW/kSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miQNV-0079Fp-5A; Thu, 04 Nov 2021 00:13:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miQN6-0079CB-LB
 for linux-arm-kernel@lists.infradead.org; Thu, 04 Nov 2021 00:12:51 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id F229F60E98;
 Thu,  4 Nov 2021 00:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635984767;
 bh=9VnFC1Xi1zLHjhHI9HJcuOMSQC8FIAOxaMKK8yHkZw8=;
 h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
 b=D26nkK6OB3FQ05dvctZTotqFjeytLoRgBVTAJAkwROe/Xl6pgkeEYgQc0IlC4Dywy
 VicXHU47rbo3qVV8bH1IrIj7O4I6KrNgUkN+zubeVohELATaGNotOV6DhotlzDU0dk
 E3OJtvRfzS09vGZX80wN2IcykC46TwNlLuhRAMw/85T+UOAFzecyRpkXlGV30P6v/X
 AFABAvz2ar8cro0pzhtDbaRCDXGlx5o8L8gjmCJy9awrS1ABoymUczfs2oR0qGLkHf
 ZuZF7+8ll6im/ODJVEzGBbw6FkUYeAzVxSDguRxUvk6bDyPBjKGJgu0+z2+GVQTXm9
 pvFsRuRe6tXdg==
Subject: Re: [GIT PULL 1/4] ARM: SoC updates for 5.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a2wxvYiEqCQbF32D-XyQAuthomVOPGkJYCrA13DUbL_4w@mail.gmail.com>
References: <CAK8P3a2FokRce-oN3dRJPihmDPWuqgWfWg1FNG6WKpWiUa4eNQ@mail.gmail.com>
 <CAK8P3a2wxvYiEqCQbF32D-XyQAuthomVOPGkJYCrA13DUbL_4w@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a2wxvYiEqCQbF32D-XyQAuthomVOPGkJYCrA13DUbL_4w@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-5.16
X-PR-Tracked-Commit-Id: fc3d4aeb559f2f704b490f8c1dff82f3b5b142ca
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2219b0ceefe835b92a8a74a73fe964aa052742a2
Message-ID: <163598476682.32364.5996070049163105070.pr-tracker-bot@kernel.org>
Date: Thu, 04 Nov 2021 00:12:46 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211103_171248_749124_9DB66116 
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
Message-ID: <20211104001246.H-dt5kKH2aX7h-kadhQJqFb_5XWTwJFt7BOlnPRwar4@z>

The pull request you sent on Wed, 3 Nov 2021 23:50:43 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-5.16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2219b0ceefe835b92a8a74a73fe964aa052742a2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
