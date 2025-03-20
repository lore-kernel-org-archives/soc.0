Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815CB221572
	for <soc@lists.linux.dev>; Thu, 20 Mar 2025 17:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742490606; cv=none; b=qIZMZJYwS9kv6xMdAs6aAMSy3FNrBMrqXp2/udlu5AWLL/tQBmeD5LjdugfuXzVLLWoKUHs8BJdD1/+7gKv0wlw/QAXean5f3NseJxb0AxhafubKEASKNRDZQQqJh1Vq442npwguozT6eeHXdFeMHX5nPwzMYY6NDW9BMZ3RRl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742490606; c=relaxed/simple;
	bh=mFmJC695wFxjCSzYmExVb3/Rkm9jBert+oMN4kaUuBw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Wy0kyj1ap32Outu0szRLlYIifknBH0ZyBBTSCKNPnvgG2PB8edbfKqg33Mrbl7BZG/Xtho8mQhhjOsDvrzBcEBXLj6kIk37UYMW1L4JPwmj4s+yxzK8lWVA/51WZadcXbSwW4Q2XndrVHPggQCimiPiQzqY2woPM0vlxIVLdysU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QuH8ql72; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QuH8ql72"
Received: by smtp.kernel.org (Postfix)
	id 77647C4CEE8; Thu, 20 Mar 2025 17:10:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61F28C4CEDD;
	Thu, 20 Mar 2025 17:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742490606;
	bh=mFmJC695wFxjCSzYmExVb3/Rkm9jBert+oMN4kaUuBw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=QuH8ql72qmvKoRmL/82jtXuHNCWEYV6Zc4TiW884ZMsLo9x9/oNat5CYzyZ8Ex8fL
	 Q3v+WXb3et+XtKz8AAFAxPHKUQxNcMIy79mdWz0x8SANh0Y7poj1KbCht6SVlgvY2g
	 cKKtzrCuOP7/mrn3IrvTzPeawLpQp9kFRTFp/IvOfCIJv/6TFcBG+SB6gaQoZ3hKLn
	 cys9MLT+KAPj7zVsan3wzxB/mMvzi9hg8OpG1VCqmc2KVvM2XKf+IBTJpBb2VsT9xb
	 sgZn1DmVBdaMtsBNr7Kdg/J1ooT09SoGy1IXlHFbDFqHcUSgN59ZLVnGRuAQSSjaw4
	 DuQQJmzius25w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 72F993806654;
	Thu, 20 Mar 2025 17:10:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/2] docs: dt: submitting-patches: Document sending DTS
 patches
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174249064199.1843567.5989329978132836009.git-patchwork-notify@kernel.org>
Date: Thu, 20 Mar 2025 17:10:41 +0000
References: <20250225184822.213296-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250225184822.213296-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 25 Feb 2025 19:48:21 +0100 you wrote:
> Document two rules already widely used and enforced by DT maintainers
> and SoC platform maintainers:
> 
> 1. DTS patches should be placed at the end of driver patchset to
>    indicate no dependencies of driver code on DTS.
> 
> 2. DTS patches should be applied via SoC platform maintainers, because
>    it is a driver-independent hardware description.  However some
>    driver maintainers are reluctant to pick up portions of patchsets and
>    prefer to take entire set at once.  For such cases, the DTS portion
>    should be split into separate patchset, so it will not end up in the
>    driver subsystem integration tree.
> 
> [...]

Here is the summary with links:
  - [1/2] docs: dt: submitting-patches: Document sending DTS patches
    https://git.kernel.org/soc/soc/c/d98d35d99e0f
  - [2/2] docs: process: maintainer-soc-clean-dts: linux-next is decisive
    https://git.kernel.org/soc/soc/c/a42d2d53a6d7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


