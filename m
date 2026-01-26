Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCD324A07C
	for <soc@lists.linux.dev>; Mon, 26 Jan 2026 21:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769464227; cv=none; b=M1nvN7DPnLfQKZeHpHyy7J7fIeTc3tw4M/FkLWHHAX9b5U2wK052kiJPD8WEbIUxFjb8lLoDFgB3kq8t0s2QrY6wYED9TvMAIs2AhWHV44ZOqbbGoxW2SmkdcL0Y5l8XwBc/b5KXZ+u7hQPL/Hv/Iff5hX0i3QlEWfLMeT4IUvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769464227; c=relaxed/simple;
	bh=qS9fgrU6WBr2FOLO2ALpWuFSjQNMcez9KDvy3cpS3tg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=S1fYVXfyytigNuVQjMDic6cclLPg/ffnxGTQLqQCm4SjTeOtvg+9HaphZPyRn2ihJTb0N+tV3yoXbxz3JabRFF+7BI6vEkvdBGzkWal91qV4bdeKM9ymp9zltddP8HPocQ/v4hzM+fLbab87UJL1bB7h3rFaNzYaJ5tU29m4TuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A5eaVjhf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A5eaVjhf"
Received: by smtp.kernel.org (Postfix)
	id 90C33C19422; Mon, 26 Jan 2026 21:50:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ACC7C116C6;
	Mon, 26 Jan 2026 21:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769464227;
	bh=qS9fgrU6WBr2FOLO2ALpWuFSjQNMcez9KDvy3cpS3tg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=A5eaVjhfQLkYwGLkSmGIqxWodMO2ZQW0PR3FYJlLaxTy6b55GbL8OymwrbDIhJIbS
	 V7L0zJg2kagj2+zyfVeleANIEtqhzcjbEfXeoAtqAfnwsQH3bpaJUsg0MQWvjH7R+8
	 T4IWvnEmW8vrkeOAlMsOXRFgAheLcaSAydRZHcyARIDmeocaRYvN6+dD1fLmtQzni5
	 1x/MadR/vXY+W5lnTpuaWXYJp19bB6XsIrDtcrS8DR662GUnhvNIopZuQuA9U69TDT
	 WxO9rUBXzpyCIaZJuPozBzxH6dBHEEVlz9K63iH94ou+Msp8WlTAW3v6zya1eBqGKg
	 WhnadXBCnqSNw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 11C6A380A958;
	Mon, 26 Jan 2026 21:50:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: dts: samsung: Drop s3c6400.dtsi
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176946422157.190855.11889331267717629215.git-patchwork-notify@kernel.org>
Date: Mon, 26 Jan 2026 21:50:21 +0000
References: <20260117182257.14799-2-krzk@kernel.org>
In-Reply-To: <20260117182257.14799-2-krzk@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 17 Jan 2026 19:22:54 +0100 you wrote:
> From: "Rob Herring (Arm)" <robh@kernel.org>
> 
> This .dtsi file is not included anywhere in the tree and can't be
> tested.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> Link: https://patch.msgid.link/20251212203226.458694-7-robh@kernel.org
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> [...]

Here is the summary with links:
  - ARM: dts: samsung: Drop s3c6400.dtsi
    https://git.kernel.org/soc/soc/c/d5e22ed44b0b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


