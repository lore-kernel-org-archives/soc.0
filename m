Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29BB2C433B4
	for <soc@archiver.kernel.org>; Thu,  1 Apr 2021 21:08:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E2533610FB; Thu,  1 Apr 2021 21:08:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CA6CC60FE9;
	Thu,  1 Apr 2021 21:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617311320;
	bh=y5UPwiqkgfVx96KWYdQ37ezgwlno0VIQUmTVpSz4sJQ=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=miCgnTNDChBZ5lsxXSdr0GbztB3aXt9HiOE3DomqO3GMZbVj9TWM4ugzAH35gqyCe
	 eQ9chKvksllpKF1n/ZBCLQBHjZpffFSbE7hr9CqkEYP2iMppE9RnVNDvq8ZaGVZIYf
	 p1sPswwb3CacheSgk0VHrCwf+l3tiFxAMF2Br8ifTbxywpzcjTbqSlPAxs+0nYmNrP
	 pnsfZCGQDyNC9/SHlTvwg70k6FCQoLXmOpFUy9PfT4/cwaJQQ5ILxgLkgCtJpaqqpd
	 87z0nUei50UTB1Yx2lO06Uw3oQQer81xHQC2ME8ejhl1jTDTTNHeDEj2+oKBiTvIlO
	 FCnmaZ5iyRiWQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org,
	Dinh Nguyen <dinguyen@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL 1/3] SoCFPGA updates for v5.13
Date: Thu,  1 Apr 2021 23:08:35 +0200
Message-Id: <161731130329.663335.3847371649852120175.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210330110430.558182-1-dinguyen@kernel.org>
References: <20210330110430.558182-1-dinguyen@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 30 Mar 2021 06:04:28 -0500, Dinh Nguyen wrote:
> Please pull in these SoCFPGA updates for v5.13.
> 
> Thanks,
> Dinh
> 
> The following changes since commit fe07bfda2fb9cdef8a4d4008a409bb02f35f1bd8:
> 
>   Linux 5.12-rc1 (2021-02-28 16:05:19 -0800)
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: ba87f2009edb69fa81d344c55bcee518b0707c98

       Arnd
