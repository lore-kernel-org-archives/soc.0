Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEFFCC433E0
	for <soc@archiver.kernel.org>; Sat, 30 Jan 2021 11:28:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A430264E0C; Sat, 30 Jan 2021 11:28:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2446D64DDB;
	Sat, 30 Jan 2021 11:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612006121;
	bh=sJ6k915t31lh60VVbOKTS3HtZV3mY7oeFzQO+vgrMjg=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jUx2xuGHzVmHQtAcYDdTNnOSQY36rNGuozeHwmBEsgO76sTauQXrvvuGC/EOVrFRq
	 dP7H2A+8BQ99Qns/5C50UFjm+EM2QEcF2tHd8DK9pFNM/aBYMStwfx9gA1s1lHwEc+
	 Q4DPDP6pHiwTB2z7+iI/bS+Sc9fCgC3pgVMB/YVAsfr9aHXEKbv9RgiO2KVp2LAy2A
	 3eimsdxpq0zg6Uc8Robe519diohAWOZSgkKpPNviSLlewgzKteInDzIflWijoz1GN7
	 KTWbTE3t44GLfzz+OPBXisfyyrmWcQpja5OFVPJP9bN8E+BrQ3LXnlEqZ/7FCYgAxj
	 ZEZ1tS7xyOa9Q==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	arm-soc <soc@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL 2/2] Renesas driver updates for v5.12
Date: Sat, 30 Jan 2021 12:28:33 +0100
Message-Id: <161200610107.2091874.1073052310080757493.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210129090815.2552425-3-geert+renesas@glider.be>
References: <20210129090815.2552425-1-geert+renesas@glider.be> <20210129090815.2552425-3-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 29 Jan 2021 10:08:15 +0100, Geert Uytterhoeven wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v5.12-tag1
> 
> [...]

Merged into arm/soc, thanks!

merge commit: e53686bbdfd2af7e63e3c0f296632c3a428c317a

       Arnd
