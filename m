Return-Path: <SRS0=6ihi=JX=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01D10C433B4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Apr 2021 19:46:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE3F2601FD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Apr 2021 19:46:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE3F2601FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SOW6RvCLoiWc7zRfw2AxuNGrSogcglDv1iZqC8ryf3s=; b=kwEZdvAfOSF5EOeAsTA/zcWE+Q
	8sCk5ob0JdGtyr63WhxIYWATxFL2r7zEKFF68cHAri3sn4rHGI5piXczenU6JNdFNH2FbRymijIvq
	plJivhG6IQM/eMoDjZy8X0ioqEsRN4N7+UGw4JcoOS5ezEjYGL5rP3dp/i3WHd2oZwyWx+9fM7s1P
	cUFf0ayvGgPqXUU0Z2C73d1I+YY0Dkf/EmnZFd3Q4EZ7z9U+b+zt+pbsqIQYT7bgpLqDDX5i/iCqC
	KQdiKpfYRDh0IUnxfY/zRS0+aRYqoIwoIIu04xpt7btlGHjSl7FjlQ0VKYXbpYJnbneQz9OovICTL
	a1/KG4xQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lb7A4-008PVb-PM; Mon, 26 Apr 2021 19:44:53 +0000
Received: from bombadil.infradead.org ([198.137.202.133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lb7A0-008PUn-4F
 for linux-arm-kernel@desiato.infradead.org; Mon, 26 Apr 2021 19:44:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Cc:List-Id:To:Date:Message-Id:
 References:In-Reply-To:From:Subject:Sender:Reply-To:MIME-Version:Content-Type
 :Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=m5hnjSaxZVKC3GJr6UKiG/yTbANO9jHtAZOsXVN8TPA=; b=2sIP2OtFrXbt/lanIRqBsDQaFN
 SF5MQBQVJ8F1moChLHlkeOBupb5UPkk30tHXdTpEU4TQaEvjIqstREO8mVlvHsJe80TQYCluNd1If
 Rux6v7WPDZkKnDRT9G+jQZJEX8OUgxororYSbDv+No0XsNzMTiPVQK+twXJgJ3BGzFiRSv/SeLDIM
 mfM7LVRZXJC6JvnpbEiJ88dUP881lxty20DzPvTeg0Mqnnyoltv4wwDALzRmjaznJBCA9hsjwGpmd
 O7TwF+HnnHFE7DMWqptIoQ8loZw6DkWtjUCvWRxjYoaEHL4KKaEQ5wOwvElBLMUavm9YxTYwdnGvO
 NmMkGGqw==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lb77q-00G9Qq-47
 for linux-arm-kernel@lists.infradead.org; Mon, 26 Apr 2021 19:42:36 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 86C9B613AE;
 Mon, 26 Apr 2021 19:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619466152;
 bh=aXOP3JIomXu1pAVOHaJs3BXugpMdL8yTf7vN7vdgK3A=;
 h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
 b=Ta7M2YumvURciw2Z4iPqgDNF5vt879waee6DM9/diRLe+248b1mpKgQG1//r6gu++
 H0xkmfcjKHtUXxzAxQgWlKJcdQXndkD8+kYScQKCjr7jtd9gdSKvu97CO/TvrU4IJl
 clD+vBm3cTtkebYFztBGcQWMiGjFuqjeZOAb6b8u49u2uoraQwP0rpvSBKYXeLT9S3
 Vgkcx0gPnW26hBluV/QvBkLfYzy6LDGarch49JRtylMoYp3qiBUPCdu4TJPnpvWn/o
 +wCI3AWDwgmqP+0oxMdSKe1O00TBYz3c8PgqSg+JiEyEKOo+h8fqeXOcL1wJ6DIzay
 GvQF/x3WAQo8w==
Subject: Re: [GIT PULL 4/6] ARM: devicetree changes for 5.13
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a0=urEEHzcQt0u2fbb7SLDO6NGs8aeYvNpj=jP+YWd2Hw@mail.gmail.com>
References: <CAK8P3a2RjRSjTcmwVf3VHy2CUB2HBj5AaJTx=1NSYuA_Qy4E-w@mail.gmail.com>
 <CAK8P3a0=urEEHzcQt0u2fbb7SLDO6NGs8aeYvNpj=jP+YWd2Hw@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a0=urEEHzcQt0u2fbb7SLDO6NGs8aeYvNpj=jP+YWd2Hw@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-dt-5.13
X-PR-Tracked-Commit-Id: 3f9a3345a3a116af806064826d42cf5211dd611d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f7857bf3745e9ede6367a8ff89c1c4f308bfd914
Message-ID: <161946615251.4821.10515143179081060713.pr-tracker-bot@kernel.org>
Date: Mon, 26 Apr 2021 19:42:32 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210426_124234_224582_3B28A445 
X-CRM114-Status: UNSURE (   4.14  )
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
Message-ID: <20210426194232.cuL75b8kRZYOC-L4eiLjuUJCWF11TWrJzuUW645Bnms@z>

The pull request you sent on Mon, 26 Apr 2021 17:57:08 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-dt-5.13

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f7857bf3745e9ede6367a8ff89c1c4f308bfd914

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
