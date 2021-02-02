Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7245CC433DB
	for <soc@archiver.kernel.org>; Tue,  2 Feb 2021 21:53:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4303F64F67; Tue,  2 Feb 2021 21:53:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B969B60295;
	Tue,  2 Feb 2021 21:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612302801;
	bh=EoJMCPPOCFYvxsYI94SQA2tHauStkh1tzsAADB4oiTY=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mlsexEU9b047AquNn4VFEE2gzcDTp3sSHMlrWBRZibYJp8J8Ma0/r34lAOefIZId7
	 /UBGScTZeYzacaZ1zUKLQ4vFm5i5jkmLt6PoIzOPi2v8e47IHC+7nP8wH0Cush3Ijx
	 iUQ84lSmVrVKmRrUWGEATI5/9GVinNqn7fVVAiVXyxDXbE/8UTCMFz/uOMdonGwGp1
	 KiQSZ1uPlKEmGffmUmWJvZhqXKCuehREl4XdaaaAcq98MgyV0hfEMVtlfEeKPtFBkN
	 iw4MDk45cPOQy2/5EsjFoYnwW1zj/QlW/chLFmCQ7/JV3x5qDaANVEh24inG829ISc
	 Tk846lPqzYx6Q==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Santosh Shilimkar <santosh.shilimkar@oracle.com>,
	soc@kernel.org,
	olof@lixom.net
Cc: Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 1/2] drivers: soc: Keystone update for v5.12
Date: Tue,  2 Feb 2021 22:53:09 +0100
Message-Id: <161230250379.1905703.9570631135024676951.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <1612156854-10929-1-git-send-email-santosh.shilimkar@oracle.com>
References: <1612156854-10929-1-git-send-email-santosh.shilimkar@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Sun, 31 Jan 2021 21:20:54 -0800, Santosh Shilimkar wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/ssantosh/linux-keystone.git tags/drivers_soc_for_5.12
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: b04c38b666edd9cf19ac773a7a899cf8554a474f

       Arnd
