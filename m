Return-Path: <SRS0=6ihi=JX=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DDB1C433B4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Apr 2021 19:47:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C74BC610A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Apr 2021 19:47:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C74BC610A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+vP8m8Do14H4GYRjGIWAEme1sFXUOsee+e6IdAoVy1Q=; b=Ad5p5n8OxdOMuO4EkJgPjxQImW
	xxSJz/5qd+EAX8YjwwLp1pfSO+Xfw7i7LuHXnBGrRdoAknUXTH6quk/BYywkTN0GMNfiFN4lPWRHl
	5s9omkPXB1f6n4LwjgPTfQlpizW2ejBx93hf3EN+zp3wkPs0rko1rR+ofuoq5coU7VQxw9QEwaTJL
	xRyY5H0EoBFyd/1+bY7I2+V3oORCbQYlOsZU1y56lfTdaQ+a9Rvk6cKDB5bslrdu84oYYfT1POH0z
	RkTZnTblbZML8Dbr5yjfdQdYChPMJkDwXEoFcepo3UXD1jiW7PYEAf41fTUHUlaI9dBGb0t7CCyYY
	bO433x2w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lb7Av-008Pdp-3k; Mon, 26 Apr 2021 19:45:46 +0000
Received: from bombadil.infradead.org ([198.137.202.133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lb7A0-008PUo-4E
 for linux-arm-kernel@desiato.infradead.org; Mon, 26 Apr 2021 19:44:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Cc:List-Id:To:Date:Message-Id:
 References:In-Reply-To:From:Subject:Sender:Reply-To:MIME-Version:Content-Type
 :Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=j4p/ma1i9SSkYT+XrAC83sj1w3Jogy8MmUgFHb+5Gc0=; b=J4Dj5ux65TR2wxdZbOEK0NI8jN
 ko1V0LO+wq8kjlMmtJs3S+iNYmU1Wla8U/wN53UrLwswMCLC3PmFwhsT7s4itGib3NRoQC/SxyEwN
 TD1fRxHPEkNOgYZQsG+14v/kDOLr49PddygXEBEN+EXR5j2yhtwKfmVKSiAQsNrZMJgdsvD5eHgZv
 P6J54UH2KM4b3nUq8UnmyajyT1RslCGEsvRtwLtVQz5bRCVTSNoB65W5P5cf80VXr6+2nxDWUKukM
 e31WTH6Su7NIi4chU9KYR69FswdehXASzGsB6hKZCnvU+XRCJIQojbHrA94mBo73l7sGcFXUR6EL2
 DBaPCuSA==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lb77r-00G9Rt-Kw
 for linux-arm-kernel@lists.infradead.org; Mon, 26 Apr 2021 19:42:36 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 01B4E613BC;
 Mon, 26 Apr 2021 19:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619466153;
 bh=+xDYKxjo8HuIJ3rW/JHd3u8zWOnBd6QuleFjnSXjOJI=;
 h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
 b=h4FYR7zRJCJowH/mzDfcFdmLrzQW6LSiyi/XZM1xQ5ETY9iB5yYW7bw1r1cINPBgZ
 MYAuqxop2wwbsUTpzh4jb73bi8EP42wlR6NcnBCYcsqZgEa6xmbjDDsDpZYEAY5fWw
 0U8k1viq4YADkvAYzMa86KNgrwC4dz4AnH0aWW8jmEDVYPrDgpTJ/xS4tetIU0XMMr
 zWFCkM5AN60d9G6WWBbYDqw4RdyAJoEljQjJNYuuyI0RSEDuAyX9StwABgy7XcOH64
 UQeZTePxA95E7MWpnh2s2A+83+xbdWyFw96ngUFNrJDaD7Y5A8WpLt3h+m2Xh3woJU
 CXnBYU340IDaA==
Subject: Re: [GIT PULL 6/6,
 look out for dependencies ] ARM: platform support for Apple M1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a388f9iSncTW-sAdbeg3-=vc=6r0X9392puGE=FsWy=Yw@mail.gmail.com>
References: <CAK8P3a2RjRSjTcmwVf3VHy2CUB2HBj5AaJTx=1NSYuA_Qy4E-w@mail.gmail.com>
 <CAK8P3a388f9iSncTW-sAdbeg3-=vc=6r0X9392puGE=FsWy=Yw@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a388f9iSncTW-sAdbeg3-=vc=6r0X9392puGE=FsWy=Yw@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
 tags/arm-apple-m1-5.13
X-PR-Tracked-Commit-Id: ea96292838397682530ac77a429974f8ff5f2df3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0c855563182001c829065faa17f8e29e9ceffe13
Message-ID: <161946615297.4821.6463208046152364085.pr-tracker-bot@kernel.org>
Date: Mon, 26 Apr 2021 19:42:32 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Hector Martin <marcan@marcan.st>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210426_124235_730663_815467CF 
X-CRM114-Status: UNSURE (   4.98  )
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
Message-ID: <20210426194232.JaCYqJ9yd1ThSojuqPOdBEtjOE_TAau1umpEKzZnir0@z>

The pull request you sent on Mon, 26 Apr 2021 18:05:42 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-apple-m1-5.13

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0c855563182001c829065faa17f8e29e9ceffe13

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
