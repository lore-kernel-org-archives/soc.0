Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84B30C433DB
	for <soc@archiver.kernel.org>; Tue,  2 Feb 2021 17:10:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5162664F8A; Tue,  2 Feb 2021 17:10:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AA7A364E08;
	Tue,  2 Feb 2021 17:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612285841;
	bh=2JJrT5jSpZJqjvFgYPmTs8bfRS+l2D+GVPZs/0zwoPU=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=kAH/79lipDu/yIAckBJmY/Il54W5T0wnL3q0wA8o0Ioa8ys+XX+qEDtPWEFTSFunH
	 uwOf4DsPDFY75VTbAgg+pfKHQpHR6y4wQh9qTtKKklPztfj7wHU0NdOq8gioQTe5BS
	 CmYw7Y9kX25B9wFERzhTFGPSKxzv4r+YyMLZHfiCjTX0AYJvjxnBKR4/b3VDa8mzR1
	 qW1ZzUVOjXeA8A82dcjO9631RjzeF7OCSkCAg2zWtFQIUREdgsXn4XhEFGT7JjiRcA
	 RKXevsWlNhwF3dXOCikef38X/35Xkn4PJgM99MoflA0G4u/JwmL/IyMS28nET7eC8X
	 FznMTfIDG/I+Q==
From: Arnd Bergmann <arnd@kernel.org>
To: olof@lixom.net,
	Santosh Shilimkar <santosh.shilimkar@oracle.com>,
	arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	soc@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL 2/2] ARM: DTS: Keystone update for v5.12
Date: Tue,  2 Feb 2021 18:10:15 +0100
Message-Id: <161228552230.1852435.17404241904576684823.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <1612156910-11159-1-git-send-email-santosh.shilimkar@oracle.com>
References: <1612156910-11159-1-git-send-email-santosh.shilimkar@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Sun, 31 Jan 2021 21:21:50 -0800, Santosh Shilimkar wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/ssantosh/linux-keystone.git tags/keystone_dts_for_5.12
> 
> [...]

Merged into arm/dt, thanks!

merge commit: bc84e13f9b1b3e2ac4df988089a9e8bcabb90ca3

       Arnd
