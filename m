Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F079C433DB
	for <soc@archiver.kernel.org>; Tue,  2 Feb 2021 17:10:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4477D64F86; Tue,  2 Feb 2021 17:10:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 01B3564E40;
	Tue,  2 Feb 2021 17:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612285826;
	bh=BRfF1uAnkdalZf16RbEhOeE4QAu6Gy2jpB0YUCfazSM=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=conwv+FoWgnoAHZHTFSe4NJDs2mqC1kyD6VaA6TVbZxNDLnklXyh8NIxjTI6KB6UK
	 kSavTphCOWIpt7iIg3lf7GNcv9xo+9SVxp4YNEa3lj2ecrpHWMjNQlHnbN+3RqlLsK
	 P43WJG2LcY7aH1pxt/afVBm0+2sCHBOwP643RW/yfMcAOSnhSd3BTk4C48hcwuJ5av
	 yPS1oBAmdyBGEr5gUWr8p/foQL/vGnZSZ4WVIISFBylo3yP+bVMOIuJ0TSGTW89xwY
	 Hd0/RWSIWOE9ZAQWprIWOJTFbxk3yxqgLlDa64q0xle8jfDs8DoNo+JgU85OAdtQFa
	 m7er6OJ108BLw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Florian Fainelli <f.fainelli@gmail.com>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-arm-kernel@lists.infradead.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Ray Jui <ray.jui@broadcom.com>,
	Scott Branden <scott.branden@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	olof@lixom.net
Subject: Re: [GIT PULL 4/6] Broadcom devicetree-arm64 changes for 5.12
Date: Tue,  2 Feb 2021 18:10:08 +0100
Message-Id: <161228552221.1852435.14632001983840621070.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210131221721.685974-4-f.fainelli@gmail.com>
References: <20210131221721.685974-1-f.fainelli@gmail.com> <20210131221721.685974-4-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Sun, 31 Jan 2021 14:17:18 -0800, Florian Fainelli wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.12/devicetree-arm64
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 528587ea03b1db948bd3a1b0ecdf42a0b92f0fe7

       Arnd
