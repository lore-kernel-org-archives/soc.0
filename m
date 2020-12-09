Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E597DC4361B
	for <soc@archiver.kernel.org>; Wed,  9 Dec 2020 20:30:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id BE50A23D25; Wed,  9 Dec 2020 20:30:50 +0000 (UTC)
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results:mail.kernel.org; dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: Michal Simek <monstr@monstr.eu>,
	SoC Team <soc@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	arm-soc <arm@kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [GIT PULL] arm64: dts: ZynqMP DT changes for v5.11
Date: Wed,  9 Dec 2020 21:30:39 +0100
Message-Id: <160754580143.2405127.141157774584873312.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <f460f6ac-d235-a33b-3d0f-ca904a43e687@monstr.eu>
References: <f460f6ac-d235-a33b-3d0f-ca904a43e687@monstr.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 9 Dec 2020 15:56:47 +0100, Michal Simek wrote:
> please pull the following changes to your tree.
> 
> Thanks,
> Michal
> 
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> [...]

Merged into arm/dt, thanks!

merge commit: c87b013f23c6aa0e244abb8bcbc83ef383827180

       Arnd
