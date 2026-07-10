Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A469F2D3A7C
	for <soc@lists.linux.dev>; Fri, 10 Jul 2026 16:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783701026; cv=none; b=AtGQHt/fJo334Ec5lm8k61c2Nm7+663JYJe0RUAckHU7MgzaMawb98y0/yD1DjiKjLJT6n8sr60+RP0oduEoxojVvUow33PPv2DWDzgzeZJQAfNZ6N8hJtVJ/91rRJYo9dS3yyijI7S05wx4l42LZNxhsT+GTv87SdoX6X9rDgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783701026; c=relaxed/simple;
	bh=7l0Kv7sAQWRchMPoN1W++7WDYGDy5osVWDas1YLQVPc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=LoM3I+uUdCGJp4rYoURHnf82z+CRoN81I2RnXQazDaKFjFC4kdut5wx5+CuF7NrvIX3MHn/xPQ0KEjdsM6H0fswDb1OnzPIjqJpcOBoT4igYrkqBaoO2ymZp6xJ4x5q6JAuVuoYaI2ZSqftBtkw7F6A0ZIh35Lf+iMrj2iIJELM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T9mqpSDp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T9mqpSDp"
Received: by smtp.kernel.org (Postfix)
	id 811161F00A3D; Fri, 10 Jul 2026 16:30:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B6801F000E9
	for <soc@kernel.org>; Fri, 10 Jul 2026 16:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783701025;
	bh=XE76Gs5n3YR1N1r2qxBA7hoorkRlTEERO28kWNvkUE0=;
	h=Subject:From:Date:To:Cc;
	b=T9mqpSDpBTg70SP09jGK6SK7GhfDeCP4FBady8NN0vL4Sch/rHZ9x5Bt13wPeviGo
	 fcUxYYnz6Qr0O6KegMo+BG7PWIWZFIxAHGj6gpc5W47el0iBH2vgx6BVx4lUAiPQNo
	 VgIRkY+DSHJt3nkOfGjauubrPArHCaKXLlZBCf1Ykn8zvEko+BPfND1nOvVUDb+eXa
	 MvJ8zhRK0jqWqQXYtkL/FvTO7Qacr+Y08Zpvz8yfWlxf6POOwKSOispUUzmuyLCfoQ
	 FMOrU6oe7sD2Ay1Q7BKrQDJulKKIgAgeL9l+bg5jfGl4XW1iZ9aa07axLuXZ2z7K9s
	 xZVlWW/mb/KcQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 5921C3924FA4;
	Fri, 10 Jul 2026 16:30:04 +0000 (UTC)
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
 <178370100285.758747.9970712504421978653.git-patchwork-summary@kernel.org>
Date: Fri, 10 Jul 2026 16:30:02 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: ARM: dts: st: spear13xx: Drop unused/incorrect usbh0_id and usbh1_id
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1116512
  Lore link: https://lore.kernel.org/r/20260625091355.107054-2-krzysztof.kozlowski@oss.qualcomm.com


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


