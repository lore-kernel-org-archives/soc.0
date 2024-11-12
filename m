Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECBA72003CB
	for <soc@lists.linux.dev>; Tue, 12 Nov 2024 15:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731424989; cv=none; b=OcNufmyePkJ9Yy8MbqxLkadV+HoJgN9YMlzvdbQ8+AiyRfxU3DQNj5kkMycHzhviHj+8ixMeU9mOn+KQzgq0G9kcyzfvYtGeipoRVG36srLA2HLP1s1jMCsKu85biI7gq7x0HBe/kFQ8ThZdDE9WGDr/rBSExo0Ck75MkZ7JHJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731424989; c=relaxed/simple;
	bh=x8eOTz4PgDoeEfP0Yu2pU2jwPqtN+CxkteVhG3s2gK0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=ZlpvQszB+0YaARgHAx5n7Gv+C9hNea/nsoNbxaGpYwfw1kbbYXimXXbIYdbJAMGH+Gki3wLc6Ivv6nkBVrFmG9CjNoDsYLuoEsuK5mn8uIVW8yyt0130SPVvn3Gg/Vg0I7gWzcMuryNzugSenBSYIWU4w4PMsfrFRO9Rs6X3ReA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dkniLtMJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dkniLtMJ"
Received: by smtp.kernel.org (Postfix)
	id DA2DEC4CED0; Tue, 12 Nov 2024 15:23:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4666C4CECD;
	Tue, 12 Nov 2024 15:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731424988;
	bh=x8eOTz4PgDoeEfP0Yu2pU2jwPqtN+CxkteVhG3s2gK0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=dkniLtMJwH2YNTPLueiHwgvebcYDK3aB/648JvXIqcBrdJh+Mae73Y3hUVG2ljuut
	 1gNWhNnugCKUxIFuvcWgqsht+6NyRsvlhIxcTCAA92+PaBNNtIKgdsk4zsJfEBrwgJ
	 WIJsBVw/dBqnOXSV/ofK6jELdwLmwyrrOXy6IEZ6WCOSzBZiWc1XNgrrBmc0cvSFeK
	 THppCJvU7sElVTcWmlmehZKQKWFatV0VmbaCBLH0+ymJ6bw5Uxtab6r/TKT7mqdvf5
	 OuqJXLGH/frxW6r7v80cJ66eplfDSGzg6HGHrGDqsyZJXIYZk4e8RhAVieTgYG1g+4
	 8TB3xGDVFjBFg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33B5B3809A80;
	Tue, 12 Nov 2024 15:23:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] memory: drivers for v6.13
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173142499864.562452.14133104674182899183.git-patchwork-notify@kernel.org>
Date: Tue, 12 Nov 2024 15:23:18 +0000
References: <20241029075348.19580-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20241029075348.19580-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 29 Oct 2024 08:53:47 +0100 you wrote:
> The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:
> 
>   Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-6.13
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] memory: drivers for v6.13
    https://git.kernel.org/soc/soc/c/9753ab5b97b9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


