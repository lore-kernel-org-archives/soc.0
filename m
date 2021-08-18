Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B436C4338F
	for <soc@archiver.kernel.org>; Wed, 18 Aug 2021 12:59:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5CB7A61058; Wed, 18 Aug 2021 12:59:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5D6076102A;
	Wed, 18 Aug 2021 12:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1629291587;
	bh=05Gg6bUoBv7u6Hxcck+kAyNgU62OKbfxTt/EcoE4NBY=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u6ygCv+t86REqk8g2eaV50fw/N6iKxSt60jJ1DyHzqBNmb+2R9mb8EPa6r029HDLj
	 DPjGuRZIYZutmznsj0dnLwj6MpNLwbZ+aXc3q9SNBcPAF0QL5kBc8XZgnnOGq2SY7o
	 R3ONSban5hgFX/eSAZWDLYyPv8+RYJT+JXq4eDfNynjrQ4WroHyO1YokZ6GDkGFzmK
	 LtQfdTpehK9VPjfiIIcMJsb9ELL4AAos4tc+NEovx9YvivuT5ISVQbC4zI2M2vqh46
	 g4Dfw49+Txi2cshNHej8dJWUL8zhdxj8G424iMcCbuBGpB1kIpWDFNY0ZN6KcP4kJe
	 zCn0KOS/D9BXA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	arm@kernel.org,
	Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [GIT PULL] ARM: mvebu: dt64 for v5.15 (#1)
Date: Wed, 18 Aug 2021 14:59:24 +0200
Message-Id: <162929137212.372162.12996626191507618886.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <878s10ypxe.fsf@BL-laptop>
References: <878s10ypxe.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 17 Aug 2021 18:52:13 +0200, Gregory CLEMENT wrote:
> Here is the first pull request for dt64 for mvebu for v5.15.
> 
> Gregory
> 
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> [...]

Merged into arm/dt, thanks!

merge commit: c4d3928250de919a1d324f6c8a7f26f51af40fd2

       Arnd
