Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01EB51DDE7
	for <soc@lists.linux.dev>; Tue, 13 Oct 2026 16:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791907837; cv=none; b=uMKI7o/diqclceSK26tgHXm9HY4FzfPCFdkAElOUSriaAXW/0dpzGAUI1WqJUX57Jofam7BH1ND+knGfxTDZvNG7Qq7IEULwt2hKDAHgjyiBLAGxHnl01k/Uw0/3zU+Z7n37F0tQXooPvlA6SeTHG020wblrPZuuWmEPe41Z4zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791907837; c=relaxed/simple;
	bh=zkcqmx5ajRNo6rVUJAIks1KBoZre6iGVM5qS8oY8uh0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=GChy2auYVBbopp8duscrAlpZExLu56wrMHS22HPTwlZHhCJ013ThZ0zRPWffszLJniTuXNuQ6MvQOScKAY002fZ3RMfMCP2Mrc7spkuWeuFKzs055x9nD0+d0a7hQN2KrZywo+sJWrFNXXFBFZ1jpoFLjeoF93veBqP/EdAaBV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UbhXq3Cx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UbhXq3Cx"
Received: by smtp.kernel.org (Postfix)
	id 596911F00898; Tue, 13 Oct 2026 16:10:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 432FA1F000FF;
	Tue, 13 Oct 2026 16:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791907836;
	bh=gxA81hwSOhMK08Wz1HnQg170aM00FpJLcPD/EXsk2to=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=UbhXq3Cxgut31rY+7q/BK92knwX3LJdM1gH/5TZLffCKuS2iZMImpoOssPq3KxApM
	 cfwz+ejtdZefxB80KTMNdccUNDzSuS2lWWGyeumZWFVnTIe8+ckblmQOz6pQD/NgAE
	 9SDOf9RZq7DC7rXXNoyGNxktg2iVr1unxofnMHip8yx3iIdlKrLMm4+Lexeq2lF+Sc
	 dCjJKg1JgvC3S/sa51KpDdlucTMaq5MxSYxCipo8K51zDqHxgSkh38crZaEmau2sMV
	 wjYq6znA+5uAEVG3ljtwenCXsWhFA3BIeU0N6qkOrJoj/YrHw+vM1/GyEnF0XTqcQO
	 M/gqvBnNOrIAg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A2E539D5FD8;
	Tue, 13 Oct 2026 16:10:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] memory: drivers for v7.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179190783476.417156.15556587784553119005.git-patchwork-notify@kernel.org>
Date: Tue, 13 Oct 2026 16:10:34 +0000
References: <20261005110427.41458-2-krzk@kernel.org>
In-Reply-To: <20261005110427.41458-2-krzk@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon,  5 Oct 2026 13:04:27 +0200 you wrote:
> Hi Arnd and SoC folks,
> 
> Note that I do not treat untested, LLM-assisted fixes as critical fixes, thus
> usually do not take them into fixes cycle.
> 
> Best regards,
> Krzysztof
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] memory: drivers for v7.4
    https://git.kernel.org/soc/soc/c/2699c4615ea6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


