Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF517C433DB
	for <soc@archiver.kernel.org>; Tue,  2 Feb 2021 21:36:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7624D64F68; Tue,  2 Feb 2021 21:36:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6D19464F61;
	Tue,  2 Feb 2021 21:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612301815;
	bh=l2zLiFQYnlqIzy1qNedzusDW5xujvBFhDqicPTJu+K4=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i7xRh+5e1Icq8XUlZO6RPmgx78gebZqS2ntA/0MKpOiIMHLutKd3a0Ezp8vPx2aoy
	 QnMnhD/ux5KG8spsvjJ9+YU2qPHmjlTKTfstzXX5/iUgjgBxL1UcVdj2iRaQfer6qD
	 bUdwt0GoNLUJtaiRHwDvKFQ7i/qxBb6mWr1cvOPP9nicjIFWYSNrKvn5RAD9W1b21y
	 vttN/OJXVr6+S8Qq3dPoV0GhmD1ml1psdrWV/H49Pfbgh/gM7M/FIfWR7JOMGRLCOO
	 BulN+nhmB9rdVvkecUxq/zzZs7ck7Z/YKOJU+VvJ26DGYbSWYZnA+Z4Zk8UzHIQD9u
	 NnYGhDQzuZplA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Florian Fainelli <f.fainelli@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	olof@lixom.net,
	linux-arm-kernel@lists.infradead.org,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: Re: [GIT PULL 5/6] Broadcom drivers changes for 5.12
Date: Tue,  2 Feb 2021 22:36:47 +0100
Message-Id: <161230178545.1902917.1837726983239956032.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210131221721.685974-5-f.fainelli@gmail.com>
References: <20210131221721.685974-1-f.fainelli@gmail.com> <20210131221721.685974-5-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Sun, 31 Jan 2021 14:17:19 -0800, Florian Fainelli wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.12/drivers
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 60a64da9f0d0b7e766ba9bb0c11e28ca780fc2fd

       Arnd
