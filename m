Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0722322258C
	for <soc@lists.linux.dev>; Fri, 14 Nov 2025 23:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763162569; cv=none; b=FIPuuZRSIRSQVeQHht/EhwxpUPeL4e9WvUE4dTvJ9RxK7yYMkNNQqw9qCRMcrALr7glcF/TbddrBeFr7cAxwspzOA13u/PWWa1WhYLw5w4lwhfr3USJG++mc0+09lvAnKOfAfgoBR/8cBBBYIqlnY45YjUSWQEx2w4gCi8qb5x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763162569; c=relaxed/simple;
	bh=5hG2LmgwKcPvYT+/CD6RvgYaqfLrHosddYNGd4nziBo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=CkQ46fPzjYqxTYCYogAZ7Q/1b++Hz0g7qnAu31i3bt9Rs3w58OUx60FB9nQrhwZj1maHpAknGowy6oL7t3rfC5i4Yl8mUlJT93Zvu5kz7Swc9S9MtHjnlxwFLNN7B0GrJJjmOkcntBKWwRGi1S1BegwM6r9s15HJ7tz2YNQCzFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MJTKPS/j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MJTKPS/j"
Received: by smtp.kernel.org (Postfix)
	id E283CC16AAE; Fri, 14 Nov 2025 23:22:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B665DC4CEF5;
	Fri, 14 Nov 2025 23:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763162568;
	bh=5hG2LmgwKcPvYT+/CD6RvgYaqfLrHosddYNGd4nziBo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=MJTKPS/jShkcR8tovjJe2uh+XiDTQCOVaiG5NgHiFsZQ8v2+oPoS0Gy+tFhRVfwV7
	 xcg+5atlQyKEZsQkVtksyEwk/k0kwUBSdUT/WfABlbso1FIzgf2N8U3jFLVCG7mpB0
	 LZpK1xqrXg9Iv4YQ0ZEDLtEgtHcvp/IMfsNHW8TPte0wTg0EFBhid1kCHo5VMXC6oL
	 p1TReMUxT5UDcBiKVRg9mKFkDe5OFPz2J7W0jL6WFJ1P2tYQKlzalSxUjOFdNdHfv3
	 eHfZNBiOr+kCDMOddchViUjRL2VJE6eh1budd7TOqwkv7vWvyglymB9vU3v1mfTs3e
	 sLkCF3xRBUSxA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 341B43A78A5F;
	Fri, 14 Nov 2025 23:22:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] memory: fixes: dirvers for v6.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176316253674.1867843.15957207532458798374.git-patchwork-notify@kernel.org>
Date: Fri, 14 Nov 2025 23:22:16 +0000
References: <20251031134910.78436-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20251031134910.78436-2-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 31 Oct 2025 14:49:10 +0100 you wrote:
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:
> 
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-fixes-6.18
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] memory: fixes: dirvers for v6.18
    https://git.kernel.org/soc/soc/c/64bdb49f2dc9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


