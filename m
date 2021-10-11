Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A257EC433EF
	for <soc@archiver.kernel.org>; Mon, 11 Oct 2021 22:12:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 80FD060F5B; Mon, 11 Oct 2021 22:12:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0358961038;
	Mon, 11 Oct 2021 22:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633990329;
	bh=LYWe6xlEjwBs2m99bppMwEnOpfC4Po6sny/pkxd6Ksw=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JtOy/bt4Cfie5vYvIrEqOc55vQd/uq9EB3oQkkzW2OhKHru/BVNIqWTgQiRFa5dXE
	 oB64ZjJTLuBlAXc3ztmu8wt5GpkInfkxCMmygebfGkr0zIdZLTC6PUcGfrDqItpPKJ
	 +PCqgIVTBuFo5NLHuP065YsIIXbZP4yIfK/iZeZHN94WRj/odYTMSlx/jvpdyZLoft
	 vdzqb1Ui/zEgHXyIVi9nw9vxKDUmicPPdZHEkg7TeZnN4LeZ/PEpDApG1Kv9qSexk/
	 GcGJywOUXf4VpIrdyBA5WrdMg2m7OLttziK2gHTOqVK7J8tZmQEuOZOEkiodxM2CpG
	 rF9DtA0/eRa0Q==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org,
	Thierry Reding <thierry.reding@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 1/7] dt-bindings: Changes for v5.16-rc1
Date: Tue, 12 Oct 2021 00:11:45 +0200
Message-Id: <163399027732.3049179.5220035290920996455.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211008201132.1678814-2-thierry.reding@gmail.com>
References: <20211008201132.1678814-1-thierry.reding@gmail.com> <20211008201132.1678814-2-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 8 Oct 2021 22:11:26 +0200, Thierry Reding wrote:
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.16-dt-bindings
> 
> [...]

Merged into arm/dt, thanks!

merge commit: cda490402d51dcdb4b35d873b268b432467b7b09

       Arnd
