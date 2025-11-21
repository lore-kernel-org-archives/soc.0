Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687B32DC332
	for <soc@lists.linux.dev>; Fri, 21 Nov 2025 21:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763758900; cv=none; b=Dp/CUGfrhdmy0TaAj5xxCY56w2nrWBtiWk7YYGHEONpMFejcZGKPgONaeUONyT1eXEn6GioU94loFIbZzjnoSY8Tu4viQthxhgY++ijahvlacHRYT84/pUL1ZLMeiUmW5ZrR41s7AtQu0o8FjfPhtU65h35AnOgcGGNNxMZUC+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763758900; c=relaxed/simple;
	bh=9lnHvcHL7UGV08uql8VuXEJH8s12M2hwVBmRZ+J1MKY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Gr7ZRujJRmD7L7if7mLZ/28XcYvRrf0JMjbsIGOU4q1AzFvgVGYtyQktllb5tYDxSL26inbIce2DD6JvTxgUGw984+XGvXVpJGhNNF7hpeUkBXUzdHKANevi5Odhd46WBMuMJt1w5lTTegVSWS3tbIiRud0OxEocl1eRzUsx8cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IEoDSY9T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IEoDSY9T"
Received: by smtp.kernel.org (Postfix)
	id 0031CC116C6; Fri, 21 Nov 2025 21:01:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEF92C4CEF1;
	Fri, 21 Nov 2025 21:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763758899;
	bh=9lnHvcHL7UGV08uql8VuXEJH8s12M2hwVBmRZ+J1MKY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=IEoDSY9T1cgsWynlByTot7TcFl7SlUyLP0C0cQ++Ou9wu26rSFBm9UsMdasuYXR3m
	 8O149YUHPaiQFNpEKekFIFXrMgd/dRo9uhPmnV0Q+iz/S8MkzF/d5deWx6vQY6FCmR
	 4PxaRaQcU7SKSuSrke3cdKvSkmc0OaizJNChXuRJe3cCybnNzrD6Bz5tc13SRzTnbp
	 YNPVLfkvuSNYpk9vi14xdwkg37vKi1zFsKZU1AxrEzvkYmGQD+D9p4xSKPe/SaPaPu
	 cvp3unP0NjynAzeFsLS0oo4NjtKZHzVFPIizUrF8WBLDk3/7xowpDiSeE+6QDttorR
	 zs4qa/t5kltjw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADE833A78A69;
	Fri, 21 Nov 2025 21:01:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] QCOMTEE fixes2 for v6.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176375886424.2583629.12168003362215822591.git-patchwork-notify@kernel.org>
Date: Fri, 21 Nov 2025 21:01:04 +0000
References: <20251117094712.GA1518418@rayden>
In-Reply-To: <20251117094712.GA1518418@rayden>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 17 Nov 2025 10:47:12 +0100 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull these two small fixes for the QCOMTEE driver in the TEE
> subsystem.
> 
> Thanks,
> Jens
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] QCOMTEE fixes2 for v6.18
    https://git.kernel.org/soc/soc/c/fe7cdcd1bace

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


