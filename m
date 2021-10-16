Return-Path: <SRS0=Uq4y=PE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58D60C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Oct 2021 16:24:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B69761027
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Oct 2021 16:24:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1B69761027
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tE9+W9v3rqOFgKU6RS9n22Vj+L3TTuk93fn4Vn+O6cc=; b=HOUCHNcC1oaKGn
	SEB0Pe9m3HR0FIMgbJD7zCYPV/5lIW3YwYIyIHFbHhlCRCcykX4hKN1nasem3oyWOfhPKaBC3rGun
	rsnpbZwQw54hrgZ7oyYEgyBhIBzShL4q0aCdBdwqmm2Sn2+OxbAFWYDJeyxdaktzmWcEFCG6RBPeb
	5JOztIVBdbIQXdE+fg0j/VQp53h+lR9A3jRNiHGBXbA4WnQF+Q7FE5J6T276/+Ky4bbpDCFgjwwHN
	qDJMvj8L7/vYeRfM0oOT3o/Gi3sO5uQGrMRcpYY1QOLiqXBrLaq3GpAJ7YbnEh8j6glqWATkbHRo7
	c7gY2BS3e0qNgn6g+MSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbmSy-00AxyI-SS; Sat, 16 Oct 2021 16:23:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbmSv-00AxxA-1J
 for linux-arm-kernel@lists.infradead.org; Sat, 16 Oct 2021 16:23:22 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 293166101E;
 Sat, 16 Oct 2021 16:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634401400;
 bh=ETay/AaGyhkEC7voDhONiaMq+QUOp5n0iys94ai1+co=;
 h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
 b=lS0i7dPN6E24eWpsl0ua4CSH3EkF5mjgUOCfGMQXds/gMu2k1thELAM0l/prId1ZQ
 rlJUwr1zWDkZXdBSz1iOb/7CfX2TCs7xmhPODi/B/tOp0WtEVTZIpkAeIm5y262peg
 LskSR/xFD/gy8ib+xzGwjJUAzte20EabIcf/BlzmV5qcRr/BpBUNVmWJcSUeGpfvC2
 8yal7uQrvboCzzMD3LVZ4t09bGiw0nfYAqoGBlDB9zstc0xOlKENjQy6BdvOAC1azj
 SqJesOQ1n5vaD2hLFag6ebsWxmv+KwEfzD22W8a+dljuZg6H5kf8XjR7K4takgR1gu
 0lJlDUfPV0F6g==
Subject: Re: [GIT PULL] ARM: SoC fixes for 5.15, part 2
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a17ccHJKteXL6Q+LxVR8m1BbedvNiVsmn_tQh6vj=bHmg@mail.gmail.com>
References: <CAK8P3a17ccHJKteXL6Q+LxVR8m1BbedvNiVsmn_tQh6vj=bHmg@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a17ccHJKteXL6Q+LxVR8m1BbedvNiVsmn_tQh6vj=bHmg@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
 tags/arm-soc-fixes-5.15-2
X-PR-Tracked-Commit-Id: 011ace4a7fadcbe8670b615e0db1e8d7b813ee6c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f04298169d9c522d611a2ce8c54489990c38e72f
Message-ID: <163440140003.26929.13876483742881199148.pr-tracker-bot@kernel.org>
Date: Sat, 16 Oct 2021 16:23:20 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Sudeep Holla <sudeep.holla@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211016_092321_122112_C04BF156 
X-CRM114-Status: UNSURE (   3.81  )
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
Message-ID: <20211016162320.Bvbol5-jfu_q9Wdty2__81kzyI6wxYg5nMqmmaWCUZs@z>

The pull request you sent on Fri, 15 Oct 2021 22:48:54 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-soc-fixes-5.15-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f04298169d9c522d611a2ce8c54489990c38e72f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
