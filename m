Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACFA9231A21
	for <soc@lists.linux.dev>; Fri,  9 May 2025 21:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746826791; cv=none; b=ncadME9sMveJDrki9IvCryOolErBEsOgOtvZbgftDQjONx93l/CDu9ihjK+pLYkD5c4Io91Y5S+ZPqzX3HNT5gFS2a/ifaFbotm6fGmFwsHKOu1rRawlNgRzDRzFjX4KxIMpCOzP6ZoF4a6fiZ8Bxex1HZ0EOzDN2OTfpi3krU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746826791; c=relaxed/simple;
	bh=xXidyLPZQhdIaxqtXOPasL/vkQeybKOYMGDzVq84GHc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=j/fZr9lU/rzV7k9Ie8XiItVl4dDiCXAInrDEZwBtmtAgamqNrRCgmGu2BDTOn2d/k2myFTcaCHe3y9Ur9L0ZNsjiHTxKymCpQ7oswNzv3Nuli2SD58RYP6If+a8FCJbA4g04cGCfU9UJisqY64JFDZLWFYjtyhziglG5AJM2/io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eLe1f6Fn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eLe1f6Fn"
Received: by smtp.kernel.org (Postfix)
	id 31FCBC4CEEB; Fri,  9 May 2025 21:39:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CB0FC4CEE4;
	Fri,  9 May 2025 21:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746826791;
	bh=xXidyLPZQhdIaxqtXOPasL/vkQeybKOYMGDzVq84GHc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=eLe1f6FnuSWr0Mi6blG/nkM/1keovIOLO7ifGAfDgsQo9ZNGedHyOiCa63W6vlpxq
	 F4ZAhxoNCEF8TvX7KUGpoRR5IJQ6JoHnF5ADlWd5IO+66oXU67sqmqtrpeOpOPl+CU
	 GMQFDDx5l1z/5obwmeMAG4HKiCnVQ5qa7bgVll2s/UfFEW1a2qXXh7m1UWhybZgUOh
	 W7UnugeQH7toPVYoLIWyFOW/NC9JDdSicme4h+Un9cJarrKVC23kCUsG/xTEkEqRXw
	 y0UwegNPQZIrofrtx2YvFaINUKHzLysz27WMFM4X0bx6pquoZtGynvRMKGZpyrQush
	 kUOkCtuKMMuMA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADC2639D61FF;
	Fri,  9 May 2025 21:40:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: amazon: Fix simple-bus node name schema warnings
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174682682924.3820180.9501287548125155141.git-patchwork-notify@kernel.org>
Date: Fri, 09 May 2025 21:40:29 +0000
References: <20250409210255.1541298-1-robh@kernel.org>
In-Reply-To: <20250409210255.1541298-1-robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed,  9 Apr 2025 16:02:54 -0500 you wrote:
> Fix a couple of node name warnings from the schema checks:
> 
> arch/arm64/boot/dts/amazon/alpine-v2-evp.dt.yaml: io-fabric: $nodename:0: 'io-fabric' does not match '^(bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'
> arch/arm64/boot/dts/amazon/alpine-v3-evp.dt.yaml: io-fabric: $nodename:0: 'io-fabric' does not match '^(bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> 
> [...]

Here is the summary with links:
  - arm64: dts: amazon: Fix simple-bus node name schema warnings
    https://git.kernel.org/soc/soc/c/09acc3266cdd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


