Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453562D77EA
	for <soc@lists.linux.dev>; Fri, 21 Nov 2025 20:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763758256; cv=none; b=QYBcleAa0skeiFYUvw8VRrWR5U81OwKp3U/HlqAFSrMnznFjJzSd4S/H85rrqzXEamwJ1AOmoZ5VCq6i8IaNtnTf6LHmz6SedLT60a7+fvuf93VwO30U3uury3uuCxcMwtO4p+GKFRDxc95bRtZdIdsoKZCHe/5YRT5qw0FqhhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763758256; c=relaxed/simple;
	bh=keL1ffxPAQyJidA7OMBI7ZJKeXkc2iI9udC8c4Pv/XA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=PSI1V40GFSJuaKD6TBppdjqewRFTs31JBp67jXZZcg5uoM5k1Qtlthtv7l6243IZhClZ9SPQ5FRwA5Q8t6Sclf3yTjMLOvlzOw33wFfW3T8FxX/17/jDT8d+khBq/fHlDCnukqckTzlrycM4w5PSbvlRs4bAzI35MF5THs10dsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q4ZHMkEX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q4ZHMkEX"
Received: by smtp.kernel.org (Postfix)
	id E7DC7C116C6; Fri, 21 Nov 2025 20:50:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D27C1C4CEF1;
	Fri, 21 Nov 2025 20:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763758255;
	bh=keL1ffxPAQyJidA7OMBI7ZJKeXkc2iI9udC8c4Pv/XA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Q4ZHMkEXpVR4C3galWObaCfAwOUhjikbTE4iU6Ug9HHBiFnDgqzQOWX/DUsuKxpx0
	 nCoGbnmerz28q1me3BV6xW0q4g8sbVD4RFQO7wqfoGrmsaNr6Fq5zwpLxI+9R2sfsj
	 RzzVvC0azK1lRqHz3rVXDNkHJsTPdAK20LFmgnR23lx9SpA7aeLJwh+OhJz2ZaKDb1
	 yyXOVGACU2xJTRpux1uleS5twBhFDu657UtEZ5x1htUj9hemSXg93zHZufirR4SqUW
	 Xe3xVtAeLtEOMt9D09nQAiRLoQaQk4Cqq0hNRzJJcSP+el4enj7Y0rbo4usPGcuwDv
	 Innp/EY0rbCMQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADCA43A78A68;
	Fri, 21 Nov 2025 20:50:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] arm64: defconfig: Remove the redundant
 SCHED_MC/SCHED_SMT
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176375822024.2580769.6069215055403895488.git-patchwork-notify@kernel.org>
Date: Fri, 21 Nov 2025 20:50:20 +0000
References: <20251021075704.527626-1-shijie@os.amperecomputing.com>
In-Reply-To: <20251021075704.527626-1-shijie@os.amperecomputing.com>
To: Huang Shijie <shijie@os.amperecomputing.com>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 21 Oct 2025 15:57:04 +0800 you wrote:
> The patch "7bd291abe2d sched: Unify the SCHED_{SMT,CLUSTER,MC} Kconfig"
> has enabled the SCHED_MC/SCHED_SMT by default for arm64.
> 
> So remove the redundant code in defconfig.
> 
> Reviewed-by: Zenghui Yu <yuzenghui@huawei.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Huang Shijie <shijie@os.amperecomputing.com>
> 
> [...]

Here is the summary with links:
  - [v2] arm64: defconfig: Remove the redundant SCHED_MC/SCHED_SMT
    https://git.kernel.org/soc/soc/c/04392a1e8145

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


