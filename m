Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5022F39A04A
	for <soc@lists.linux.dev>; Mon, 10 Aug 2026 09:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786352481; cv=none; b=YGwArkB4Cg0Ahd+GsejbHNUc4hxlWEJhSQ7F9dl6jUvypGGP4Fc5KhMpIS+ELgAXnQCUPb+9EEf+Atv9CAtPsIL0zgWWiTi0tgOYvhD8Xmf1EjvH1xHO5RsA7dOtHOoE7kEMRdwutoiXMHl1oRKd/SYOIFp1hiTkafmfuq+HnZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786352481; c=relaxed/simple;
	bh=564vl5AiR2ACyKrHMzKTixZfUJSewsBa4nyz7Qms4lg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=uI3Y1UQiQW+W+88xL1rZjSLAkyYTVLLKWKDnQRgJzL0woCAUyTdZUdhSwS9CsLZaL++AbTjxLHTz7L4QYRETgDPFHmGFx1zgSZXbtdAqryPL63g1pKSOb/DGHS3Lo/sUhqowc+Pq5UuTHtlkoWAm/AJs3M8LgWn8TEOhpx7r2mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=flEbrJ5X; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="flEbrJ5X"
Received: by smtp.kernel.org (Postfix)
	id 4B6F91F00A3A; Mon, 10 Aug 2026 09:01:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 343EA1F000E9;
	Mon, 10 Aug 2026 09:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786352480;
	bh=U4EtU3ibEwFtH9FxTYqocQIjgBuAn9miWg4dhRLnDSA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=flEbrJ5XhVtjsE1iKZb3GRFNP/jjxqmqQt4UaR5AqvNI8JsuXkG7rkw+mxt0MDxcW
	 mh5rLE5xA4b6s9kThgV2yZIOcDLJZWF2ZtwCDYIzgFbpzoE/usnnm6eCEs/YyDCt4h
	 vkjU5HKhhKeUEJCpW+eCoN7bSP/3DndCSclJ5ZRY9ZNdGkOy7KfjQpmnVLh6RV2jUK
	 3sLWLMlkA8CrF0xi42WbdN3nKBags7n1rV4m9Ka0jMJgvWlZAV8PoFukKvEo3qoTrO
	 Rl15BLII+Z2PHfOMkA7sMn3rLqAqSD71BI5bqU1m1TfOhYI7sHQ927AhgovJ440v06
	 /kPn1QOJ3g6aA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 569993924FC2;
	Mon, 10 Aug 2026 09:00:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] SOC FSL for 7.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178635243688.3658557.17627253734550489491.git-patchwork-notify@kernel.org>
Date: Mon, 10 Aug 2026 09:00:36 +0000
References: <b0e98427-f0d3-47a3-a0b2-de386a5e641c@kernel.org>
In-Reply-To: <b0e98427-f0d3-47a3-a0b2-de386a5e641c@kernel.org>
To: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 10 Aug 2026 08:07:34 +0200 you wrote:
> Hi Arnd,
> 
> Please pull the following Freescale Soc Drivers changes for 7.3
> 
> Changes to fsl-mc bus are reviewed or acked by Ioana
> Changes to powerpc are reviewed or acked by Maddy
> Changes to phy is acked by Vinod
> Changes to dt-binding are reviewed or acked by Conor or Krzysztof
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] SOC FSL for 7.3
    https://git.kernel.org/soc/soc/c/30502a6a727f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


