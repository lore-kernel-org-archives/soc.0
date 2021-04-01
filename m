Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE249C433B4
	for <soc@archiver.kernel.org>; Thu,  1 Apr 2021 20:15:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 90A60610D0; Thu,  1 Apr 2021 20:15:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B8763610EA;
	Thu,  1 Apr 2021 20:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617308159;
	bh=9RH7iG3o3uUenCTrIvDL8kj/TD5cEDI6UioCY4zI9Tc=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aElTdEihNHmcJJaOWZcH+oI0/Sl11gMXWr6QOehEoo1stztXMPx2n0Mx2DA0h4zHw
	 9bakLlfxzCgz5M0Y3nU5YhKEheqb8Taks51LELmoDgR9nALsRiec8byLdHznsXrjCP
	 EKnwnpFv86dnVlqfqAwcFxA6+F8a1EKGxXgAVfk2vYbTPz8cZkfEUUsUuIWQIZj5L7
	 oxuot1Zzr0VNREMvBNfZ3/MTFDYE4l1Wbsir+RyXPUetwdy0S6/WdYpO4G+BodOiMF
	 xF/mnaAXxMuwfnnO4JbAZZh6BF8h+fxgbpAG/hTRX/BtbVO0FU3laFwHlhKLcQUv/+
	 8KAjuBM+qxRNw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>,
	Sudeep Holla <sudeep.holla@arm.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Kevin Hilman <khilman@kernel.org>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Olof Johansson <olof@lixom.net>,
	Liviu Dudau <liviu.dudau@arm.com>
Subject: Re: [GIT PULL] arm64: dts: juno: Updates for v5.13
Date: Thu,  1 Apr 2021 22:15:26 +0200
Message-Id: <161730808648.655497.9953607257021480984.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210331100410.cenuhvpqoumvsk52@bogus>
References: <20210331100410.cenuhvpqoumvsk52@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 31 Mar 2021 11:04:10 +0100, Sudeep Holla wrote:
> Please pull !
> 
> Regards,
> Sudeep
> 
> -->8
> 
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 45f174d8a13cd877034189628f6b00bf30c832c6

       Arnd
