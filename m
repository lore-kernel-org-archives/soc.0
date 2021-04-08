Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52CE0C433ED
	for <soc@archiver.kernel.org>; Thu,  8 Apr 2021 15:24:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3082261130; Thu,  8 Apr 2021 15:24:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DC0D56113D;
	Thu,  8 Apr 2021 15:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617895487;
	bh=NY5Ca+YJQoktWAT4RxxV94o+oaHNVFhSxr+q2zCpoUM=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IEyFyWwur6bLcsb1LmvcqnLV2uk0Atz0M0nXMPo5y7ytJP7OJbJj1nBV/WiqtX1wb
	 sb1s8t0rdJZA3g+wDA7xXskwE5KxET9iO1RzqY5Blha4v10dp+L1aWz6kHoRncG8Vy
	 XKkkXeXNU8BgGnRlUksyDxkSXV0tJRHeonbhWfqkVe12oLrd0cwb25CVJ9GvOtdzVE
	 pQtyOazaRSy9agxtJ056v/6+Dv/sz26GmfHz5CETomwKZai0ByvwxK4BvIgruS0Q80
	 7bAkp4nQ8E64GBCoaS10LZ5a27jndf7S7+oXJd6Em5QsjO/SXMX00lvHazXpcCYohp
	 Y1VqOfeOSnq1w==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Olof Johansson <olof@lixom.net>,
	Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Andrew Lunn <andrew@lunn.ch>
Subject: Re: [GIT PULL] ARM: mvebu: dt64 for v5.13 (#1)
Date: Thu,  8 Apr 2021 17:24:21 +0200
Message-Id: <161789462026.1629934.18198415044078612678.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <874kgocs7t.fsf@BL-laptop>
References: <874kgocs7t.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 02 Apr 2021 23:05:42 +0200, Gregory CLEMENT wrote:
> Here is the first pull request for dt64 for mvebu for v5.13.
> 
> Gregory
> 
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> 
> [...]

Merged into arm/dt, thanks!

merge commit: d1e3a9efb2afabad584f385b3bd58ec27ebf490a

       Arnd
