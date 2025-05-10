Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A48B67F
	for <soc@lists.linux.dev>; Sat, 10 May 2025 09:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746870590; cv=none; b=WNhq7/uc6loIk9q06roPK4YqOgUnHaTwZYnkqghljM/2SMEtgnQmtNYqSTnbU38JVBEswrvMIWomc7z5d/l8EihjUqhtD2HKVRm1f+kg2ewcuV0wQJq6wixxQSGHQKMeQYu64efi2fFCrSqMMAk1lumGQzEzg4QO3Kz9npXBADU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746870590; c=relaxed/simple;
	bh=ny3l6IKhsGQ6P5XuYQA9roVJCEyN6iSO36gwebjHMJw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=AikaXN2AcFQkIrkY4ctmVuwHWoS5iojD9w5t1IECBg8UUTFyeyHNBrvxDup21LkyZSl6WQk2Ewvd35dWAQE3h94dk4assqgobbtMVrOuEad+QEa102p/6U4BWHAR4ISqI83P6vivHQEkmKNaZkGKFQckePM2PIiquXmnLcS24jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cLIfwxPJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cLIfwxPJ"
Received: by smtp.kernel.org (Postfix)
	id B9B33C4CEEE; Sat, 10 May 2025 09:49:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97F32C4CEE2
	for <soc@kernel.org>; Sat, 10 May 2025 09:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746870589;
	bh=ny3l6IKhsGQ6P5XuYQA9roVJCEyN6iSO36gwebjHMJw=;
	h=Subject:From:Date:To:Cc:From;
	b=cLIfwxPJ+6thYkxiY6dq7cNWblRnYnBIolyBwCiOtWwKo7k4ekAupdv7y/17rUJ2C
	 dPL+T29hXHmwqZsaal8jbef3WtAH2TAE1rlQNy6HT27Pxya3Z0GzG/t34Bntj3nerv
	 YSgu0H58YrY0SBbrhb/jjQWOjiXrWFQsOcDg/G9ifIG9Oq6dNQtuQLM0oKxA+oOS+g
	 esrcdJj0mUNCqoC3fEu8eDRW0l/tqkBfNhgvrOR0woBptlaOpRf2Dxebo6SajO9558
	 c6rgzGs1ZD3XrlBAE2ZPRbaL7vfQm/zEVDdgMUn9UkRljVHlEzjKSpcpEo8sE7oNG5
	 PdEabIJnjtD7w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EE21B3822D42;
	Sat, 10 May 2025 09:50:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174687062746.3943501.6339597463959559561.git-patchwork-summary@kernel.org>
Date: Sat, 10 May 2025 09:50:27 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] TEE updates for 6.16
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=961154
  Lore link: https://lore.kernel.org/r/20250509065114.GA4188600@rayden


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


