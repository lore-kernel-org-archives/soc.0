Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60770C4338F
	for <soc@archiver.kernel.org>; Mon,  2 Aug 2021 13:34:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3397760F6D; Mon,  2 Aug 2021 13:34:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6DE1460FA0;
	Mon,  2 Aug 2021 13:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1627911246;
	bh=oasDpz27kFmZh5itB/GUvE+3lwjuX2EwLqwaOKQdZLA=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lp7I86J7tQqXGrfCeoowc7Zj3u5QFHLV545VSq3oeX1aHG0gXZtXeLMBPZRC3UPmb
	 Km5L4x8B+dBlt0oh6C9bEF4b25IR+Fj4Pou/jiKr/pXHJnPf6Td8/B/Ei/ouU+T7nz
	 5LnWgxnpi2+BiTawG7g3LWIwDh4NKG7o2wQszOBWdQ/89Spj6rrhulIlYdDH0W5waR
	 a612Ndnz9848xF0oyiUN5YqqYjXcxn6Okfk8elh1oPLpKQ4EITo9tZywY0W4iEBnFk
	 TCkrDceoXS0oFLTmSSacGRZxFm7e4POsinRjEKf5Mg66WMBYzKjLcFo9WarVwHh13c
	 zKpkIe3oBY0mg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc <soc@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	arm-soc <arm@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 1/3] Renesas ARM DT updates for v5.15
Date: Mon,  2 Aug 2021 15:33:59 +0200
Message-Id: <162791122493.1140356.14062105755897419012.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1627650696.git.geert+renesas@glider.be>
References: <cover.1627650695.git.geert+renesas@glider.be> <cover.1627650696.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 30 Jul 2021 15:18:54 +0200, Geert Uytterhoeven wrote:
> The following changes since commit 2734d6c1b1a089fb593ef6a23d4b70903526fe0c:
> 
>   Linux 5.14-rc2 (2021-07-18 14:13:49 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-dt-for-v5.15-tag1
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 272614ec1b6bde9ab56bf8c9a71c4ff9ccf2eff8

       Arnd
