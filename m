Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E8F19F13F
	for <soc@lists.linux.dev>; Tue, 29 Jul 2025 21:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753823028; cv=none; b=MkehaSvopXcqKx9ayaaFzfx5f+o3WK1rMUkvIDTkhCWjD83xwtHcFjFTN+0O9shbAhcpYQG9MubgW98K7vhRsresfNbau3KIL+d2ONBk+n5YXEEpMyFYT6RaIsVR13XmXFgIiG3bXRn5lf8XCTnjgZylC6o+JXPlgkQH+zVNlhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753823028; c=relaxed/simple;
	bh=A/qMqnx4c867Iu/Or6YGA9DrO2CNVDmS08ipGlCNFC0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DSHOQ83WJG3HWXmrUZuUoAJfo3rYNLHlnrEv9nzfiGvlLuD1QcMYT46nwu/gePcAwxcG62kzZe8gsKGdnthRGjYnIFpqUtyv2gf5O9/ThBNOWEv5qXpM4Q4/2l/ANJeKp2AQSN2/y1Z5f5KJFNZNM/ce6wUk8pLhjb9hocLcTWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=CHTR14gh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="CHTR14gh"
Received: by smtp.kernel.org (Postfix)
	id 27135C4CEF8; Tue, 29 Jul 2025 21:03:48 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 42D6FC4CEEF
	for <soc@kernel.org>; Tue, 29 Jul 2025 21:03:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 42D6FC4CEEF
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-7074bad053aso20656866d6.3
        for <soc@kernel.org>; Tue, 29 Jul 2025 14:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1753823026; x=1754427826; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+rPXKsCA+dPRWArmcN3YT+cIXsoHEjyomHliSYwpeYc=;
        b=CHTR14ghF+20eVJNXr6+1G/do1EQSV7XHg8BEHgycMpkAOmyOot6MSoxh3xY/BNfj9
         B8hXuO1ocf0EXVM5gfG0EWwN/98Y4KI8VYHV6td+y16NpE5eQi79b2p1zpM1B6rxR+EZ
         4X5zSzX1mU58KCmP3oa7D4vXcnONtGG+Kd+gc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753823026; x=1754427826;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+rPXKsCA+dPRWArmcN3YT+cIXsoHEjyomHliSYwpeYc=;
        b=nfVXIi1cYlZacPxcfzgJlFIGBFSn3KwUTD63tkyVeyQKAc8Ab97yOVLtKRvp8gcWQa
         r5QBZdGe0uw8yb4MfO5YShNKrLJAGrDPuZTUgeDoI/nzluH7VukzjSyQR9EXLBYhljIt
         ZtcP4xe4ABe9QBTJu225Qvyy18hD6VBn/FQijDja7LWTdJK6cm5Ty3KoP9zeM7D3K+n7
         3yNy1kZMx1f9THPs6INOQbvGp0pVBt6Mz2I7CeyoalQOR6W15VUn0ow7XSSXFqJ2kAjf
         9metCV77s3R/KoG0lqeTV6NtxBVpHfNk906vTntOiuUgXwPeAOdPF2UUFuJUDUfVzebM
         OLbg==
X-Gm-Message-State: AOJu0Yxr2Wmx2wmeWRD1nmygbSE5hvB9EVBZuIDaZZrQrDIUUSSz7RKv
	owg2WcsfX6/rBME78yTALOX/+lx+b4q48lB14NW/bgNhLOxLVGAbUp3lMEjlX5dPlMfBm2PipQP
	dka5tWQ==
X-Gm-Gg: ASbGncvkScskDm2A6p+xpNYGHc38tR7j1D3yQjllJvaA75IoLvfIyvTKB5BrHmVcNVv
	kkyv6Nh39wLXE2qC0O/K2gGs0s2utQ6Megd/W7IVQs/iew8uUeVIANHKNBsf/uzfB0kvpsf9gYL
	gaYqfi/kGA8PwX9+/1F0+oHm00r/AEPAgbIXLjctvYZv7/CsGKtmTn18jhNDgxKtkbYPSvQx+LO
	UF2EGylQZ+QxUoFNeV4V+N47ZUiyoFIav7qT8zZqA3WO+t7znmsvxVBko1JRL94kdXGBLsy12ps
	kDaza0TNxUGH17dw0M37yRyt/YFvet1ZfkpkJ9hGmQH0NGJI8n05Ea03L2NR+5Vc9UF1h6e7KTb
	uIqjlSt56FtgKBrMPt23Icq/WAylCsNCkaA5BTcSdBHAiNF+LEEAZceYoXgvHgQ==
X-Google-Smtp-Source: AGHT+IE0+BAUV3EYaBn0dLHQGzxapsMgJMs0rsn+z9buZALFKNTS5nfkpJVW7AtLtNBWUFZwvoKjxA==
X-Received: by 2002:a05:6214:cc6:b0:707:4d17:e280 with SMTP id 6a1803df08f44-707671e8f20mr14808296d6.28.1753823026050;
        Tue, 29 Jul 2025 14:03:46 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ae98dcd600sm55071711cf.0.2025.07.29.14.03.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jul 2025 14:03:45 -0700 (PDT)
Message-ID: <965bf9c1-0da6-4851-a106-f90eeceebe96@broadcom.com>
Date: Tue, 29 Jul 2025 14:03:44 -0700
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL 1/5] Broadcom defconfig-arm64 changes for 6.17
To: Andrea della Porta <andrea.porta@suse.com>, Arnd Bergmann <arnd@arndb.de>
Cc: soc@kernel.org, patchwork-bot+linux-soc@kernel.org
References: <20250630190216.1518354-1-florian.fainelli@broadcom.com>
 <175311192825.94241.11000772896570883971.git-patchwork-notify@kernel.org>
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
In-Reply-To: <175311192825.94241.11000772896570883971.git-patchwork-notify@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Arnd,

On 7/21/25 08:32, patchwork-bot+linux-soc@kernel.org wrote:
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
>      (no matching commit)
>    - [GIT,PULL,2/5] Broadcom devicetree changes for 6.17
>      (no matching commit)
>    - [GIT,PULL,3/5] Broadcom devicetree-arm64 changes for 6.17
>      (no matching commit)
>    - [GIT,PULL,4/5] Broadcom drivers changes for 6.17
>      https://git.kernel.org/soc/soc/c/aee4eeec7e5e
>    - [GIT,PULL,5/5] Broadcom maintainers changes for 6.17
>      https://git.kernel.org/soc/soc/c/2b12a400dd94

Thanks for applying the changes, can you confirm that you also intend to 
take in "[GIT,PULL,2/5] Broadcom devicetree changes for 6.17" for 6.17, 
that appears to be the only missing from your notification emails.

Cheers
-- 
Florian
