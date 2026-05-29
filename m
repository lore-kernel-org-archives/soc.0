Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F552377023
	for <soc@lists.linux.dev>; Fri, 29 May 2026 22:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780094421; cv=none; b=OSHZZGWFK8PULVfBYlprNomCmGk7CpAW40/1y+q7UDpBL5E5iSfrx5KA1GFVoAPd4Zi9vWx6HgmTqj3bNTOtp1q312aiUn4f0cWggQZKQn0dOjCC6A24YOhoRV01M4hAugNtiiauUxlvF5N2PA5imNOGl89z+q9BNn4OfEpsrPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780094421; c=relaxed/simple;
	bh=Xb/NfAv2TwirWEvXZ6qKEjKiQgVco3wNJlhQZdkxC0I=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=ljNI0rtJS3Z5QiR+Cp/SVFk5mLlH9N1GO/CGPus8M7GLobFtpb+mfDx3hNuVsCFwY2VIy6Z41TZ4IyPwlowNh/UawtWDmTNQMeRB0MSF+Hsd578Y6ZkkFbg5aNlVaynkxPy5ZKEefwZlK5t6O8F5cDJsBOVbeFVyZ5PHrsTVOro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U4qPJY3P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U4qPJY3P"
Received: by smtp.kernel.org (Postfix)
	id 8BB121F00898; Fri, 29 May 2026 22:40:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7596F1F00893;
	Fri, 29 May 2026 22:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780094420;
	bh=xDi6QX/7x1QKFP4nkeG5Ef6OpgB1J1IwcjLzHXB5yIM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=U4qPJY3Pq31k5xJccqb5kRTHp3i90aGRZw9GsnKp5+J6XnLfz/h8pIpL5QqtxqD0+
	 yXDhtD90rgNTQ/SbTKAQvGsJNXK25dEowuJk/CxbUIqdZMYUhEec63Yz/fu5u9Z1Ka
	 IaGEq/t5Do1BXKPwZmHWSehiRn1KUvYv9wmVeiBOaybiQFhpKu4o6QNVL3In1GimPz
	 N8duUqw+DWECEDEUrFDgsMrd9MiTB4OFinBzDpEDb+gDGJ4sSfAMrP0tI/OaUNMefC
	 RjeI6iu9lMvhW44tMz3yFKuz5cOq7Az4KPL9GyC5YiQFz4rUHnCWQlstZYbGW3Do52
	 rINpvSWu9hiPQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 5696B39301A3;
	Fri, 29 May 2026 22:40:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_scmi: Updates for v7.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178009442388.1985625.12892056376314326862.git-patchwork-notify@kernel.org>
Date: Fri, 29 May 2026 22:40:23 +0000
References: <20260528185827.776851-1-sudeep.holla@kernel.org>
In-Reply-To: <20260528185827.776851-1-sudeep.holla@kernel.org>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 28 May 2026 19:58:26 +0100 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm_scmi: Updates for v7.2
    https://git.kernel.org/soc/soc/c/1499b84142cc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


