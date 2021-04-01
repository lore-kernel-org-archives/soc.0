Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34992C433ED
	for <soc@archiver.kernel.org>; Thu,  1 Apr 2021 21:06:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1029C610F8; Thu,  1 Apr 2021 21:06:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 86420610F7;
	Thu,  1 Apr 2021 21:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617311172;
	bh=H9C7fZndGJzPonnBNukM9PU9HffsDsUwZe9xsFCNTjY=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=Zde4Tq/KLW9oTtQpqqLvTJIW7Ovz6uQA7GJlK93z7irpHWSVhqdhlF4lZZMpuArux
	 qLm3SA8D/VErmgtN+yJsfY9+w5UZExas1Jcjue5G1Y8rCqPHjZ3kPwWAT49W74CU6t
	 WN6LzzKzy/HsOJXEeGd5HpRcIa0M+SwQ/63LHKl8AF99owKe00Hl6wXZ1iuo5354Ts
	 NLiZ6OmYaeyma6bvkZukgAfpJyYCA3VcWRHuA8yuND9xlUNoodur1TJiTgH6uRwILY
	 DVBpvNBtxfTpdyVtMUtC2lnuKRW2QdJHs38sAaI/MpbEyzWVPED+OEoU6KlcaEY1NP
	 54Ad0fReIHUng==
From: Arnd Bergmann <arnd@kernel.org>
To: Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: configs: Remove REGULATOR_USERSPACE_CONSUMER
Date: Thu,  1 Apr 2021 23:06:02 +0200
Message-Id: <161731114633.662954.15683308110570757088.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210401102858.4095-1-broonie@kernel.org>
References: <20210401102858.4095-1-broonie@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 1 Apr 2021 11:28:58 +0100, Mark Brown wrote:
> The userspace consumer is a development tool, not intended for producton
> systems and so should not be present in defconfigs especially not those
> for specific machines so is not a good fit for defconfig, remove it from
> those defconfigs where it is enabled. No system in mainline actually
> instantiates one.

Applied to arm/defconfig, thanks!

[1/1] ARM: configs: Remove REGULATOR_USERSPACE_CONSUMER
      commit: 797e1491b8df16eb666ec12f7a49515f12515c37

       Arnd
