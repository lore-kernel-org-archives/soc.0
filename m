Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA28643AA1
	for <soc@lists.linux.dev>; Tue, 12 Nov 2024 15:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731424221; cv=none; b=gL9XlcwaWbZoBcO6aFLzgwlOtxhTGx6wSwi9IdF1kUndVnRCH9HGOtFLV60/si/0j87ON6PXfMS2ZkRHvBHOiOf5GvScCcDeuWVUTEG9vcQdeCc37xf8+nxoWYUV5XdUUHmhqrcXpDunmVCpTQ9vpqdZevDx6sjOlHjiTg60YvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731424221; c=relaxed/simple;
	bh=A9FZGexrsnTS6tPeZQ7MWQq0pcSZNB+ie1WBydgKXqs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=ZATL5bXjO1UG3pq9kDbCPMAk5TfunEi4+/z66ag/h0rQGPDou01jGBYo0hkzNpvVGApXhJ2ICdD+LJKlDHnHCZ0Vds2SLQJSnYENjEha9QoidBNMcZJpLgaWAqtbV/Vvp6yQvpRRKjFYJKkNY2ItrSrNc4LrjznjrrfXwBKNNLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gUtcxZ2z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gUtcxZ2z"
Received: by smtp.kernel.org (Postfix)
	id 98373C4CED5; Tue, 12 Nov 2024 15:10:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B1C3C4CECD
	for <soc@kernel.org>; Tue, 12 Nov 2024 15:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731424221;
	bh=A9FZGexrsnTS6tPeZQ7MWQq0pcSZNB+ie1WBydgKXqs=;
	h=Subject:From:Date:To:Cc:From;
	b=gUtcxZ2zikwi4aya+gKzB3TYRJ/BH1DEt/1pKWGX9t78Acx/l4fXHhxhi8VxSgoXZ
	 IW3RE269g77kWWgcVgFKgZlKjG592CxT8QEwLdsdYqs2tswctyxjXTFTIdxt+fGv1e
	 YixKdCw0kCIxBaiYlT/D41BcVAvX1w+ROWEjzLgWQzImeYDP7/fuUPYzC+f9AMQAYf
	 IlpUiA7HgS4x15KHQoRsuc093YvOgp9xMxG5l/PNab8lZacDFO39HXKOX63c5/QEH+
	 PsQfcuyyQgbktaUkD1LnJ6ksGmZKZDU5t/zinrRY32ZpXIdlxUJORxJUM60ZzaQW7h
	 Qn2wWAO9y3UZA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B6C653809A80;
	Tue, 12 Nov 2024 15:10:32 +0000 (UTC)
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
 <173142423124.559138.16998582840572768022.git-patchwork-summary@kernel.org>
Date: Tue, 12 Nov 2024 15:10:31 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] Qualcomm driver fixes for v6.12
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=905480
  Lore link: https://lore.kernel.org/r/20241101161455.746290-1-andersson@kernel.org


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


