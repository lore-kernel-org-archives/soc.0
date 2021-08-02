Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80532C4338F
	for <soc@archiver.kernel.org>; Mon,  2 Aug 2021 13:34:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 504FC60FF2; Mon,  2 Aug 2021 13:34:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8CE1960FC4;
	Mon,  2 Aug 2021 13:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1627911248;
	bh=EeMU1k7JK0lGUWjAt7YcQieL8boQC4w/IvfTZ+BdQW0=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HCp8N68W9YRlV8ZnmecG/aC3Ik7T1HvvIPbEqeMH6urgZuwnIE4bOCn1n2NAVf9VJ
	 9vPos0y98C5bBIAd74aAB9Qv/Z4wwNGBdqFl4wV7vDXkOax+GjFdzZuOtG9aAG41nN
	 svsKRXDq7lYQiVZhZbx3J7sAEPq5jeD1RRpqHy7PtUNXfffodzWM1KDrFnAUK7LKAj
	 LA4fFts4ubfWoL90WUUKsMQV5cS4C6BiVEAX+CApB6hX2UjTn5hegZ45s+EpJbKo5Q
	 DQ29XkIGph2LeUKnytMRue/xSj0W9cRpGKZfgEN4cIJfsRQkqg1zC1k6yzsmcVv2ul
	 jvUinUJWtV+xA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc <soc@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	arm-soc <arm@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 3/3] Renesas DT binding updates for v5.15
Date: Mon,  2 Aug 2021 15:34:00 +0200
Message-Id: <162791122501.1140356.6236184546400456466.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1627650706.git.geert+renesas@glider.be>
References: <cover.1627650695.git.geert+renesas@glider.be> <cover.1627650706.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 30 Jul 2021 15:18:56 +0200, Geert Uytterhoeven wrote:
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v5.15-tag1
> 
> [...]

Merged into arm/dt, thanks!

merge commit: c4994975132eb2488ad1259c273812ae38f5fccd

       Arnd
