Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC3619B5A7
	for <soc@lists.linux.dev>; Fri, 21 Nov 2025 20:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763756538; cv=none; b=c64U91QgiqsPYtS9dyUQLwcJhzSXhSATDX2kE9zuY7+NSry8Pnisj1Ob1cuJgZTL9xzYqMrblv3PrGhK/y5YBb4TEnuc4aVAtooK+l+xHRsxCAxpKMVceLyQU5EfAO49wCyms9D2/9h1uEY4F3ig7rE5RkmySwPPOJqOkLowmTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763756538; c=relaxed/simple;
	bh=DNw81u9VKqzg2h2OUK+OLam3jwuiqc36HyNLxpUsD90=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Pimv4Of/i8/3RNpZUUG/gZYzQTA0G+gDxv98gNY/5MYEEPwHKbgqYjfiKZ/lG1z0UQJmCXCd9YYTizOLHsj+4jKSCxKIyfF9Z8CVzNtMUIcAMSaQv2b/FasDyx5jicT+Ipvt6VX+/n2f9duaCnX7hnUT6CFNiXVj2y5NxBU4do8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ogGDnu1z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ogGDnu1z"
Received: by smtp.kernel.org (Postfix)
	id 02BF9C113D0; Fri, 21 Nov 2025 20:22:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1394C4CEF1;
	Fri, 21 Nov 2025 20:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763756537;
	bh=DNw81u9VKqzg2h2OUK+OLam3jwuiqc36HyNLxpUsD90=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ogGDnu1zH+5ojAUCEbuW2Q2bxqrTy9vQy6WS12ARb/wlwcNeo1TUs/2hvxFyRJyHk
	 OTQzFyi9dmzewKrVRzPpNXc+sfIPn2HAR7r2FaqioFe894GpD2q/XNam8nYMBYzhla
	 hraGgpD/pTXtZEz2GMfoxeIpD1xWWrimcOH14IK+8RwG5Ky2N8xRnNXydDcWb/mD/w
	 mQzUr5hbbNnLrp+LCr6vKd7Ur1M1KBoDRlX86Hr9LW+8pGbfkwZHTu61s/RdlVEwMU
	 TqGqGcHn2LhiFXHSDvDKjOTukFmM1V+eO6D3sTSJjFhnvfojnKoD5jVfyZYVmoiHSP
	 VTS46OyiP+Jvw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADEE53A78A68;
	Fri, 21 Nov 2025 20:21:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V SpacemiT Devicetrees for v6.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176375650249.2571237.935600518297526999.git-patchwork-notify@kernel.org>
Date: Fri, 21 Nov 2025 20:21:42 +0000
References: <20251113180732-GYC0846694@gentoo.org>
In-Reply-To: <20251113180732-GYC0846694@gentoo.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 13 Nov 2025 18:14:50 +0800 you wrote:
> Hi Arnd,
> 
>    Please pull SpacemiT's DeviceTree changes for v6.19
> 
> Yixun Lan
> 
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V SpacemiT Devicetrees for v6.19
    https://git.kernel.org/soc/soc/c/441bd1568064

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


