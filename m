Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A3D4AEE0
	for <soc@lists.linux.dev>; Wed, 30 Jul 2025 20:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753909173; cv=none; b=gDt6cO87ZnzebXo7fumSKMzUiOPe4mxFNQcAVdhPi/hTw+qUK4+hiapd9fHoajV6X0yvas43+t0pRDZpxSIXoTD2NnvXa0rm5HoYq3RdPOZK5wDtCRYcKbuCDG8tpxmOsw6AtEtqlfinMZW0ZRHBSgBmTiw8T1q4LNx7simkM7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753909173; c=relaxed/simple;
	bh=nh2eREqtD38BFOOAp8ubwhk1UGXvtrpmDSHWTJQrE58=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D8sILaAscEpTN5gcQtuwWvrQdPABYe84RvvJgECBZkxX8ndNKI3j2S1CI9a9b0JsCrE5K4TXP3HFL6zy8og3SSSwZsq6cNYYzaRfhqKpOtBiYajNfOrQiHen5gZaMfwwQpwyfoHAgB7LHO7wUrU9zIPB13FuFJPFMq9hoks3oxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=HfyclahF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="HfyclahF"
Received: by smtp.kernel.org (Postfix)
	id 41A82C4CEF7; Wed, 30 Jul 2025 20:59:33 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 69941C4CEF5
	for <soc@kernel.org>; Wed, 30 Jul 2025 20:59:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 69941C4CEF5
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-748e63d4b05so160516b3a.2
        for <soc@kernel.org>; Wed, 30 Jul 2025 13:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1753909172; x=1754513972; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2jbLxsRcifZlUVcw0Fu8betwJGMFtrQuZGNQ0Fns1xA=;
        b=HfyclahFTq6+LwHjA7cDoN/nzLMukyAaQ82Ii0DEcKdtFE4x0zdGNFtYVNs9+yOtE2
         U163udJjFEzj65Yfju3PLpqIMoR7q+AbyNb5EJLxeXclL/9MlHogfcoZYgJtKqX8NnoO
         Zc4T4dUHwGxBZVMJf2QgnDZKEpR2Sd3bvsZc0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753909172; x=1754513972;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2jbLxsRcifZlUVcw0Fu8betwJGMFtrQuZGNQ0Fns1xA=;
        b=Snc+kRKg1h32klo++QPswB178sQIjgTJ2AFq+QeCvpY4A24IJC0vsTe0w8b2F+z/Az
         BwsyOIxWddKlrO8tkaWanWKkCV7PwGHbSjf15Zcy20mE5+7WSbDEYd92XdNdIRIhs50I
         Gkp6qu+aPiiv+uelufgzSiYncEeyZUaFgc+29sN0c8yzJ8ps4CniEzDdNztLWdL+Abz4
         D30gVmSUgc0FlGzrzlWm1m0B1cAHqGuZaHLyVW5DvA5BVwoJCSxMCZyKnLaotS24iAGN
         5h1Za5PWbyvogzhFnW21+HxDlSfFJmZscdZJ/X8iCGHHERW+XuxG+l821iuiPj4J5DOl
         Dt0w==
X-Gm-Message-State: AOJu0YxNzhZ1BLDZplIyFsuVBxxaEg11i0+tthbb5SfZZe6g1QQcm3XC
	L9gROjXrutpjzvNOsm+3X+k96FB7tIZnSAVqAo/3em03oFTYig0ggiiYgem03/HDKmObLa/iXW6
	jGwDn9w==
X-Gm-Gg: ASbGncs5bvghg6RgIwmEwuiamnK9mqE1rKzZgmV1QmaaUeiYCF/gk0L8/aD1sLZkq+x
	bM/w0eChznlJAhhGsyjBpAvll79tgpar3yMd/0CJmvkG29IrBZyKN4FtzVQ2mNweZ+RSRPXooKh
	AdI6ORMX0QyrH6p3GxKYHW8AJpu01rW1Du8PoVm7/9N8FVB5A5Ys/ew/9ZLCGxiyyyKayFRvvhd
	scEjmnfj6nUhLUEVhmQs2lYYVqwaKTFBbp6A+pnz1Ug35NsD2CBn1Bbv7r8Vidmtt+GnU/AW8fM
	dEbKTmYOEvK0yB4um8xx2pnPWlURB1zjSPYUjS1jnUdKf74ICefNn2dgc4y+3L9eCfZ6ehfn12C
	Si+yuzxruVfAWm0XmbQvWxvDSXzs8/aPWyyMBYbxLalQmVmTXiuU2RCANPiVoMg==
