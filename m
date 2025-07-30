Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCD11E5B7C
	for <soc@lists.linux.dev>; Wed, 30 Jul 2025 06:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753856437; cv=none; b=TPsn0NbYW1DlykpyPuiAzibEWDCmQoggEoPIVh4GCYq4kuXhqGouRsaZ1ZdzmEyffSSEBjR80gCqhW6e6MCFUI7CtBGOmhPV9ldkURjM+GWv6PfsNYfeM3y4JvrwSfd/s1FK7wJWgG5NV47EHxTgc3nI4J6Lcj9kdosmTAZD/sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753856437; c=relaxed/simple;
	bh=nKY0YqG4t9mznqNAUvd95M6TzmSQjIk5LRlskSPR1Ik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LhN5JFyxu/qM79fkMRO+Pl7I4OgxqrX27AXGb6jRncgeyEf9a1LQ8wIptikzVcFWca7ykzNBH7CU/2PKy5HhIjbqO2QR8z8sPR08zTYQ7e7RJistODhGTIEf3BK9rGyAQL4/Gy0mn9YWdxrPfiuQIM28AMzUdQNoo18DVE0j24E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id D5507C4CEF6; Wed, 30 Jul 2025 06:20:36 +0000 (UTC)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by smtp.kernel.org (Postfix) with ESMTP id 836BDC4CEE7;
	Wed, 30 Jul 2025 06:20:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 836BDC4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bsMJX4rC6z9sN6;
	Wed, 30 Jul 2025 08:10:20 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kvx3b491i35a; Wed, 30 Jul 2025 08:10:20 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bsMJX41K8z9s92;
	Wed, 30 Jul 2025 08:10:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 7FE3B8B76C;
	Wed, 30 Jul 2025 08:10:20 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 3j76NxDL4snr; Wed, 30 Jul 2025 08:10:20 +0200 (CEST)
Received: from [10.25.207.160] (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 57D8F8B763;
	Wed, 30 Jul 2025 08:10:20 +0200 (CEST)
Message-ID: <b885d194-dee0-4cc8-ad85-25949baf02b3@csgroup.eu>
Date: Wed, 30 Jul 2025 08:10:20 +0200
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] SOC FSL for 6.17
To: Krzysztof Kozlowski <krzk@kernel.org>, soc@kernel.org,
 Arnd Bergmann <arnd@arndb.de>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <c947d537-cae5-44f0-abd8-0c558bac46d2@csgroup.eu>
 <cb913a0a-0f3f-4890-aa1f-1b01ec9c564e@kernel.org>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <cb913a0a-0f3f-4890-aa1f-1b01ec9c564e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Le 18/07/2025 à 11:23, Krzysztof Kozlowski a écrit :
> On 10/07/2025 08:44, Christophe Leroy wrote:
>> Hi Arnd,
>>
>> Please pull the following Freescale Soc Drivers changes for 6.17
>>
>> The tegra change is outside soc/fsl tree but it is acked by maintainer
>> of DRM DRIVERS FOR NVIDIA TEGRA.
>>
>> Thanks
>> Christophe
>>
>> The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:
>>
>>     Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)
>>
>> are available in the Git repository at:
>>
>>     https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fchleroy%2Flinux.git&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C2a2edd9aede449ece30d08ddc5dccf65%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638884274336423091%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=t2mexcfPjeKLqozoB28iCbWbrQY40jEdaaJ%2FHnyKSEY%3D&reserved=0 tags/soc_fsl-6.17-1
>>
>> for you to fetch changes up to 76760b9dbbf8088ef31afb60d92b955f88ad1288:
>>
>>     soc: Use dev_fwnode() (2025-07-08 10:29:28 +0200)
>>
>> ----------------------------------------------------------------
>> FSL SOC Changes for 6.17:
>> - Use dev_fwnode() instead of of_fwnode_handle()
>> - Use new GPIO line value setter callbacks
> 
> It has been many days and I still do not see this patch in linux-next.
> Please confirm that you properly feed linux-next and for how long this
> patch was sitting there (BEFORE you send them to upstream maintainer).

Until recently I was relying on my branch poping up into linux-next once 
merged into the soc tree.

Since monday last week it is now included in linux-next independently.

Christophe
