Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CD0CC433B4
	for <soc@archiver.kernel.org>; Thu,  1 Apr 2021 19:24:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 49E4D610CB; Thu,  1 Apr 2021 19:24:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BEFFD610D0;
	Thu,  1 Apr 2021 19:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617305079;
	bh=nmaf73T1V9OZ4POKVDjbnFqaUT1F4D2vEE1SzTsNTNU=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MlDRLtv+xxaHlvFCUGA3N67VjLzKmXOI4jbs8tL2QmWmIhBv7KbXIYNm8wyY1fWXJ
	 VCBRS/t7dkvAGfERjy07nOjy++/I845452sMz+iky8odUI7pd4XPxfvD3kHeQrPPSG
	 b/kkWmDN+ZdswBA6sg3eDYCgLqQod2zpotpxE6G6Aup/LI0T0LS7LBvHYcZxQSbz95
	 9rFz36bfoIc+8cw452IHOhOF+VhVDVQXYtjysXfYAludpBLqU59HF2EWlKhzwp2+D2
	 vjWHbt2vZqNxVHNfLVIsIByHkLcy4MVTLRxhs/GxkB5QA9f1ovfL3htaQuRKfQoAhq
	 FIteeIXj19dkg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Thierry Reding <thierry.reding@gmail.com>,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-tegra@vger.kernel.org,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 3/5] soc/tegra: Changes for v5.13-rc1
Date: Thu,  1 Apr 2021 21:24:17 +0200
Message-Id: <161730504520.632809.18138273991245281834.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210401172622.3352990-3-thierry.reding@gmail.com>
References: <20210401172622.3352990-1-thierry.reding@gmail.com> <20210401172622.3352990-3-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 1 Apr 2021 19:26:20 +0200, Thierry Reding wrote:
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.13-soc
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 66f3431a87339f332a2ca674e9fbca48a6014f89

       Arnd
