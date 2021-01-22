Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCCE1C433DB
	for <soc@archiver.kernel.org>; Fri, 22 Jan 2021 22:46:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7EEE423B09; Fri, 22 Jan 2021 22:46:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DCB2923AAC;
	Fri, 22 Jan 2021 22:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611355616;
	bh=AAUDxcAwbpHTXTCeGZoCgUNBKhwI/UVhl6oKZXYWmSk=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BBxvyZYHAnEfllziBcljQwkO+0P2kXyLj0lgSjG7zWbLT+ZuiawIPoTJpUQmTL+qW
	 +IZ5nbP0fM1LWogorGONlxZrpxRT7vRRnFABVFAK+6X2yA4SGbVlK5vCmYt3dfwCR2
	 0FlxryTpqBCO6ECG102GSS0i2ntdoJcjxoCUoIhbnkKTI0f+eQCP5+hsigXTTFn3oK
	 cBkrHbhPJB2j8IO0VW3Bav9jDArOVziVz7lTg2283jy8jDRZME2tRpG1aexeJekIbU
	 NvlgktIQUM+n2txs5bmm2SXUJH30oP3JL9hzmh+aHCldAr3lPRFyv9VRaHyk/EapJF
	 9xXy0uw9fj2Hw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>,
	Sudeep Holla <sudeep.holla@arm.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Kevin Hilman <khilman@kernel.org>,
	Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] firmware: arm_scmi: Updates for v5.12
Date: Fri, 22 Jan 2021 23:46:52 +0100
Message-Id: <161135560489.1320908.16791887569896437473.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210120174356.cnxopzjjpqo5e3ws@bogus>
References: <20210120174356.cnxopzjjpqo5e3ws@bogus>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 20 Jan 2021 17:43:56 +0000, Sudeep Holla wrote:
> Please pull !
> 
> Regards,
> Sudeep
> 
> -->8
> 
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: e6babd8dded31c0235c2e83871d290dfd407e4fa

       Arnd
