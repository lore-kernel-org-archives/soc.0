Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1161FC7FF
	for <soc@lists.linux.dev>; Tue, 12 Nov 2024 15:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731424976; cv=none; b=PUqMQxYdDeg/mZ1hNSADyXNntKv/vIcQ/Qa7IpQ3zZc1EML/7isoI3+1mJw2SRxNlYI0CDLqVVENfC3CpAOb9R8eMPRiXhjECj4yjOq+lfody0hrksWhO/WtIP//hPPeI+hGNkx2eo3z3+OWJEdPlMCZ0/ASx/nL8zDdRESQOmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731424976; c=relaxed/simple;
	bh=YPBNtrMZW11Z7scgOgAPrzjflEDuRabe7WgAYPlS5+g=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=TZvJXavvGg2mu2gEXf+fS+Y+YU6LI1LmEBRzXMf45oTHORcuhURQO2/bYSadAk01LyIMceh/BdN52y1j4kkN/K8YKeFy7Z+09t+jrdGpioKWUVqAFlgJV0YlgnGn+Ye1rVym61qCqakGLdIGPaygVTDc2TriofMrbmt1OfEtOhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rZmNQn7x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rZmNQn7x"
Received: by smtp.kernel.org (Postfix)
	id 6B75FC4CED5; Tue, 12 Nov 2024 15:22:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50735C4CECD;
	Tue, 12 Nov 2024 15:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731424976;
	bh=YPBNtrMZW11Z7scgOgAPrzjflEDuRabe7WgAYPlS5+g=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=rZmNQn7x/YZgphZNMXhe4zIgaB8MUs5ncn2dLtI5JKxTYvTfI38qfglocthotcu2z
	 msOK+oUEsP+5QZxCR6CAUuCgwjyt/qOwGB0wv1Jbh41NLbg8V/kQlpfPMVDFof0/si
	 cfb7mOQEMaZ40x78fNnNsXuhH9IGUBtZ5+fmPX5GYQAyOtRHUtwrgjsCsVNUhPp79X
	 3Gk6khTkx+qHKgRDQ3+4Ae2V/uOHHjb7+w4B3xACj6worJkzcvi3+GCOwYxY1rbgpj
	 OISFiROM7F5lXtr3NxQeE62i9p/PZaTPqqYhACOrdUMS1TCVE+mVFyqHxtwM/I3iNp
	 fPfWW89eSIz2w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADD453809A80;
	Tue, 12 Nov 2024 15:23:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: dts: ZynqMP SOC changes for 6.13
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173142498649.562452.10118938147490968447.git-patchwork-notify@kernel.org>
Date: Tue, 12 Nov 2024 15:23:06 +0000
References: <CAHTX3dK9PKmG_UG4MW=x5KmZCrd5PkcAZiNVgPFQ_zsPRgu+dg@mail.gmail.com>
In-Reply-To: <CAHTX3dK9PKmG_UG4MW=x5KmZCrd5PkcAZiNVgPFQ_zsPRgu+dg@mail.gmail.com>
To: Michal Simek <monstr@monstr.eu>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 1 Nov 2024 13:20:27 +0100 you wrote:
> Hi,
> 
> please pull the following changes to your tree. All of them are
> related to the firmware interface.
> 
> Thanks,
> Michal
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: dts: ZynqMP SOC changes for 6.13
    https://git.kernel.org/soc/soc/c/04d4d0a446bd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


