Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831FE3D6F
	for <soc@lists.linux.dev>; Wed, 17 Dec 2025 00:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765929832; cv=none; b=aWOiz0VsrY19MSOBZiyTCTBFj/UKegg2Ya9YMyCz/nKfGwEnL6RLN8Lj1NPsnIWTS9UF+69C8KgZsVFR2ty6TowJb11P4PlidHCQlIoSn5Vwf5bWZFk0Q5kEJAeMXW9OeKNPvOfkRdVIZNeLBZLVWOMKLeYHqx50PS0QKApv2lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765929832; c=relaxed/simple;
	bh=NJZaH7skSexEaFAy/gh9p3/z9J6dpaWX6TKh+Z4jInw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pDJ1cPcD6OlbwkzrTpdbtvwgwVur4Qafk0xvPttY33LxGl4uFyOsFn/moa/CfF3JeIktc+eC85AZflJqe+oDlktbm9s7l2ochawuiyKYA+6rcOHGLGRIutXpYbodw/HlBzN5YdZ+qxqPb7G0TMZp1i+nepyzaJZZRuzqBZToL9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Cpf+TBa1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Cpf+TBa1"
Received: by smtp.kernel.org (Postfix)
	id 3A7BEC113D0; Wed, 17 Dec 2025 00:03:52 +0000 (UTC)
