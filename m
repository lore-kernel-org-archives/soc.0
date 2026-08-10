Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0772B3AA4F6
	for <soc@lists.linux.dev>; Mon, 10 Aug 2026 09:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786352461; cv=none; b=jRKFa+mUH8QrF1DHD2rsSB9oKhNNsxbRp1AhrqRorqD/zLPq+M4E7Qzrex2gLTpfLk8scAbNhTf2n0MYGM8CkuBGrzURKxcXLyer0b67JPCFiJE5fcZ7BBiHsH7kmV8YkiwJ/VAS8BPsE6D6xidO/k/K1+8M8Pr9aLRye2uxpbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786352461; c=relaxed/simple;
	bh=x+l5a7hy7kcFFU9vfYY5H7i4h+W61HEeizqnUNA03SU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=GaaWe3+LRhf2cx6D6q3VuatcOCXmbrahlswkq27z5owRomH56NwDmFFX4yX8lFTqatmSkqziyfzXi5Rcm6C7ELiquGsY56mD6CfAZOkgfU/exwBh0pGGvhSLJfWu1WFHy0Y++V1p7dtdicpe5xxtdGrDz4yBzLeTKTPVofg2Y/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WqGa+dM6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WqGa+dM6"
Received: by smtp.kernel.org (Postfix)
	id C4F401F00A3A; Mon, 10 Aug 2026 09:00:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE3AE1F000E9;
	Mon, 10 Aug 2026 09:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786352458;
	bh=koYX6fGPcSifv4AR0Aqc8Fc4nXTBaY2z4Vx1jT8q0Yg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=WqGa+dM6keszmqLMQXkMzRNhem3QGTZK+WhvWCL0vXLzPDCMo8cLs7Id2xk4kqZ/4
	 SK5K19NMCkIUlYnvWDkw+DKyE2kT4UUB6DDjtfllL6zdp9uR6G/ma4dg9ZdATbl/z/
	 W3kVIrZDq86rQlMA7OJoXiXSM4TmKMm1SuG3UYVRErnzt8p5y67B+bYvbOWQwkAXDg
	 +CyarRshsWApRXhKj3Xi8e4WAhgP3Wn2ztg02T94WRmIjO9Vm02rlsjhDU50bYgP6D
	 YxA4D4PfZZT4r5fB9Yf1t1ykHcrPQvbr9cbeq4uuE8zss3mFtPat3VhdVaRrNoXlj7
	 cXNfDldsbgH0A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D09B43924FC2;
	Mon, 10 Aug 2026 09:00:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL v2] arm64: tegra: Device tree fixes for v7.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178635241540.3658557.14300274371645513973.git-patchwork-notify@kernel.org>
Date: Mon, 10 Aug 2026 09:00:15 +0000
References: <20260802163936.1257450-1-thierry.reding@kernel.org>
In-Reply-To: <20260802163936.1257450-1-thierry.reding@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Sun,  2 Aug 2026 18:39:34 +0200 you wrote:
> From: Thierry Reding <thierry.reding@gmail.com>
> 
> Hi ARM SoC maintainers,
> 
> The following changes since commit f5098b6bae761e346ebcd9da7f95622c04733cff:
> 
>   Linux 7.2-rc5 (2026-07-26 14:45:48 -0700)
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,v2] arm64: tegra: Device tree fixes for v7.2
    https://git.kernel.org/soc/soc/c/e36c0670d5eb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


