Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B0E378838
	for <soc@lists.linux.dev>; Tue,  9 Jun 2026 12:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781007009; cv=none; b=KTtQuDCPrZu61BVpGudL4NN3jBdvAnSGQ0d0jEPuhqrE0sMzf+ziOjkiAiuLQqOZFpoO/ANzIcUl0PYS2mA4gSBmRobjOycmS/SslL723XIpoHyQeopiFl/CEiBW08cLVkaFdeAQ53muvsM9J3mmRmERXL9quzxptmjCtEtx7rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781007009; c=relaxed/simple;
	bh=U0n10f3fl4wuVMQd859MHQBm8k8fF68E52kVmvSsknQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=rFQ2oq6NWnCcz/B/x7rVgX/uP0x0C1wUcjCQfzwmDmkKAlUNP+U0Uu5TgyA+354wSiZzbqG0Xqojz2Xfb9VspjPZzfrf/2zsK60ZbVw7aZecquWvTaR8rU/zrtihDi5+kWh94YNF/xLORLHLBWGQJ1Z9f5SHvyuykXIqBeL8wuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=czm6Vvxi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="czm6Vvxi"
Received: by smtp.kernel.org (Postfix)
	id 058461F00898; Tue,  9 Jun 2026 12:10:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3F301F00893;
	Tue,  9 Jun 2026 12:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781007007;
	bh=3br3mxfX01vSKb0rDKPkezsOuSeTgrdhrkwKYhNDlJA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=czm6Vvxid8UODlqsWWv6DdxWSxIGPyV7YVQY6GHZIv8ZQhWhmjREoz9hd6va2ZmDw
	 bRQvDQYTFWP+IJNzJkWun3BEQJKiSz6M+sYv6sg75z1zeyLsv9Kkw0qbQ6hFW0B9DH
	 AsZeqZ8LN8sjQQuL3YoUWFFfPh4eGUo9cXJQDraQQiIwggYoiibcob7//riTyuJ2Ua
	 Kw9vHclJwTb2yf4Nv+zSc41owJr52yM2iRCjCYVjBo6an2GFfMuCFugUSG29DotoJd
	 urqQl1apvEB+0U69UIrU8r5k5T1sAeTDRJEMfAohdQxhkOKK+ksX4zszRz7qi6DVmi
	 tZKidkFCMKGxw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 9399939308CA;
	Tue,  9 Jun 2026 12:10:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] i.MX arm64 defconfig change for v7.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178100700615.1991839.1733591992806008402.git-patchwork-notify@kernel.org>
Date: Tue, 09 Jun 2026 12:10:06 +0000
References: <20260608153615.2274186-1-Frank.Li@oss.nxp.com>
In-Reply-To: <20260608153615.2274186-1-Frank.Li@oss.nxp.com>
To: Frank Li <Frank.Li@oss.nxp.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon,  8 Jun 2026 11:36:13 -0400 you wrote:
> From: Frank.Li@nxp.com
> 
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
> 
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] i.MX arm64 defconfig change for v7.2
    https://git.kernel.org/soc/soc/c/f044d8021c0c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


