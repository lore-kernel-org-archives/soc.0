Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EA63C433EF
	for <soc@archiver.kernel.org>; Wed, 20 Oct 2021 14:44:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 364A06138B; Wed, 20 Oct 2021 14:44:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0731D6138D;
	Wed, 20 Oct 2021 14:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634741058;
	bh=w1HEOzqw9am88vvGSLDdAUDpJuhlNzmKJw8lfg6RO8M=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FAAbNyUiYhdsQKEjq0wiq+k0lWVZXUKYukWZ5iyuA+FaovKE/Edl96Ni1VhwAYF1K
	 AHL1rUe2T41ot0Rrm959j1ZyU76aWkclcrEMdaJgkCqcZfEoqt2ff3k7HX3mlvBm1/
	 BHCKUivp+JMFW99cANEEh9VO3W38j5uvQsHmJN8O4bWz/GwvMQk+SlPVR0LrFuySug
	 ZKWKRLndJJOKQ41z5yebkJdJ2cZWvfK5Le7vcibnpNKOBL/4UbwDPjoJ85FewHhgxU
	 ulSMSHqXKP6KnDFpKlA1ucRqNhG/HY/KRK0bPRMfl6fBN7tXjRXmR3vG6esh6rZ6ZV
	 P77Gyj21BzPdw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de
Subject: Re: [GIT PULL] Reset controller fixes for v5.15
Date: Wed, 20 Oct 2021 16:44:10 +0200
Message-Id: <163474104528.3915621.6394652804482446474.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <b378f2aae54538db6a13c98561b4cbcacbef937c.camel@pengutronix.de>
References: <b378f2aae54538db6a13c98561b4cbcacbef937c.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 19 Oct 2021 17:12:51 +0200, Philipp Zabel wrote:
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.pengutronix.de/pza/linux tags/reset-fixes-for-v5.15
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: 36b6dcbc1245a3b4dd6bc5cc6b0284c9f05cdddc

       Arnd
