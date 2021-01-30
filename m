Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 716EAC433DB
	for <soc@archiver.kernel.org>; Sat, 30 Jan 2021 11:36:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5153664E09; Sat, 30 Jan 2021 11:36:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id EFEAA64DE7;
	Sat, 30 Jan 2021 11:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612006612;
	bh=0BmqgNkFIayug654qP6zSh3IMYPIZwHpy2DU2XcmwmM=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pNiWSlR20+bCSNZa8PcaZjNSZw8e/GL59crl5H2InHgwcGi/ZrsRVBIz9H2LHwym5
	 4hcGuN2HdSqb2MQjcOgcUo1SYBr/KseIa8syfK0m+Pfo3DRP5/UgDds+h8mLsBhcH+
	 P4Qszegsou0FJrmNDhoEqrSQbXu24DCdKGVwr1uXPd/eMfRWPSVBklANdfaf2MVmHK
	 7ZC5ir7xSVWym1lGP1Is+x03tntzK9sU9JjfsjD10ctkN4m5YdNm2lnoPIfakgiYfJ
	 RVF6WtaB540bvuj4h8C32mCZX8Yv7rFSiuuWrzie910AddQTzV9PKsRqFE15XaPn6f
	 mGrmZIxiLyuvQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Tony Lindgren <tony@atomide.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	arm@kernel.org
Subject: Re: [GIT PULL] Fixes for omaps for v5.11-rc cycle
Date: Sat, 30 Jan 2021 12:36:48 +0100
Message-Id: <161200659667.2416228.1843955519499955570.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <pull-1611818709-243493@atomide.com>
References: <pull-1611818709-243493@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 28 Jan 2021 09:43:50 +0200, Tony Lindgren wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.11/fixes-rc5
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: 2a3e487a3e538b3a87d0a4ea71f185437c38e55e

       Arnd
