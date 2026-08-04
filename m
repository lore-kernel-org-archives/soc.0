Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FCA40DB2D
	for <soc@lists.linux.dev>; Tue,  4 Aug 2026 20:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785874873; cv=none; b=CTWtEmJss6lKJVGA8sLLYeoI3ExFQfWv1K449NBIlxa25VbMWvJdichgy9YQFHjQrR5fBc7gvYONSqNB5P7eS/RiWHticM20m80WfQYD9AusQf4qOrzJJfaAg1kIGeDLMnQaxzFvYsCp/h+8toPS7Kv1kyOrAfok7Q5YCAA5Pqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785874873; c=relaxed/simple;
	bh=5Vd+gne3SMn1ikk9cRN9q6xRyRfWiDV9e7Q0HQcX9lU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=qSwFxPvOk+lDdRLnNBYTX7fmh3svUmboBzqZYxc3RGweiJjsTzsWC2eqmmzarSnxf7kP5bYBG5w9zSvQTmqBkeoUWgGbpWAmDznUmqZxU6pR2X1+gWalmx0fFhBZisoAlxwsC28002IDbEJXtKkjTujy1jgcZxOI8wcchzh1Hn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NVhW8BJb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NVhW8BJb"
Received: by smtp.kernel.org (Postfix)
	id 467271F00A3A; Tue,  4 Aug 2026 20:21:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3046F1F000E9;
	Tue,  4 Aug 2026 20:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785874871;
	bh=n43ZcHlCBKjZ/Zjc+rC7yvbU0k4V+VgZvdMsseo+prY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=NVhW8BJbMZVGUWg0Bum5+B1nuqXjoECV0/NN9gzzDUNG8dATKJtN4+vq50YHZnglg
	 FR7JOI8Pa4kp147tVLGLfVbZQFMFuHib9566QXkmGX3/dQMWoYNghot1loXca9KCMG
	 sSIHj7X5+mMk+wXsZlgPPqLO/HWqe/kkY7D/beFSiCFsTiP5JnA9LUPrRce4pCeHln
	 hjjLHHvEMfAZ3kTLpw+aGZDPBaYXvgYWTbjFS4oyEAnwSlUGMrJ6v85miNhQSczzSm
	 fCguNWbT9osCHu4MZwcH0+T/5kioTYtusGatON21oNg6pE7DC9r/evP6TAsuoDfNV+
	 xqBfuiAffPlFA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D095639263B9;
	Tue,  4 Aug 2026 20:20:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm driver updates for v7.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178587483138.3769923.3876901079423807669.git-patchwork-notify@kernel.org>
Date: Tue, 04 Aug 2026 20:20:31 +0000
References: <20260730164052.176832-1-andersson@kernel.org>
In-Reply-To: <20260730164052.176832-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 30 Jul 2026 11:40:52 -0500 you wrote:
> The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:
> 
>   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-7.3
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm driver updates for v7.3
    https://git.kernel.org/soc/soc/c/6a0542115428

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


