Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C9120899C
	for <soc@lists.linux.dev>; Wed, 19 Mar 2025 22:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742422299; cv=none; b=R1uZeTYN0KTfcvltbQVY2zCkcY8DcJf6a9MYuhSb7rFRp5BI7rcwL/rVuUC505HUfI4vAgvMcUiaq4znoi3mmNZZ0C7jb0hHUKyLVex3IhMYWCtBxbG6v2VXgI5kU67ePdkDsTgkwPZ2KQs114DAdd40QHCJjIIo5sslpzUt+ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742422299; c=relaxed/simple;
	bh=eVr/Yjv4rT0tq9ye8gY9mRVslLrNje4ku9Ee3UM7d7A=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=chjb2gFQtEM9WHqKRr+oIB0JxhmVEBeLSzNRK0OzN2lqjkewLcTMbfT9DPyQ5lDQxixg3WHyebIDF+F5+EkrauSq+KFBFxO9njZP2XgzmRbISo83DfSIu2X27VgI0CQ6kAQ+uHyfttSgp6u3rXYic/l94iqCZs4njv3UiGxSX7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e/e/JceW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e/e/JceW"
Received: by smtp.kernel.org (Postfix)
	id 10FE9C4CEEA; Wed, 19 Mar 2025 22:11:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF85FC4CEE4;
	Wed, 19 Mar 2025 22:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742422299;
	bh=eVr/Yjv4rT0tq9ye8gY9mRVslLrNje4ku9Ee3UM7d7A=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=e/e/JceW52IP8N0rJNt+eXzqpunKjE3BSsu7GHyiG/Jjd3ZHSP8n+bUTX677s/mbt
	 hzvDMCk3kiiqPHCE+oU/hIAkPvZ7dGJoOp3WsZX+ovwNNXqXb05QT5VwL9lCbo1N/I
	 zxnUOIspq1QD5an5pecl4k7brsTF+TrjT/qrcKNzKSvwddN3jN+x0z9yw3xLhl/utZ
	 mLjRlUm6FsuPsVcm3SAWDF5K967YfExFWrwQS/syfYgtwYwD8Tu5KMV4QySUYTrGsx
	 3JC8x8tKvi1+17btNgjo1ANxXhpKyQ10R1KoPnmQ6QVT8YLtdSKvXAvutsFIsubgpH
	 D/mh2eXJFVaPw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EADC03806654;
	Wed, 19 Mar 2025 22:12:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] soc: samsung: include linux/array_size.h where needed
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174242233449.1211847.4604453842019098912.git-patchwork-notify@kernel.org>
Date: Wed, 19 Mar 2025 22:12:14 +0000
References: <20250305211446.43772-1-arnd@kernel.org>
In-Reply-To: <20250305211446.43772-1-arnd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>:

On Wed,  5 Mar 2025 22:14:02 +0100 you wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> This does not necessarily get included through asm/io.h:
> 
> drivers/soc/samsung/exynos3250-pmu.c:120:18: error: use of undeclared identifier 'ARRAY_SIZE'
>   120 |         for (i = 0; i < ARRAY_SIZE(exynos3250_list_feed); i++) {
>       |                         ^
> drivers/soc/samsung/exynos5250-pmu.c:162:18: error: use of undeclared identifier 'ARRAY_SIZE'
>   162 |         for (i = 0; i < ARRAY_SIZE(exynos5_list_both_cnt_feed); i++) {
>       |                         ^
> 
> [...]

Here is the summary with links:
  - soc: samsung: include linux/array_size.h where needed
    https://git.kernel.org/soc/soc/c/4c57930f68d9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


