Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56F50C63777
	for <soc@archiver.kernel.org>; Thu, 26 Nov 2020 21:17:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1E77E21D93; Thu, 26 Nov 2020 21:17:22 +0000 (UTC)
Received: from threadripper.lan (HSI-KBW-46-223-126-90.hsi.kabel-badenwuerttemberg.de [46.223.126.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 77785221FA;
	Thu, 26 Nov 2020 21:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606425442;
	bh=C9XAjE0/vdrTIqtYOSKtLrMqP6ngh0aVLriHwvFwL6Q=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c9ijnZGt0jBu4ITdCx6Xk1YRI1AcBYxk5HLtOUkhL4nRgflDKI+tEplXCj0hdGc4E
	 z0jWp2YHUG2+MBfMlma/aXieOKibT4ClFF4eVIUfv6ZQMmAg05jqPG9b2uU0iveICW
	 X0mDirWEaUmzbtjmF/pxK7xvErUMfZr8yz8dISqU=
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>,
	soc@kernel.org,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org
Subject: Re: [GIT PULL] arm64: tegra: Device tree fixes for v5.10-rc6
Date: Thu, 26 Nov 2020 22:17:13 +0100
Message-Id: <160642540729.1426580.3199546669902175491.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201125170306.1095734-1-thierry.reding@gmail.com>
References: <20201125170306.1095734-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 25 Nov 2020 18:03:06 +0100, Thierry Reding wrote:
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.10-arm64-dt-fixes
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: 06ceddef30a58ddb4393176c78fd4dccc14dbfde

       Arnd
