Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59ADAC433EF
	for <soc@archiver.kernel.org>; Mon, 11 Oct 2021 22:11:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DB33960F3A; Mon, 11 Oct 2021 22:11:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0CD2360F21;
	Mon, 11 Oct 2021 22:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633990313;
	bh=KbyZXYV+89ujNC3AHGmEX5i29bB5OJkHExGA3g06Qr0=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eFU5s4SCy0qZeF+pPKiFynExN0oonrcRfSyb3OGWAQVcZIRjB9/kQ8gEzkLhoND+G
	 aJi1RHCKngESLYeQkS54NrSgWmPMvkuSrcg1jAaSzMl2M34pjv5PSvd/yqz4ay3V1j
	 adIQ41a5ih0g28jZ7A/eL7JuqOzz6ZOPT0WFo6nRM2qZ9jbFhMfPXmWPV1/wjaZ0Eb
	 LOzLDt9/NoMmoVgsoKgiRn/4D8HMESNJe9y5YIeYiszuuOckPKjoltexVQmoMQ0rox
	 wKQckAhkyH4zqmubW0fyZ7vpdQ/NBDsaZiSvfbB7QyLkL1fDoUcOIEG8S4cR2U1ru9
	 a+07NTLDCz1nA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>,
	arm-soc <arm@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	Luca Weiss <luca@z3ntu.xyz>,
	Sungbo Eo <mans0n@gorani.run>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Frank Wunderlich <frank-w@public-files.de>
Subject: Re: [GIT PULL] ARM: dts32: mediatek updates for v5.16
Date: Tue, 12 Oct 2021 00:11:43 +0200
Message-Id: <163399027746.3049179.12954087095996639958.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <7135d46f-5fb9-b46d-96d4-3b38548fe23e@gmail.com>
References: <7135d46f-5fb9-b46d-96d4-3b38548fe23e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 11 Oct 2021 11:55:25 +0200, Matthias Brugger wrote:
> Please have look to the latest arm32 bit DTS changes.
> 
> Regards,
> Matthias

Merged into arm/dt, thanks!

merge commit: 79619b7988a45197d9a22657d246057a9c8391b8

       Arnd
