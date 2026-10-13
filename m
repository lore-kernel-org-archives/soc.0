Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B274EBAD9
	for <soc@lists.linux.dev>; Tue, 13 Oct 2026 16:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791907841; cv=none; b=Zm6J1EkgizIRG/f2Bt9RzoFvUrxFy5xNoVtEBfJ8V/C0mG4iEJEjtfj2zNp8O2X3SZVSd+pPVjI/rzfRMgBj1YTSuSFyd2OL9femM11kGXbL9Cz9iawqlHGD9Brr635ALGcMzIhB9bDtCpjy5i7n+PYcMJrkinAtD0gM5WhXB+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791907841; c=relaxed/simple;
	bh=NOenGxcN93sI2yMc86OwD8f8KLhn/M2ZipFZ2LWwL+Q=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=gkQTt8rVcN+nelYtAAbRhYCwoET+Rh1xYVZRX0hwxhAvuRUAYBG7w30CrKF+dGacSw1cV8y1p/dQBjLiZdMc511Na+49aWbVokCvWpQqF4ChIF+CVN9bWJxHlslakP4yfqEKRBGPuacHCMNq8jlQ5ORkb9eeE2nLJri2h1BLv1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gw+RHo1h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gw+RHo1h"
Received: by smtp.kernel.org (Postfix)
	id D5AC61F00893; Tue, 13 Oct 2026 16:10:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF45F1F000FF;
	Tue, 13 Oct 2026 16:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791907840;
	bh=oGr01/oYWw9GUA8muI4T2R4VNah8dftXwGncrST5R3s=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=gw+RHo1htM33pKbTZVYNsSFgiLt56xNomRmvQkHEeUUzACjMQYHhMUCEcSBQiSQST
	 OPcbc0j5VvCscrRpdh2rYLaa5uLZxRdrWv9JXsv460p5shsq7fjKDmLaRI4xKveQbn
	 WAs3QUSLaSXxg5nwIC0xLN2xk1g8gl64xgfaPhMRc60xO7I7YUStyztKzCOTLj+Jqp
	 1/n7PBPprsXwtSCpc7NCiIUz8NtA+np0PDMirhhGTDZHMkWmmein9Q4pQLsPIgr1cA
	 3RtE4xgP1m4zGLSh9pdE4cGs7fWZ/4JngfX9Fcxfin+otOcza615V+ryPkleT6NLnJ
	 zfpqMVXyzu2qw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B449739D5FD8;
	Tue, 13 Oct 2026 16:10:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: vexpress: Fixes for v7.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179190783926.417156.8943700807347309285.git-patchwork-notify@kernel.org>
Date: Tue, 13 Oct 2026 16:10:39 +0000
References: <20261007150034.624664-1-sudeep.holla@kernel.org>
In-Reply-To: <20261007150034.624664-1-sudeep.holla@kernel.org>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed,  7 Oct 2026 16:00:31 +0100 you wrote:
> Hi ARM SoC Team,
> 
> Please pull ! These came in recently and are in -next for a week now.
> I am sending these early for v7.4 as fixes instead of waiting until -rc1.
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: vexpress: Fixes for v7.4
    https://git.kernel.org/soc/soc/c/19e5b00239f1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


