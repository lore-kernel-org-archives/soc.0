Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5202033AD9A
	for <soc@lists.linux.dev>; Mon, 20 Apr 2026 16:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776700804; cv=none; b=JX3XUy127BTRZQGoC9300RJw9r8At2j9cb2WzLKaiO6DkWcJ+0TZWww/erAaeoTRnTgWTjLN+29k17YHzEWODtf5UFn52I0kdaFMji7g1l4rolRi7Lfe/5lVhKOECqqlwW1KYeqHJ0eEkX3OF0bVSEkoWu/7Iv82XtiOnAigqu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776700804; c=relaxed/simple;
	bh=vf0INhEBlwibMXaTSxbd9KjMzTO2h7zelu1LyUPmLIE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=EAcQViJRscUM7UnMArC/kwVQDdq8pw53Paaq9V7zGJw2WPg5NExNtxNNsZTlDZtAv+QCOY3XKG0wh7Eu+LIc2eKyL5oGXdTthe7yNxLpOKXMVRXRnODzeGoqBLdtlD4kMSDFlaeocLs8upq13iStJkUY2jm63NRIBrQJSJ41U4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cfJ2p/D7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cfJ2p/D7"
Received: by smtp.kernel.org (Postfix)
	id 3EAFCC2BCB4; Mon, 20 Apr 2026 16:00:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29116C19425;
	Mon, 20 Apr 2026 16:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776700804;
	bh=vf0INhEBlwibMXaTSxbd9KjMzTO2h7zelu1LyUPmLIE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=cfJ2p/D7vpakssNjevM0N+UltaSo1i3PbkXO08+Q9mWlYCkllNX+Cz1FFIzIK4prr
	 NntLHXzAJpK3X62B7KbSh4hsSDTklIWK6F0TG5lwXracPQrjAfP2QbIPayDnvZYWPm
	 LADmK6RSVYIbs5JnAzpCEvqFuxTFk1q24KfT2tS2JFeiH7rUbeKj7ZVaC0vOJhnUPE
	 WFAr8ecNa4mst+LwklQFV2vriMBMnD7OXziIt4NVMaAecc32VaEA0J+5q6XQ2tZrg4
	 Wf0YF53xMHR3VivB2WbXDMpto4mL+LCcIdtYwDsvPUl+TlolM7qEms+QOov1eX2q0/
	 jhjQ/q5b1Z1iw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02E4A393000C;
	Mon, 20 Apr 2026 15:59:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/2] Documentation/process: maintainer-soc: Trim from
 trivial
 ask-DT
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <177670076856.1706382.6071437791637463585.git-patchwork-notify@kernel.org>
Date: Mon, 20 Apr 2026 15:59:28 +0000
References: <20260413074401.27282-3-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260413074401.27282-3-krzysztof.kozlowski@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 13 Apr 2026 09:44:02 +0200 you wrote:
> It is obvious that one can ask DT maintainers of something, just like
> one can ask anyone, so just drop the sentence.  Concise documents with
> rules have bigger chances of actually being read by people.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  Documentation/process/maintainer-soc.rst | 2 --
>  1 file changed, 2 deletions(-)

Here is the summary with links:
  - [1/2] Documentation/process: maintainer-soc: Trim from trivial ask-DT
    https://git.kernel.org/soc/soc/c/f325b239a7bb
  - [2/2] Documentation/process: maintainer-soc: Document purpose of defconfigs
    https://git.kernel.org/soc/soc/c/8b0beb45840a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


