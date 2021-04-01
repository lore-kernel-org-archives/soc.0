Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2687DC433ED
	for <soc@archiver.kernel.org>; Thu,  1 Apr 2021 20:15:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 03807610D0; Thu,  1 Apr 2021 20:15:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 50818610F8;
	Thu,  1 Apr 2021 20:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617308141;
	bh=b8MXG3GU0ybMmhptaXm842lvOADpXqKzDv1VhTUXIuI=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XIldZVLBSy7gBY2yJg7DSRki9lX59gzXASzU4dWPhtCp/qfr1V3j/SIvKDz4ThaT1
	 QiXzwKKjyILmpNIqnHkJZ6X8mVwMEwaYkOI8Pp2iJxyr/4I8fYOhf79GCXJBY5Fa3+
	 VT4frnNR84CRAxR0vnv/jpqqsneGRlnQ1vHOu0gK+dmpgjDm90RDQN4HMBtOjp74ca
	 CALG4qLoISzNoNom9md0TCMeKFKULTcWSHlvbGcoxNrsqFYRrqpCfH+GN25fGec5a4
	 HNaLCD7QB0KJg9FAL/yK3RqK93AGyjswRa0r58BZ8+s+2aCKLxxzMrGLU0pcfcD4ek
	 gwRm5JwSPxf/A==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Florian Fainelli <f.fainelli@gmail.com>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	olof@lixom.net,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: Re: [GIT PULL 1/3] Broadcom devicetree changes for 5.13
Date: Thu,  1 Apr 2021 22:15:18 +0200
Message-Id: <161730808607.655497.16848778452197527943.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210330184006.1451315-1-f.fainelli@gmail.com>
References: <20210330184006.1451315-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 30 Mar 2021 11:40:04 -0700, Florian Fainelli wrote:
> The following changes since commit fe07bfda2fb9cdef8a4d4008a409bb02f35f1bd8:
> 
>   Linux 5.12-rc1 (2021-02-28 16:05:19 -0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.13/devicetree
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 498adc8623c237d9f87f4a0582393e0d69504bae

       Arnd
