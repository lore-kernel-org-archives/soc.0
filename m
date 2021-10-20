Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F391BC433EF
	for <soc@archiver.kernel.org>; Wed, 20 Oct 2021 14:50:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DBE2C6138F; Wed, 20 Oct 2021 14:50:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7EF2B61359;
	Wed, 20 Oct 2021 14:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634741447;
	bh=WWqkNo8J+ICdTfrO8OLG8oeSD+W8ndSzuylXmDOc4v8=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SWE5GIINYwsilH4F20iVIJu+lmukg0m84+G5C30Mj2gPqqKhcuMOtGzfw7Jr0TcWo
	 gqYs+XyeRxZz56qirp/BSnCrcBY+hEoGmv27KcxoA/bVny19gYZai9dU1NZ/1z4+44
	 YrGviThahjXDgSpK4gH98USJL31KTEgiXiKcHLSZxRCDAK9hlgH0SD3yHwIe0Cj09u
	 ro9KAbGtTwMj1QRctqQrQmoKC1BBoJqzWh3JGHwKgvjGvJLylnG4pW+P0FkTmR0IZv
	 osG9VjR3Xl9D7jFdHEaJHR+QaFVWrVilmw036qsyS6R4IKldJkdw6rfF/gUNcPshXH
	 Uw5m2qpoZOj7Q==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	olof@lixom.net
Cc: Arnd Bergmann <arnd@arndb.de>,
	yuji2.ishikawa@toshiba.co.jp,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] ARM: Visconti: device tree changes for 5.16
Date: Wed, 20 Oct 2021 16:50:17 +0200
Message-Id: <163474139779.4099414.10629589892566771876.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <YWoH3g7vU1ZEAp+P@toshiba.co.jp>
References: <YWoH3g7vU1ZEAp+P@toshiba.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Sat, 16 Oct 2021 07:59:42 +0900, Nobuhiro Iwamatsu wrote:
> This request includes the PCIe and VisROBO VRB board DT patch for the
> Visconti SoC.
> Please pull for v5.16 kernel cycle.
> 
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 06ddf8fb43370fd2ce5e2b66a77d159ae13b388a

       Arnd
