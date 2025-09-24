Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4933128AD
	for <soc@lists.linux.dev>; Wed, 24 Sep 2025 16:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758730836; cv=none; b=RPlXyyBBh+S33GMt7TSRy3BJeAJSkYmWuqK1PiZiIw5sUq8t/LvKRbwpp1mhkVThewgNY2n9rHP/7RnMAnxGTPEd//v2DJf6lNRU6U8lWJGzy6FuPY+yB9mSL4iDbaFBpnB6YY+em4PL6uywxYMTxX0/03JU26atLe+Z70MPMCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758730836; c=relaxed/simple;
	bh=+M9kI5puvs6+L8yEYgsKp+kkZvQcLsagU1dBNyCsDTY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=E/Axqp4kekX44hXYFGIo1cQJq72Yr4Hdn48L8u/PmISxdtVRh5iTWNy2PpwWT94oQ0yeM4sIe8NUdJMMH8dsoislMlU9tSvcxirIGLTrbsZpTFHO20sXOX/NZ0Fn1kiHOe8xozrB+MI57qzh/kjL2aJRv3ZKvvWYkV6DpdHXm/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 40846C4CEF0; Wed, 24 Sep 2025 16:20:36 +0000 (UTC)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.kernel.org (Postfix) with ESMTP id DF014C4CEE7
	for <soc@kernel.org>; Wed, 24 Sep 2025 16:20:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DF014C4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cX1pJ594cz9sSp;
	Wed, 24 Sep 2025 18:02:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2C3WRkuK0BC9; Wed, 24 Sep 2025 18:02:48 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cX1pB5TL1z9sST;
	Wed, 24 Sep 2025 18:02:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id AD7AF8B763;
	Wed, 24 Sep 2025 18:02:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 0UckyDH9Fa_j; Wed, 24 Sep 2025 18:02:42 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 45BB28B768;
	Wed, 24 Sep 2025 18:02:42 +0200 (CEST)
Message-ID: <26615a15-3494-435f-b0c1-861122b4b5e1@csgroup.eu>
Date: Wed, 24 Sep 2025 18:02:41 +0200
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [GIT PULL] SOC FSL for 6.18
To: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Language: fr-FR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Arnd,

Please pull the following Freescale Soc Drivers changes for 6.18

The bus/fsl-mc changes outside soc/fsl tree are acked by maintainer of 
QORIQ DPAA2 FSL-MC BUS DRIVER.

Thanks
Christophe

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

   https://github.com/chleroy/linux.git tags/soc_fsl-6.18-1

for you to fetch changes up to 5498f07842cbddd86c725b960acb8e478684ca45:

   soc/fsl/qbman: Use for_each_online_cpu() instead of for_each_cpu() 
(2025-09-22 21:31:08 +0200)

----------------------------------------------------------------
FSL SOC Changes for 6.18:
- Use for_each_online_cpu() instead of for_each_cpu() in qbman
- Update FSL QUICC ENGINE GPIO driver to a standard platform driver
and stop using legacy-of-mm-gpiochip.h header
- Misc fixes on bus/fsl-mc

----------------------------------------------------------------
Chelsy Ratnawat (1):
       bus: fsl-mc: Replace snprintf and sprintf with sysfs_emit in 
sysfs show functions

Christophe Leroy (2):
       soc: fsl: qe: Change GPIO driver to a proper platform driver
       soc: fsl: qe: Drop legacy-of-mm-gpiochip.h header from GPIO driver

Fushuai Wang (1):
       soc/fsl/qbman: Use for_each_online_cpu() instead of for_each_cpu()

Salah Triki (1):
       bus: fsl-mc: Check return value of platform_get_resource()

  arch/powerpc/platforms/Kconfig          |   1 -
  drivers/bus/fsl-mc/fsl-mc-bus.c         |   9 ++-
  drivers/soc/fsl/qbman/qman_test_stash.c |   2 +-
  drivers/soc/fsl/qe/gpio.c               | 139 
+++++++++++++++++---------------
  4 files changed, 82 insertions(+), 69 deletions(-)
