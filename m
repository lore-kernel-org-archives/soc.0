Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D07BC4338F
	for <soc@archiver.kernel.org>; Wed, 18 Aug 2021 12:59:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 57C8B61075; Wed, 18 Aug 2021 12:59:49 +0000 (UTC)
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
Cc: Arnd Bergmann <arnd@arndb.de>,
	Andrew Jeffery <andrew@aj.id.au>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	linux-aspeed <linux-aspeed@lists.ozlabs.org>
Subject: Re: [GIT PULL] ARM: aspeed: devicetree changes for 5.15
Date: Wed, 18 Aug 2021 14:59:25 +0200
Message-Id: <162929137186.372162.11203697127775599651.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <CACPK8XdWRBb9cuDWGQPfK8R8TsZuydJQHsL4_e2w=HvCKAMogg@mail.gmail.com>
References: <CACPK8XdWRBb9cuDWGQPfK8R8TsZuydJQHsL4_e2w=HvCKAMogg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

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
