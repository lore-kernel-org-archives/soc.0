Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B735EC4338F
	for <soc@archiver.kernel.org>; Mon, 16 Aug 2021 21:20:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6E6FA60F11; Mon, 16 Aug 2021 21:20:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E2B5C60C3F;
	Mon, 16 Aug 2021 21:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1629148858;
	bh=xy75B7f3O3rr1HsJ4TIPFeo8h1e6BjPN9GfOsaopMQ0=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Qeo3TZ0As32pZKsH9KiwU5xtTfHLQJcOlZ+jbj+9k3TFmMuHJ9P464WR2LZk76n0k
	 7MAmD4jeikhnxSTOzGRtKH6uJbV6KpsMqsUHsdjnwi1ykd3KPKMmEv8JuKPdPAvW5o
	 RuvQA8voWVcKTeMWray3r9oEesOwGjzyDNAi9WLxIG1defnNVppZO+L2ojbm68qg8t
	 ugb0FWrEo8+UR1Be3DWpT7Mnr63HyDdfqZMGwa3Ym4oX/WhcVtOSndR10eN8yHhBK8
	 6jW3hceoV1LfpenUQ72u6jTjwwMWPoTIR9AlOv6ayRw+w/Sacvkkup2OG1t0/A9zYu
	 45komE6TwXmyg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	soc <soc@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [GIT PULL 1/2] Renesas ARM DT updates for v5.15 (take two)
Date: Mon, 16 Aug 2021 23:20:48 +0200
Message-Id: <162914852219.237905.10683958407915595103.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1628849623.git.geert+renesas@glider.be>
References: <cover.1628849621.git.geert+renesas@glider.be> <cover.1628849623.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 13 Aug 2021 12:22:35 +0200, Geert Uytterhoeven wrote:
> The following changes since commit 651f8cffade8615bb4fce1ecb3a929892c5e60d7:
> 
>   arm64: dts: renesas: r8a77961: Add iommus to ipmmu_ds[01] related nodes (2021-07-30 15:07:25 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-dt-for-v5.15-tag2
> 
> [...]

Merged into arm/dt, thanks!

merge commit: d5aa0245860732268b94d9989e2ade382770fd13

       Arnd
