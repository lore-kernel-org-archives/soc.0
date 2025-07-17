Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7639F20ED
	for <soc@lists.linux.dev>; Thu, 17 Jul 2025 18:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752777428; cv=none; b=XhUnxcV9GyPh1BWmVa29nhd+P5oNuhaAF20mo0nDk+6lKORFXsTK+pDjuvPYjCp+Ahc2YuM3IywecMGO+zjUv3DyF+0LTenuOX13JCN+Vjva64I4dNf6Vlk0/kgPEawLVq6NSpQGgspp2fZs8Pp0B6Os84p5Deg7C4KImz/P09k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752777428; c=relaxed/simple;
	bh=w7yGuY+gT4KAKbucKE6yGntCo/ScU+bxYuVIXkD28uw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=drYUS52QJ3xIPx9rw2METe7oVbGL327jr7kux1Uxj5xAe0G2FQ7qehrF8rZnitXQr9lixysjsNBhoI3AgtqiqURAfUkmdSKlHUB4cIoXNdXt9cVDJaRiDbdWAaM2VwYLQ00VZ8ty8OG8FNl3/LCGmB9hLIi5yTY7/RyJI3LV31c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=HAhact4g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="HAhact4g"
Received: by smtp.kernel.org (Postfix)
	id F1EC6C4CEED; Thu, 17 Jul 2025 18:37:07 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 31963C4CEE3
	for <soc@kernel.org>; Thu, 17 Jul 2025 18:37:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 31963C4CEE3
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7e33d36491dso168380685a.3
        for <soc@kernel.org>; Thu, 17 Jul 2025 11:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1752777426; x=1753382226; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eSD2tpJzY9C76IOQTT5NSlNvSbDvEKD1q4r4RfEzT2M=;
        b=HAhact4gHChDLPwcfxL1HPIs3T3UtsKGbtzGnpnM77xtS5FWL51bLh/i3OXHe9WTmR
         kVoyynIC76uV5Ukeybf35priJi0z3heKMiin31C2qgE8eFy2u4sQgPCNyfDCTUB4KZVT
         bG4hprj7PzzsTlRovL19gqIAaj1WEvu3gatqM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752777426; x=1753382226;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eSD2tpJzY9C76IOQTT5NSlNvSbDvEKD1q4r4RfEzT2M=;
        b=DsESRmonYhf+3lUQVV973gd/8xQx6uGKmeRui0Ub+3F9H8nnQ1vwGIn/+O2PtHsYpj
         jooxVHu7l8NYqTp+S1Bvr/NDQ3v/2pIwBxS/gFzMrn5gfBFd5l4OqKWIsDl2jXYWVOeg
         038YAVSWT7WI3vmOTCXMUy1pmQmug2WcrboDXdizS8YNS6n37xcxccmdI9qwtz17yp0V
         UzO7CkpQ0NOsNGOQil4n6/8JqTtC8SEDcLzJwLxiTutN1s7RLjuf1LlnUgRrZP/aLzwQ
         PsyO2kLsNAymKNoYIcUHdwmgkZvke7RZ5rNoB8WEpd+ybsolkZYygLczW2XgP30s9fQv
         7KFQ==
X-Gm-Message-State: AOJu0YwGiwjFjgq7TNbgfKdsXaz1o/8CModX5j4VH0aaV0AZMoX+cF69
	oZApTOZRdXJpMjlL7DmJ8OJfsbVe0+V1tC9dSvToN87RxvT8c7jsnWueqXH/dZabOA==
X-Gm-Gg: ASbGncusba/4o1bUQaVq56/NwsC4ebIbA/uKWIyfYyzPch3E25LODriEK9aKcLPikhk
	SXVozWiRPiA46lULaF7JB90OlOYs74NCDzah+12id1SY25YTkftwGyhGTGQiOqybWpvNN+k0RrT
	ITGqzt1KWGMozRnfFHAvFPS4M6TqoQa+F4sfTyqkx0eOSNX0ODc7p9/PPi+b28/5uj+pSY3i1nC
	10Yuz8ThJ9OvUSLRg5ct1GRJui6GFHPIvnlsTznr6fLPFoiOyXmfGTfH/fRkQuIdeInO4oBo1/J
	vKS0Bf7VRqqh6N/kzsHGgmPLHm9sMhTrs7ZZKT+Xw6kv/rXeNnBjTYZuF07SGMUQWtBjLf0EJ/k
	mNBI/t916YoYZgmtZFfkulPDLUF+ikFImeL9Y+VtXPXoLO1eHhaRdvgcmtBM1QQ==
X-Google-Smtp-Source: AGHT+IEdJJAEAUpLsjb1fWH3dJkpQExaxSMZ/KDnIr4KPAdE/iheS1fNVwgPbQ7C374uve7a4Q6R6Q==
X-Received: by 2002:a05:620a:414a:b0:7d4:38f:a7b3 with SMTP id af79cd13be357-7e342b5236bmr1137514685a.29.1752777425955;
        Thu, 17 Jul 2025 11:37:05 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7dcde8fd40esm928330385a.96.2025.07.17.11.37.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 11:37:05 -0700 (PDT)
Message-ID: <b20e997c-015d-44f9-87ce-943381793fa9@broadcom.com>
Date: Thu, 17 Jul 2025 11:37:01 -0700
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL 1/5] Broadcom defconfig-arm64 changes for 6.17
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: patchwork-bot+linux-soc@kernel.org, Arnd Bergmann <arnd@arndb.de>
Cc: soc@kernel.org
References: <20250630190216.1518354-1-florian.fainelli@broadcom.com>
 <175162020751.1782818.1640014464017504198.git-patchwork-notify@kernel.org>
 <f6df4328-f3c6-4326-a4b6-326685aebaeb@broadcom.com>
Content-Language: en-US
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
In-Reply-To: <f6df4328-f3c6-4326-a4b6-326685aebaeb@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/11/25 14:38, Florian Fainelli wrote:
> On 7/4/25 02:10, patchwork-bot+linux-soc@kernel.org wrote:
>> Hello:
>>
>> This pull request was applied to soc/soc.git (for-next)
>> by Arnd Bergmann <arnd@arndb.de>:
>>
>> On Mon, 30 Jun 2025 12:02:12 -0700 you wrote:
>>> The following changes since commit 
>>> 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:
>>>
>>>    Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)
>>>
>>> are available in the Git repository at:
>>>
>>>    https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.17/ 
>>> defconfig-arm64
>>>
>>> [...]
>>
>> Here is the summary with links:
>>    - [GIT,PULL,1/5] Broadcom defconfig-arm64 changes for 6.17
>>      https://git.kernel.org/soc/soc/c/241a3be47756
>>    - [GIT,PULL,2/5] Broadcom devicetree changes for 6.17
>>      (no matching commit)
>>    - [GIT,PULL,3/5] Broadcom devicetree-arm64 changes for 6.17
>>      (no matching commit)
>>    - [GIT,PULL,4/5] Broadcom drivers changes for 6.17
>>      (no matching commit)
>>    - [GIT,PULL,5/5] Broadcom maintainers changes for 6.17
>>      (no matching commit)
> 
> Arnd, can you also take the 3 other pull requests, it looks like only 2 
> have been applied: devicetree-arm64 and defconfig-arm64. Please let me 
> know if we need to do something different here, thanks!

Arnd, can we get the other pull requests to be applied, or have they 
somehow been applied and the notification email simply was not sent out?

Thanks!
-- 
Florian
