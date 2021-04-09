Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DD51C433B4
	for <soc@archiver.kernel.org>; Fri,  9 Apr 2021 19:55:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DE2EF61041; Fri,  9 Apr 2021 19:55:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 86DE161186;
	Fri,  9 Apr 2021 19:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617998104;
	bh=pDnrJcgtP6+wy/hGLUiAByKSmbuPue4kVYXSXIcpLHE=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V350quqbWUUsbsrh5Yv6DnUxUOsPsaBjPn6nD/QcIO2LhP7hZ8sDw1hp3cACCDTdp
	 XDtvFFYnwtp6gfgt5gT+7CtAP1lND29oNRTfrP8VJJBBfkLWlGmPMhq/HroZQH54+X
	 DQjg0vARZ2vRF8m8cSPIgf/DUVoTI1q+yfkhBcNSM2GkgZ8SVhMU3r3g3/O1rmQCqs
	 tikY3hnrJb6zLbKkeIzvWqb61yMXjpaPTCeFiWSAFpG/M6LtAOc9NJOyUGQ6luZYfm
	 Hvlcy6LxBueud14cVPuwDSZtjkiEJ+kStIoGuSyF+X3BlgBRfk2b0+/460wHhFzUY5
	 wZEzbym6tmtaw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org,
	Kevin Hilman <khilman@baylibre.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] arm64: dts: amlogic: updates for v5.13 (round 2)
Date: Fri,  9 Apr 2021 21:54:54 +0200
Message-Id: <161799808702.1862218.12904940080958587014.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <7htuofgwaz.fsf@baylibre.com>
References: <7htuofgwaz.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 09 Apr 2021 11:14:12 -0700, Kevin Hilman wrote:
> Arnd, Olof,
> 
> A 2nd round of DT changes for Amlogic SoC families.
> 
> I'm now aware of the new DT warnings added in the first round and will
> work to get those cleaned up next.
> 
> Kevin
> 
> [...]

Merged into arm/dt, thanks!

merge commit: db7a033f2b1f54c46244efe54687fe8f4b9b7c21

       Arnd
