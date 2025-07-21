Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926B717993
	for <soc@lists.linux.dev>; Mon, 21 Jul 2025 15:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753111903; cv=none; b=EsSRmbd0lbWcSlxUs27bDdIqd80vfmo4/rS+dYHgqXA/JuTAyJYczL4y3BJb4GRH27WqGXhYjl9/sUiDv0r1tzaEa3l9CPECy2nsPtWCy/IY5awF5wr9TlRBvjIw2ywFjYuTwwpNs8U0nlkb6QxnIcbHPTccgGz5+yR+WtJdcGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753111903; c=relaxed/simple;
	bh=934DGwLfHcqUc3d4+En+JiPWvsDJco6+KJr6dEjjsTY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=J9a3t5Y7aAWanE+iCvKG/PIPsflyRQeLn4Mf023ZXDckKVUfnTKcGX98Yk+sTxY93mnHYd6yRhRrTCXpH4tgIygKC+ciB+AvhyeCu/iyS+MvC+wn5SNQNHRiOn4/VDhQqkjz7uQevZdhqRREnpeE0G4seJeA6mQN+Jy+5G21bAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s5PiPrzx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s5PiPrzx"
Received: by smtp.kernel.org (Postfix)
	id 2E234C4CEF6; Mon, 21 Jul 2025 15:31:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18663C4CEED;
	Mon, 21 Jul 2025 15:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753111901;
	bh=934DGwLfHcqUc3d4+En+JiPWvsDJco6+KJr6dEjjsTY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=s5PiPrzxjnrdI37/Db/Xh0b1ga8Q9nvRe86RcU8pYEz7eN7vjmCjyOO64pGCQQ+r5
	 MAxNgbYNKIDx+xHyLj2tV62dk1NQMKfNGbQY9UDR0MAuEh5xFz8rajC4xQb9LaoRip
	 GV5BxJpLlYlDHs4cQA4NtfSl/W0emton0/Jdu3GfwVKiOqORV6hV7jJZD0ChsXzZQO
	 cHKcTVkuVCKXIOnXg0cE+Es6iJ51dJL3AeyEtkUp+Ed9y23XsZn5tbIcd1KS9tOPdL
	 2/sLC+6dWzBVMuFOPNKuAbjzLze0ah2aUN9TaanCiSc0hQ1CPHQNYKJLpr9AX1Cbms
	 4Y/1gZ0axFYdA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 24A31383B266;
	Mon, 21 Jul 2025 15:32:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/9] add Voyager board support
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175311191974.94241.14490941012792423343.git-patchwork-notify@kernel.org>
Date: Mon, 21 Jul 2025 15:31:59 +0000
References: <20250711133025.2192404-1-ben717@andestech.com>
In-Reply-To: <20250711133025.2192404-1-ben717@andestech.com>
To: Ben Zong-You Xie <ben717@andestech.com>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 11 Jul 2025 21:30:16 +0800 you wrote:
> The Voyager is a 9.6” x 9.6” Micro ATX form factor development board
> including Andes QiLai SoC. This patch series adds minimal device tree
> files for the QiLai SoC and the Voyager board [1].
> 
> Now only support basic uart drivers to boot up into a basic console. Other
> features will be added later.
> 
> [...]

Here is the summary with links:
  - [v2,1/9] riscv: add Andes SoC family Kconfig support
    https://git.kernel.org/soc/soc/c/00dba19aa005
  - [v2,2/9] dt-bindings: riscv: add Andes QiLai SoC and the Voyager board bindings
    https://git.kernel.org/soc/soc/c/12d8c15992c4
  - [v2,3/9] dt-bindings: interrupt-controller: add Andes QiLai PLIC
    https://git.kernel.org/soc/soc/c/6eeee4fb1930
  - [v2,4/9] dt-bindings: interrupt-controller: add Andes machine-level software interrupt controller
    https://git.kernel.org/soc/soc/c/1f5ff8c363cf
  - [v2,5/9] dt-bindings: timer: add Andes machine timer
    https://git.kernel.org/soc/soc/c/65bbf10b934a
  - [v2,6/9] riscv: dts: andes: add QiLai SoC device tree
    https://git.kernel.org/soc/soc/c/609496af55ca
  - [v2,7/9] riscv: dts: andes: add Voyager board device tree
    https://git.kernel.org/soc/soc/c/9d462f56db7a
  - [v2,8/9] riscv: defconfig: enable Andes SoC
    https://git.kernel.org/soc/soc/c/ad087c91eb87
  - [v2,9/9] MAINTAINERS: Add entry for Andes SoC
    https://git.kernel.org/soc/soc/c/bf40c1a5b956

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


