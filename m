Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C358C433FE
	for <soc@archiver.kernel.org>; Mon, 11 Oct 2021 14:54:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 120D260ED4; Mon, 11 Oct 2021 14:54:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 836FF60BD3;
	Mon, 11 Oct 2021 14:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633964076;
	bh=btPjfble0h5U4MxezT3RvavLZYYojZkL6JofnhyizHE=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SXT/yJ4J0uGR5CaloH5HsMCPmICxRPzv67YsW8PcA69zpGKnL1g0a1C8lJuBEZM8Y
	 xaKPqfmDCgfYl+OmK/h71w+CWHViH2NoM/WflO957IDGxG13Jy0NPNIZ57SLmr5n83
	 0tQ+9T4B5J+0Ph65AqtfPkQUP0owed021Zs4XM6Ps0MDcCvt7WUmzbPm0p/H6gKxDZ
	 es/bKzjBytOvo471u8jYoJC9qr7/VUZJ4o7q8Qx26v8AwCAZmLBO4hnTueoA7EbMac
	 Vv58hjzXL1cSNjy5ptDRQMAULMsgvFmInNjCyvvYRyzaXtadTtiZIsyTuIwQ/kZWlc
	 cEekE8ZR6egvg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Olof Johansson <olof@lixom.net>,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [GIT PULL 1/3] memory: drivers for v5.16
Date: Mon, 11 Oct 2021 16:54:24 +0200
Message-Id: <163396399134.3170841.10756303713428017053.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211010175836.13302-1-krzysztof.kozlowski@canonical.com>
References: <20211010175836.13302-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Sun, 10 Oct 2021 19:58:34 +0200, Krzysztof Kozlowski wrote:
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-5.16
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 16667625dae695631d98d848769e481b08de7185

       Arnd
