Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A776CC43214
	for <soc@archiver.kernel.org>; Mon, 16 Aug 2021 21:14:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5A82861052; Mon, 16 Aug 2021 21:14:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D253861042;
	Mon, 16 Aug 2021 21:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1629148478;
	bh=RUGjOEJb5rWbfkFJdM4qNiMKq1B6zkdeIA44CA1G11o=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n+Tqbmfk4njJ3Y36diwB8Bygs0Qew5v1KlFRacwIFkoigvMa2P3sEHQrHs4VLONrC
	 zvuzDJo8Q50EECXi1IcBJjX9G9eyIGStHregwDFEmnKPRFiFi6A3TqDbasf6wbc1ge
	 2AAYv8j77jf+Dl1p1AT782c8+WJ7fsBdIsmusURutx0br1JacAE4/AMwui+P9uS8ik
	 2luuvaVeoHxmx47TRQCKq3JxaK+dZxpSVmY6aHNVf9j+C15GG5UHRz6k0X/oBRoRxu
	 KNOGFPP4hsikusAFmF3e0z7/yXDa1mCjX7pNcWcW59iFpb/tgsOhsqsOeSoab31Onl
	 HKfjPj6pXWj6g==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org,
	Li Yang <leoyang.li@nxp.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	shawnguo@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] soc/fsl drivers changes for fix(v5.14)
Date: Mon, 16 Aug 2021 23:14:33 +0200
Message-Id: <162914846696.237742.13028145809209351673.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210813222305.13663-1-leoyang.li@nxp.com>
References: <20210813222305.13663-1-leoyang.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 13 Aug 2021 17:23:05 -0500, Li Yang wrote:
> Please merge the following fixes for soc/fsl drivers.
> 
> Regards,
> Leo
> 
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: df97e5f3b21c3ed41385fa61cfb6e191044957ce

       Arnd
