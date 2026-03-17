Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24D43469FC
	for <soc@lists.linux.dev>; Tue, 17 Mar 2026 08:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773737509; cv=none; b=blbNAdrq9gtbEsI8TCsY0mMAUuJEDkhQlJM2oR3+vQujI0jEGeKUK1Hpds/a1zSl+Loql20G3LCuRLtcUQhv9ooGbxK8ohbbQALBp2s6eMtGnK9gcbo9U9kvSZ8SIYozjoFuTKOrB2lEE/6qMn/GNT4COzZ+bQw9Hs+8bu2j0rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773737509; c=relaxed/simple;
	bh=F35u330TQ0Qd2K1i6G71PgX+7Rk66KGKZfQeptXDdCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HTIHaIUrSuL64Ti6PxiDSxeSKdMsIiylhwJTD7IwRZoJb3uG3g0kTdN92tAuMJA1Dk0d/D1UDwO1Fo2zcOVeqHPcG17wCwVCEAIOEd1xaxAgLeJ4/J0GF67NylVOhaaIkdQDYQLXvfWPspU9eqIYfKv4ZXboXJiqQ8Q1OnPTrcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UGvPOCOa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UGvPOCOa"
Received: by smtp.kernel.org (Postfix)
	id BA6BEC2BCB0; Tue, 17 Mar 2026 08:51:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45CC3C19425;
	Tue, 17 Mar 2026 08:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773737508;
	bh=F35u330TQ0Qd2K1i6G71PgX+7Rk66KGKZfQeptXDdCM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UGvPOCOamZpkSFYoFUEh9RdRoPLUAjOrQOj2CX04QJLVvLxls6WoCaEeSZ+e0pCPl
	 AsuauYcBKqUna8nFH3oGiaFVq3R1ezq3LQIDZyWlisNU1HU1DL5apyfkL/IW/eVvRH
	 mnZeNdt1KL8MrPis8aNyHi1gRUCE0sLNXNXRfhCbekWmTCRZwRed+8cUubxC6yGh3O
	 WHmmq4azcKblyaRY1aroLC/xbLwx4MXg4wkEWHpxenz/4MjfumhYmqUm+eQh/yCmk3
	 bHGqrEWojNHx7ToVHtIKBaIpdXW2nCFAimnkfs9UE1osTvy9AdOGgDbCfczUpopqra
	 iMEHTJ8p8Y4Bg==
Date: Tue, 17 Mar 2026 09:51:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: arm@kernel.org, soc@kernel.org, linux-kernel@vger.kernel.org, 
	op-tee@lists.trustedfirmware.org
Subject: Re: [GIT PULL] TEE shared memory fix for 7.0
Message-ID: <20260317-illustrious-finicky-frog-90a86c@quoll>
References: <20260316074150.GA2474723@rayden>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260316074150.GA2474723@rayden>

On Mon, Mar 16, 2026 at 08:41:50AM +0100, Jens Wiklander wrote:
> Hello arm-soc maintainers,
> 
> Please pull this patch removing the refcounting of kernel pages within
> the TEE shared memory helper. 
> 
> Thanks,
> Jens
> 
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee.git tags/tee-fix-for-v7.0
> 
> for you to fetch changes up to 08d9a4580f71120be3c5b221af32dca00a48ceb0:
> 
>   tee: shm: Remove refcounting of kernel pages (2026-03-03 09:03:04 +0100)
> 
> ----------------------------------------------------------------
> TEE shared memory update for 7.0
> 
> Remove refcounting of kernel pages in register_shm_helper() to support
> slab allocations.

That's a supposed fix for a year old commit, not current RC, and the
commit msg does not explain what is the bug being fixed here. Looks like
it is doing improvement, not a fix. Can you provide here more
explanation of the actual bug being fixed to justify this going to
current RC fixes?

> 

Best regards,
Krzysztof

