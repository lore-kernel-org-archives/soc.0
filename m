Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3831235073
	for <soc@lists.linux.dev>; Fri,  9 May 2025 16:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746807005; cv=none; b=YlMhyXx3zuyS+z7GRlSFsRm2SlvxT+G/C+jWZZh0iLMtBV5wDZHtonbAZOPTCJnAyvDpBQV9G51G7JGDGlizN+QpjTcwo/+dmMKMytfE3LivadsclckZlRaG6yDmH1xWKHYCMUeJnAdWkOsATXlKO9+rwfwpAhGtRYu6RpTc0EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746807005; c=relaxed/simple;
	bh=m7Mc6neY+xlkuM/TLKIP1HvWnuEiIMLnODwM/VLwavM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=TFTAgpB9hFTtIA7jBHFk9bPFEi3NTnQZfFAIzKItTVsfeFQO6H3+/xtJwmhW/vGA20y/Zmw2Rzl/scZ0Sg1VNeyN2Qo1h5wuZ7A4zVE7d+mBXN7k8GTJY9PdLp6PEZFkDTZpd7U+EhGXXc4w7NIK6Qv5osU459SGXR+60LIfblw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VxqZXNGh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VxqZXNGh"
Received: by smtp.kernel.org (Postfix)
	id 5F23DC4CEEE; Fri,  9 May 2025 16:10:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49749C4CEE4;
	Fri,  9 May 2025 16:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746807005;
	bh=m7Mc6neY+xlkuM/TLKIP1HvWnuEiIMLnODwM/VLwavM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=VxqZXNGh7etmpoSPUIrI8s35si3NZLDrHNAevNeWho5hyfmBYU4sRLxFStOyVGfIe
	 FlTQalUxsUqtTYHlA5dPk636m1Lah67exaJUX6kt6qd9mE9qnqLonzwodRj2FLGvj9
	 OL3PtgQujLbO0pt1mOmdselmu/5Pv0I3SKiFjoFMJxfKiEGNUVChhCNPgBJY/Fvyu8
	 N+jApZPLY1KrcLO7+dvhHX2q1N++JqyfcM1PT+arYsmJa6NZ9DziHLnj7bI//fNZDq
	 +7yEgr6UKi3NWYmbnfFeQXtQxAUDS2MXNBUxXBcvkrgTvAzYgvGNlJBWybdjnrjs9H
	 5X6zMP9KgXHHQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAD5D380CFFB;
	Fri,  9 May 2025 16:10:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Amlogic fixes for v6.15
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174680704348.3673480.2316991222468934597.git-patchwork-notify@kernel.org>
Date: Fri, 09 May 2025 16:10:43 +0000
References: <e9c520a1-b986-49e1-b9b1-67511c187716@linaro.org>
In-Reply-To: <e9c520a1-b986-49e1-b9b1-67511c187716@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 9 May 2025 17:45:41 +0200 you wrote:
> Hi,
> 
> Here's a set of DT fixes for the new PWM bindings migration, and missing
> audio nodes enabling for the dreambox DTs.
> 
> Thanks,
> Neil
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Amlogic fixes for v6.15
    https://git.kernel.org/soc/soc/c/e36f6de6adec

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


