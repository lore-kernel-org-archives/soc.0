Return-Path: <SRS0=NLw9=NJ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAD50C4320A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Aug 2021 13:03:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9521D60EFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Aug 2021 13:03:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9521D60EFF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sb5+wweYUIOMooCKVzT0rw7GgQjZ5mZhVa7chXayXMM=; b=DQfBbH2ozWt4Xu
	nhEGAp/ahFgUra08sZuLj9gYm+9//ojgS7JGpMGWP8RjlXWiYYzw+xM3PbmiVOyx+g4+A5p2l7sAi
	SbGzTtbYdrTm3+y9DIILnp8k/XrYC+qLdWPp50ZhkLtUNZeiGMNGj6uqzrwhXJJlc61MLWybdFIzV
	+8nuRwRR2rxFhOspyn7vaze6K5VyWoR5JeQTqCzmUoWu/SB3Tjflxn33lFBRJjMSdnzk7cpjdcN8a
	wJYWK8IN917NyOdQD+q7VNsdUT0Iaj0UvR6XFYggzI7Us4Psc0+oICBM2rWxmeykm/8cGJNt3N2+N
	0T1YsX0wW1WooCrr9fLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGLB9-005bOb-KB; Wed, 18 Aug 2021 13:00:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGLAb-005bGs-Gf
 for linux-arm-kernel@lists.infradead.org; Wed, 18 Aug 2021 12:59:50 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B829B6108B;
 Wed, 18 Aug 2021 12:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629291589;
 bh=NQ7YVl0zBOlQKk7YhXLiC9GPIBKFILKn3qHOuBPZ4m0=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jC9lXLxwbWi5EnRMx/yNZuNhW4xuRujrLlZbOQUDLSZ6rzBKNWtrrWifM8TLvKKCi
 dvP9gU3JRJKZqzSywxJAwC7PhrV5346LvWtaTMis0+PjMdXOnJx3jm6/q5pV9bj0ye
 81IF7OFgGMpbaXo24zWIt51SEdz4HjduGJUrJBdd27Jvs4GWAVUlKLAbTmS60VXvsj
 uh7ULcIVSXgFicNRXhT8Ym+87/3bKoVZyNI7b3TbCr4ZW/NvS0H9PAnhLLB2KJG4Ee
 D5qYdgpbmV3vSTLDyAb73xjgouwZBBqI4QzoMHFNqYkJJqE2oqNJLxs7g+1SEgVgZ0
 5aGk375m46hJQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>,
	Joel Stanley <joel@jms.id.au>
Cc: Arnd Bergmann <arnd@arndb.de>, Andrew Jeffery <andrew@aj.id.au>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>
Subject: Re: [GIT PULL] ARM: aspeed: devicetree changes for 5.15
Date: Wed, 18 Aug 2021 14:59:25 +0200
Message-ID: <162929137186.372162.11203697127775599651.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <CACPK8XdWRBb9cuDWGQPfK8R8TsZuydJQHsL4_e2w=HvCKAMogg@mail.gmail.com>
References: <CACPK8XdWRBb9cuDWGQPfK8R8TsZuydJQHsL4_e2w=HvCKAMogg@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_055949_615908_A76FF959 
X-CRM114-Status: UNSURE (   7.49  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210818125925.W1HwAk8AlkQQDZuk0BmVFhN7LONEJ3HQk5f7Eyhogfo@z>

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 17 Aug 2021 07:51:54 +0000, Joel Stanley wrote:
> Here are the aspeed changes for 5.15.
> 
> The following changes since commit 2734d6c1b1a089fb593ef6a23d4b70903526fe0c:
> 
>   Linux 5.14-rc2 (2021-07-18 14:13:49 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Merged into arm/dt, thanks!

merge commit: c872138c2c7166dc95c778f4decc165bace9cb33

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
