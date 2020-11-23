Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73120C2D0E4
	for <soc@archiver.kernel.org>; Mon, 23 Nov 2020 16:52:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3A9F722210; Mon, 23 Nov 2020 16:52:12 +0000 (UTC)
Received: from threadripper.lan (HSI-KBW-46-223-126-90.hsi.kabel-badenwuerttemberg.de [46.223.126.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 69ACD22206;
	Mon, 23 Nov 2020 16:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606150332;
	bh=l7xW3y1NS0SxZDHZxvp1uaALvEDNTeAHYw6Dhd15S7A=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bWy9AGkyWcBCjVYwJk/baoeYhJA7SiFinP48TmxasX/Ynt0fGC83NTPT/gQiEVvzE
	 2RBteDwl9TBqtGl2q5vGgBwwcitJUMGqpXw1h4QFrzd0LouOckJ5X+p1AFdRrfjC9Q
	 jzcKDwYft8aGTLuK58Dn4D8za7soPGoMTTl5tBcM=
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL 2/2] ARM: dts: samsung: Changes for v5.11
Date: Mon, 23 Nov 2020 17:52:00 +0100
Message-Id: <160615031096.69876.12612135680941414001.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201113162211.10020-2-krzk@kernel.org>
References: <20201113162211.10020-1-krzk@kernel.org> <20201113162211.10020-2-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 13 Nov 2020 17:22:11 +0100, Krzysztof Kozlowski wrote:
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-5.11
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 1e548b67828087a29c6b8294629c1620826fba15

       Arnd
