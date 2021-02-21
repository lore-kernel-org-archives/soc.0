Return-Path: <SRS0=X6Z7=HX=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F13ACC43381
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Feb 2021 02:59:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AC2E65133
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Feb 2021 02:59:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9AC2E65133
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pkFXkEEJPcj2EMn3E9Ou8jGzmzgL7H0uWzZPfDa0bhU=; b=xCoH7DSjTVBuVREyYhadBR2IXg
	IRVmBfmcsLzrXftJU0337CsdJnVZWi3ZIpLLAA6CY/vuimnSFd6z2QVrIl/uKR54/OXzP4ZcEHpBo
	W+bp9FiiXR8wlgFm68zABFjexBfMQM4gDXiMlhTv0MBWmSnduIw2gOrt7x6w1Yu6bB9oJOPVpofIr
	2MZmFaVe6kD/eONR3E/5YIV8C1DbhpjbmZihi23blFfPEDebMnKPlE9eZSoBK8n1PO3MFCZ+JjJeO
	sQtE+hmTlemFGez5T9g4u8hFRA1pjd5P22IGuthai0uaq9kI8SszK9jotXRK8VkW6TcL83LU6WLBz
	SkZfd0ZQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lDewQ-0004OP-Hn; Sun, 21 Feb 2021 02:57:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lDewB-0004MT-LZ
 for linux-arm-kernel@lists.infradead.org; Sun, 21 Feb 2021 02:57:36 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 8106564EFD;
 Sun, 21 Feb 2021 02:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613876251;
 bh=82kk6aDXKM6S64ifemPIaPmHHDSokQqiP4WgVgIbeEY=;
 h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
 b=OgQXmI64ivIa1fbwSis8uff0Gq2AbG4+2PXq3afsDq+MssQ6NZ7S1ecS/ANb3fXva
 erZXpe5MezWQvPndpyDXPHx3M6FAmfofinipe4oQs3aQPmI84yVdg1AiK4cx4szaR5
 FnPdmPl5fliVInxjyfpsM4isbe7Pl+L8EDgEqkJGnS0vpmDG0nCU2aeuz4hPhqfCy2
 8P90oNS2Fo9e4T5SOGFsqpFeqTA/VqANFUl8JG/8Muo8HGQBcWRX2QWZuDE997zaSH
 0/aHeIXdPlZTDuVv9ppd/lUGSz5hD3sBF7e1ynhc9e2k78D9CGDjdkEs4IpP0B6unL
 w2xBVkGIm4WfA==
Subject: Re: [GIT PULL 5/6] ARM SoC devicetree updates for v5.12
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a1bF_6yzYn6We3A7sC_nJf+FVO2Pv1pgyu3-qa_YotT_Q@mail.gmail.com>
References: <CAK8P3a0w-vPNBF=4ieg3YUyNHzy+qiZ5iK-9M1cRxA+TakScYw@mail.gmail.com>
 <CAK8P3a1bF_6yzYn6We3A7sC_nJf+FVO2Pv1pgyu3-qa_YotT_Q@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a1bF_6yzYn6We3A7sC_nJf+FVO2Pv1pgyu3-qa_YotT_Q@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-dt-v5.12
X-PR-Tracked-Commit-Id: 14bd96946377148cb6e7dd7ce55ecc5128a92d7b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 82851fce6107d5a3e66d95aee2ae68860a732703
Message-ID: <161387625136.20427.7512357495842873965.pr-tracker-bot@kernel.org>
Date: Sun, 21 Feb 2021 02:57:31 +0000
To: Arnd Bergmann <arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210220_215735_828788_B1C7BDBC 
X-CRM114-Status: UNSURE (   5.41  )
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
Message-ID: <20210221025731._svhQbnafZYg7cfaFYyUB2pzjB2nUwJtMGCXquvDIE8@z>

The pull request you sent on Sun, 14 Feb 2021 23:45:18 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-dt-v5.12

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/82851fce6107d5a3e66d95aee2ae68860a732703

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
