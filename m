Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72EAF3CBE91
	for <soc@lists.linux.dev>; Tue,  2 Jun 2026 09:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780391412; cv=none; b=U5hsJYt6OaNZfsVAzDdRzr9mr3/KaHUsvDGDzA7alIt3Z1sjtbxGxxlHWkp0kQwOuPBIoTP1MQC3wvXY5S92ZPhyn6f1S8LZQlKYNpOh4c966GE0EgGbyxcbea9fyX4pQcFXTtfM2ARNEl6xkMXlaIowaMhgXCXuOHJUJrKb5CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780391412; c=relaxed/simple;
	bh=jdZQWcvfkG+aLy/0xhJcIT4QSeLgkTmT9duXaWg56eU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=AGa0awWMLSjLURGngHGBjfZsZFXdOY01oLQxn6w+b5bDIxjTIaKRLh6Tf4urY9FB6ZcJ6uURxn6c59E7GeXkzhDYa3bx7NwGROw97DFHqo0Uj8RVfF2fpVsITFxcL1Iflsk5qU0Eb6UtDbaYYFN8tkAm88OCp4S3XRmRqlGEEoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OO7/W0iN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OO7/W0iN"
Received: by smtp.kernel.org (Postfix)
	id 6E9381F0089A; Tue,  2 Jun 2026 09:10:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58C541F00898
	for <soc@kernel.org>; Tue,  2 Jun 2026 09:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780391411;
	bh=AdeH3OKBWyA+XDrIS3EHGSsqwj3l2VDNqH4hX32RXTI=;
	h=Subject:From:Date:To:Cc;
	b=OO7/W0iN4oykXzUdXNF+16jSXG/e9ePutPqM+rmCgliXVkkhtsr+VCsUKcBD0+jD/
	 +8JgWgFU2WqrTsJBf5ezUFq2q/vJMMfVqqFdoh2y/uDpZVl7P2w4CEXDNqhVmKMMjT
	 lO75CWDKThy0f6idnBXF9buB9COGsQSE97C4bpJBHXty4dNQWGGrdY2IhWrwriKihP
	 0BicE/VkAph1NVwTh0sRbAnA/R4yPvdam01FFFyw+ViXGfsbHazX9VszNDQZCLGVnO
	 wrQI+ZsWaCF8DjK99gC/j/BvoCYtdorNuIOTksANEvi7k6D1kOOE/V29xWCcRd+/Of
	 vnBe3RH1/csVA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 965F03811A49;
	Tue,  2 Jun 2026 09:10:14 +0000 (UTC)
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
 <178039141317.340640.2261533946284563665.git-patchwork-summary@kernel.org>
Date: Tue, 02 Jun 2026 09:10:13 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] Qualcomm Arm64 DeviceTree updates for v7.2
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Linus Walleij <linusw@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1101146
  Lore link: https://lore.kernel.org/r/20260526165735.17848-1-andersson@kernel.org


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


