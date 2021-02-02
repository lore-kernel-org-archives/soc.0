Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CACCC433E0
	for <soc@archiver.kernel.org>; Tue,  2 Feb 2021 16:48:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B0CDE64F94; Tue,  2 Feb 2021 16:48:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0A0AB64F7F;
	Tue,  2 Feb 2021 16:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612284480;
	bh=R2JKYXC6NAoRuSanZPQd/DMB+L1eNAcjJrgEMgYwM0w=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lcqTC7dADIoHogusTvXfCbjywtV0jiKHfqHhsLn19jWf2CU6ekfHN7GlJhVlVI7l8
	 /GLLHdNphhynu1rV7DX5D4kyMNjyA5RPSBIh8YNkF2p3TdZCwOa8ZyzJlS27a5iRQA
	 BANfKNlQ78sOJKrPpy3TfR2KWbB0PVrOTMLL1oUpk2n7HvWgQgTytVmln/g+Fcw0K+
	 IDjem5TiURKjF98KL5MpHcnYXOWTo3wyba0jm+OC/WDPLERZhNq8N87ZV7erA/nMsB
	 GcbG1i65f5z+urPVoEgBhBBda1/18sdaZEDJMR1wle+KPxe7LPsFhyGA1P+bbwmooC
	 uXrXXRTegbdHw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Nishanth Menon <nm@ti.com>,
	arm@kernel.org,
	soc@kernel.org,
	Olof Johansson <olof@lixom.net>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org,
	Tero Kristo <kristo@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 1/2] MAINTAINERS: Update to TI maintainer for v5.12
Date: Tue,  2 Feb 2021 17:47:51 +0100
Message-Id: <161228438414.1848830.8600684869682893491.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210130131411.afna4wj72r7xscqn@skinny>
References: <20210130131411.afna4wj72r7xscqn@skinny>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Sat, 30 Jan 2021 07:14:11 -0600, Nishanth Menon wrote:
> Please pull the following MAINTAINERS file update for v5.12 cycle. Made
> sense to send via ARM path since the main PR path was for TI platforms.

This seems more appropriate to have in v5.11, I tend to fast-track
maintainer address changes as bug-fixes so future emails reach the
correct address.

> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: 6102f9e700bb3fee2f37756514885e7b14a70ef6

       Arnd
