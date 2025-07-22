Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B03D225A31
	for <soc@lists.linux.dev>; Tue, 22 Jul 2025 20:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753217425; cv=none; b=iYF0pQkGJvj9RMpicJtRovjrUshq50wxkgCMsSnLzxtqfP7nyozDBWY2GXEYUo38Izhq4bnpDazFtXDpf+idLXIajPvkegRNS/xBaHRMt7kaOvOMgDYmqjZ0OAkHpRWsEM5RNpZ5+X3z4fdElGkehIBtXaE6Zs65hauYs/n9cs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753217425; c=relaxed/simple;
	bh=UX9YmDBP8WaoukHps3A99Bj27of4j1muygOMyF6kCwg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=ALAU8aws64z8lAnGp+IrFfMURGbyvH/qf7agQ/7tA7lWrmioVjdrr7m4HnnomeHFzpqpBh6XF30lzsHbBx0YpzkKBo2JY4HsFgEtvjVpLoHgIYbLnIFrAFsjABuR+4k8u5OWdSwUf7Hy44AMwsezwYlg8tpi3dasJpPmx3I2XAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ljwhdR2e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ljwhdR2e"
Received: by smtp.kernel.org (Postfix)
	id 994CFC4CEF4; Tue, 22 Jul 2025 20:50:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80148C4CEEB;
	Tue, 22 Jul 2025 20:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753217424;
	bh=UX9YmDBP8WaoukHps3A99Bj27of4j1muygOMyF6kCwg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ljwhdR2eu7KCsGMnxDwgNOf1oPvS6apV7Me7QTEW4DNGD2qwvNUDExjiiEACpN28R
	 cHpE/Ezn4IZgD+P/uYmXtftMSxQSKDSmj7uZotniYwNdMOvwYaiPZCYE2NsWbDTkYY
	 EqmgmdrIHwL6y7WVfvRNZUwUfAgLZl2LLXTrMyRwLs6d0GM93pXRusv3cCo3jr+vbC
	 GsQtQQJVXB81sXNtm2QahZ15dvdjnSegsVoKlRZpFrlc61+0qTZ3Bp/cdqLXe3hKHA
	 /0lVUqMpc7NMX98xk1brghjLrzVboPITD/XT6LM1XvMnsaRIlEaBuEdClsgIspBc+t
	 7k/wxkm4VPSrw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33C32383BF5D;
	Tue, 22 Jul 2025 20:50:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v6 00/10] Axiado AX3000 SoC and Evaluation Board Support
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175321744300.949540.10151377686694434106.git-patchwork-notify@kernel.org>
Date: Tue, 22 Jul 2025 20:50:43 +0000
References: 
 <20250722-axiado-ax3000-soc-and-evaluation-board-support-v6-0-543979a60ccf@axiado.com>
In-Reply-To: 
 <20250722-axiado-ax3000-soc-and-evaluation-board-support-v6-0-543979a60ccf@axiado.com>
To: Harshit Shah <hshah@axiado.com>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 22 Jul 2025 13:15:28 -0700 you wrote:
> -------------------------------
> Hello SoC maintainers,
> 
> This patch series adds initial support for the Axiado AX3000 SoC and its
> evaluation board.
> 
> Change from v6
> - Ran "b4 trailer -u" and add reviewed by Krzysztof
> 
> [...]

Here is the summary with links:
  - [v6,01/10] dt-bindings: vendor-prefixes: Add Axiado Corporation
    https://git.kernel.org/soc/soc/c/ffab86698c26
  - [v6,02/10] dt-bindings: arm: axiado: add AX3000 EVK compatible strings
    https://git.kernel.org/soc/soc/c/c1fbbb76ecc9
  - [v6,03/10] dt-bindings: gpio: cdns: convert to YAML
    https://git.kernel.org/soc/soc/c/36f422344978
  - [v6,04/10] dt-bindings: gpio: cdns: add Axiado AX3000 GPIO variant
    https://git.kernel.org/soc/soc/c/4c5250ebc3e4
  - [v6,05/10] dt-bindings: serial: cdns: add Axiado AX3000 UART controller
    https://git.kernel.org/soc/soc/c/7346be495b9a
  - [v6,06/10] dt-bindings: i3c: cdns: add Axiado AX3000 I3C controller
    https://git.kernel.org/soc/soc/c/678fefdfe9de
  - [v6,07/10] arm64: add Axiado SoC family
    https://git.kernel.org/soc/soc/c/729b770bb454
  - [v6,08/10] arm64: dts: axiado: Add initial support for AX3000 SoC and eval board
    https://git.kernel.org/soc/soc/c/1f7055779001
  - [v6,09/10] arm64: defconfig: enable the Axiado family
    https://git.kernel.org/soc/soc/c/525f46c7e3b7
  - [v6,10/10] MAINTAINERS: Add entry for Axiado
    https://git.kernel.org/soc/soc/c/a6beb2bdb0db

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


