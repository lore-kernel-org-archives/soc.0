Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B090BC4338F
	for <soc@archiver.kernel.org>; Mon, 16 Aug 2021 21:21:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8F45660F39; Mon, 16 Aug 2021 21:21:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 10D4060F5C;
	Mon, 16 Aug 2021 21:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1629148866;
	bh=KXkdranSjGiD0FZJmV0BdAng2XKwcQNGJhAAroPbTLM=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ni9fk84hOIVPsAtJobH5+WGNJELJ6POCinvUAdf1dgUaeQD0fuXJHM11X7sq/xQR2
	 BwrijzPmKXl4SgSwGa3d7MxreQpHVgWeVn8yEQko8ib9kgcxzO55ivDvAriTspcVsb
	 /h2zbYsOTjsNgUMSSDr7z9t5VudobpuzF75wND5jzF+vDDXnN09TgxhM5EgSk9USYm
	 VFsTf4s0ioDjUfdFO7ocGMEMDE4CvJ++4uQwZkA5jubQy+W7ypHEDq/bm4jqxg8TwQ
	 VFmx+q4gtDRNxQmOaH9BJkQvWZM4ryeKHWil8OfMG9vutBDKXjJ4+Ldx+2LJJZ/4XY
	 epSfrmlkTI6uw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org,
	Thierry Reding <thierry.reding@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org
Subject: Re: [GIT PULL 1/6] dt-bindings: Changes for v5.15-rc1
Date: Mon, 16 Aug 2021 23:20:52 +0200
Message-Id: <162914852238.237905.17270063246440695138.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210813162157.2820913-1-thierry.reding@gmail.com>
References: <20210813162157.2820913-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 13 Aug 2021 18:21:52 +0200, Thierry Reding wrote:
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.15-dt-bindings
> 
> [...]

Merged into arm/dt, thanks!

merge commit: b05cff9f4d38cd4a9ccc387a8054f9efe8e8414f

       Arnd
