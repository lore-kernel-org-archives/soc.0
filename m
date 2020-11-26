Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77F71C63777
	for <soc@archiver.kernel.org>; Thu, 26 Nov 2020 21:18:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4427A21D93; Thu, 26 Nov 2020 21:18:43 +0000 (UTC)
Received: from threadripper.lan (HSI-KBW-46-223-126-90.hsi.kabel-badenwuerttemberg.de [46.223.126.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id E441821D1A;
	Thu, 26 Nov 2020 21:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606425523;
	bh=D/Vv9ohlcWtBibcu7HMsp2X81XWsBXQ+PE64KH8vPao=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q+LiHsxw1rkMPvI2/eda+fCzhJ/0fp+A7vWbGJArI83lBzwifl9e8VwvuU6JSoiK5
	 pMf+Usfa9mb2maYY5BWcOyfKui7XTTq4btL5ezfs6FLP6o7HmQz0mHXnwuOMKeWztt
	 oUYm/HT8el8jFWvTHkWTiWMoxzU6EyWMbCBv49oc=
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL 1/2] memory: Memory controller for v5.11
Date: Thu, 26 Nov 2020 22:18:36 +0100
Message-Id: <160642550448.1427126.9578170268675699142.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201125184529.5392-1-krzk@kernel.org>
References: <20201125184529.5392-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 25 Nov 2020 19:45:28 +0100, Krzysztof Kozlowski wrote:
> Few early changes for v5.11.
> 
> Best regards,
> Krzysztof
> 
> 
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 0a3251a174018be76b14aa5857e2fef9e6993a53

       Arnd
