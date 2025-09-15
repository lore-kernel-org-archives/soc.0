Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE78523A
	for <soc@lists.linux.dev>; Mon, 15 Sep 2025 13:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757944261; cv=none; b=VezM8/x32Pe0N6wtxyr5G1DV4cZjPeMJ923LVkke9MHbcGuA8eClu3y24eyo1iM9eKpeScr1hE+MobljC2ivxUmq6sm6V3ITzJ9yyiUzBx38gB0+88wtGeWvMzHAAI23P15OfoffLiQPw/5W2kOWqZbFxIKWRrFE0em86njh//Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757944261; c=relaxed/simple;
	bh=EtfD48EO4M5AudqgELiFCCMnhKSmFAOKg7X132XHOm4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=i7iA3jlD2Qd7RGJlf5NA5/eGH7EsycbsXG2EvFjWf9Zf2GtSB/u2s30oL6+GKK0wRKvoIjEyv5ArbhbK2c343x0H+k4sR1pHgkvmXE0s4QhgciHQi423BciuQeKIIRWW868vUH5QgbhrFD8vs8h1w75bRJlJaibagIOOz2rKI3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oftiM7jU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oftiM7jU"
Received: by smtp.kernel.org (Postfix)
	id 8E8A0C4CEF7; Mon, 15 Sep 2025 13:51:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79370C4CEF1;
	Mon, 15 Sep 2025 13:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757944261;
	bh=EtfD48EO4M5AudqgELiFCCMnhKSmFAOKg7X132XHOm4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=oftiM7jUoH6RyTEZnWUFii8CfxyBXq1u0+CXnANFJW2K2E2Q7wXUFcmZnHu3q4gbN
	 TbnOy83Mz1q0HUgbeMNDzfgfb17z0LAXvLr2KHFDGVdTQrvj8QsL2HLXBF1r0Atc+K
	 LcBJucsMylODRSQPM2+ZK+QPSWMPiBKuO2wwLaZYM5jJr4HnvbT+80HlXQh4Gzol9M
	 8Mr2oHcyncsNGazcvK8bmdV/aLc7rNVTfdUA4kE5QtQuWMwrL3uD/aUmDGlmRIz3Sa
	 H3RASBHRPq08w66/8tegCjde7JtFHSALX/prrVuLnnVkduunpVCFL44MOzDKvXRSjL
	 B7WzNc/aG53GA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33BF039D0C18;
	Mon, 15 Sep 2025 13:51:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: apm: Move slimpro nodes out of "simple-bus"
 node
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175794426274.4179625.2718153419049862279.git-patchwork-notify@kernel.org>
Date: Mon, 15 Sep 2025 13:51:02 +0000
References: <20250910214822.508317-2-robh@kernel.org>
In-Reply-To: <20250910214822.508317-2-robh@kernel.org>
To: Rob Herring (Arm) <robh@kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 10 Sep 2025 16:48:23 -0500 you wrote:
> The slimpro nodes are not MMIO devices, so they don't belong under a
> "simple-bus" node. Move them to the top level.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> Arnd, Please take this directly.
> 
> [...]

Here is the summary with links:
  - arm64: dts: apm: Move slimpro nodes out of "simple-bus" node
    https://git.kernel.org/soc/soc/c/7a0e28e5b2aa

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


