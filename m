Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F872857EF
	for <soc@lists.linux.dev>; Thu, 25 Sep 2025 13:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758808210; cv=none; b=PE4iq1xBB1lC//yxM74ZZLZYWcPtoKcwc7JwweRJGHvG+5skCWyFOUyxc2hfSbJP0lovao/WPUfbc72UvszY/jP+vVClcMskDzJyikg85Ou52GO02ifugDwRxzN0cThg0DBpFtOxTmuA5EHYLfKi76LBN15GzHWLMQARtqJSQ2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758808210; c=relaxed/simple;
	bh=HdC923Z+vngvtQUNIqgbaa28wPYhMyeLmYb4gIewbsM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=GzV4JxYN0xsFTyI93OSna+/KDAQbAi9E8s/gmCeAyL4iUcYlXgIkwsQ0D+2qpqXq8eCZPzF29KDAymN4t3Wt31kO+PVjWo9X/CguPKTsbWL1r2ddjUJEVGotCK1LBxigfgYR76XqgcYcIvhsM+a6zCilBK/UORzmvj6xQ7ojh24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bCl47MwD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bCl47MwD"
Received: by smtp.kernel.org (Postfix)
	id 1D2B7C113D0; Thu, 25 Sep 2025 13:50:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01AF0C4CEF0;
	Thu, 25 Sep 2025 13:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758808210;
	bh=HdC923Z+vngvtQUNIqgbaa28wPYhMyeLmYb4gIewbsM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=bCl47MwDtP0kxcuKcFJET6tfHSMqRWbO62KgjRfIT7MjkH+fUcgzut4fosWctCNmU
	 eWGCf3uzJpzHJtgjLMQ2aevl0OUIplwlOBGfddO6kmzgCAhZ9OYXgsrlaFIqqym3Am
	 5kbgL+AxiexiUwV1kwJ6NWzF28lRnZAuG1QsUvni59p3VfJC/yC3aUfjiKwcYmmYOT
	 xC6nmUFnlwHnlbo5JNHnPXXwG/Rpkwo8Rcc1eHvTvtazo9sslpgT85ME0EZ6fYEwaW
	 u8ljdOeHdtvyYIuE2l1l76KpXuW4cZyQc9TeC2hbl9NCwF4nzCZtW4tE73cNV+Kl78
	 6meSKbPEY7pyA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33DC239D0C21;
	Thu, 25 Sep 2025 13:50:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v5 0/6] Basic device tree support for ESWIN EIC7700 RISC-V
 SoC
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175880820600.2989194.2155786354537304652.git-patchwork-notify@kernel.org>
Date: Thu, 25 Sep 2025 13:50:06 +0000
References: <20250825132427.1618089-1-pinkesh.vaghela@einfochips.com>
In-Reply-To: <20250825132427.1618089-1-pinkesh.vaghela@einfochips.com>
To: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 25 Aug 2025 18:54:21 +0530 you wrote:
> Add support for ESWIN EIC7700 SoC consisting of SiFive Quad-Core
> P550 CPU cluster and the first development board that uses it, the
> SiFive HiFive Premier P550.
> 
> This patch series adds initial device tree and also adds ESWIN
> architecture support.
> 
> [...]

Here is the summary with links:
  - [v5,1/6] dt-bindings: riscv: Add SiFive P550 CPU compatible
    https://git.kernel.org/soc/soc/c/b9607ff0f86a
  - [v5,2/6] riscv: Add Kconfig option for ESWIN platforms
    https://git.kernel.org/soc/soc/c/faaf0ea59713
  - [v5,3/6] dt-bindings: riscv: Add SiFive HiFive Premier P550 board
    https://git.kernel.org/soc/soc/c/3e907d0faa79
  - [v5,4/6] dt-bindings: interrupt-controller: Add ESWIN EIC7700 PLIC
    https://git.kernel.org/soc/soc/c/21b5a7ace6b2
  - [v5,5/6] riscv: dts: add initial support for EIC7700 SoC
    https://git.kernel.org/soc/soc/c/3329e2f3b524
  - [v5,6/6] riscv: dts: eswin: add HiFive Premier P550 board device tree
    https://git.kernel.org/soc/soc/c/fee2f45def03

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


