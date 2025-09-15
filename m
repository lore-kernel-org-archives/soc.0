Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB4F523A
	for <soc@lists.linux.dev>; Mon, 15 Sep 2025 13:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757944268; cv=none; b=TzpON19tsgj0GnJMa0XC8vvYEHDAc0icflKqDDbLZ77E7k3aD2XDFb2UvWqtlfcco66r6ZZs3XKrp/k/FmjuO9/M/IP/zAkaUzKOXh05Vj4nxxoN9LN3erlan+7ZD1CpYAGVJC5A2imIh1ozZ8Dgb2s/PlYo6xnMVzqFawheGnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757944268; c=relaxed/simple;
	bh=9Veo3JxHMZb3/OJ1hFzVJwqH2l6SDubCLw7ZjDYCrGI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=SktLl/IugNXx0n3eAjv9B6VZgMcel6qC8RQUqZNLRrGjjW9R4wx9o2LMWfhNoHRkLwxrbB/xpcFBtd+ax7cOCMkdvl5RcN8w+EyNaeNK2Hzsu1IclIsQGveTzV3c0EMvNzdFRLVkqBv2TizYl/Bi3OVbwZ0Y+4CHs+VweWT8PwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e25qzAGc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e25qzAGc"
Received: by smtp.kernel.org (Postfix)
	id 830CDC4CEF5; Mon, 15 Sep 2025 13:51:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DE96C4CEF1;
	Mon, 15 Sep 2025 13:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757944268;
	bh=9Veo3JxHMZb3/OJ1hFzVJwqH2l6SDubCLw7ZjDYCrGI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=e25qzAGcFITFYwrOZet/q+vQDNYHTD69gJ7ZuBXSON+o0LccmqFHOR9uPL779V6ul
	 y+eAM2DiUUZcbatP4Dfyg6Xa29YFw/H15AssqOe8c+Xgrad66IIUGLhXERtT1va9cZ
	 3uD37jizLfFLpQ7iHBMK/7oNNQv0XkWaChptPr0IMG5XwgPtAtOSbrMFsp4BHSkDvD
	 9eAAYQls5v2tA1C/WLJdHe8SIxHaNw8xi55qFKVKLzli/ZdfFbfEnvGiykhAA5AcCa
	 Bv1ee6hJr5/W+oQo7kHAmFVn5ePzPDQAwOeVBj9kPrdOwy4DTi2oGCv/V/BMG9ZhAM
	 +vz+WQcUhFXLg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33C2D39D0C18;
	Mon, 15 Sep 2025 13:51:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: dts: samsung: dts for v6.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175794426998.4179625.15857753801771148811.git-patchwork-notify@kernel.org>
Date: Mon, 15 Sep 2025 13:51:09 +0000
References: <20250909184559.105777-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250909184559.105777-2-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue,  9 Sep 2025 20:45:58 +0200 you wrote:
> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:
> 
>   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-6.18
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: dts: samsung: dts for v6.18
    https://git.kernel.org/soc/soc/c/9a801e8b96b8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


