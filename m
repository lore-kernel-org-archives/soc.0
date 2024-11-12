Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C150420ADDC
	for <soc@lists.linux.dev>; Tue, 12 Nov 2024 22:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731450700; cv=none; b=HNzj8opaD2JBjk39K3DPWMZZ3Djyp3Y2XzOYj5bCuGk9TLl/o0vraS0LMXWPqv6WL8R3eDzS0qNVyxb0v15Cyri1DgukVkz0J+FYrhzGfm9uyoaqmGX6c+/+cGTRLm3HpCpTnMJO73/x261Q2fsWTQ08YAdcAqjo0tQI4f1kOW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731450700; c=relaxed/simple;
	bh=GBTPQ3muoBLQ+kVfH9ZlCvvHl2rErWMOWsVCGhYFENs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=UXtzlUspxsCKBRIKULZvHRwr0q7+mEhnxAEGuSK/jYPg/Xpf8y7amGa211b1Pt2SMzigMRG+J//fEn7F7XitLNg4J46q4Ua4CVohokuCVNRfL/VaP2hlkVx2ylYxyi3UKR4Yet9hiitXO4U+pkXT5Z3jBGVxjOiU+6DvU9BqgOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nQswaboq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nQswaboq"
Received: by smtp.kernel.org (Postfix)
	id 5E23CC4CED6; Tue, 12 Nov 2024 22:31:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47EB2C4CECD;
	Tue, 12 Nov 2024 22:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731450700;
	bh=GBTPQ3muoBLQ+kVfH9ZlCvvHl2rErWMOWsVCGhYFENs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=nQswaboqWVC9DIuHEcpLJVs34W+NrSvetOuZdE7Z60tjvQP5hd8ztP7Ptmdtt9iJa
	 8WOdNKpv12vtOPyirS/1tLCu0DTkmQuNHoEvfwUjdU5BnwnfQIkVrNccmKywbJgwDg
	 10gmhQ81jQXLIXugkCnPnxCAxPjD343NDkoJA7MSV0CItSManwyrCTzzMyST6vQHWI
	 Pe/S7IhpQjsz5Dwb1kG0tMQH1H0prSSy9TU4AO3ZG86luQOfJQkJXNOx2W8e3eQ+5Q
	 GHyfUOlBw5+GKHAjpve5FezgjGG1ZIC7zgbIacRfLtj9IH0qvt4Heii17ZKr4x64I6
	 VEUpLwq11v4Tw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADE163809A80;
	Tue, 12 Nov 2024 22:31:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: Zynq SoC changes for 6.13
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173145071023.694695.11092871266510025245.git-patchwork-notify@kernel.org>
Date: Tue, 12 Nov 2024 22:31:50 +0000
References: <CAHTX3dKLb4nOVpVvnwyxE6zJZNXpiB4hh=WzpKWwhqP7aLobjw@mail.gmail.com>
In-Reply-To: <CAHTX3dKLb4nOVpVvnwyxE6zJZNXpiB4hh=WzpKWwhqP7aLobjw@mail.gmail.com>
To: Michal Simek <monstr@monstr.eu>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 1 Nov 2024 13:53:08 +0100 you wrote:
> Hi,
> 
> please pull this cleanup patch to your tree.
> 
> Thanks,
> Michal
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: Zynq SoC changes for 6.13
    https://git.kernel.org/soc/soc/c/d95fa0fab7ca

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


