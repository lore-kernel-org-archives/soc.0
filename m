Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9826CC433E0
	for <soc@archiver.kernel.org>; Thu, 11 Feb 2021 15:05:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 665D164F0B; Thu, 11 Feb 2021 15:05:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D96F564F0A;
	Thu, 11 Feb 2021 15:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1613055935;
	bh=eMHR2QnFXKhzszOQbr8KEa6+kba6b6+zD2YeMMPU2wU=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nv4pieajO7AWDqObBnDXqECPGxxzdiYu2FrFRTEPbeKkyL60as6S/TyPVP9e+onWS
	 +vJf72AszBN70JYQKpiuR1FGl3bKXA46Mi6TLLLaktImdEgIl8xhsbQm6GPBeB9bLA
	 9r06I4gtNfJoZMVNLwcDnRUESbg6DS1zEf86dqIMM0ZMvgDKboBSZkqTh+OfMc2/sT
	 hAeA04h4ovJrGXYxZcmeS9AnnAg+RlVB41g3X1NnpkpePb3/50KXpQTpLngbBJOSJt
	 mYaMEcX/+mZkgSm7PxHgwWwW6VWVbQXvSUMZowcUUH8pOuL99kNdynLGstla3S3p+a
	 +5t9JE3ZkPCVQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>,
	arm <arm@kernel.org>,
	Joel Stanley <joel@jms.id.au>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-aspeed <linux-aspeed@lists.ozlabs.org>,
	Andrew Jeffery <andrew@aj.id.au>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [GIT PULL] ARM: aspeed: soc changes for 5.12
Date: Thu, 11 Feb 2021 16:05:30 +0100
Message-Id: <161305590367.259551.3441332889006792758.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <CACPK8Xf+4VkWC6rkHhsWdwhaLjy2Az=GAHaEe=SvOiUc_OGKSQ@mail.gmail.com>
References: <CACPK8Xf+4VkWC6rkHhsWdwhaLjy2Az=GAHaEe=SvOiUc_OGKSQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 10 Feb 2021 12:30:27 +0000, Joel Stanley wrote:
> A small pull request for the aspeed platform this time around.
> 
> The following changes since commit d0e72be77e7995923fac73f27cf7a75d3d1a4dec:
> 
>   soc: aspeed: socinfo: Add new systems (2021-02-10 22:25:45 +1030)
> 
> are available in the Git repository at:
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 4f79a8b06fccec3dd68935db5a4662435c472abf

       Arnd