Received: from mail-oa1-f100.google.com (mail-oa1-f100.google.com [209.85.160.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8463CC4CEF1
	for <soc@kernel.org>; Wed, 17 Dec 2025 00:03:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8463CC4CEF1
Authentication-Results: smtp.kernel.org; dmarc=fail (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-oa1-f100.google.com with SMTP id 586e51a60fabf-3e7f68df436so40894fac.1
        for <soc@kernel.org>; Tue, 16 Dec 2025 16:03:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765929828; x=1766534628;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q8Y5Nly6/2QcuWXLw650vy+bFUZ3dsDuqEwgOZmk9iA=;
        b=Rw67sRWUfDd2dm8N+sEZ+r937C+lqViIc5/jsDFNEtZHIsBvdkHKohh1hN2hNsfHm1
         6DawX/1sVgVLxDPJkxDYhFU9VaGBKGOOKP55niW4j1mfKqY6U8NlPRWOvzuSKnXQxGoe
         wgJigbu343uj5uJAy+Qi4CetP0QQS4e75Ks+F26QOmHxu/DODTrTCwEYPXoBj1SP6DJx
         zIPrZnc/G1iGCxV4Wqznmb0CvWS529UNvjZEpV+KL+vi7AUjpdnBbekML1fHCS5P2a14
         zuget4XBMCSM+9eU1bxLEUKo5VMCT+WHjfS8BLJD8pJjnagRVS3f/w1oDqWqYkQKOGmL
         Nnhg==
X-Forwarded-Encrypted: i=1; AJvYcCUIxC8ErtqYp8r+ynziY+PdJTOQWn9/H3ajWcVm+o7MEC/m+piADvy7ALxBvB6y00hNAro=@kernel.org
X-Gm-Message-State: AOJu0YxwU2QbLUZUa+fD9YdvR+Hsv9q2RPl25qvnqdDwM5ua3no7aADi
	6d/gPL2Pl0/b9KYyo/uhYYeghdSDM8ccWG26P/zPxUw0doPtvZaa70qbtl6sUnkwmSZZIV04IZk
	5j7pfqZvlLyLlV4vZVqk0ok1QfbIV2Vk++xFCYFwaFLw70sqLoEPWymX+CnCdlwTDYNr5fLAZ91
	56dg1Jr0/W+sW+dEW7O0LfY7gD6LZSbDSBtsH3GKEKG5maI3kzBFHwSEWzzn09JqsFjnDS6WHiG
	r8HWg==
X-Gm-Gg: AY/fxX7N4wqw2QQD3/0XA9mKUmAiqbdHq0AHG66MuD6gtqrcLl0unKAps2cazo/McQO
	SoHETZDdtNGkgGhvH6ggxGQE9GCIDcHjeRnUOWeqWnr7sl+QDeD0sDv4g8mWpAK/9mkkuXoNkVo
	AFyi3daTCSnhq1t+QC8POPlwULMS5mwYFlKhjCn+uAB/cB2SCArYp/HzrwZe+gehwQ02InJDqyM
	X+qCkUI64US3WsrmuGMcpef0ENWEHAJZ3usmPaDBVEKdCHiB854UPg44q0PR+jOED4fSjBD3P2x
	pPg4cr3nKIHC9mddSS5en0zv6NTsGhTaNjG6A6/wUNIUkquzyaDq0X4CaS8y3vqVmOKD5iYfpD+
	ndpLa6V5BmsSqsQ267HrBjhfLMnYboNgRmDJ6X2yEvt3659gKgWzh2U/0bOD3Hb4oDOR0h2syl1
	XbL/0hcy+xY5tMcRUwk5NjPiCUmkDBlVDcg9hNKjWwc9YwZTS89g==
X-Google-Smtp-Source: AGHT+IGBLptu/iGSD9WUccYmtkpMWh2ZDhbIVTsNSeeTbWHJv/jRXHBXN/7JrjdV/QaAw/7vmwLyBoNp6Ao3
X-Received: by 2002:a05:6871:281:b0:3d2:e6a7:e938 with SMTP id 586e51a60fabf-3f5dfbc0168mr9915446fac.15.1765929828330;
        Tue, 16 Dec 2025 16:03:48 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-19.dlp.protect.broadcom.com. [144.49.247.19])
        by smtp-relay.gmail.com with ESMTPS id 586e51a60fabf-3f614b82306sm1445235fac.2.2025.12.16.16.03.47
        for <soc@kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Dec 2025 16:03:48 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ac387300f4so96209eec.0
        for <soc@kernel.org>; Tue, 16 Dec 2025 16:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1765929826; x=1766534626; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Q8Y5Nly6/2QcuWXLw650vy+bFUZ3dsDuqEwgOZmk9iA=;
        b=Cpf+TBa1l7UE51ysysjW54/XAVZmakXvXS81LBWg/aKCkFbqAjUAnBp+RdKMxYRM9R
         72+LrATW5OXRpZDywLNLu40Cd1uc2sgkoA5kd+foTtfNfBLNIQTo2X6gkacE8RKug1ja
         C5R3SZS5UDtwaYEvrTJkjPpnUXPYMWhYVY3oc=
X-Forwarded-Encrypted: i=1; AJvYcCUgy0wJG37wcz+afeVANNzehjl0Tn2AD3U/Gb693QFw+FRdDygJjvEkF5KFoYjWWqrs1ls=@kernel.org
X-Received: by 2002:a05:693c:8006:b0:2ab:f74a:6a63 with SMTP id 5a478bee46e88-2ac3119e045mr8038583eec.16.1765929826003;
        Tue, 16 Dec 2025 16:03:46 -0800 (PST)
X-Received: by 2002:a05:693c:8006:b0:2ab:f74a:6a63 with SMTP id 5a478bee46e88-2ac3119e045mr8038570eec.16.1765929825269;
        Tue, 16 Dec 2025 16:03:45 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ae4f0546a1sm1821021eec.29.2025.12.16.16.03.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 16:03:44 -0800 (PST)
Message-ID: <822bdd19-276b-4868-b3e4-59a187bc7048@broadcom.com>
Date: Tue, 16 Dec 2025 16:03:43 -0800
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL 1/1] Broadcom devicetree-arm64 changes for 6.19
To: Florian Fainelli <florian.fainelli@broadcom.com>, soc@kernel.org
Cc: Stanimir Varbanov <svarbanov@suse.de>,
 Peter Robinson <pbrobinson@gmail.com>, Stefan Wahren <wahrenst@gmx.net>,
 linux-arm-kernel@lists.infradead.org, arnd@arndb.de, khilman@kernel.org,
 bcm-kernel-feedback-list@broadcom.com
References: <20251216235649.633331-1-florian.fainelli@broadcom.com>
Content-Language: en-US, fr-FR
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
In-Reply-To: <20251216235649.633331-1-florian.fainelli@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 12/16/25 15:56, Florian Fainelli wrote:
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:
> 
>    Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
> 
> are available in the Git repository at:
> 
>    https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.19/devicetree-arm64
> 
> for you to fetch changes up to 37c3a91e9730e274fe2eca9703033ae0f154cb62:
> 
>    arm64: dts: broadcom: bcm2712: Add watchdog DT node (2025-11-05 10:28:29 -0800)
> 
> ----------------------------------------------------------------
> This pull request contains Broadcom ARM64-based SoCs Device Tre updates
> for 6.19, please pull the following:
> 
> - Peter enables the random number generator on BCM2712
> 
> - Stanimir adds the watchdog Device Tree node for BCM2712
> 
> ----------------------------------------------------------------
> Peter Robinson (1):
>        arm64: dts: broadcom: bcm2712: Enable RNG
> 
> Stanimir Varbanov (1):
>        arm64: dts: broadcom: bcm2712: Add watchdog DT node
> 
>   arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 

Apologies for sending this so late, after v6.19-rc1, these changes are 
somewhat minor, so please let me know if they can be accepted as late 
changes to the 6.19 merge window.

Thank you!
-- 
Florian

