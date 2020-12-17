Return-Path: <SRS0=g+kj=FV=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 093D3C2BBCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Dec 2020 00:58:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C050C23B27
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Dec 2020 00:58:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C050C23B27
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gUa1duN+G8XJ5H2RK88mxNkRiUPJrtyZxK1rcd3/E4U=; b=cocPNhkXBujJ3NDDksgVs8zZ+h
	ytEmVyZa37y6lGWppkzywc5tgInwuFwnMX7jsGwznEMy3gDq/W9qVWxoWQlZOIhnuoMa/mzl4HFqL
	FpR2whY92L0cz/+TXqPEchan65SsvfmvK57GAup7DKJV65U1vzm0NTBDOMfZSNdWelUY5895b7vI7
	7j2m7a4AUAGsHKSyGt8eFdNr7+XnU7RniVpieh8e9y5GawdbwLPkrVm0eY1CjXoEJnOOQF+6qOOH3
	GzfkeItUaewIrV1J3i9G9uH0pE0i6Yukb5QtuduasZ+bN9AYG5WGW4xYEW33elIVh7Ba/Ido0GY+k
	C6FHQv6w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kphbd-0002m0-21; Thu, 17 Dec 2020 00:57:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kphba-0002kh-0H
 for linux-arm-kernel@lists.infradead.org; Thu, 17 Dec 2020 00:57:19 +0000
Subject: Re: [GIT PULL 1/5] ARM: SoC updates for 5.11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608166636;
 bh=yCjFiOouycpbFyB/zyc0w1uubea5LFk7ZQhDekiTZnY=;
 h=From:In-Reply-To:References:Date:To:List-Id:Cc:From;
 b=kQYStM2CxF5Hx+6HWgHBGE/0GtGTEJM8jtI/YlsG83v1GKztwfIsNWJzMNFOMx22+
 8XMBssyYN3BeK0t4MSm6rFYAe8A1ZwhbDgIhj+9Q6589zqfIFkrSfIwnbXD9Rpnpc7
 6l/YWZw7oIUujKIEPCQYtpHFQcx2G4O7fEE2UEJJeIyNZMw+wMvGgLsjQJ1uz9B4e+
 scdI/14RTG3/ONO8WSBqptg4g/KEcaAtDabfyrk6op9O14x/YHBoVrZViN4PkZTW6Z
 Wn1l61oVxTDLpjtd60WNT2BdULekIdv/qva4GB+BtXc1i0eO6z8Alu2zsiqmzOE2W3
 t1WsdlopOcuxw==
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a009=T3WorioFWX8d=tEK78_o6ZHM6TGSmWmd37-_izug@mail.gmail.com>
References: <CAK8P3a009=T3WorioFWX8d=tEK78_o6ZHM6TGSmWmd37-_izug@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <CAK8P3a009=T3WorioFWX8d=tEK78_o6ZHM6TGSmWmd37-_izug@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-soc-5.11
X-PR-Tracked-Commit-Id: dcb11100cd5d3f5a191b7fba75422e3df792f3ff
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b06db0b3936956352a6ff693ea589bd4671c071d
Message-ID: <160816663648.8160.17970877466719452935.pr-tracker-bot@kernel.org>
Date: Thu, 17 Dec 2020 00:57:16 +0000
To: Arnd Bergmann <arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_195718_185274_75CC0A28 
X-CRM114-Status: UNSURE (   5.36  )
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
Message-ID: <20201217005716.JWXlJ5LYeSgVY7lfLTs2-6wPrSztVyhbO_RwHU9JqkA@z>

The pull request you sent on Thu, 17 Dec 2020 00:22:29 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-soc-5.11

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b06db0b3936956352a6ff693ea589bd4671c071d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
