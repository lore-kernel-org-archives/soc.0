Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9918FC433B4
	for <soc@archiver.kernel.org>; Thu,  1 Apr 2021 20:16:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6CEE8610E6; Thu,  1 Apr 2021 20:16:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DD15A610CF;
	Thu,  1 Apr 2021 20:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617308161;
	bh=irZjzXGSZVMdspwKpGDAvHSi7OHxEhIejW09irlmSC4=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aEmvPy4KT6p2zk0UkjDvqA9F1vcaIuZuHCq8Tnkn0A4WcjO69OX1ntF/41tKIDkoP
	 8HbtShmVSbLLdwjZHiyLSI3w5LfItab/0YeGtYX8507a0hBbqUDh43CSuXOPXRptjy
	 tKGSSJ4NowMjQq4m09cCZII6Xk2s/XFUUW253hlruflrQQEOSA04pSHP4n4V64Eqni
	 okzcoDQqfZ8ESMt2rfzLFp7zgnCu0bYz71gxXph8u5hM7yGrq3nOYXsZVIxVPWvn+9
	 3LDb+WlqWPENKkNaXACwLGaCqqwAY6HST9kOQ/Qo40LzP+vLShPwBUAnphNu9MAqQr
	 f/plg4SCB2sTg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	Thierry Reding <thierry.reding@gmail.com>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org
Subject: Re: [GIT PULL 1/5] dt-bindings: Changes for v5.13-rc1
Date: Thu,  1 Apr 2021 22:15:27 +0200
Message-Id: <161730808673.655497.15661315865375300905.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210401172622.3352990-1-thierry.reding@gmail.com>
References: <20210401172622.3352990-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 1 Apr 2021 19:26:18 +0200, Thierry Reding wrote:
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.13-dt-bindings
> 
> [...]

Merged into arm/dt, thanks!

merge commit: ece61ed98bdab5c5ee28777cd5cb3113fe71bacf

       Arnd
