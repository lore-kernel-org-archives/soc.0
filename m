Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A94815383A
	for <soc@lists.linux.dev>; Wed, 30 Jul 2025 07:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753858966; cv=none; b=DR2uk6/dcGHBzgZSwFXIZQEz96hwOTFlzfDH9NoNph6COYaAgbxoQelWbT/fhk6mqut3E9PKagpi/ta+Vu+36sPb/sKWFO2dHb0VeLnwQslPQoVa9JvGuiRZwNQAhTVqktduSY9jpH5G4n6sTYNoeF4FniDvtqmN+znNxxfCh3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753858966; c=relaxed/simple;
	bh=AYmWNsGOu3CT6Uf/JvhFHsDiGSArUUgqMWqlvm1OTu8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=bEEnjT2Va7i5HUaxIRflJDXR/bqXTR9Yl1xJYwPAhl821QJu8nHp/IfvPCFl3MwyjzwGjg6hMQdfCIhCXIvazk4TaKMJD3K9fb6K8Xno7Qz0yLejlbpb504yyTw1DE/4Q+RdUdxT9ypFo2ilQXD56Bg4FPMHvJ6EkY/qI2rtj6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f6iycNHh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f6iycNHh"
Received: by smtp.kernel.org (Postfix)
	id E3547C4CEF6; Wed, 30 Jul 2025 07:02:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD3A4C4CEE7
	for <soc@kernel.org>; Wed, 30 Jul 2025 07:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753858964;
	bh=AYmWNsGOu3CT6Uf/JvhFHsDiGSArUUgqMWqlvm1OTu8=;
	h=Subject:From:Date:To:Cc:From;
	b=f6iycNHhsPCsKAtexFbwvu82UCUaXnVnX+YIIs3nh0/ehfecHzE9XhcVJOm+Jvzrb
	 gOinEaFlRxJ8k7Khe7wIYJc3SCIkTYEL81k9tkznoxb/9+R4E586bGeCeAfgE/9jf7
	 IcFLHR5AkyoWeff5WtILY4NuZ4kAG6XYQRzFp7iEzDgnPZqfyGUw+HNL+C6CffETxv
	 WOMzHF0WyYaTqjF0s67G5ISVBCn9sZgjDDE5/8aZ3ltIoar+1KMgKy5PZO1uFzmuIH
	 Wu2Mbom6mV8gPqkbMfmjJiTLpYTuoD8PSVVcFaqFbxZyUTLcwHVt4op9xXK92Ntt9G
	 nFao9ho4w6iSw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EFADF383BF5F;
	Wed, 30 Jul 2025 07:03:01 +0000 (UTC)
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
 <175385898046.1808741.7628628546019849933.git-patchwork-summary@kernel.org>
Date: Wed, 30 Jul 2025 07:03:00 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL,1/1] Broadcom devicetree fixes for 6.16
  Submitter: Florian Fainelli <florian.fainelli@broadcom.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=986854
  Lore link: https://lore.kernel.org/r/20250729205711.3393417-1-florian.fainelli@broadcom.com


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


