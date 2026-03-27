Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD0F355F20
	for <soc@lists.linux.dev>; Fri, 27 Mar 2026 16:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774628807; cv=none; b=PQOfd9H2yRPPMeOOcdhgS27sPSkcjYtjauVc2e+lxqfLgO+EQX1RUgb9hFYsAAt6NS5JxPTykTlFP50wNru5b6+Li6Kq+TFChi0HrHxS7pOvv0TLKWhUiG09GUeWwJ9T4ZBKnLk3W8pSRrlMASxcp/HSFAz97ObPhSEUwFdGUDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774628807; c=relaxed/simple;
	bh=As5+JttcwmpnIbAwrrcyLiYbgIrjXqA0LjcZQsdFwew=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lzqLqVw4uSLXOho2EsrzT/G9nwjpImormsLI6J/LHs2XC00UbUdLcs19xCLz0ooo70Pu42P6vc3QviCssKIXrcDk2kINgSaPOMyo+VS910AiPIIhp2s5cQgytoczCuTdWyAidKVzWuVa8K9tL7Grjx2wKU1V13fpMie1uPg1BCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=h31VBbx1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="h31VBbx1"
Received: by smtp.kernel.org (Postfix)
	id E0105C2BC87; Fri, 27 Mar 2026 16:26:46 +0000 (UTC)
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C16E4C2BCB1
	for <soc@kernel.org>; Fri, 27 Mar 2026 16:26:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C16E4C2BCB1
Authentication-Results: smtp.kernel.org; dmarc=fail (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-354bc7c2c46so1471762a91.0
        for <soc@kernel.org>; Fri, 27 Mar 2026 09:26:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774628805; x=1775233605;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZNu4zPz2mZhXhyfe6svc9T00szp8jGCp3e2sMiV3zXI=;
        b=CPB2k2FhvVkQoRM2DtMMsB6uCmN3zlNqbh/RZMOtDkpu3e99GPNnPWQQWKxOvsgRZr
         pmioYJKCvYFLVueVy+deJSzbZrBJ2iw4uubYsOGbJ4Cgo6AmN0j0vAN9ooIIhHVl0YPi
         NdMPNFB7xc11qqFVMgygXdnHRqtzPXSnn1W6D04v5WS/yUkcseDvSkjx4jh1f8oLMBXS
         WZKzUknKE/zNg5g9+qaFYfmEX6JYKs2X9SKy6Ym8KRRurI2KXO9+cqjnVcL+ZgfHM3JZ
         xMLWhCQgE9Q8V1gUp456E2JRfM4G40gVK19+70ZldVbJUgBU1dpw+ekfF5+DPYbqPtk4
         9X1A==
X-Gm-Message-State: AOJu0Yz+ZlhhHjSoxNScPPgFpsLD8htyltXHv7OehUrOnlSFrnV7X9Pz
	RDPgo1pYuJqchTd0fFnpLTO6z8nD8DTa6+g9rYA1Iq3NpMhiZ/k3a3Yg+335DCKHVPaMkWbfPgX
	rYk75iT6jmcx6C5yw90qxEWJDu8kjoC3DRIeZHA8jskP/qvIetcztLFYMDU97Ms84c2QFeh0hpA
	CcoghMxWHzyKF8u70w553aWzMBWx5AyYpcTh13wUxmZ4tan36RvjwGY4fkc0vpY9jaKKJAJp5dj
	xbqNA==
X-Gm-Gg: ATEYQzyXjubPS04NGtj7jALijGNxAhH7iAshs+DyPkxJJoKIE2Lah50a6OvLrLlKPNk
	Qjnr25MATRM3yJxmk4jbdkJI7i8W+2SujOPwip3I8HCVgJfh5fGrZSOMGioVXc+gE9yC2Js0ffr
	/WklnYLcr/hbOn+gVRb7D17D4+ezoldRqHpUfmq2wLemaUkAp57y9GiKcwuG1zH3TbvbXa0tWPN
	DWN/BQuwGACnnUcC0wPyqLha0+EimsfEkADlIsXe9GEoJCFNa7KPyOqaFvKKNI7XZD8KcoLdPDd
	AagMv9OdOHVJ3yczxvlfLgCwQLm0I/feDgaVHk2TWNG/vppV/svWMzllv3yRywYL/AzVkIhyUb/
	ZPLNROko/r4PO1GhmtjyLqwYesOsUVhW4oq7RAAR6SblbadDXvZy6v2Bo554Eg4ky1VS/XnGUaW
	PigGqXgCBn0n+IC28CiUh6oPkoncAIihDJGXxLtq0yCYbzxrqHaslADtaOhhfwMw==
X-Received: by 2002:a17:90b:1642:b0:359:fdc0:4621 with SMTP id 98e67ed59e1d1-35c2ffa8f44mr3393605a91.11.1774628804799;
        Fri, 27 Mar 2026 09:26:44 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-15.dlp.protect.broadcom.com. [144.49.247.15])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-35c2e9e15c5sm135658a91.1.2026.03.27.09.26.44
        for <soc@kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Mar 2026 09:26:44 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-485345e2fdfso12743345e9.2
        for <soc@kernel.org>; Fri, 27 Mar 2026 09:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1774628802; x=1775233602; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZNu4zPz2mZhXhyfe6svc9T00szp8jGCp3e2sMiV3zXI=;
        b=h31VBbx1raOV1yps1OUZOSXSce9ezXRiampWkaleEG6tHNGEQd/9C3I+NaZO8SrFPR
         HGbPNBNQQTW0SXDlK72Je3OBlSw/tuRRqzxMuvAG6EZznXfQ56UpYM4zKMFt75yX3qLm
         v/qDZfgUFCkZpuWpXzlZ8of3+nyUR9xx6BsWM=
