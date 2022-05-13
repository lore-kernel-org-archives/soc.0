Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23FF9C433EF
	for <soc@archiver.kernel.org>; Fri, 13 May 2022 12:00:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0C808C34114; Fri, 13 May 2022 12:00:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8689C34117;
	Fri, 13 May 2022 12:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652443220;
	bh=h47tLrFyvqv+7zyBvQhn3TQYqOW/fmOb3fGy/sPJ/EY=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hbW6UM0T10UUG/kX4WxzJyKEKs8cGogltSiGC795BcHqIK8Cl1JmAm/BhfWiYyaW/
	 oPm+ubpRZOYodClzg8SzSHMdtR8jEFxV64lqP4qrDYKxwYYNeW29KxiPZezi8cFOBP
	 iiluCxhC1Rd7BwFf1UwujLC8UPZTs9IASjde689iWVUbhGbCiCHG0gIkIpbP0hVeX5
	 Mr8aPr7UqCQ9Zf15g5XaUSWudXl6SWQXSTmwYfQcqWB73S9BD5QU+y98xgAZMN64nC
	 Rs8TMqHpvqSIwKlaGl+VjazhbgSylGXZ5/b23kIS2kze0HLuejnjHeiha5fq0aCxQL
	 nhfO8AAGa3V+g==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Vignesh Raghavendra <vigneshr@ti.com>,
	SoC <soc@kernel.org>,
	Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
	arm-soc <arm@kernel.org>,
	Olof Johansson <olof@lixom.net>
Cc: Arnd Bergmann <arnd@arndb.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Tero Kristo <kristo@kernel.org>,
	"Menon, Nishanth" <nm@ti.com>
Subject: Re: [GIT PULL] TI K3 defconfig updates for v5.19
Date: Fri, 13 May 2022 14:00:11 +0200
Message-Id: <165244251866.2864729.12620460775658849127.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <88cd734e-47a7-4307-c119-8f6ec6c40452@ti.com>
References: <88cd734e-47a7-4307-c119-8f6ec6c40452@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Sat, 7 May 2022 22:19:53 +0530, Vignesh Raghavendra wrote:
> The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:
> 
>   Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-k3-config-for-v5.19
> 
> [...]

Merged into arm/defconfig, thanks!

merge commit: 9bc4df1d8b91d8677a547d4d21fde7405e46a39c

       Arnd
