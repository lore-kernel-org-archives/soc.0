Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E28D7C3E8C5
	for <soc@archiver.kernel.org>; Fri, 27 Nov 2020 20:10:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B36D522228; Fri, 27 Nov 2020 20:10:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606507807;
	bh=/v7qeu55h8yOKyQXJEVkxqonLcgvVHwg5haHkBWgTgU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=bZbELCI8OBdujGyfT0+ifloeLB+IR4WE6PjsgjacrFf3AwUp2sTx2c0XDYXM/6Xkz
	 7LTReUzwQLvbS5hwsQdeWgQUhlzeRNMO+Bsnlux0c0sxp3ryM8W++2tSJDiwHcbdk1
	 srhdwQT09YHBC+l/FVZKclbpGi6Efzmc5npGz3n4=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_scmi: Updates for v5.11
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <160650780757.32506.16864830648659525752.git-patchwork-notify@kernel.org>
Date: Fri, 27 Nov 2020 20:10:07 +0000
References: <20201124122412.22386-1-sudeep.holla@arm.com>
In-Reply-To: <20201124122412.22386-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Tue, 24 Nov 2020 12:24:12 +0000 you wrote:
> Hi ARM SoC Team,
> 
> Please pull ! The tag is based on v5.10-rc2 to avoid conflicts with
> the fixes that got merged in -rc2.
> 
> Note the hwmon is acked by Guenter to take the changes together.
> Also note that the SCMI regulator driver itself is getting queued by
> Mark Brown separately and hence I have sent him pull request with
> 'scmi-voltage-5.11' tag which I have also merged here.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm_scmi: Updates for v5.11
    https://git.kernel.org/soc/soc/c/270a5bbb090c

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


