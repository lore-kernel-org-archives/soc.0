Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F792137750
	for <soc@lists.linux.dev>; Mon,  1 Jun 2026 22:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780351225; cv=pass; b=noHMh99IMT1/RDxoFrSD1mFHitoD3ElgSKc05Rq7smzDDlOUfB3a3A7SLxv3h0XTXOM18Qk6OIcAI5RGl8Fa/0CPsgPyShuTE718KXNNNNpgELMpvtSxWrticRhW16QIkR2cnHgQeE10VgaBBEDMbPhTCaPJWIHg83yRfNknWM8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780351225; c=relaxed/simple;
	bh=anF0y/T/VKPbCtvNltNXEXqPyjP1eSqAAOstFQxIvWs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rb23Gq8RCg3W8e4TLJ71EpVVqY5XiecDZ0BcZzG+sQqpEI87hi/WRBnZDA/EeNGpTanvvazTsFVUmXm4gNGPKSH5e26bH4xsruKN/qXrR5tgSfjtfPS19TjY1NDzK/1+DM5sDYc/O/8RDWAm7v8hXRuO+QYpUrIWWA4bamRI+Qo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=GkboD3CE; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="GkboD3CE"
Received: by smtp.kernel.org (Postfix)
	id 09A831F00898; Mon,  1 Jun 2026 22:00:24 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.214.226
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1780351223;
	b=nmxGQrtdhZGtNwtaDcYR8rtx7cxDH+v3Ob9TaByeulFPTZdu5rMv7rmdqdXy4rwfTQ1z
	 0ZAtChu/sq9W8fshDOoJkRjgJAOnOiZlu7WobuG/5rw37DSupvcmL6fGrRsKFe1VefyGh
	 iz5rbJWat7yypDLq746S8pdhSxFM/MiYkvhBs28A6udvw3gIeq2hdive0rvKLSKdCxnf0
	 fEGA1jjCuHkk2J59xjaGqzylOOXPlWvVh/ro6MsjRVn9Hb1So/SrEnh027KKwS5NL8sWa
	 u5PkZPs8DZLR+KbSJh/QSaTlml3u/Mb6w2dZPQClsnhoycFKNMB3no1Dc2m77iG4f7w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1780351223;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=xV0cBcTIxSbpyYXNCcDDEaCoxrbY0/NjPrBS4j7wZMI=;
	b=k32BgohMPBedVIccNwmfiEbZcSEdKVb1IYaUj+gyIGgIlNMG6kkeenuMQXVPlbs+ZTl7
	 lgRbIE2apGZITRGAva3OY7MG4HMZNicTwtd8/vUFGsJf2g9RLPC5hvD0dNKM7lG7KGB+r
	 RKlNyPOex0IvZ5fMmVgC6FUcaXqJ2HnDmaV+saOoGimFmlAbQpRoigeeLd11xFdNJ3aE1
	 9No0tyd05iPEMV/RMKTjSoW9rYB1ZIcx10bct+dYYLUyrt1IFTx3JiGBbSTwHcMeFaukA
	 CP3jv3yalG+MTf6rYhQdDe/uYoP4cU4ytunTVoOfwd3fqOKjc1SfhmuVn9vryWd+uGw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=GkboD3CE;
	dmarc=fail header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	arc=none smtp.remote-ip=209.85.214.226
