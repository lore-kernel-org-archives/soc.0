Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E73B1C433DB
	for <soc@archiver.kernel.org>; Sat, 30 Jan 2021 11:26:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 941BB64E0F; Sat, 30 Jan 2021 11:26:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1973D64E0A;
	Sat, 30 Jan 2021 11:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612005991;
	bh=mOmeB4tPT9hhBNqlsMvRo2GOSWwEIsv3ihHCaa9+WRw=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aiXw8hjxtAqoDsQ6d1LQeLZFhKvq/3HdDHWl8Uj256WoFN0/v4kvXJqNPuIneHxEi
	 g05+ZD6eAZ4o9IE4gYnyugB5zlhF0OKzknQFPEt5gtx9w/4PKAwPYpIewWDR8PGRxX
	 2CCGQRDYs0N7zf3ZZTtoFaScAac9lHZCLCabyf2V+vZHonCE/UovvlTbweOYtpekMO
	 akxo8mE25k1UW3PVat5zfQHzuFSIaqsmGsGUfOh5WwOrdph3M4QWdaaNeckX7WStid
	 +bQTeOSbfOtSwD0603LE6G0GrvTz43URpoSfbOohGBOSYmVsKoOXMWwnxCPLpT05Yy
	 p6Alm6gr75s+Q==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Thierry Reding <thierry.reding@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [GIT PULL 6/6] arm64: tegra: Default configuration changes for v5.12-rc1
Date: Sat, 30 Jan 2021 12:26:25 +0100
Message-Id: <161200598073.2029918.576266600186123573.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210129193254.3610492-6-thierry.reding@gmail.com>
References: <20210129193254.3610492-1-thierry.reding@gmail.com> <20210129193254.3610492-6-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 29 Jan 2021 20:32:54 +0100, Thierry Reding wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.12-arm64-defconfig
> 
> [...]

Merged into arm/defconfig, thanks!

merge commit: ee29b84a1dfecc32925037871ed18d9af61529b4

       Arnd
