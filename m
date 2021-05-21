Return-Path: <SRS0=pBbD=KQ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BC7EC433ED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 May 2021 00:52:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBA8D613AC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 May 2021 00:52:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CBA8D613AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8NW5SxQwmsncmMFeIzKEa/s2NCKE8VLVmvsWDInJABc=; b=SUFoNsOkNDQiXqrj6piz4ZRaLF
	jHLogppeItINH3EpUExl4uGuZSL0UwKonPvJ2CCKsKv5gUaaeLm3PrMYqff7JinxhrovsVQsK/KGt
	4GqaIbiylKXqOWLR2jYo03UHkdMnVSddf+yfjyRFNwGBJIvRQTNV3tt4pjd3JuccS4fdUpBGpSix/
	38I9EYJCNHpN7PHg9ATjpk+DD6FDFi3GGudZyPVyySVhV6flWG06SINmviCMqzKH0gdbM1h7sBmKX
	XNxn7EUz8vINCj899lW7uXQOAjBxGT6lqJurzQ9J+BGL86Bq6h29tz59/tkdo7XE33SSTli/oGvXZ
	i6eeiVBA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljtMr-0039qD-4M; Fri, 21 May 2021 00:50:21 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljtLS-0039P7-2b
 for linux-arm-kernel@desiato.infradead.org; Fri, 21 May 2021 00:48:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Cc:List-Id:To:Date:Message-Id:
 References:In-Reply-To:From:Subject:Sender:Reply-To:MIME-Version:Content-Type
 :Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=MLAJcYYmXI1J35bDnMoK7p50r9vWYr2rtI2KfE9gut4=; b=TN5KczLHH49lbYDAQWvCP71JpR
 5OiTS+RlqUmQQ0edfg5RxfcPkjBcaLin38IKAJN8tcKFh5SCBzWqhDxpI4VRN/hPgM5aUlgf65XFt
 WjKdrYEO1Vyjj88o8mafkqQkBXWCNWbt98dW2BXLhh1jZd74O0aJF6M9TtrdPvMIB25Zl76Gr8+Ik
 5VN8Lq5h++9BRF0xU/VjOxm1r9vEHQiLtTfeyawfBAHwC9SkXTU5+TcdqsIlKhthboADsUu3jH22P
 FDO6ILCQ1LBbWEj5CE/VQk1yhygcH16DsUHtqjsUXsRsuLuMh3ENarb66pAW18eXbMsGZ0e4hOEGn
 zSEQXhgA==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljtLP-00GjgM-Fo
 for linux-arm-kernel@lists.infradead.org; Fri, 21 May 2021 00:48:52 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 673C8613AC;
 Fri, 21 May 2021 00:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621558129;
 bh=S74FQGlGcpbKGa+miqThw2gK80sNQmuw9ASTQf1gwxY=;
 h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
 b=hbWduevogV0b77tj6jOKtllRe+vdXp1yQUJkFiUNAYfTZ8MAwGF4IvJ1F4BG5kaV5
 vgGW7vs/iEntQr4foWU7NPGWmK6pR3xE4n0tUBIIed6ltAdhQj3YKDzhWAKAWM9Cat
 Bt4I+8jpc+O38SJiP3yOqxihVzfGTYtqpbNycz/UQtMKMQ21kOMKrSnq7w8RIdYfXK
 yNLtcBbC+BVxL2/mHKuHSDI3adEbqolh9ICE2j0ll8W1TOCBbc7CIvlUqnkcxP7kwF
 kSVjd6aWhdy73m7SqaGWxKD01907iQZuLl/3lqc6q1QhB2n6TD32Sp2Ei9UydvrqOx
 gaqLTyphnsMaA==
Subject: Re: [GIT PULL] ARM: SoC fixes for 5.13
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a0QqwkGDabWzD+oDp7jsfkuLEaFxmCaHBuu_HVd4TxLXg@mail.gmail.com>
References: <CAK8P3a0QqwkGDabWzD+oDp7jsfkuLEaFxmCaHBuu_HVd4TxLXg@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a0QqwkGDabWzD+oDp7jsfkuLEaFxmCaHBuu_HVd4TxLXg@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
 tags/arm-soc-fixes-5.13-1
X-PR-Tracked-Commit-Id: d37316b72e8bf95a52d1c3e93c823d128c09b521
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ba816d3c265cfe9ed0ee8347eab63cf5ac3cf5dc
Message-ID: <162155812938.12405.10426812957569408184.pr-tracker-bot@kernel.org>
Date: Fri, 21 May 2021 00:48:49 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_174851_562839_3EC5094C 
X-CRM114-Status: UNSURE (   4.31  )
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
Message-ID: <20210521004849.1hprD2hoDEfyD0yNZjfmSDkEJmZJ_LLhUjMvXW78mWU@z>

The pull request you sent on Thu, 20 May 2021 23:04:12 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-soc-fixes-5.13-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ba816d3c265cfe9ed0ee8347eab63cf5ac3cf5dc

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