Received: from mail-pl1-f226.google.com (mail-pl1-f226.google.com [209.85.214.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 759181F00893
	for <soc@kernel.org>; Mon,  1 Jun 2026 22:00:23 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=GkboD3CE
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 759181F00893
Authentication-Results: smtp.kernel.org; dmarc=fail (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-pl1-f226.google.com with SMTP id d9443c01a7336-2c0c379e8ffso12629105ad.3
        for <soc@kernel.org>; Mon, 01 Jun 2026 15:00:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780351223; x=1780956023;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xV0cBcTIxSbpyYXNCcDDEaCoxrbY0/NjPrBS4j7wZMI=;
        b=j6GpIY3jhAhZP5C8oE9EdMy3GpdJd8rBewNfPxnu1W3Ylgm6kO83YKPT2qhBD/wAAN
         wOB4z/roqeT/H4Cm5ZL6p4C+qQF4lDiMOZyzg9FGJNUjyOQwguPfo6NDmzc3JvZs3zFP
         NtVQkvQsppPhX9ZVvxa+0lYpuHwj+4E0F7YbbDa6LjH8RCKAC/aN+IFVCRo5nxHvVJaC
         2kzTa70fvctGb3WY4QwNuLMoCqELqUJprY+T1vfHdntS1EPLp4kVKqy/pcE/7tEb4aZi
         J9oTZf3JJ4U3Q1k0WFvnx0/thKEnwh4g6MRb8aFOdlw4/wuwHfh+VF3PvKamG4XHia/Z
         /6fA==
X-Gm-Message-State: AOJu0Yz+Vzdv/yzWNef9Ld5kleHud5kFWVDn1qKpzoVZGXNpuBUcx/DF
	VgFbl8k3FZUVUCvSjR72cvEW+kVLmwziZ81IHBFZ95a122GM/Fnket3mY/rJMoAydfRfffJ2ldv
	L6Urlr+BL045Jl08Scvwv7dWgUjp7CqbfRXRwszlEvDux8aawOzI9H3b9jRnQzdwt/QBg78CHJ3
	rr/vMjQj7iFCkdHxvY6o45FtpZBMsPm45CSyri7DhUOEOZBA3HtDQ1eeJ5GPHSHmmfVZd11OD4m
	lO2BA==
X-Gm-Gg: Acq92OETnzSO5+8Qq9wrXvdJ2uUk2UK5XGuHEK3QNNgTPUuAEGwVaVS4nWDFI771eVa
	DWAhKr1fQlEcLxcIAwax0ynbVU66y7gla4LhKVTSbUzx84VXx8tf2oJlIANNn6f/7eSSFLNSJt2
	Xyv82fcKkwqiQvC4V8MbF47Ra6QFf+ZzVj5T2auxT+8Jos89+YMIWD871U1hD9yqTa6MBEKAzCs
	4RmmNZ6f5Jn9JIWZ5AzASn8wXl659DK5q5GXwQuTgW5nrMTBOkuAd+iyWHZvrg91TD34+xtnIwk
	MHQ4+g8wAXP+6EA6+2XId/zXkrRsd5xiqBUit5SYuBRVhGTRxG25lT5Idxab9PUfJaj+vKJwTPg
	klD6Hw+wsFQ1YynKgl/1Q3bJkHIF8Lj5Jpiz6XrrXz1SxJmSen21ky6OPEkQ6+5lFN5GlWJP5ZP
	S7Zt8NuVOwjHUBYvj+IW+uYL72zjPGoR9pcRpAVsMcfoqNidUuFKZhXydsI18VD7fPyRvp8+SW
X-Received: by 2002:a17:902:c402:b0:2bf:2329:9f40 with SMTP id d9443c01a7336-2bf367cbe31mr157790305ad.9.1780351221131;
        Mon, 01 Jun 2026 15:00:21 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-18.dlp.protect.broadcom.com. [144.49.247.18])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2bf23a30cf4sm9236425ad.24.2026.06.01.15.00.20
        for <soc@kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jun 2026 15:00:21 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-516cde13e8cso232204961cf.1
        for <soc@kernel.org>; Mon, 01 Jun 2026 15:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1780351220; x=1780956020; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xV0cBcTIxSbpyYXNCcDDEaCoxrbY0/NjPrBS4j7wZMI=;
        b=GkboD3CEuDv2Tb3W+1AVFjdBtsucn5Yuf2n2+yJKMXQhuXED8pgWqnlqqC2wGMPUk3
         7/DxZMMHqFDV1TO1rBriTZ+WIzJ/CKU/QCd1zXCZUw6VKWO+MpSkeiBens8n7iTiBx6G
         dWfEGWcWNvZSl3LkG+AQZxE+GGU+G2xlnsOXk=
X-Received: by 2002:a05:622a:610c:b0:517:1465:9167 with SMTP id d75a77b69052e-5173a818cd7mr194210421cf.28.1780351219699;
        Mon, 01 Jun 2026 15:00:19 -0700 (PDT)
X-Received: by 2002:a05:622a:610c:b0:517:1465:9167 with SMTP id d75a77b69052e-5173a818cd7mr194208411cf.28.1780351218741;
        Mon, 01 Jun 2026 15:00:18 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ccea08d945sm102961666d6.20.2026.06.01.15.00.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 15:00:18 -0700 (PDT)
Message-ID: <a3cc0f97-5a35-43c1-bea8-d2b9671b4ff8@broadcom.com>
Date: Mon, 1 Jun 2026 15:00:16 -0700
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL 1/2] Broadcom devicetree changes for 7.2
To: soc@kernel.org
Cc: Jinseok Kim <always.starving0@gmail.com>, Rosen Penev <rosenp@gmail.com>,
 linux-arm-kernel@lists.infradead.org, arnd@arndb.de, khilman@kernel.org,
 bcm-kernel-feedback-list@broadcom.com
References: <20260601202945.1195228-1-florian.fainelli@broadcom.com>
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
In-Reply-To: <20260601202945.1195228-1-florian.fainelli@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 6/1/26 13:29, Florian Fainelli wrote:
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
> 
>    Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> 
> are available in the Git repository at:
> 
>    https://github.com/Broadcom/stblinux.git tags/arm-soc/for-7.2/devicetree
> 
> for you to fetch changes up to 245552af869d35ae27cac2121696dd630f15b3bf:
> 
>    arm: dts: bcm2711: Fix typo in gpio-line-names (2026-05-29 11:13:56 -0700)
> 
> ----------------------------------------------------------------
> This pull request contains Broadcom ARM-based SoCs Device Tree changes
> for 7.2, please pull the following:
> 
> - Rosen moves the Meraki MX6X pinctrl configuration to the PWM node
>    where it belongs, also fixes the USB3 GPIO for the R6300v2 and
>    EA6500v2 routers
> 
> - Jinseok fixes a gpio label for the bcm2711 systems (Raspberry Pi 4)
> 
> ----------------------------------------------------------------

FWIW, I have not been able to migrate our git tree to kernel.org just yet.
-- 
Florian
