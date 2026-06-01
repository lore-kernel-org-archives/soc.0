Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1E1381AF9
	for <soc@lists.linux.dev>; Mon,  1 Jun 2026 20:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780346402; cv=none; b=jIL9gQrCp0pINVtEcSS7PvD3/jjV8ES4G3DsBIOVs72JGkgeAog+d9aZzrfQfcoVQODuLbwdbU6n6g1HiNubbhwmKZAudB8FMMcxRLkhQdv4bhiyrntVlZNb4J621liOpcK4g94L/If8Km+uF5nF62Ju2CDqxY4i1/Z6XFDrmL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780346402; c=relaxed/simple;
	bh=aFnO7d+w+9b4P/SoKL4HIKVZ4iE4s9uBEFtOA5bejZQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=iyiy7Kq0s+Vpm52JkXK2UsdM+M2mcmH1m1cT9dYOf2mgV44TSiZS3DeckR1IaLkTycCf1Yk2/dAe42KDMBT0sQWSAl+uI1MymVpgMT+yHLmARG/7P0VxTR7FIDeLOErsDatFGJt571zmzv7X20bzYn0upweW5I6v1MfsmAsFUEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vc6/ULHM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vc6/ULHM"
Received: by smtp.kernel.org (Postfix)
	id 2DD3F1F0089A; Mon,  1 Jun 2026 20:40:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 185E81F00893
	for <soc@kernel.org>; Mon,  1 Jun 2026 20:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780346401;
	bh=1D9jfNQtZwVlSkYnzVvcrozmN2BKKdpb1S+GuphIdKE=;
	h=Subject:From:Date:To:Cc;
	b=Vc6/ULHMs75xUD2PY3UWfzvaOaa98RaNctPmqRVYpPEVvRuuD7opKSqtHM15SEBjW
	 kb9vrvjhgbEoqE2TufCZN9Sf1veP9mC6Z32K9XKDRuZNrtzNhuAaUnIsr+8xikGDqd
	 OEsz0dnospxWgR+D9chG48ZuM9cY7ETi+GZ4hs/lEIttVSUH2ajw1dz3Ub9aGhV5Zh
	 cx51FA5Fx3Pys1g1tZRhoYpUjAsfrxZwgFfjY2XNLSk1T7Hgrhq0eLUdXAR4LX0fjQ
	 gJlsG14Ig8k8pQiqXZWIHU5MA9ZT6FtbqjewReQiMa0IfoCMYA6IQHqJ+Bu+CJ2i8K
	 jdPiPWCSfsJDw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 9610838119F4;
	Mon,  1 Jun 2026 20:40:04 +0000 (UTC)
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
 <178034640333.87569.3886756347463692616.git-patchwork-summary@kernel.org>
Date: Mon, 01 Jun 2026 20:40:03 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] ARM: zte: clean up zx297520v3 doc. warnings
  Submitter: Stefan Dösinger <stefandoesinger@gmail.com>
  Committer: Linus Walleij <linusw@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1099812
  Lore link: https://lore.kernel.org/r/1991560.tdWV9SEqCh@strix


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


