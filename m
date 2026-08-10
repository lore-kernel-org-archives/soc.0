Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24163644CA
	for <soc@lists.linux.dev>; Mon, 10 Aug 2026 20:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786393909; cv=none; b=lYw9TKmRk1QXwJP/Z1oTL8rtIfOzxVMxkJM+iVzyZFaOYDWI3fYnl1FiAQJE/C4z3cTzOZE4fzXNAq9ERc9LA5zqlPoaqG8sx+jG4ImDviP4SZWVEFhWafvd6cK/YJPz4s59PlxAIk6InDfg6WHdkT6p3tPKiR/sjdtszidbmAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786393909; c=relaxed/simple;
	bh=TKiYzAiSS+2L8g04S+nZn17KpNVCXy8XR+pbSL4lZYk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=hM27jEl+mXXF15DLtv31hju+sdP0TWtjVc0yjxy0yEPZ7tIUwa4fOXu3sd3j5MxcVo3kIEM5JDo2On9Rdwxa+DwW+F7tG29W6yHSnuCiAYptv4PnYmh95xzld8Bdc6v1vDKzpGhbbRcCxZNCK/U+uFWsZvzvKMYomrGCHN4siu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FGOVFk2A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FGOVFk2A"
Received: by smtp.kernel.org (Postfix)
	id A477A1F00A3A; Mon, 10 Aug 2026 20:31:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EF431F000E9
	for <soc@kernel.org>; Mon, 10 Aug 2026 20:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786393908;
	bh=mYFrg34qO3PPVv5wzsXJASWNc7tNCnY2IV7y9lbslqY=;
	h=Subject:From:Date:To:Cc;
	b=FGOVFk2AZR6PtJcVmot+Mt7Bpttb+d8Gj3Zzu/3/qg78aRqN9dn0zRBDdPNFVf9oX
	 +fZf6RvPsbdsvJS2suu7Uii24r4ArCeztuuBbKAvlscZCNeyKKuY1CtGm54kSVFrhk
	 XeLcTfAwKgx4gId2BpOpKljg4BNK7AsRecYnLxXA+LP7KbjFzkXt4yOdRZJQOYDOnt
	 fVlKhSbRzexrT/zWMXVjI/TSiGhL0NduX3KM8h1bpTKPFXBMNeT0unvL7cm16j5Whg
	 51M436+i1Di+hvNkBOULC98USwXZyxL2eYA5w+XlIPu151Db/hzZYscmmzbM8HGQJm
	 srbRFlMiT8LUA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 59471392625A;
	Mon, 10 Aug 2026 20:31:06 +0000 (UTC)
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
 <178639386496.202926.1935536009861442336.git-patchwork-summary@kernel.org>
Date: Mon, 10 Aug 2026 20:31:04 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: [GIT,PULL,1/3] arm64: dts: samsung: for v7.3, part two
  Submitter: Krzysztof Kozlowski <krzk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1141284
  Lore link: https://lore.kernel.org/r/20260806081903.165005-4-krzk@kernel.org
    Patches: [GIT,PULL,1/3] arm64: dts: samsung: for v7.3, part two
             [GIT,PULL,3/3] ARM: samsung: mach for v7.3


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


