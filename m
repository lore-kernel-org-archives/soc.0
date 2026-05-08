Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E12E3382DA
	for <soc@lists.linux.dev>; Fri,  8 May 2026 13:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778247654; cv=none; b=B0WtBiLmCNa5ub+pedTJlee/9MpZEbq2UxOApcQwU4uOJ960HQJrFKO4edvMzXyhn61MBOVvZoxk+wYli8BCXSWHNpW7BF5JsDGMQai0WWN36kvTRmmbPxzd/DFQHKLsMgRTG93BBdrUPJ4lqx7O3gWKGfmX0S5VLFSBXhSrNYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778247654; c=relaxed/simple;
	bh=eptEeapb8E2nWE2H1PbicH3wGozILhS9qurNdOortsE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=LGNVAhj8Ht6VNM4gRWW+m7wSt1c9ZJt8DFQCdXL6e2MSdlsTjT2tFbgGEjNnHCqnUlpdnNxes0B4kqG7p8KlXOPBQIN152P7gaVC7bE8bY5Gu9R76bhNS4U9dOSiqrVlyJ8cW7bRROkkrG4392FQTQLx+yTnGu8mkNc+xVmclcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uq4OMD7w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uq4OMD7w"
Received: by smtp.kernel.org (Postfix)
	id 54DB7C2BCC7; Fri,  8 May 2026 13:40:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F5BAC2BCB0
	for <soc@kernel.org>; Fri,  8 May 2026 13:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778247654;
	bh=eptEeapb8E2nWE2H1PbicH3wGozILhS9qurNdOortsE=;
	h=Subject:From:Date:To:Cc:From;
	b=Uq4OMD7w7aFb9pYhG4h0Gb1JtHtDaSwHFBzqHKybdp0p+dZMRIy+reqdV1G3gHbnQ
	 vE9uKtOBx9EBK4fnYIFX4yRtv8woiPJsjp3L5uVG0rtggzLbqAYAKLM7wzy/iLcaUL
	 iUuthi/ej+YkrwWQ3zyhgvBhmokr/krkQJD8gcjKUfSsq/hZ5301Li9fEJ342zbocp
	 uOCn4/PSB39uM4RxFpoPuSMy3TxiAls2S1VlXtTdMXcLONhF1oOJLIGIFgSacJF6NV
	 YAqRDls2t3j+UCS4ZIcXEhrwkZR+PZliff2p45Ij2ImBFoTjZAr9RtYCFYcJA2gNkv
	 0jtbQMzMgLIkg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 0599F381195E;
	Fri,  8 May 2026 13:40:04 +0000 (UTC)
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
 <177824760250.686902.13208423639868061958.git-patchwork-summary@kernel.org>
Date: Fri, 08 May 2026 13:40:02 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] RISC-V devicetrees fixes for v7.1-rc3
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1091213
  Lore link: https://lore.kernel.org/r/20260507-blush-secluding-aae99d404f6f@spud


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


