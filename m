Return-Path: <SRS0=Yq3b=MC=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41E66C07E95
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Jul 2021 17:37:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0559861289
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Jul 2021 17:37:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0559861289
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tGdKvDUD5Pj/lMjtCwnzKa19rTClzQpJyF/oky7E+O4=; b=NxRKQ7WpviWGgX
	94ZvgBl+iAgV4Cii/O7NjEC3h9xEcned/pJk+s0eFpev/lEH9+AEPhAQstK02RQItR+rs0dnNsTt2
	tvLgbCsEp2cOjLXizKyFgpbb0158JwZc3z4kGut/LUmi1ZmScGI30j0AJAjiVwLYLhzd9rgzK1yI8
	TNuI2SgiGkKk3nRu4c6BhlXE5QYSW+M6ABxeQor+mMkZuE+4xmmh9sXiPgM1Vaw2oMQSZ7NfzMY2p
	hDmzuI3tsdfR9XTTPucYwx/yjD7FZapRkt8citUhQLn0KYzhfz0F8Zapa7jgdVzp/hj7W9MIMRQp1
	n9opa5K3fWtRAb7jWP/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m2Gta-003xiB-09; Sat, 10 Jul 2021 17:36:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2GtA-003xeV-Fb
 for linux-arm-kernel@lists.infradead.org; Sat, 10 Jul 2021 17:35:42 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 209EE61289;
 Sat, 10 Jul 2021 17:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625938540;
 bh=Zh2Uu+h8sRtkqtXtrSHA7KNBefDfnjMlHARaFIBxUHo=;
 h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
 b=UzXHdRRIaKPd/6FbfRbwRV35NBKe60OvqDT/uF7VstquOdTs+AMFtJlKVV8GlvxoW
 vr4AtxAbwmSASjYAwz81ct7rnXNnewGuadeFXxrjtYgm2/qualRJQdI2LAsnoJeRcD
 nkED26lbiKsyiwZcywoMCQvuKPspow77q1LawL8VAZ7nTQCv5XRd2XpHUk1jpMssvM
 sQIAXAOreNwBC77vIF4XAwkknZZk2Hbk/046YB1vLAgAmaCTcysI5zxKifaHNivaTS
 4NN4eM9DUNUayGWWWpxNl4APjZx7uFc5NqCEeETlfTsCvxB28wvI7We2f7laHGwij2
 J83/H/3SeY9VQ==
Subject: Re: [GIT PULL 3/4] ARM: Drivers for 5.14
From: pr-tracker-bot@kernel.org
In-Reply-To: <20210709234054.10288-3-olof@lixom.net>
References: <20210709234054.10288-1-olof@lixom.net>
 <20210709234054.10288-3-olof@lixom.net>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <20210709234054.10288-3-olof@lixom.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
 tags/arm-drivers-5.14
X-PR-Tracked-Commit-Id: 2afd1c20e7547887f37f638d6b7953138d8c948e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 071e5aceebebf1d33b5c29ccfd2688ed39c60007
Message-ID: <162593854009.16773.6811500673684434420.pr-tracker-bot@kernel.org>
Date: Sat, 10 Jul 2021 17:35:40 +0000
To: Olof Johansson <olof@lixom.net>
List-Id: <soc.lore.kernel.org>
Cc: torvalds@linux-foundation.org, arm@kernel.org, soc@kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Olof Johansson <olof@lixom.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210710_103540_574128_6DA44FC6 
X-CRM114-Status: UNSURE (   3.49  )
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
Message-ID: <20210710173540.kAetzDl1pY3KUeqZm0wQ2nA8Gii37K7QQFI97QnRQaQ@z>

The pull request you sent on Fri,  9 Jul 2021 16:40:53 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-drivers-5.14

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/071e5aceebebf1d33b5c29ccfd2688ed39c60007

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