X-Received: by 2002:a05:600c:83c5:b0:477:7af8:c8ad with SMTP id 5b1f17b1804b1-487280a25c4mr52192935e9.31.1774628802603;
        Fri, 27 Mar 2026 09:26:42 -0700 (PDT)
X-Received: by 2002:a05:600c:83c5:b0:477:7af8:c8ad with SMTP id 5b1f17b1804b1-487280a25c4mr52192205e9.31.1774628802031;
        Fri, 27 Mar 2026 09:26:42 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf1c4sm15953919f8f.23.2026.03.27.09.26.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 09:26:41 -0700 (PDT)
Message-ID: <e53ae287-6800-4048-9a9e-e5f125671c13@broadcom.com>
Date: Fri, 27 Mar 2026 09:26:37 -0700
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL 1/2] Broadcom devicetree changes for 7.1
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@kernel.org, Rosen Penev <rosenp@gmail.com>,
 Rob Herring <robh@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 William Zhang <william.zhang@broadcom.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, linux-arm-kernel@lists.infradead.org, arnd@arndb.de,
 khilman@kernel.org, bcm-kernel-feedback-list@broadcom.com
References: <20260323190239.1890505-1-florian.fainelli@broadcom.com>
 <20260327-lurking-amazing-pudu-114fe8@quoll>
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
In-Reply-To: <20260327-lurking-amazing-pudu-114fe8@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 3/27/26 04:53, Krzysztof Kozlowski wrote:
> On Mon, Mar 23, 2026 at 12:02:38PM -0700, Florian Fainelli wrote:
>> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
>>
>>    Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
>>
>> are available in the Git repository at:
>>
>>    https://github.com/Broadcom/stblinux.git tags/arm-soc/for-7.1/devicetree
>>
>> for you to fetch changes up to 220bdfcb4b4788f57faa2c28454d8b2dd3bcab6c:
>>
>>    ARM: dts: BCM5301X: EA9200: specify partitions (2026-03-20 16:57:31 -0700)
> 
> Four days after:
> 
> Days in linux-next:
> ----------------------------------------
>   0 | ++++++++++++++++ (16)
> 
> ...
> 
> Commits with 0 days in linux-next (16 of 19: 84.2%)...
> 
> Are you sure your tree is included in the next?

The branch that is included in linux-next is my "next" branch which is a 
merge of all branches. In this particular case however it looks like the 
branch was not updated.
-- 
Florian
