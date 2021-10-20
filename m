Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CAF9C433EF
	for <soc@archiver.kernel.org>; Wed, 20 Oct 2021 21:30:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0B09C60D07; Wed, 20 Oct 2021 21:30:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AB59D61284;
	Wed, 20 Oct 2021 21:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634765442;
	bh=+di8/CKCwnYc9P6WoxftUMkSrSNJKw1OrByoQVD7PBI=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U/sa0ZDjRPAbFdwDxt1siRKm9Kqm9m6XVWw5Ux2zrd5jCNAz5cgl9u/ACCeT6TCGE
	 q8AikMcXbK89ddId63Iu0BS/3rjZ1kDG0af2JCDNF47AAPLccYD3HLErKd+iT0i6yK
	 af+bOUHvtEKofwysdL+RmnmSgTRRGzrhLktVhPIRlFVlqxPshXRhbwT68huwZMeem8
	 5+U00MxWckyHINSyBOgjw+ZEI2tolvEmqOEBvfGUCDNQ1o2mCZxO5F2IMhgAZkG1ts
	 4fnw94zBYtrXJR8vpiONAeOusPhPyqHmByw/3rdJr3Idv7V6tlDnHJOOylM486N44G
	 QB4HiBNmGRoEg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	olof@lixom.net,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	yuji2.ishikawa@toshiba.co.jp
Subject: Re: [GIT PULL] ARM: Visconti: defconfig changes for 5.16
Date: Wed, 20 Oct 2021 23:30:36 +0200
Message-Id: <163476542780.4156336.10346978324196950813.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <YWoIf4xPoQtLhC3x@toshiba.co.jp>
References: <YWoIf4xPoQtLhC3x@toshiba.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Sat, 16 Oct 2021 08:02:23 +0900, Nobuhiro Iwamatsu wrote:
> This request includes patches that enables PCIe for Visconti SoC in defconfig.
> Please pull for v5.16 kernel cycle.
> 
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Merged into arm/defconfigs, thanks!

merge commit: ddcb48fa7d60bae6c3f2db7cc84250d33177388d

       Arnd
