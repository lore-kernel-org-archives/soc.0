Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2C97C433EF
	for <soc@archiver.kernel.org>; Mon, 11 Oct 2021 22:12:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D9C7B61038; Mon, 11 Oct 2021 22:12:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8178460F3A;
	Mon, 11 Oct 2021 22:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633990334;
	bh=a6Q/X4VDnkKlM1ULNGlUzA/PZuWoOdFb/A/DxITZsWA=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uUXHRdAZFWfoiZAWdwfI+JTcBZwqtmZ6RoE6J/bpZwj09ZKbqUnvmdpeAOFfs3SGb
	 qVF0gM3xdhnxB6I1HmRBwUKRhgkHcoW1AXIw+JQMSgoxO8q2P5Ekk02Xuic9W3UeL/
	 k6pPcYzMETmOt1UzbCvJChUEfbmG8cIqEUTcGirdOwyDt7pEGdIb7OgE/rabuqnE0e
	 dB8WAPjUTha/RrbDCPAzA85q3uSSY4pN8H3op676sVlMPyY5iDMEu3HshkLjWWhCrO
	 xv8GHpui90H9nsQqqR6WAl11IQOTY3tllgwPZXpMLObRmO8cZoe7PdZNkdh7Ptg5LH
	 4ajxu1htztl6g==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Tony Lindgren <tony@atomide.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-omap@vger.kernel.org,
	arm@kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 3/3] Devicetree changes for omaps for v5.16
Date: Tue, 12 Oct 2021 00:11:48 +0200
Message-Id: <163399027753.3049179.12794438950184811153.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <pull-1633950030-501948@atomide.com-3>
References: <pull-1633950030-501948@atomide.com> <pull-1633950030-501948@atomide.com-3>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 11 Oct 2021 14:02:44 +0300, Tony Lindgren wrote:
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.16/dt-signed
> 
> [...]

Merged into arm/dt, thanks!

merge commit: c3bb12ba7ffe7c57d57f063aaa2d28b1341046a2

       Arnd
