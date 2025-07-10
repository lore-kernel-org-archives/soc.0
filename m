Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DF72882B4
	for <soc@lists.linux.dev>; Thu, 10 Jul 2025 06:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752130240; cv=none; b=ejNdXP3nfT8pBmvkfoft5MP81eofnf/G0sRPVcRZ/F4zFGMo7hpVqGdy7YWUDBH8FMcFEViTF9P+gG/92mbuJe0WdfhGDgSYQev+sl/3itB5/mCUA2kiqDYywiQN8c8Rz5GhitzcrJz6pHmsc2X2AmRQbbnEubw77fLpIKCpM6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752130240; c=relaxed/simple;
	bh=KnGAdQxEVp5FaRAYi/FCTRHf4G7dnqfhDf42/ixgYCk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=I5YM4f01OKRQ4KrT3SpnQmmN7EcAawVOAvEm+EXlsapZqIP8KsZiOllsnyZs+P9y2Y7hWHM4Bbu2qWGPIrSsR3grlXHc4WyBOXIHlpXGrfUfJJIYJ3D3rhXxiyIj0SnDw8Wuz6aOwtrEhF3L12JBjSDPrTYYRVjYZxk/o3phWQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 78531C4CEF5; Thu, 10 Jul 2025 06:50:40 +0000 (UTC)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by smtp.kernel.org (Postfix) with ESMTP id 3B74EC4CEE3
	for <soc@kernel.org>; Thu, 10 Jul 2025 06:50:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3B74EC4CEE3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bd51H2snqz9tZl;
	Thu, 10 Jul 2025 08:44:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PD7tMD8jOn9n; Thu, 10 Jul 2025 08:44:35 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bd5145bZgz9tHZ;
	Thu, 10 Jul 2025 08:44:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B8A8E8B76D;
	Thu, 10 Jul 2025 08:44:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id TUROZSHQu4HZ; Thu, 10 Jul 2025 08:44:24 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 842D18B763;
	Thu, 10 Jul 2025 08:44:24 +0200 (CEST)
Message-ID: <c947d537-cae5-44f0-abd8-0c558bac46d2@csgroup.eu>
Date: Thu, 10 Jul 2025 08:44:23 +0200
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [GIT PULL] SOC FSL for 6.17
To: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Language: fr-FR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Arnd,

Please pull the following Freescale Soc Drivers changes for 6.17

The tegra change is outside soc/fsl tree but it is acked by maintainer 
of DRM DRIVERS FOR NVIDIA TEGRA.

Thanks
Christophe

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

   Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

   https://github.com/chleroy/linux.git tags/soc_fsl-6.17-1

for you to fetch changes up to 76760b9dbbf8088ef31afb60d92b955f88ad1288:

   soc: Use dev_fwnode() (2025-07-08 10:29:28 +0200)

----------------------------------------------------------------
FSL SOC Changes for 6.17:
- Use dev_fwnode() instead of of_fwnode_handle()
- Use new GPIO line value setter callbacks

----------------------------------------------------------------
Bartosz Golaszewski (1):
       soc: fsl: qe: use new GPIO line value setter callbacks

Jiri Slaby (SUSE) (1):
       soc: Use dev_fwnode()

  drivers/soc/fsl/qe/gpio.c  | 6 ++++--
  drivers/soc/fsl/qe/qe_ic.c | 3 +--
  drivers/soc/tegra/pmc.c    | 3 +--
  3 files changed, 6 insertions(+), 6 deletions(-)
