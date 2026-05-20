Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B87370AE9
	for <soc@lists.linux.dev>; Wed, 20 May 2026 10:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779273063; cv=none; b=Ajb4vHcHnoF3f7w7DDkxiRwV1ok3gMKU5MnPZX6jp4w12c6C1hd+JTAGTDnfuK8RobfwEGQ6ZBxXWeO0h3ARQ1U0y/PXXLnkMPjkKesMNTOXGHEvP3wTIPgm3dZdc48yoE6xwRxdfXrBuToVueijPDHX5Y/nJgdVKyj91NtQIno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779273063; c=relaxed/simple;
	bh=U6h9gc4YO6a1i9KMV4ld8n945eN62JfQfRwB271LjDE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=n6wZgzya+INDEMrPNfjLvObAmmYWx9egxlczOsO0SmMhSnSHlF3tIy8GREHsIfJ+rkLVUjqQCxGb5+nueDkvKW9Br2uAMLRu/IOM4IL+AlNllMLfz+desDrV3ouG/dKYWGeJ5D+L/bK2DYpgcG2wI0XP2nOwgzfGy/PppoAk2QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q8trtwck; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q8trtwck"
Received: by smtp.kernel.org (Postfix)
	id 1BFC91F00896; Wed, 20 May 2026 10:30:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06B191F000E9;
	Wed, 20 May 2026 10:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779273059;
	bh=8YqtAXAzrtRyRyEFIqDzYQ5c3bMjuyvFOXzOmbK/MH8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Q8trtwckOH+HNIEWcqFCj8Qtlt0/IAn+PAE3QHO9OWoeewCQ31YE6tRmZdDf7wHU9
	 UlfDQjQW7xXf9ssj/ZgnxQN3SRhxnxx75QRm+Xa1D3OOOV9YSB5Wj8KNNl8V67b7St
	 8U7cJwNRO9+FTMbXYxjizEH5RyjG5wxKvy+IXZM5bu/4TfKnRfe1QIeTgmCDoikvpX
	 K4MinN0mq18DQiXWwRlz4NtkkywzL6mA54sr/Mb5BCMLT8y3L02Ys6WTlNTA1TSYGE
	 YuQOlx+S8JrtX+w1LLPU7SR/q1cBbdchK3btium0v6b3lMsQ/PNgzYYtxQLm8QXgYF
	 HaJJHmRdeFvhw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0A453930A0E;
	Wed, 20 May 2026 10:31:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3] arm64: defconfig: Enable PCI M.2 power sequencing
 driver
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <177927306951.3101306.5919071818164776130.git-patchwork-notify@kernel.org>
Date: Wed, 20 May 2026 10:31:09 +0000
References: <20260514065017.11305-1-manivannan.sadhasivam@oss.qualcomm.com>
In-Reply-To: <20260514065017.11305-1-manivannan.sadhasivam@oss.qualcomm.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 14 May 2026 12:20:17 +0530 you wrote:
> POWER_SEQUENCING_PCIE_M2 driver handles power supply to the PCIe M.2
> connectors and is required on wide variety of ARM64 platforms such as
> Qcom Snapdragon X Elite laptops and Mediatek Dojo Chromebooks.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> [...]

Here is the summary with links:
  - [v3] arm64: defconfig: Enable PCI M.2 power sequencing driver
    https://git.kernel.org/soc/soc/c/35f2514c8ff3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


