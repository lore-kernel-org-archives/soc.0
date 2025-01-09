Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8F82046A3
	for <soc@lists.linux.dev>; Thu,  9 Jan 2025 22:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736460722; cv=none; b=Nov98o+2A8VqSYHEtYCeQJ9BLanUPCAOWK/yUo6JsC+PIwTH4iak7xWPbIVsH0KvBqOHs1N8H/Hg8nhkOaaewKXL+SSqIDjRT+1nvTC0AK3oxAIfosd4M3DDiTeYoIEfWTtdqCeRd02BfFSY/UHe6xQ79J77sItLLNgz/stbp94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736460722; c=relaxed/simple;
	bh=2tW9ezPrV4s5QlVwDNID4XvMAuyhwQOJbs8ZAv06do4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=RT0bJUPVQU1j8vv6Mmo7ll/Hqmz1CKX++bHR62/JKUWMCRgu9NlKr3kcF0dOSNyiDQ57VM0bexU01EYiF4VUEQLsLrEOJ5hHP+cNQjP7ufwr1ajsRj+EvFjmcFW+2RvxVp9jNaLywtUrmcyTv0yqNxqLvAWQHBLfjFLEfr5ypuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YhmqTKkt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YhmqTKkt"
Received: by smtp.kernel.org (Postfix)
	id 0D9AEC4CEE1; Thu,  9 Jan 2025 22:12:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB568C4CED2;
	Thu,  9 Jan 2025 22:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736460722;
	bh=2tW9ezPrV4s5QlVwDNID4XvMAuyhwQOJbs8ZAv06do4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=YhmqTKkt9+M26wcj7hF6ECnhpx9QX4Uo1EeieGwVBizOoy4hjtWlEqmL3E2YF4byK
	 rURf9TgGmW7hSL00dUryE3frLMoySCh12GmFk8vsWN6v4eO+LQzZFjnJTIf/fwq+eI
	 1S0KZRgMMBx9Vbeq5U8xmQ/5HHxq370wpUwNINUUUe9TKC2sHlnjPvCRzk+T0E95ru
	 PJgoyMRQG3MnFMip/0FKQ6tB2H6VUIsSERRdVSB6JFiOBHyJ/V7YhBvoBnEQnoB3IO
	 fmrylzS77C/BvjDWLp2+lxVoI9EqZ8LIgzdY/SMzd9UmU9adiMSaUo2fTSPEWMqO9c
	 O+n8qx9ENKUIA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAF12380A97F;
	Thu,  9 Jan 2025 22:12:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm Arm64 DeviceTree fixes for v6.13
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173646074342.1523525.13791694188959593696.git-patchwork-notify@kernel.org>
Date: Thu, 09 Jan 2025 22:12:23 +0000
References: <20250103024945.4649-1-andersson@kernel.org>
In-Reply-To: <20250103024945.4649-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu,  2 Jan 2025 20:49:44 -0600 you wrote:
> The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:
> 
>   Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-6.13
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm Arm64 DeviceTree fixes for v6.13
    https://git.kernel.org/soc/soc/c/627522c8bf4b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


