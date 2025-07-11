Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF51F18D
	for <soc@lists.linux.dev>; Fri, 11 Jul 2025 21:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752269901; cv=none; b=Arkql1r4B0BmdN9Mk5pszzC1pncIyEAvaT5dMqqaxQD+HVGsZFIyamIXTFYJ4gpEPeh4i8UG7NDx5hQ4WrGVwFA4UrAV/yrAgg8phgCqIot21cQZ3YIxYTtoYRDn6e6cdbdWIR1WmfSu81dKLg+TXKvXXNX5nOEUD51j3DD8Xrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752269901; c=relaxed/simple;
	bh=v5IByAVNY31roj+HWyOHzr8673SJyFZbql1IZchgM9c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t0vX0062+/0VBSwRr5Hcm6qM8BUtmb6IgVpPEetLj4qpTjuWh983qfYNMhSs4gYTTlXMyrRs8P/wK98AhbwxDCElu4WutDT5tkG89V1Cb5muTx+NYQANuO8POPDyNTtwMh8+JUWhDZ+az8Jgw6AUgm4/Lq9c9ql7geBCBDWqBP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=SiY7GNgQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="SiY7GNgQ"
Received: by smtp.kernel.org (Postfix)
	id 8FACAC4CEF0; Fri, 11 Jul 2025 21:38:20 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B1D97C4CEED
	for <soc@kernel.org>; Fri, 11 Jul 2025 21:38:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B1D97C4CEED
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7490acf57b9so1967710b3a.2
        for <soc@kernel.org>; Fri, 11 Jul 2025 14:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1752269899; x=1752874699; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ip2NHUGFdSS41IlhRj6535+lBtfJ/uxbQjk4PZKYAt0=;
        b=SiY7GNgQUQZrceR6jjYJmXYMrIMWkR+dkhZP3yGPl29LOWEhSkDythSpkukN6fWl5/
         hBFT+iTgY53rAn7XRBv+agofx3YKaOfaJ6LXfAKiaSRkXQS5AhA6am52rY+onG8W78Vo
         rQOrdPgdUhI7ZyMkI/z9uE1ZZUBRj9urdRxpc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752269899; x=1752874699;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ip2NHUGFdSS41IlhRj6535+lBtfJ/uxbQjk4PZKYAt0=;
        b=LYS9aUyUIcwdSuiK98ej8ThaU+NdvujaXruhfZBok1Hh6nqBKI6pg6L4vrOyxN7FSq
         EE6J+T0p7izf6SqBGSc48nz2Dmg9V5CIEkoka3iU0mWQrhETvkG+S31stXy0lua4hWhf
         K0mLGFOXwJIMTvnSlEYGUbt/PiuqGZF23+eiq3tSa6tIePudri3D2goaf1Jf8ye6MU3K
         AdjQsZqWVvEuGbgIgtjHzEOewIXU59mL3vhBhlCwkNBv2D0Ho9OSm2llQL2EkOT+4R2A
         OnnXv64WU8DygtLtDkdF/a12BcddULCqnxAoq1iYZXTHI4RZwxYzN37/HEN6/Rke4ta3
         sAdw==
X-Gm-Message-State: AOJu0YyaSrcgQPRv0bt21dvH9k4uRg0+7uEvCjkvy1mgUGFun25g2BV3
	pMytaU4LV//YMDnsW3hhn9clrlyfDoj1ocITlc/qPCOMZWFNb/gEkHM77G6/oBhIvQ==
X-Gm-Gg: ASbGncta9HxU4OaiMhIQnxYXAiV7GYe6mZyvwAajyLlLiwsD/c6GNgEq7QGmk1+r8Qb
	bKm++VPocpVck1laBZWSnvEccf2G/XqKj25HxqCIK+qwRgbOIJo4cffJe3jRnAz0ZWdLB5lfrsK
	2n92K05lFJr0UrzMBC47SYNdOum0EhOASFDNHeusSVignezznkbKOpavKjIkOJpby3Pr37tV+G9
	mvj3JUSFwjLt9sZnEHmDVIqZ9wurtOVyLE8MC/xz4469VgI6auRoY2Zi1xzkb4wq8iE605Tan1/
	6p+Q3mXpq3i9K9qiB4VLnmSdOSaWOSiB2Cpj1e/bmwZ/rOgq2IbqYn0rkeGK4G8XJtm/kemTEfr
	o4LcNO2zUHxcs4it8xJO5B78UCMTrr8+Z5bee4f+4jolfy0VhFFeAg0QeCmvkcA==
X-Google-Smtp-Source: AGHT+IGSqJ9ts19LWsnw45j+sShsIKoM2yf+ZMJscjEELOW0k1Ff3ZwF4w0vR3y2lh1oXihdKGcTzg==
X-Received: by 2002:a05:6a20:9f4d:b0:220:9e54:d5cc with SMTP id adf61e73a8af0-23120a0397bmr9173687637.31.1752269898863;
        Fri, 11 Jul 2025 14:38:18 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f1b360sm6033711b3a.78.2025.07.11.14.38.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 14:38:18 -0700 (PDT)
Message-ID: <f6df4328-f3c6-4326-a4b6-326685aebaeb@broadcom.com>
Date: Fri, 11 Jul 2025 14:38:14 -0700
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL 1/5] Broadcom defconfig-arm64 changes for 6.17
To: patchwork-bot+linux-soc@kernel.org, Arnd Bergmann <arnd@arndb.de>
Cc: soc@kernel.org
References: <20250630190216.1518354-1-florian.fainelli@broadcom.com>
 <175162020751.1782818.1640014464017504198.git-patchwork-notify@kernel.org>
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <175162020751.1782818.1640014464017504198.git-patchwork-notify@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/4/25 02:10, patchwork-bot+linux-soc@kernel.org wrote:
> Hello:
> 
> This pull request was applied to soc/soc.git (for-next)
> by Arnd Bergmann <arnd@arndb.de>:
> 
> On Mon, 30 Jun 2025 12:02:12 -0700 you wrote:
>> The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:
>>
>>    Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)
>>
>> are available in the Git repository at:
>>
>>    https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.17/defconfig-arm64
>>
>> [...]
> 
> Here is the summary with links:
>    - [GIT,PULL,1/5] Broadcom defconfig-arm64 changes for 6.17
>      https://git.kernel.org/soc/soc/c/241a3be47756
>    - [GIT,PULL,2/5] Broadcom devicetree changes for 6.17
>      (no matching commit)
>    - [GIT,PULL,3/5] Broadcom devicetree-arm64 changes for 6.17
>      (no matching commit)
>    - [GIT,PULL,4/5] Broadcom drivers changes for 6.17
>      (no matching commit)
>    - [GIT,PULL,5/5] Broadcom maintainers changes for 6.17
>      (no matching commit)

Arnd, can you also take the 3 other pull requests, it looks like only 2 
have been applied: devicetree-arm64 and defconfig-arm64. Please let me 
know if we need to do something different here, thanks!
-- 
Florian
