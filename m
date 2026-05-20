Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9060D3D669F
	for <soc@lists.linux.dev>; Wed, 20 May 2026 10:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779273065; cv=none; b=uW1caWhtR80mvboZctul2crpuq3zua/mKg15Ef4O3/m/Fpu/bYmWCzI/95Zvrq9iwQthDhRSkNMPlqQvxyOeEL/hloQhGnbzhjMTN5ylsYrCS+hwVChEhY6b3iHTEwBbcmf3eaWti+YJRyuaeS/66yypW4khlLeSweIF7b4go+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779273065; c=relaxed/simple;
	bh=Prn3JkKc6oPGwx7ZuKTD57FNyiPz6nNFfkAwcMTTcrc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=BebozRgsGyIHVU96fupm4xBot9CGYnP3xitQZKFDXTevGwF1x+0UJrEsHRC+qBalf1CPG0m4nWi4hGiFe3YuwG8emxw4i9FyPjpFGOP22mq80lu81SDXKDdzSxawbaHvY6EZLUR+q4vUb7e7lN1URQ4jZwhcblQtSJRamWY9rQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ufzr7ICK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ufzr7ICK"
Received: by smtp.kernel.org (Postfix)
	id 2D5671F00893; Wed, 20 May 2026 10:31:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 173891F000E9;
	Wed, 20 May 2026 10:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779273062;
	bh=w1kVNpO8KGfmEExNP8/XgBcGZkh1dPrFQDv5F06j/bg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Ufzr7ICK5MdpquLs48w6Nr1MVl3Wfevof0v/QdEsLDNIYqV/JAkyd0yamlqYpdapz
	 9zYaqlv5iG03cQInrdUokdeM18e6Ml8ny8WnqoT5yFCVtJAUFOdCngZi+LW9elyiEX
	 Jdfb5JRI4VNN5/+bvWW0P4h9uHhQH3vsc6y++ncUAHxe8XrK6B8N85CtnfQ0JcZ0yW
	 8JDaDQPvXT/Uqk/M3pg3QztZrekfeDDbeZLy8R2/GVdqyxIh+n7Q4VcFHUfltTHtJb
	 /oHukkZrHXRv8E/13m2zzfur4auK1H4FIFC3o6pOCJHOYknkGdj22CNp3pqaPzzdD3
	 h90Azfrpd57EA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D09CB3930A0E;
	Wed, 20 May 2026 10:31:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] SOC FSL for 7.1 (retry)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <177927307238.3101306.9197537483718779325.git-patchwork-notify@kernel.org>
Date: Wed, 20 May 2026 10:31:12 +0000
References: <310b65ba-1d73-4ce0-b332-00cde70acc69@kernel.org>
In-Reply-To: <310b65ba-1d73-4ce0-b332-00cde70acc69@kernel.org>
To: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 15 Apr 2026 07:57:41 +0200 you wrote:
> Hi Arnd,
> 
> As you are worried about the last minute rebase done yesterday, here is
> a new pull request without the rebase. It means it is based on tag
> soc_fsl-7.0-2 that you merged into 7.0-rc5 some weeks ago.
> 
> Most commits have spent several weeks in linux-next, only the last one
> spent only 10 days there, but it is not a major change and it is
> originating from the maintainer of fsl-mc bus directly.
> Commit a0fe29d20e78 ("soc: fsl: qe: panic on ioremap() failure in
> qe_reset()") is also flagged as being commited 10 days ago, but this is
> just because I droped the preceding commit.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] SOC FSL for 7.1 (retry)
    https://git.kernel.org/soc/soc/c/49ff66206e5f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


