Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 906FAC433F5
	for <soc@archiver.kernel.org>; Tue,  8 Mar 2022 16:54:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7C1BBC340F6; Tue,  8 Mar 2022 16:54:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A597BC340EF;
	Tue,  8 Mar 2022 16:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646758480;
	bh=Yyw0e+1ZnO5hFOA9P7UhSxWOtl6Nu3TnTTjNfO4VN04=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ATGqdUtW5zK42BmEcVpumLeKDnvvKqc/x0UKRamQRk20EJuXtpzCmQdF2Oij/e6vd
	 4ibxRoIXVVFLo1I0tt+gi82zSrK2fDXf4YY70FzDwJ4/cZsgAFjbJuLMYC8a3JFDXO
	 yXDBjKGwx5mRzXSr9BCGaO0Xg5Na1yCxGSjEVU+XMNnr1OfExNdqwphQxZVSRmbjVx
	 5P2ImM9WEuE4veUWUjmGcabevChr+iXn8RkVaCWcqzjskWDhViXpqhtAgW4leUzjJk
	 P/W8zX4PZDsazrmUx9S8tHR0Pd2n41Z5OE6gAaCR4raVkZdJ5pu7LM6pjrJrcmEZL1
	 JVPW/0+77DNCQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	soc@kernel.org,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [GIT PULL] memory: drivers for v5.18, part two, late
Date: Tue,  8 Mar 2022 17:53:59 +0100
Message-Id: <164675831478.4164581.15330007161039565555.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220307082552.55719-1-krzysztof.kozlowski@canonical.com>
References: <20220307082552.55719-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 7 Mar 2022 09:25:52 +0100, Krzysztof Kozlowski wrote:
> Late minor fixes for v5.18 memory drivers. On top of previous pull
> (tags/memory-controller-drv, soc branch: memory/drivers).
> 
> If these are too late, please consider it also for fixes after merge window.
> These are not typical merge-window fixes though (issues existed for long time).
> 
> Best regards,
> Krzysztof
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 608f7cf3f54415963ef49b70596153d806ebb0de

       Arnd
