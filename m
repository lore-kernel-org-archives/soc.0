Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14CF3221732
	for <soc@lists.linux.dev>; Wed, 21 May 2025 17:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747848027; cv=none; b=pgfpZ/OhIlO8zKDpn0BKOXqqNAmE+8rZDWI8QTccPmiSUyo2e0q5WJiIwq4A4Y63RQ1vZN4AE7T/vHOdN+JmcMxjMhk4ZLoWRNY4DdbOMENBq7t4JdrFiIFZv2fqBm7kKeQq6ZsSqZgyZvu8gRj9gS5Zo1bVBc8NrcNb9OQG2uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747848027; c=relaxed/simple;
	bh=VPghkNvjbrnX+0JFhY1mJ1Yw5QsO+XlZBxzCk4OM2EQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=N8gC9E43iyUUqdlHfw7ydDxJfE3+zbqRT1NRY5x0rv6D+ZoDC9HlsHPzCAA9OtEJJN39dfS4a2ZyZmptUxt/RzlZjHR6aqlMZgIAU/0efCU8Qweh7FYwBsHYWk/WCazev1UFnSVDC9BAsoVK85nOAzybq3Slw+NJuc2KkAsOkcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DW8jDVcU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DW8jDVcU"
Received: by smtp.kernel.org (Postfix)
	id 9B037C4CEE7; Wed, 21 May 2025 17:20:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80A6AC4CEE4;
	Wed, 21 May 2025 17:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747848026;
	bh=VPghkNvjbrnX+0JFhY1mJ1Yw5QsO+XlZBxzCk4OM2EQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=DW8jDVcUhPSpgG9QkB1PpcUaAkEYMoUPWLX0Sy5OZvniKANwFgEc1e5x9yF70Oa0g
	 KdJHzjgoauWEv72lXQ9U4Au5nPttn32AkiBqaQpR7S+PXKpOwgZyq0PAs9eGswx7AJ
	 Dvk25LwqfM0RQVqmBuvac7vN9LOd+4wZvoe5KlWTOo5/+9kjyTKiJvvZMgPVmQPgjn
	 aFjdV0YMThwPfT+jZfoXGWk8LJEga35vEihqHxy3Y8gbR3IhPv0j2epNbky28I+IPQ
	 dpOBHGY3sZ8JP9hNcyby/TrIegtOhzfgG6YVNTsTcG9nECaMUQDgvhqskbSOhlvA5h
	 nNOfn/6zLBM9A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70F1D380CEEF;
	Wed, 21 May 2025 17:21:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/1] arm64: dts: blaize-blzp1600: Enable GPIO support
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174784806199.2163178.14466400409950742245.git-patchwork-notify@kernel.org>
Date: Wed, 21 May 2025 17:21:01 +0000
References: <20250512133302.151621-1-nikolaos.pasaloukos@blaize.com>
In-Reply-To: <20250512133302.151621-1-nikolaos.pasaloukos@blaize.com>
To: Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 12 May 2025 13:33:17 +0000 you wrote:
> Blaize BLZP1600 uses the custom silicon provided from
> VeriSilicon to add GPIO support.
> This interface is used to control signals on many other
> peripherals, such as Ethernet, USB, SD and eMMC.
> 
> Signed-off-by: Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
> 
> [...]

Here is the summary with links:
  - [1/1] arm64: dts: blaize-blzp1600: Enable GPIO support
    https://git.kernel.org/soc/soc/c/c07da6de0eb8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


