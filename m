Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0D6346A1A
	for <soc@lists.linux.dev>; Wed,  7 Jan 2026 17:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767805412; cv=none; b=UWqidfME2Q+qmb3ZN08s297l/fgoQ0NElUtJ1EMb5sDceF7/CUfZtKozld1jxMusXOGEudOUL6uUhjOTiSfN6S//1vpyLZzT2C+NvdaB8j9eZWvJ3STympX8Ee8a2r+h+5JST3bqfiLZdcVZI4tn6DlPqSZq0npmfk7vaBG5+pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767805412; c=relaxed/simple;
	bh=UQghhgErbZqUCSbNgBjhSkS41FFKG4khs5RMeqA+k3g=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=DBVrmV0B80P1cDRf5mTl59WN3NfYcmoy+z1PZHfBpbOiV6v4XBZxxSj0oPvs+rxTAHCcUJEv4mq/Dc8H10vh6ChM0o/kSQ+HQjcCTGa15H8UUqHFzkHk38z8fqK12Ii+I7QKejDtr2Fesmf5mzpQraBp7C/DqytZZg2ytDv0LQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LnumtQKt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LnumtQKt"
Received: by smtp.kernel.org (Postfix)
	id 4A1D2C4CEF7; Wed,  7 Jan 2026 17:03:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3476BC4CEF1;
	Wed,  7 Jan 2026 17:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767805412;
	bh=UQghhgErbZqUCSbNgBjhSkS41FFKG4khs5RMeqA+k3g=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=LnumtQKtnbFnXTr6DWht61/jBsZJMAu3dMW164oUmvP+O95YwHJmChwrxwsIslSH0
	 n+HVeI3u7k+WmdtlFw1/Ivh4lHpHOGWzCo5j8NFdBwHTrqSDOghgcuh83v5C2hyiKU
	 yqWt2aMicXlYQCIvocd4AHRsyTmgpXupGSICcaAGydKRk28bsZ/ETf3zZiauVD39BK
	 rx51Sk4BuTXWb7dLJNExu7PuBUid+BfdF1a+eCH2NamT1L9EnoBeDClf8PcgNofqdU
	 /Bkr+DqZRkFbc/TE1Y6AtWCkdWo71nkhSnsKnrMLWdIxvb+jXY3i7utbifUUsCHEms
	 l+pvzHqP6oYaQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 78C183A40FD1;
	Wed,  7 Jan 2026 17:00:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/2] Documentation/process: maintainer-soc: Be more
 explicit
 about defconfig
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176780520927.2859028.11389473869232911364.git-patchwork-notify@kernel.org>
Date: Wed, 07 Jan 2026 17:00:09 +0000
References: <20251223142726.73417-3-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20251223142726.73417-3-krzysztof.kozlowski@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 23 Dec 2025 15:27:27 +0100 you wrote:
> It is already documented but people still send noticeable amount of
> patches ignoring the rule - get_maintainers.pl does not work on
> arm64/configs/defconfig or any other shared ARM defconfig.
> 
> Be more explicit, that one must not rely on typical/simple approach
> here for getting To/Cc list.
> 
> [...]

Here is the summary with links:
  - [1/2] Documentation/process: maintainer-soc: Be more explicit about defconfig
    https://git.kernel.org/soc/soc/c/6efe5322f060
  - [2/2] Documentation/process: maintainer-soc: Mark 'make' as commands
    https://git.kernel.org/soc/soc/c/51183d3ff553

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


