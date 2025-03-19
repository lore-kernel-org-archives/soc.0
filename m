Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B0A20899C
	for <soc@lists.linux.dev>; Wed, 19 Mar 2025 22:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742422310; cv=none; b=MXga7YJEt0rSopWNKhqwjtzBzph6h/vxyzcFd+PWANXtpWPZ+BZWjYZLRmBYbRn2G+C3AXDgUT6fS17krG7dtzYwotfA4iRSKFz5YrgGlYrjhBdJhUM/gfbXJcfyRYZ3zekthVTG7Z5uVljdQrdwZzJ5+yg4qw/oLNNt8aKYHTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742422310; c=relaxed/simple;
	bh=Prgi9bRSIgXBhCvlR/JhzGCab3hUezia/PDAAnH4EH0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=CvIt76EsHPZBWYX3tzo6sg01+RWPMlT1WOApiecctfsaCRM5KBor5Cyk/RCQXPm0bham3/BF5ri0jCPh27r7OfCSfEWCjDJ+c2SkEXoab60cPzLcDwjjugzZLaJ04OclxfRDrqWhb6CJkUj/QUiLIuHBF7srKbdpRvlHE2kbtEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=REDj+7c0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="REDj+7c0"
Received: by smtp.kernel.org (Postfix)
	id 8E61BC4CEEA; Wed, 19 Mar 2025 22:11:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78B5FC4CEE4;
	Wed, 19 Mar 2025 22:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742422310;
	bh=Prgi9bRSIgXBhCvlR/JhzGCab3hUezia/PDAAnH4EH0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=REDj+7c0zSJsgbLWbdjI1vWBr6sDXKjpv13IPEBbAKZljZlO95qOQHBtN5MPYHPKa
	 F1DBRtzeqZH7dccZnqYewL+tyMexwIdYenMVkezZGnfdKBh3Bl5oG1eXdX+SIYBAxS
	 QnPLd1F7Y27jF3wuVKJzhOUzHsQfnIjx6aY43BytQExacrRb84iH8kV3VrKsMG6xBz
	 moURWJbtIWtIpE8/SdhCSE2eLNYPz9e5evtuQ5N6f05F/8A0OtsWbHeeftRbU7ZYRV
	 jGNZUSgNsFYOPX5x4NNDM/M+ZoQscHfEab70TJjBfUCYnxjYnfIMjs60zPvn7Hj+WO
	 eU5uG7vYz/tsQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70DEF3806654;
	Wed, 19 Mar 2025 22:12:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] memory: drivers for v6.15
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174242234599.1211847.5693211019868528704.git-patchwork-notify@kernel.org>
Date: Wed, 19 Mar 2025 22:12:25 +0000
References: <20250316143503.17620-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250316143503.17620-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 16 Mar 2025 15:35:02 +0100 you wrote:
> The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:
> 
>   Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-6.15
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] memory: drivers for v6.15
    https://git.kernel.org/soc/soc/c/3603d920b2cc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


