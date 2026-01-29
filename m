Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240C037B40B
	for <soc@lists.linux.dev>; Thu, 29 Jan 2026 09:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769680319; cv=none; b=T4Y1HY3631+Owm8+kW+DrvF/YxR6A0tCp2jQ8Ea8TequrgU5DUXAZe/HA2JtpQQacku7wr1/5DinIBHKE5YehkVAea2O5aaO8s1p8q/boJBO8GAQdvj+6qXKP67UuaCgEMc9tprzsX1mTuK1sx4Sr52jLgkhkPhyZ0uA16wJchk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769680319; c=relaxed/simple;
	bh=K4VsMrG5CuRQEE9xMOiny+gXlGLdFr4oL+B9ZKjCQ6A=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=n3ItGsq5auOs3hDSw7XCsN8EVJErxG9SpLvJKLhvVrpmsVfTSICrPyFSJeAJhn/YisX1zyypHgBg5x8yYK5RNUfl5AUKghIfAJNwhrpMk4UJ1yYo0suKnNz+mBhPr6nO/InM31Opb9K3LNlEDKcHXhMoCY/+wAw/cjdnOqlpjB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZvmcpQab; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZvmcpQab"
Received: by smtp.kernel.org (Postfix)
	id 1C2ACC116D0; Thu, 29 Jan 2026 09:51:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05ED3C4CEF7;
	Thu, 29 Jan 2026 09:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769680319;
	bh=K4VsMrG5CuRQEE9xMOiny+gXlGLdFr4oL+B9ZKjCQ6A=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ZvmcpQabOkUHqwZ6cKoXfoGO7I6d23y+TVgxhzD31YVkDFRhNQljgprgWGdsZcB5J
	 bT8VU6UtNWgugf9aOND7J1m/0pWnp/vPkTimkia0BAoooyU0RvEOw+qiZoRVMao52f
	 gsfLjbuSruW5toacT+7/aHahRx386PbXmyY6xovXBSkbG3j9/E/j4vQnLDwDufkH+E
	 8+HfnridSn5asjIK3UBJjRyAzZ+mAnQ6gIUWuty/+EsmeZf9IfwgeAP8qgSuTnGSBE
	 BrgwqudeNdmrVEazJi+YYELXCROAE0MNrd7DESvqzQDBe1Vrb/LcnrbKzdaqTqebAu
	 1KwXYM2TOUNbA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 4EB6D380AADF;
	Thu, 29 Jan 2026 09:51:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/2] ARM: defconfig: move entries
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176968031184.2433421.9110844699505584084.git-patchwork-notify@kernel.org>
Date: Thu, 29 Jan 2026 09:51:51 +0000
References: <20260112153255.795553-1-arnd@kernel.org>
In-Reply-To: <20260112153255.795553-1-arnd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 12 Jan 2026 16:32:54 +0100 you wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Some Kconfig files got rearranged, so change the defconfig file
> to put everything back in the order used by 'make savedefconfig'.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> 
> [...]

Here is the summary with links:
  - [1/2] ARM: defconfig: move entries
    https://git.kernel.org/soc/soc/c/ee1ab82ee032
  - [2/2] ARM: defconfig: turn off CONFIG_EXPERT
    https://git.kernel.org/soc/soc/c/6d925df98181

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


