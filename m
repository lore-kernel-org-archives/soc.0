Return-Path: <SRS0=LeP6=JE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8007EC433ED
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Apr 2021 18:29:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 138E5611BD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Apr 2021 18:29:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 138E5611BD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=03CK/wItEG4sKdsFtPvQVKnHbVWuK1ETV04W92lT7b4=; b=a5CnPhwjGp+o3oraSssNl6mnXN
	Ye8jronkBOWK9W5QzgOLlg+jkzEhDaQNgIuQHH75Y8z2OR/JCeLfX27yxo5aCNGatsRz3gwQM9ihu
	fDO+IDFglhhBLkNmvf9WF5PjE/Jbalj8O3yU2EHjcHpw9j/dWNf5/haKqR+cBa9Jj531rObPygE3A
	EiWg99xJm2+0KDO//jKegyHGjp+ct9KIRtby7Ao0raKy/t2Au/WsMTas2y7xV46Y7uKs0rehlk49y
	g1gMHX7MLEO5uoX0E1uwfJxeJ+Jyu7oR29RLbYAnRvXi0Q7/gV/pQwb2XtusHMcZ+SRvSp87hAPsl
	S8RQwJ6Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUCua-005kK2-I1; Wed, 07 Apr 2021 18:28:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUCuW-005kJ9-2g
 for linux-arm-kernel@lists.infradead.org; Wed, 07 Apr 2021 18:28:18 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 218666124C;
 Wed,  7 Apr 2021 18:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617820093;
 bh=CmFuQbnPJo4nr0FyADMBeregTf8AK1kXRyCUqkVrNro=;
 h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
 b=H1uhmuVxgpazrgz2qeTwfKCbN2vmqbw88LGkyWo+iX/SPq1u2qMrfUh5sZ5woJnTz
 9+yNtdWSk9kLpR9NO9ws31xzfKdaxejdqBo4+5AyA24dZSO1Yt6K3bja2xVuBOEI6R
 vGYVw836H5MiJp6w3QajGgHShg4ZjCcFziaHWDDVH9Gt3aUGXQxLDFsanT2XL3xLC3
 ecAj9xX8DPou+89EnLxfQQxLGA+WboNpeuIENB5VnfINrRZtGLjAvdG3+lZFVz5b7r
 fQ9IskM9atgQ5xA7m2GqnzZSnEYHIRR6z8hJw312iTMIdfx8tpj86kQ2phVJKG6R9m
 PnEHbywB+pMMw==
Subject: Re: [GIT PULL] ARM SoC fixes for v5.12, part 2
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a1QBvqNyReGC9UhYx-GOm3hYB1_xD22E0tmY7k_XqVUSg@mail.gmail.com>
References: <CAK8P3a1QBvqNyReGC9UhYx-GOm3hYB1_xD22E0tmY7k_XqVUSg@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a1QBvqNyReGC9UhYx-GOm3hYB1_xD22E0tmY7k_XqVUSg@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
 tags/arm-fixes-5.11-2
X-PR-Tracked-Commit-Id: 1180042dc6030c6e26530d4cfe0338fe8e447ca4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3a22981230f997846d1cfeb8eadcda8bcc0f7ea8
Message-ID: <161782009311.7121.7085895249015339168.pr-tracker-bot@kernel.org>
Date: Wed, 07 Apr 2021 18:28:13 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Tony Lindgren <tony@atomide.com>, Maxime Ripard <mripard@kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_192816_298499_39D6CC84 
X-CRM114-Status: UNSURE (   4.21  )
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
Message-ID: <20210407182813.nlHbSKUi9V1t1CDOS0Kpsgycsf1OsaDOplYb_78LzkI@z>

The pull request you sent on Wed, 7 Apr 2021 13:37:54 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-fixes-5.11-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3a22981230f997846d1cfeb8eadcda8bcc0f7ea8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
