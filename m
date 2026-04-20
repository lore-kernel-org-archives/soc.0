Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE95A2DC76C
	for <soc@lists.linux.dev>; Mon, 20 Apr 2026 16:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776700805; cv=none; b=lrFNLuQl/a+eAjhepbAJ9UaJCuhasrsYITxwNIXxXDs3Vqkue4pdhVYTaLTHDLKGZ4VR7Fp8LwfKm1xc/t+jus5JGY05vbPFv4HlUfJRsXlbP9BYqRZlevBy8ITYHuGTc3gXSwlT906OBW02xNn9p7keEbJ3tccKSJPvNLCcW1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776700805; c=relaxed/simple;
	bh=Xw7eeoTaGouu3lPZjSmWsGyQqY3Day+hMshBkH+YFxU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=ki8FAFK5n9k6cAKBLHzOOLe2kk7QIuzXW6d7RCqkG94KwUuVouJGUe7NX4YkeKmXV1HeEBJl5+K5wX4y522/9hhpBNXROZ88pbjVeylV+Q8EKoFgQvd1MCDoD7/nqwAwiJfpisdbgYK5HolAXc4HkiSolIzQqS9znV+Tj12FYBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ln7ob959; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ln7ob959"
Received: by smtp.kernel.org (Postfix)
	id BA7FEC2BCB4; Mon, 20 Apr 2026 16:00:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4B94C19425;
	Mon, 20 Apr 2026 16:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776700805;
	bh=Xw7eeoTaGouu3lPZjSmWsGyQqY3Day+hMshBkH+YFxU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ln7ob9594J/f4uLZ021O49CyaroNNY4LpLcAVkTc8j+aF0u0RpDh1XAdBX50ypwx/
	 DedmZvFntgiz6fDPBGajPmyaXq5Dp7ZFqIhjQk9Hk1/PidJ6pns3W5FqmMssZGPj+Q
	 T2Q3T2n9pWHmTIAebZr9P3xqekG8oE0QyRjU4Vta6PZqmlItnOF22XxbpxScYpnNe/
	 uCs9Pj8TzFXGynN4Z0OpVGpPhIYzIa1/OGCsgtLgNg8MXX/Ij+yEOopouHJc1Q6tPX
	 ZASRmbM8sCUqOqp5zcTj9CiXXOqCF7xXRjECxlF80eK4jw63k7ksb2uExBjLNTAVH5
	 0S5xv1Qh/gCOg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CE50393000C;
	Mon, 20 Apr 2026 15:59:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] [v2] ARM: dts: bcm4709: fix bus range assignment
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <177670077004.1706382.3512415590482165274.git-patchwork-notify@kernel.org>
Date: Mon, 20 Apr 2026 15:59:30 +0000
References: <20260414064754.3129667-1-arnd@kernel.org>
In-Reply-To: <20260414064754.3129667-1-arnd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 14 Apr 2026 08:47:46 +0200 you wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The netgear r8000 dts file limits the bus range for the first host
> bridge to exclude bus 0, but the two devices on the first bus are
> explicitly assigned to bus 0, causing a build time warning:
> 
> /home/arnd/arm-soc/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts:142.3-27: Warning (pci_device_bus_num): /axi@18000000/pcie@13000/pcie@0/pcie@0,0/pcie@1,0:bus-range: PCI bus number 0 out of range, expected (1 - 255)
> /home/arnd/arm-soc/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts:142.3-27: Warning (pci_device_bus_num): /axi@18000000/pcie@13000/pcie@0/pcie@0,0/pcie@2,0:bus-range: PCI bus number 0 out of range, expected (1 - 255)
> 
> [...]

Here is the summary with links:
  - [v2] ARM: dts: bcm4709: fix bus range assignment
    https://git.kernel.org/soc/soc/c/b1bf0efcd9a5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


