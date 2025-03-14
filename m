Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7CB202F7B
	for <soc@lists.linux.dev>; Fri, 14 Mar 2025 17:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741973399; cv=none; b=iWtCU1tF81SqKCiV+mpM5V2EyiMcjSnpYODLmv/vGsd4UNkWk1GemYaEzPd/iqfj53YWj2vP4OmErJrAtSQ1eI0wyrLpxsSg5YepMhFVsH63CzjvuuUuU5jWWfy8Z5aEMKhZI6wlyKbz5EEBetaUlu5yqAasGy5y4uB/tijwQWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741973399; c=relaxed/simple;
	bh=lgsoYYXnbDFX7XoSWePRRO8WvXPQCrkG3kz2pOZNhIQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=nqOrw2i9jWhdlkkzC2Npc66KKKXZ2y1Z+DQVgPlXwd+dny8wmVuPqnvKNoiCl4I7Vcrz/UHFfBkEwBE0q2SiiA6TAnXXs8CSn83dnhIGbQEm+klh3fIr3r8Z32GktrtLAjZtp6WWX1DWGjjpxQD1Ybc2gwKmO1dFUXBXojDeUnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uAezJnlv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uAezJnlv"
Received: by smtp.kernel.org (Postfix)
	id 942C8C4CEEC; Fri, 14 Mar 2025 17:29:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CDDFC4CEE3;
	Fri, 14 Mar 2025 17:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741973398;
	bh=lgsoYYXnbDFX7XoSWePRRO8WvXPQCrkG3kz2pOZNhIQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=uAezJnlvTjNm6LBRbx2F0DGNhLQ8P7nF3GnpAb+iY6Zc9KjAZ93c++LgqvuBKs5fB
	 E2KvKi/KH9UGiJyUA900i76arUk0Z/Ui6Xn3phobtaVw6IxpOo2mHQAzI/sdrky0BJ
	 buiMi0kJ5mkx6aywiDhRUpMxxOu+Tpx16Ufnl/hPkffPf7QH5cs79dM6Z5jXnhBvKL
	 go5VKYlW5eAvy0l9rhOJdqGS6DSvr70VStOQ6zVKjG7NyoxkZ/RS+q3rp8SyoaWG+b
	 UnD4CFXMaHEVC+DwMvTsKMBC5YO5YMq4fSuISw589rf7PgboKleJocMv5B9EujDikO
	 jPplzvoLFm+CQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7166B380CEE2;
	Fri, 14 Mar 2025 17:30:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH][GIT PULL fixes] memory: omap-gpmc: drop no compatible check
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174197343325.2324103.6318298718130417065.git-patchwork-notify@kernel.org>
Date: Fri, 14 Mar 2025 17:30:33 +0000
References: <20250310141514.56033-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250310141514.56033-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 10 Mar 2025 15:15:14 +0100 you wrote:
> From: Roger Quadros <rogerq@kernel.org>
> 
> We are no longer depending on legacy device trees so
> drop the no compatible check for NAND and OneNAND
> nodes.
> 
> Suggested-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Roger Quadros <rogerq@kernel.org>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Link: https://lore.kernel.org/r/20250114-omap-gpmc-drop-no-compatible-check-v1-1-262c8d549732@kernel.org
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,fixes] memory: omap-gpmc: drop no compatible check
    https://git.kernel.org/soc/soc/c/edcccc6892f6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


