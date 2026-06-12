Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B1C3DD51A
	for <soc@lists.linux.dev>; Fri, 12 Jun 2026 07:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781249412; cv=none; b=ZCdXrtbTXutX1/WjHrKAo6SY9dWWILJoIkPznEwtNJeF/HX9D86s7i+BN4dS/8eEYxArobmISWtMgZpyGbMuD7h3iMmDbtfbCn27rn5x9Yc9O7I8G3YNYewZ5cAkeeCuQ77xlaE8IYJR104qnugvcaEmqcUfkvpbyEBpN+BjSwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781249412; c=relaxed/simple;
	bh=7l8koMUQJkQuNeaQ1hUG/jG0N9x3eVq4tbtCzvk7zL0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=QiFcR8FBz5GgpsM7Nnsxz+Og2UE+dxMxCclayIClzhA78X0jNzt4o4aiy5K9p/mQPZdOJJHl9895K4vRjcPYYvTZmOuE5TmPeKl3NUvJP/iYx9HXI4bKrDG7kqCLcU0ZBvUZZ3gkG/YkdJ+R2bvoGQC8QsB1AsPwzEK3f/gQmIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SP7NHFnC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SP7NHFnC"
Received: by smtp.kernel.org (Postfix)
	id 3C5E51F00A3A; Fri, 12 Jun 2026 07:30:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24F381F000E9;
	Fri, 12 Jun 2026 07:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781249411;
	bh=IRdweQ1UF92KsXUl6nsuvBr5EoLcDleC04qDYjjdeB4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=SP7NHFnCgbDlCnlhrSWxUJVGAKXJnCMDpjlnAwBojrBtB2ZC3kvZ2PXwzKXy5H3xD
	 r4/qKsAy54twzMkOTDhPn00l5FaWqvMAJ5f85kJSr6oKWX6oMPs/sU4k4d8ydYnSQK
	 rAdzAtbDXkfQQwqF+IztYaftI/jHFZR+dXMAykzaUsLVHB50AY/Pfvygp3gdl+tgDy
	 uNEQ1PvwaqmfKvg/0lcVFuwHsRafoYO8kSslA/P2oSgmnzHl4cQ1zH3hH1SHrRIk45
	 UPdYS3AJ3bLS0l2yyeLrKbZUVqr4pVDS6YCgGAZMNIOg9soqhIFs4EeTHFQoT2uQ6h
	 fa3BWFZR3ot4g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 567B63931000;
	Fri, 12 Jun 2026 07:30:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL]arm64:Add eMMC controller support to the BST C1200
 device
 tree
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178124940788.526649.14761245051789599059.git-patchwork-notify@kernel.org>
Date: Fri, 12 Jun 2026 07:30:07 +0000
References: <178124706736.583168.7192372166865774364@bst.ai>
In-Reply-To: <178124706736.583168.7192372166865774364@bst.ai>
To: None <gordon.ge@bst.ai>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 12 Jun 2026 06:51:07 +0000 you wrote:
> Hi Arnd, Thank you for pointing out the mistake.
> 
> ---
> 
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
> 
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64:Add eMMC controller support to the BST C1200 device tree
    https://git.kernel.org/soc/soc/c/c936d730575f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


