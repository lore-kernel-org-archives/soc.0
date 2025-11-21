Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44858272E6E
	for <soc@lists.linux.dev>; Fri, 21 Nov 2025 20:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763756553; cv=none; b=hgHg6jvyC0CzaA5nNTRzE+P5pOofXGnZQjgRKtl3ckn5TQLiJdCSsricgVjUSsg+7B1Dx9eAy8ICW1m9WQh8iAXROrht9segAGmngkXUf/JDOwJTERLBXnuRGzHuDmWCI6RzoG8tWFn1G0XxF1Jon6K1QUwpSh02SvVbJFe+9jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763756553; c=relaxed/simple;
	bh=YBnL5KMyAIbrXjdczQBoLLwG0YLSSIWsZlJW/oMF+W8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=U7wbp2BiwmCa3/lHVaVz1qq3XsAVP3jTGFf7r67hFOTwKFGNfivD9z4O85HCnRc1SvhSauiEqVqHT6eD8R6sRIsxZXYpo9+PfsPLYDyqhj19uakU5gxxVsszVliq16UuvhFqAfW2iME+r2xxPcE5XTEO+gmmOZ4XGP+zJhDIG4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D/U8UqWQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D/U8UqWQ"
Received: by smtp.kernel.org (Postfix)
	id 3A27CC16AAE; Fri, 21 Nov 2025 20:22:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2454DC113D0;
	Fri, 21 Nov 2025 20:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763756553;
	bh=YBnL5KMyAIbrXjdczQBoLLwG0YLSSIWsZlJW/oMF+W8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=D/U8UqWQaWjzsmiJ1UGJop7yOnI/0GpmnMk7XMWbTb6xBBpmdbYb5C25dTEV+NCqv
	 Y0UgITEiky0uCndlwUUVCo6aI0rY+1mBc70/2p8acfCLyko0JniO/lFL96lEs/5jL4
	 JWaHLgx6FEZKrsboxpFXJ/ixKKUF/jIFDPlKdgG8ZrRX6ViX+BsCIAvcA/t5RV/73R
	 2wapienBgBx1cd0mqnT6TTZRhzuBI7cCrAiUa8laaZUUBUIIUHjIZ+1PHMQo2AboCf
	 vf5CxZa6RQ1eQnzLcRYnMU5ClwUoeEo3T3jMk8UlPQwG+rNWuSZIrthQNSuIWHcmQ9
	 0q7R9sF07Nf9w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EADEF3A78A68;
	Fri, 21 Nov 2025 20:21:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] PXA1908 DT changes for 6.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176375651749.2571237.17534372290059214487.git-patchwork-notify@kernel.org>
Date: Fri, 21 Nov 2025 20:21:57 +0000
References: <5048490.31r3eYUQgx@radijator>
In-Reply-To: <5048490.31r3eYUQgx@radijator>
To: =?utf-8?q?Duje_Mihanovi=C4=87_=3Cdujemihanovic32=40gmail=2Ecom=3E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 23 Oct 2025 22:13:45 +0200 you wrote:
> Hi SoC maintainers,
> 
> Here's the first batch of PXA1908 DT changes for 6.19.
> 
> Regards,
> Duje
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] PXA1908 DT changes for 6.19
    https://git.kernel.org/soc/soc/c/6ef9a6fca74f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


