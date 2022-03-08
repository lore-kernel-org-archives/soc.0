Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE3DCC433F5
	for <soc@archiver.kernel.org>; Tue,  8 Mar 2022 16:54:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B60A8C36AE7; Tue,  8 Mar 2022 16:54:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C16CFC36AE2;
	Tue,  8 Mar 2022 16:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646758473;
	bh=QG90P0VwJKi69WTb2Qu5kvqLtv0euBzZXT3q2Qdvln4=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dC1GOodWfsEMBmZy8TBpQ5gSAy++ivt5nHebowcrzZxUnuD4w5Vv1yn6fVzoOpD2a
	 kvO21rkP6QJrR4TrfJgNaf9MYtL+tfGVs/DQ9vDY62h9nv34+mAgIrCeF9vzkfG619
	 7MlJIDNoCNnZ+fW99182M4w8oPvkrfEPWstu2KB7/InTsJ4HJ4xmkQw4R5OPgE0TNf
	 Kl45GEWWFwd5nzRvkDHKt6qBVahXfNOfPnPMItSG/AVHDYS7EU4PgbfhvWUy2Ax+eb
	 CGrZ99LaZHgZnEg/6yKQU5fWVTceIW7lXAXAlNtkyGAXzjqFTxV924gEI0TdMCdMVy
	 fjutR5ssXOZLg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	soc@kernel.org,
	arm@kernel.org,
	Olof Johansson <olof@lixom.net>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [GIT PULL 1/3] memory: drivers for v5.18
Date: Tue,  8 Mar 2022 17:53:56 +0100
Message-Id: <164675831373.4164581.12505949731046295171.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220228164313.52931-1-krzysztof.kozlowski@canonical.com>
References: <20220228164313.52931-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 28 Feb 2022 17:43:11 +0100, Krzysztof Kozlowski wrote:
> This includes the material which missed v5.17.
> 
> Best regards,
> Krzysztof
> 
> 
> The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: b903f9c55ea4a2af9a627268becc1e5f48ffbeec

       Arnd
