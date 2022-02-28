Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75836C433EF
	for <soc@archiver.kernel.org>; Mon, 28 Feb 2022 15:16:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4018AC340EE; Mon, 28 Feb 2022 15:16:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2E61C340F3;
	Mon, 28 Feb 2022 15:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646061411;
	bh=DvUaTW5gQi1drhkdO0/fBKlbLVRQpZi/yKHwvjDisro=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EJAzeFjTayhgfs8xOwEVNeQgN3hnb1ZYQLetl96idacoZPoJ/aQ6bpHR1zfzZ91Qo
	 LSyEQoxY+xrz4dtcGAnfgToFhjxrGzKhJFkjuT3P8Ou3FhAGd8irvmTeg4fd0zu1N4
	 1ituuBsGAH7Zi5P5PoyLJrNi2weVu78Be5CWQ82VlV+aMhiytYFkNr5ftDwz7nFrSq
	 iQ3Va5UDxoNR1kyV0No5wrvP5pC/9M+pN3FW73tg/NWqLeB56qQf6NfsKYS5y4Kb/U
	 Swb8VqfI+l2PQOJNCVe3w1vJHjylZpKwzB/L/X85k4JkU5xUt5pBJ6C8T5No7ki71d
	 c1X18tQ78Cfhg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [GIT PULL 1/2] ARM: dts: samsung: dts for v5.18
Date: Mon, 28 Feb 2022 16:16:30 +0100
Message-Id: <164606116889.3364867.13760216215937331872.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220209145226.184375-1-krzysztof.kozlowski@canonical.com>
References: <20220209145226.184375-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 9 Feb 2022 15:52:25 +0100, Krzysztof Kozlowski wrote:
> New platforms and a lot of dtschema cleanups.
> 
> Best regards,
> Krzysztof
> 
> 
> The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 60a9914cb2061ba612a3f14f6ad329912b486360

       Arnd
