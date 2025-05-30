Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8311898F8
	for <soc@lists.linux.dev>; Fri, 30 May 2025 07:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748589594; cv=none; b=oaPgo7e0GgbR8tlyi13z86WpIG9vTINtfIbyDrZPi5/oci5O4xhn+Wa/C9WYFhNX8LZwqqyjYUb8TX6gRj1xFJj0DMgstpyAXsjJ8MYpjgGqE+kCxjswyIvRLJCdao8wylZi2knZtbiM4GKEUFsPBIxgpcYoMH/B6lqxQHWb7BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748589594; c=relaxed/simple;
	bh=EBqhrks5BJfaVENJgowXgeaKBblMpE2SDZKeNClO68k=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=qm+X0rMfTTXVHdr8eLaHG0oMzFFtSCi+2BGuCSykMBDwBv6wDl52fLCvPFmQbd0WkZJzSqUN1qc3GlBwd5m9aav/B/pWDrKNgNrrGl7LoMFSxkDPsOgH1Y2jiMTr85TXDrWbSRlUPcran1lqpA6WeEJg+QVScUKH3X2dBeV/Tv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rMm5G1ly; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rMm5G1ly"
Received: by smtp.kernel.org (Postfix)
	id 6CCD6C4CEEE; Fri, 30 May 2025 07:19:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56A9CC4CEE9
	for <soc@kernel.org>; Fri, 30 May 2025 07:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748589593;
	bh=EBqhrks5BJfaVENJgowXgeaKBblMpE2SDZKeNClO68k=;
	h=Subject:From:Date:To:Cc:From;
	b=rMm5G1lyQzvVGKosnZiTBk2rFaGRkiLdC5JNc4iC0HbNh8fhvyzRNPpG2WoBPq+mj
	 Fo5B2bTwuZbGr1chlO0blirv1NppWF1T02xD6imWw+oVKSMqroWzfEix/x4nRVNmVq
	 XrZt0hrO0OMHHEyJVJmmJqLw3q4ADyy1bOqJbFEulsowzk6aKOW2bleTbqcWs3uvNv
	 PsKHVTNymd4PbUTT5YbXBal0SwSdA6i34jjtSRq1J1e0fqbkhJBbl/mgWgBlzZ1LhS
	 hq+LabfgLG5ZzUCk2MSBPi3jJ7MkDmUkMppb4sVDjbsxjm7QzaMHS0r8F+Ht2f5qTr
	 FTDPd7CHFRuyw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EE96239F1DEF;
	Fri, 30 May 2025 07:20:27 +0000 (UTC)
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
 <174858962644.3857068.3532452227590249386.git-patchwork-summary@kernel.org>
Date: Fri, 30 May 2025 07:20:26 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: MAINTAINERS, mailmap: update Sven Peter's email address
  Submitter: None <sven@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=967153
  Lore link: https://lore.kernel.org/r/20250528221718.45204-1-sven@kernel.org


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


