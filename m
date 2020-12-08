Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C268C433FE
	for <soc@archiver.kernel.org>; Tue,  8 Dec 2020 16:11:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E24C423B02; Tue,  8 Dec 2020 16:11:23 +0000 (UTC)
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results:mail.kernel.org; dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	arm@kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [RFC 1/2] MAINTAINERS: correct SoC Git address (formerly: arm-soc)
Date: Tue,  8 Dec 2020 17:11:11 +0100
Message-Id: <160744385141.3969289.7559804169434250347.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201201211516.24921-1-krzk@kernel.org>
References: <20201201211516.24921-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 1 Dec 2020 23:15:15 +0200, Krzysztof Kozlowski wrote:
> The SoC Git was moved from arm/arm-soc.git to soc/soc.git.  Correct the
> ARM Sub-architectures entry.

Applied to arm/fixes, thanks!

[1/2] MAINTAINERS: correct SoC Git address (formerly: arm-soc)
      commit: c99055ec2c3974386f36eb648af77a8dbe887ca9
[2/2] MAINTAINERS: add a limited ARM and ARM64 SoC entry
      commit: db2082700a0c7974c3a7787d50abff34b2695b4b

       Arnd