X-Google-Smtp-Source: AGHT+IFyu0bIzZSTuMIpH8Aa06GTNgCMUHm0+9jDMgIIp/cN3FSe5iUvJga3aN9oKQMY+TsJ6tOMVA==
X-Received: by 2002:aa7:88cb:0:b0:748:68dd:eb8c with SMTP id d2e1a72fcca58-76ab30d1714mr5316636b3a.23.1753909171576;
        Wed, 30 Jul 2025 13:59:31 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7640881f0eesm10734390b3a.11.2025.07.30.13.59.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 13:59:30 -0700 (PDT)
Message-ID: <8832bc52-7f89-4c1c-a15a-593d1a9d1f01@broadcom.com>
Date: Wed, 30 Jul 2025 13:59:29 -0700
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL 1/5] Broadcom defconfig-arm64 changes for 6.17
To: Arnd Bergmann <arnd@arndb.de>, Andrea della Porta <andrea.porta@suse.com>
Cc: soc@kernel.org,
 patchwork-bot+linux-soc <patchwork-bot+linux-soc@kernel.org>
References: <20250630190216.1518354-1-florian.fainelli@broadcom.com>
 <175311192825.94241.11000772896570883971.git-patchwork-notify@kernel.org>
 <965bf9c1-0da6-4851-a106-f90eeceebe96@broadcom.com>
 <78b8cc2a-b76b-44c5-bc3d-c2017be75f9d@app.fastmail.com>
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
In-Reply-To: <78b8cc2a-b76b-44c5-bc3d-c2017be75f9d@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Arnd,

On 7/29/25 23:00, Arnd Bergmann wrote:
> On Tue, Jul 29, 2025, at 23:03, Florian Fainelli wrote:
>> On 7/21/25 08:32, patchwork-bot+linux-soc@kernel.org wrote:
>>> This pull request was applied to soc/soc.git (for-next)
>>> by Arnd Bergmann <arnd@arndb.de>:
>>>
>>> On Mon, 30 Jun 2025 12:02:12 -0700 you wrote:
>>>> The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:
>>>>
>>>>     Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)
>>>>
>>>> are available in the Git repository at:
>>>>
>>>>     https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.17/defconfig-arm64
>>>>
>>>> [...]
>>>
>>> Here is the summary with links:
>>>     - [GIT,PULL,1/5] Broadcom defconfig-arm64 changes for 6.17
>>>       (no matching commit)
>>>     - [GIT,PULL,2/5] Broadcom devicetree changes for 6.17
>>>       (no matching commit)
>>>     - [GIT,PULL,3/5] Broadcom devicetree-arm64 changes for 6.17
>>>       (no matching commit)
>>>     - [GIT,PULL,4/5] Broadcom drivers changes for 6.17
>>>       https://git.kernel.org/soc/soc/c/aee4eeec7e5e
>>>     - [GIT,PULL,5/5] Broadcom maintainers changes for 6.17
>>>       https://git.kernel.org/soc/soc/c/2b12a400dd94
>>
>> Thanks for applying the changes, can you confirm that you also intend to
>> take in "[GIT,PULL,2/5] Broadcom devicetree changes for 6.17" for 6.17,
>> that appears to be the only missing from your notification emails.
> 
> Hi Florian,
> 
> I don't know exactly what happened with the notifications. I did
> pull the branches in two batches some time apart, but as far as I
> can tell, they were all part of the pull requests that I sent last
> week and should now be part of Linus' tree.
> 
> Can you check again if anything is still missing and send me a
> follow-up pull request in that case?
> 
> I tried to make sure that the information about which branches
> I pulled is visible in both linux-next/arch/arm/arm-soc-for-next-contents.txt
> and in https://patchwork.kernel.org/project/linux-soc/list/, both
> of which show your branches as Queued, though some other branches
> are still listed as 'New' in patchwork for reasons I never quite
> understood.

This all looks good, thank you very much! I just sent out another pull 
requests for two minor changes to the RP1 clock driver, I had them 
queued up after the original tag was generated and Stephen reviewed those.

Thanks!
-- 
Florian
