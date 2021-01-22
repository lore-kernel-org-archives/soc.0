Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39EE7C433DB
	for <soc@archiver.kernel.org>; Fri, 22 Jan 2021 22:44:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0F03923AAC; Fri, 22 Jan 2021 22:44:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 21BD723AA1;
	Fri, 22 Jan 2021 22:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611355473;
	bh=5pmgZHFoZbj9OlZfnTbzEza85I+nAheQ0hjOO9tqwDQ=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U03IQo21QL0cMlU71LaSQMvwIWTOlaKiYWx0ZbFyUFZk9oCxqJnfwknXycALDAsg6
	 Xaxg5sdTUI6QOlkRNRpl+wEY/Rb6jbhW6i3esGAp27aPzASa0A3KMFVzdg87Kzk8pE
	 brSvHV11Z1qjNMkwjJqlwmeSvGdXvC86Hn2C9xPp0kD/7JChvwIAuEniaRytXEWiJ8
	 IPVPMZfJhFgSAsJvDEJhh9KXE1zlBG5h06XRaNODqU57175eM37cELLSJwL4fxZm/h
	 1P4QtuD9DmxkSPun+Lj0j8bbP2KD3surVDI/0/3uhYFdpNuhHZddhqNnicMWFSvqmh
	 r1ZLbqBjOS4aQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	soc@kernel.org,
	linux@armlinux.org.uk
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-actions@lists.infradead.org,
	cristian.ciocaltea@gmail.com,
	linux-kernel@vger.kernel.org,
	afaerber@suse.de,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: multi_v7_defconfig: Enable Actions Semi platform and drivers
Date: Fri, 22 Jan 2021 23:44:26 +0100
Message-Id: <161135545365.1320625.6993812983016804731.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210121061447.26517-1-manivannan.sadhasivam@linaro.org>
References: <20210121061447.26517-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 21 Jan 2021 11:44:47 +0530, Manivannan Sadhasivam wrote:
> The support for Actions Semi ARM32 platform has matured enough in the
> mainline. So let's enable it in multi_v7_defconfig along with the
> relevant drivers. The platform can now boot a distro from eMMC or uSD
> without any out of tree patch.

Applied to arm/defconfig, thanks!

[1/1] ARM: multi_v7_defconfig: Enable Actions Semi platform and drivers
      commit: 26ba4a474aec5998e52826319c4d7a1c98e8fab5

       Arnd
