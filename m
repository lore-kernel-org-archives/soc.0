Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FA53AC2B
	for <soc@lists.linux.dev>; Thu,  3 Oct 2024 05:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727932889; cv=none; b=ewSVAmTAHv8KLRG14A9XYwJ+YBVtncZJnNF5UR7TSWjzfcSI2TNJ8ARCREFpMNxQt0ZrR0H35xqovCA1Qc2mcihaUXhryXtjHPGN9cwXKuS5vyrgZtOsbF8pVdtJcgHXesVqMM1E+Zo4KyXDWhR/MvYTROLiTknjQ7mURclxVpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727932889; c=relaxed/simple;
	bh=TLlYfqsej1jvMOodcxUf7H4bpjzZHIIQhryYVpzqnd0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=uxTsx7RVkfKEcaVGockWuQlDDzYAxa6r2ztS4oMsW9A2pcbvw2yLU97zY7uftpdSVYTdlVInvJU+5yHrzoZXgKnFCNJtPm0tFNuGk9iXUv1OBqS//XdNu7VBcJEn+mb3yxKMYRaaakPvED/Tv8hku7xm62+D1zlR1dgTQlQisGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 69D80C4CECC; Thu,  3 Oct 2024 05:21:29 +0000 (UTC)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 06FD7C4CEC7
	for <soc@kernel.org>; Thu,  3 Oct 2024 05:21:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 06FD7C4CEC7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4XK0QY4jZbz9sPd;
	Thu,  3 Oct 2024 07:21:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pJL9cLjZYQ63; Thu,  3 Oct 2024 07:21:25 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4XK0QY3xKXz9rvV;
	Thu,  3 Oct 2024 07:21:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 759BB8B766;
	Thu,  3 Oct 2024 07:21:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id LiKfHjcgrxAl; Thu,  3 Oct 2024 07:21:25 +0200 (CEST)
Received: from [192.168.233.90] (unknown [192.168.233.90])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 3D0028B763;
	Thu,  3 Oct 2024 07:21:25 +0200 (CEST)
Message-ID: <c954bdb0-0c16-491a-8662-37e58f07208f@csgroup.eu>
Date: Thu, 3 Oct 2024 07:21:24 +0200
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [GIT PULL] SOC FSL fixes for 6.12
To: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>
Cc: Herve Codina <herve.codina@bootlin.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Content-Language: fr-FR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Arnd,

Please pull the following Freescale Soc Drivers fixes for 6.12

Thanks
Christophe

The following changes since commit 7a99b1c0bce5cf8c554ceecd29ad1e8085557fd3:

   Merge branch 'support-for-quicc-engine-tsa-and-qmc' (2024-09-03 
07:51:34 +0200)

are available in the Git repository at:

   https://github.com/chleroy/linux.git tags/soc_fsl-6.12-3

for you to fetch changes up to 1117b916f541fc8e4ce812843555432022e5aa0e:

   soc: fsl: cpm1: qmc: Fix unused data compilation warning (2024-10-02 
23:29:38 +0200)

----------------------------------------------------------------
FSL SOC fixes for v6.12:

- Fix a "cast to pointer from integer of different size" build error
due to IS_ERROR_VALUE() used with something which is not a pointer.

- Fix an unused data build warning.

----------------------------------------------------------------
Geert Uytterhoeven (1):
       soc: fsl: cpm1: qmc: Do not use IS_ERR_VALUE() on error pointers

Herve Codina (1):
       soc: fsl: cpm1: qmc: Fix unused data compilation warning

  drivers/soc/fsl/qe/qmc.c | 11 +++++------
  1 file changed, 5 insertions(+), 6 deletions(-)
