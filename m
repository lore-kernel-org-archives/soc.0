Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596A5B67A
	for <soc@lists.linux.dev>; Mon, 21 Jul 2025 14:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753109505; cv=none; b=gGeTpTUwnluN1xo9TDS/0awOOvsmfnQmDS2jlSQodc6Eu5nOphxV/rmpvqP17ug1Mq45NJJF8BcJc8WHj5NIu+4cERGaFYPjEMvY7CbLNhRcp9x4nV6CkJU7gmUIlIRiDkN6Zg3y84/CaaXbV4bXM1B+KvSkPaL58hE5kCMpUTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753109505; c=relaxed/simple;
	bh=DyvAfgWzioQHUZ4aJF2ZYimbi5yWGntCTaE3tvPFUK4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=DvMffJvpHCr2TaK9aMd55T8oHxOQT1Sg3Tm6oR0TQwjLYIZuZf1V0dfh4GIz23t4GslwjSmLSMwIqfTXzjLV84h18nYQkCUk1lSjvLkbz4gyUKUqeUb7cq3jzjQTZp2lV0zTY7/PP3JKKcyYll0TSchQS9/TrTta8hz4Pz+solU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mbac0Pvz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mbac0Pvz"
Received: by smtp.kernel.org (Postfix)
	id D9791C4CEF8; Mon, 21 Jul 2025 14:51:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2EB3C4CEED
	for <soc@kernel.org>; Mon, 21 Jul 2025 14:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753109504;
	bh=DyvAfgWzioQHUZ4aJF2ZYimbi5yWGntCTaE3tvPFUK4=;
	h=Subject:From:Date:To:Cc:From;
	b=mbac0PvzbYCHHHI0P5XF21Hr8oBYFX4JxqA7d2UeK0CgQEasz+NIACbelzSsH10hS
	 gG4yOZy2X6tC9HqSgpTADDi1hTNQrz3+EnNjB6YPN8SyVcuY7EI6BTGFqRPH1eKOON
	 aQcqU64/F4i2NHyEoW2ikINBbizGAVBxokjo7iQ7lrU5EL8lrMdhW1m1+M4WqMnKwK
	 uJZPz+kU/QPlk0XqAfEnAVp028XPbTJZAe1yqbRpl1+Og3Ys06M/sbCqhojpnDuWTd
	 jKRyj74CRllND4U5UcOj4oXOzItuKNabO0aICHul1l3l3MUFXcAYyouQcRS1tkyCGh
	 iJxCaFzamTk/g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B1641383BF5D;
	Mon, 21 Jul 2025 14:52:04 +0000 (UTC)
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
 <175310952335.77297.17564525176060832531.git-patchwork-summary@kernel.org>
Date: Mon, 21 Jul 2025 14:52:03 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] Allwinner fixes for 6.16
  Submitter: Chen-Yu Tsai <wens@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=982619
  Lore link: https://lore.kernel.org/r/aHaJp8ut6z9Ds_qn@wens.tw


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


