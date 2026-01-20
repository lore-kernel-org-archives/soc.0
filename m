Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A4341322C
	for <soc@lists.linux.dev>; Tue, 20 Jan 2026 17:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768930206; cv=none; b=RfvVmIAeKHQD4962iUXUTnJNHkPFejGmiNNI1Oyp9IYdMs9UqVSF6g0frgg49K+0Aj7rFswNc38gFVmyMeNKSmDk7XlcjknDoGz7AhGnsZZ1CEgXHFsTamSeeo6ToOF5c/zPFVEcuUAhD58CS7SMoTTgUI9vlMuEwevGuvp3w8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768930206; c=relaxed/simple;
	bh=gbHwfRNNGrGVHkZNn7t7YCpLhHHJMP/sBIJMgrfGM60=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=YOM6imnBmxm8hftdyAjpYcmUPYAqa04+X8qsihN0pm/EVXZEnjV/xVHsOKxDWJWME4uHqoGQSwNCx2vNBJRzoz/MOxlNFktnMXSjc4pqP5eS1mzSmQ0n7+u+Kt+mG83oRjTneTsUC+/OY2mM/BCSbF+ZbhrTK76Yp9qtZYkyu7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aRS0dlL2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aRS0dlL2"
Received: by smtp.kernel.org (Postfix)
	id EA3EBC19423; Tue, 20 Jan 2026 17:30:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D43EEC16AAE
	for <soc@kernel.org>; Tue, 20 Jan 2026 17:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768930205;
	bh=gbHwfRNNGrGVHkZNn7t7YCpLhHHJMP/sBIJMgrfGM60=;
	h=Subject:From:Date:To:Cc:From;
	b=aRS0dlL2PGspgT4FuYa4MS6SKx/QpdJxNTj5zHVoKg+1CguFPPnCsHlmK0JF97Vrv
	 SxXPdEIcSol7MgQDiZnAQE3yoTGmoORXAoAM9YdoTzniRlTDfjgXSVROpg8z3xftFR
	 M7RL/+lvqszgh/1Flom+qe+a8l8qYTyQOz8zuoIQa1E+49rr9p9NOgdOKtNlZqiK3W
	 81KwL9/lfXo/MxRe9+VVbK96T/nsq+vEVhXaxBm5BfKr1i842TZKYwVP2RSd+Dh5+j
	 g+rJdN8WOlRKtyEPcHk+kYR4XMUpNs87SKzbZXzFCRDVVaybmWfezI4zbXSlXUTTdF
	 CBrL/nfG+t8fQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 8DCF93810935;
	Tue, 20 Jan 2026 17:30:04 +0000 (UTC)
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
 <176893020310.535807.4867753118823322165.git-patchwork-summary@kernel.org>
Date: Tue, 20 Jan 2026 17:30:03 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: MAINTAINERS: Add Andrew as M: to ARM/NUVOTON NPCM ARCHITECTURE
  Submitter: Andrew Jeffery <andrew@codeconstruct.com.au>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1043062
  Lore link: https://lore.kernel.org/r/20260116-npcm-arch-maintainer-v1-1-4abecbe1dc15@codeconstruct.com.au

Patch: [GIT,PULL] nuvoton: First batch of arm fixes for v6.19
  Submitter: Andrew Jeffery <andrew@codeconstruct.com.au>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1043066
  Lore link: https://lore.kernel.org/r/392d9247f7c15d11b115c86cba762568f37cd10f.camel@codeconstruct.com.au


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


