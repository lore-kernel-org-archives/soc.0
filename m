Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7025263F38
	for <soc@lists.linux.dev>; Tue, 23 Sep 2025 21:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758662449; cv=none; b=XkJHYfC+bUKWU2MIlNEL/aSpOVFyrJJBCiScqB6DUY/l4IE/LdjzFpzGrMMxiJ9PQV9hg7VXUHqojlt24uY+g4U6GUckgj+XnAYAXpAOWXN/j6hLaj+K4giPdoQVNAC0KWcBrn5jTgaufSQoARWwlyIECkk0r5oN/gMfArRFanc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758662449; c=relaxed/simple;
	bh=t+KVtcjeFnCemJpnsP7pu/ZhPZGZsd/zJc3uFh2KhyY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=JKtSfpZ7XV9yT6s4grr/T2SAEUseuBFUW0I3in6S17YHWzVhTOAEqfmvVM65fJsLc/Uky9mS3cOCyRNkA84SQADsjneEqUGDaoJIS5iFC7SK58agj73pzz5nPzdHwJhwSQx14gU5Xk9kUm3pNyMX/891AaijpbEVj9N6VnhSY68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VIXjcZ02; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VIXjcZ02"
Received: by smtp.kernel.org (Postfix)
	id 994ECC116B1; Tue, 23 Sep 2025 21:20:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F21BC4CEF5;
	Tue, 23 Sep 2025 21:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758662448;
	bh=t+KVtcjeFnCemJpnsP7pu/ZhPZGZsd/zJc3uFh2KhyY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=VIXjcZ02OLD3vVO6yJSBc3pSXJlTFoNN8uJsVHzSrKeYpSYgrw6ZT3arFRIFED3Dt
	 HBlaT9LK3AkvsW0V+gU/YJF1+v+zFaMmFwYevuKJW5dspghOYfcBNsy6+Xu9u2vkoY
	 dTn2iKZyfXg/ODFkd9AyOyCBVGffu47KzxAiQ8k+P2zDLcmeydRITSa7h2TC9UlrZD
	 yVTDBYN239KGrY4vYYXJpzMq/+epjqemn3Ak/BRxPqK+vW84kxiMGcLMVFJ9s1BVxB
	 0xwSnfTCaBC3oWglY9kfK5NVTBKKboIW56HtfNuu9YKkBnNLiwa/224fQfs4/n5hSh
	 A1tJEzJxEe6Qw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADC7339D0C20;
	Tue, 23 Sep 2025 21:20:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm Arm32 defconfig updates for v6.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175866244523.1926563.9668880718308329402.git-patchwork-notify@kernel.org>
Date: Tue, 23 Sep 2025 21:20:45 +0000
References: <20250921020746.596400-1-andersson@kernel.org>
In-Reply-To: <20250921020746.596400-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 20 Sep 2025 21:07:45 -0500 you wrote:
> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:
> 
>   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm32-defconfig-for-6.18
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm Arm32 defconfig updates for v6.18
    https://git.kernel.org/soc/soc/c/4a77e9ed4e27

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


