Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795098607;
	b=cfRs6emfJeZXbeS80e+zDfZNZdCudqgQl95bdSvojJiCWKpAcJhofLHLcc5pUkschEdM
	 qcixwl2GaDu7jILJaFNJbCjRsA+8sfnP40gRuaSMePnHSFPdk+tvkqVHOUNvXMN9ms1Kz
	 4++lF4fooYKVkmrP1Lp1AZqRT3iePg58fvOxowfsqA3E0qLj5wbW2P4kvShp0lOlnRLGi
	 4Jx68HgAqAsP09AGfiEq90vJJbv/owKsN4jEcqclqfiVuZ8s+EJjEhhc3aECelzXVReui
	 w9Wb/hx73gO6Q+Q2RTiZo7aqNcPgI9cg9+8sJWLI28v0Rs3igkOQGCQju5XHmJdXj5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795098607;
	h=Received:Delivered-To:Received:DKIM-Signature:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:Message-Id:Date:
	 References:In-Reply-To:To:Cc;
	bh=WQYSz8+QpxfW8yfqxyzVTiqvLKuDArGLxwn6CidRC3E=;
	b=UFmxXuFT5BcDpjGdW+Adx50jrBNggUTa/XD6zv6v3hb31TxpSdJmRBG8e2zpJIfW9P1K
	 yDFaj9Qe4LT+aAV8ingbMkwHZJO4UDfDXfGu3W+T/WYqbYyK22uucM+UDUhfFc/epjwqh
	 RhQ/II4UIM9SkRmt8S9WVdgzFsYsswCsRnJSPoak/JIh0ULxq7vm90LQ2uSlp3yFVGiR+
	 87hgmqREZ9qxrBrCbPq5HbpnnLiEpelk4FL9j8tw1XpeyFVeHkS8c9LfpQYQp20M0E1Ua
	 QEDENAkSIUd+RHPqnR6WHe/Y7N+zKJQYXKH51g8M+ozVii4fhbB/ejFD/m+ur+RDhlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Is55Opf7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A935B606A320
	for <soc@lists.linux.dev>; Thu, 19 Nov 2026 14:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Is55Opf7
Received: by smtp.kernel.org (Postfix)
	id 9B0C91F000CC; Thu, 19 Nov 2026 14:30:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 839221F000CB;
	Thu, 19 Nov 2026 14:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795098607;
	bh=WQYSz8+QpxfW8yfqxyzVTiqvLKuDArGLxwn6CidRC3E=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Is55Opf7a0QhoVUxGE00lYDcsQJYLm7WRAR6//mreoOhCqL0QMutcF2yFY6DwA3jU
	 YgirouMhRBmtgfGYSg5psXs2h0++6CpMLi+Pc65Pw3u7JpV0KKcpzj156ZzTxK66D+
	 39PeCrSZkEnCf2dBQLs9RnZv348c7uuOcd9qLvOOxqDZSzFQEFO0lXg9iU/ZJP9MlR
	 MEu9sLPQ1TNcdJ5yUVLS2gWHgkUaWFQ9rzV/XGT01UlOHZ68tsbyxPxZOMMdMKLoWG
	 ZmTMTx0JSFW/y8aQBSE0b78warSh+rK2Whj0d/Fm+MQmdNmX5zwX0TiKIRAqzKsMBW
	 v3d6BiV+FMnOA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 774383808210;
	Thu, 19 Nov 2026 14:30:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Post: <mailto:soc@lists.linux.dev>
List-Help: <mailto:soc+help@lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v12 0/6] arm64: add Ambarella CV75 SoC support
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179509860628.3125960.15545903935890136572.git-patchwork-notify@kernel.org>
Date: Thu, 19 Nov 2026 14:30:06 +0000
References: <20261119-cv75-soc-v12-0-e5a03cca8b05@ambarella.com>
In-Reply-To: <20261119-cv75-soc-v12-0-e5a03cca8b05@ambarella.com>
To: Long Zhao <longzhao@ambarella.com>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 19 Nov 2026 18:13:18 +0800 you wrote:
> Add the Ambarella CV75 SoC and EVK support: the board binding, the
> RCT clock binding and driver, ARCH_AMBARELLA, the devicetree and
> MAINTAINERS.
> 
> Apply the patches in this order:
> 
> 1. board binding
> 2. RCT clock binding and clock ID header
> 3. ARCH_AMBARELLA
> 4. RCT clock driver
> 5. CV75 SoC and EVK device tree, plus defconfig
> 6. MAINTAINERS
> 
> [...]

Here is the summary with links:
  - [v12,1/6] dt-bindings: arm: add Ambarella CV75 platforms
    https://git.kernel.org/soc/soc/c/97a175f09791
  - [v12,2/6] dt-bindings: clock: add Ambarella CV75 RCT
    https://git.kernel.org/soc/soc/c/58a9f024d58c
  - [v12,3/6] arm64: add ARCH_AMBARELLA
    https://git.kernel.org/soc/soc/c/d48cfd6482ee
  - [v12,4/6] clk: ambarella: add CV75 RCT clock controller
    (no matching commit)
  - [v12,5/6] arm64: dts: ambarella: add CV75 SoC and EVK
    https://git.kernel.org/soc/soc/c/4a1ce643a9ec
  - [v12,6/6] MAINTAINERS: add ARM/AMBARELLA SoC support
    https://git.kernel.org/soc/soc/c/d76a3a4c6da4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


