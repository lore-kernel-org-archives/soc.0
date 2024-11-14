Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6133629429
	for <soc@lists.linux.dev>; Thu, 14 Nov 2024 14:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731593309; cv=none; b=CgQhsTNdsEkxwJnLgG51MzF6oY155IaBEDH/crFY/71tO4fKdg1yruMU9CYKfv+OqAzDHLW8rxcjlZJ1FE6Z13spgfe7wjb/y3DFovAyE3xBVgrKsukCDmQOlMt8A8+MxzNgJVcj4c8bLq1n4Vtz1UCgW4tZ/x7tmFBgU1GaINA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731593309; c=relaxed/simple;
	bh=4tmLsYzGf/MJXXRAi6PqnuCEZuoR301b1aVT0OhXBcA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=tzFkOUrJ8hfdM8cM8d8Eav3+34HBGGOZYffWwa+7Qgxo4pid/0pjkMQRSV9T9rioS/w8qN4eC1IgldqWnL53amurX3ft98sqyTnldOisJIQUn8Tu1KdZ6doXlK9GsE9XGLzgg3hBkZOYVb2FG7EpQDDRASOz8fN9lv5Sp5PXQxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id EBC21C4CED4; Thu, 14 Nov 2024 14:08:28 +0000 (UTC)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7A1A6C4CECD
	for <soc@kernel.org>; Thu, 14 Nov 2024 14:08:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7A1A6C4CECD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Xq27F2SZsz9sSc;
	Thu, 14 Nov 2024 15:08:25 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XJP1MnpOcJTL; Thu, 14 Nov 2024 15:08:25 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Xq27C6DdPz9sSd;
	Thu, 14 Nov 2024 15:08:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C73C08B7A0;
	Thu, 14 Nov 2024 15:08:23 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 3a5FcjBVyalq; Thu, 14 Nov 2024 15:08:23 +0100 (CET)
Received: from [192.168.232.55] (unknown [192.168.232.55])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 822F78B763;
	Thu, 14 Nov 2024 15:08:23 +0100 (CET)
Message-ID: <c3c4961b-fe2a-4fcc-a7a1-f8b5352e09a2@csgroup.eu>
Date: Thu, 14 Nov 2024 15:08:23 +0100
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [GIT PULL] SOC FSL for 6.13
To: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>
Cc: Herve Codina <herve.codina@bootlin.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
Content-Language: fr-FR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Arnd,

Please pull the following Freescale Soc Drivers changes for 6.13

Thanks
Christophe

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

   Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

   https://github.com/chleroy/linux.git tags/soc_fsl-6.13-1

for you to fetch changes up to cb3daa51db819a172e9524e96e2ed96b4237e51a:

   soc: fsl: cpm1: qmc: Set the ret error code on platform_get_irq() 
failure (2024-11-14 08:26:15 +0100)

----------------------------------------------------------------
FSL SOC changes for 6.13:

- Fix a missing of_node_put() in RCPM
- Fix a missing error code on failure in CPM1 QMC
- Switch to using for_each_available_child_of_node_scoped() in CPM1 TSA

----------------------------------------------------------------
Herve Codina (1):
       soc: fsl: cpm1: qmc: Set the ret error code on platform_get_irq() 
failure

Javier Carrasco (2):
       soc: fsl: cpm1: tsa: switch to 
for_each_available_child_of_node_scoped()
       soc: fsl: rcpm: fix missing of_node_put() in 
copy_ippdexpcr1_setting()

  drivers/soc/fsl/qe/qmc.c |  4 +++-
  drivers/soc/fsl/qe/tsa.c | 28 ++++------------------------
  drivers/soc/fsl/rcpm.c   |  1 +
  3 files changed, 8 insertions(+), 25 deletions(-)
